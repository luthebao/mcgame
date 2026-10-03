// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetManagerPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.SkillUseSlot;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.ui.view.comp.BasicMultiLineButton;
    import com.qeedoo.ui.view.comp.PentagonCanvas;
    import mx.containers.Canvas;
    import mx.controls.Button;
    import mx.collections.ArrayCollection;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.PropertyBar;
    import mx.controls.CheckBox;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import flash.utils.Timer;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.containers.HBox;
    import mx.controls.List;
    import mx.controls.ComboBox;
    import mx.core.Repeater;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.core.ClassFactory;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import mx.binding.RepeatableBinding;
    import mx.events.ListEvent;
    import mx.events.CloseEvent;
    import com.qeedoo.game.logic.PetLogic;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.utils.getDefinitionByName;
    import flash.geom.Rectangle;
    import com.qeedoo.game.config.ItemConfig;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.game.logic.Battle;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.events.Event;
    import com.adobe.crypto.MD5;
    import mx.core.DragSource;
    import mx.managers.DragManager;
    import com.qeedoo.ui.view.compBattle.PetCmdCanvas;
    import mx.core.IUITextField;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.data.GameData;
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

    public class PetManagerPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const PAGE_MAX_PET_NUM:int = 10;
        public var _PetManagerPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _169699452petFuncBtn5:BasicGlowButton;
        private var _692413227classImg:Image;
        private var _1091882814factor1:RoundedLabel;
        private var _900562943skill2:SkillUseSlot;
        private var selPetDataTemp:Object;
        private var _861878256basichortxtbutton5:BasicTxtButton;
        private var _1872627967finalSleep:TextInput;
        private var _1420795392addIntelligence:BoxLabel;
        private var _1382596167finalResiPoison:TextInput;
        private var _1549420544delBtn1:BasicGlowButton;
        private var _464115109petLevel:RoundedLabel;
        private var _177868763styleAddName:String;
        private var followPetData:Object;
        private var _677962293petEqu5:ItemSlot;
        private var _933944003tarcanvas:SimpleCanvas;
        private var _1892385864finalResiSleep:TextInput;
        private var _1554141557tabBtn2:BasicMultiLineButton;
        private var _3034454btn2:BasicGlowButton;
        private var _805962357propertyPentagon:PentagonCanvas;
        private var petDataTemp:Object;
        private var _702954884aptIntelligence:BoxLabel;
        private var _99622dp2:Canvas;
        private var _19957965addBtnCanvas:Canvas;
        private var _550778331canvas3:Canvas;
        private var _1864769379minusStrengthButton:Button;
        private var _817036290addStrength:BoxLabel;
        private var _507317139growRate:BoxLabel;
        private var _839841132upBtn5:BasicGlowButton;
        private var _861878252basichortxtbutton1:BasicTxtButton;
        private var _850872420addAgility:BoxLabel;
        private var _355194339finalRage:TextInput;
        private var _708846363addEnergyButton:Button;
        private var followPetId:Number = -1;
        private var _1952151455critical:BoxLabel;
        private var petClassAC:ArrayCollection;
        private var _505171265openBtn1:BasicGlowButton;
        private var _1091882811factor4:RoundedLabel;
        private var _900562941skill4:SkillUseSlot;
        private var _2055403737aptStrengthEx:RoundedLabel;
        private var _169699448petFuncBtn1:BasicGlowButton;
        private var _1588184269aptAgilityEx:RoundedLabel;
        private var _677962290petEqu8:ItemSlot;
        private var _1863068566minusEnergyButton:Button;
        private var selectedTabIndex:int = 0;
        private var _97632477mDefence:BoxLabel;
        private var _861878257basichortxtbutton6:BasicTxtButton;
        private var tempMultiple:int = 0;
        private var _1549420546delBtn3:BasicGlowButton;
        private var _1906307211finalResiDizzy:TextInput;
        private var _498964688finalConfusion:TextInput;
        private var _1218397274finalCounter:TextInput;
        private var Multiple:int = 1;
        private var _991700866petExp:BoxLabel;
        private var _677962295petEqu3:ItemSlot;
        private var _95758295dodge:BoxLabel;
        private var _1554141559tabBtn0:BasicMultiLineButton;
        public var _PetManagerPanel_Label1:Label;
        public var _PetManagerPanel_Label2:Label;
        public var _PetManagerPanel_Label3:Label;
        public var _PetManagerPanel_Label4:Label;
        public var _PetManagerPanel_Label5:Label;
        public var _PetManagerPanel_Label6:Label;
        public var _PetManagerPanel_Label10:Label;
        public var _PetManagerPanel_Label11:Label;
        public var _PetManagerPanel_Label12:Label;
        public var _PetManagerPanel_Label13:Label;
        public var _PetManagerPanel_Label14:Label;
        public var _PetManagerPanel_Label15:Label;
        public var _PetManagerPanel_Label16:Label;
        public var _PetManagerPanel_Label17:Label;
        public var _PetManagerPanel_Label18:Label;
        public var _PetManagerPanel_Label19:Label;
        public var _PetManagerPanel_Label7:Label;
        public var _PetManagerPanel_Label8:Label;
        public var _PetManagerPanel_Label9:Label;
        private var _505171264openBtn2:BasicGlowButton;
        private var _14326624addStaminaButton:Button;
        private var _1046717375propertyBarMp:PropertyBar;
        public var _PetManagerPanel_Label20:Label;
        public var _PetManagerPanel_Label21:Label;
        public var _PetManagerPanel_Label22:Label;
        public var _PetManagerPanel_Label23:Label;
        public var _PetManagerPanel_Label24:Label;
        public var _PetManagerPanel_Label25:Label;
        public var _PetManagerPanel_Label26:Label;
        private var _1984280679finalResiConfusion:TextInput;
        private var _57704679finalReduceHurt2:TextInput;
        private var _169699451petFuncBtn4:BasicGlowButton;
        private var _801114956paixucb:CheckBox;
        private var view:ViewManager;
        private var petAC1:ArrayCollection;
        private var petAC2:ArrayCollection;
        private var petAC3:ArrayCollection;
        private var petAC4:ArrayCollection;
        private var petAC6:ArrayCollection;
        private var petAC7:ArrayCollection;
        private var _426146348addStrengthButton:Button;
        private var _395626106aptStrength:BoxLabel;
        private var _307382965showCanvas:CharactorShowCanvas;
        private var petAC5:ArrayCollection;
        private var _btnEnabled:Boolean = true;
        private var _839841135upBtn2:BasicGlowButton;
        private var pageAC:ArrayCollection;
        private var _861878253basichortxtbutton2:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton10:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton11:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton12:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton13:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton14:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton15:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton16:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton17:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton18:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton19:BasicTxtButton;
        private var _30739193attLastPoint:BoxLabel;
        private var _467845765finalBreakReborn:TextInput;
        private var _1887307336finalCombo:TextInput;
        public var _PetManagerPanel_BasicTxtButton20:BasicTxtButton;
        private var _1997577724finalPraDef:TextInput;
        private var _1091882813factor2:RoundedLabel;
        private var _106557218petMp:BoxLabel;
        private var _1270522743attEnergy:BoxLabel;
        public var _PetManagerPanel_RoundedLabel18:RoundedLabel;
        private var _900562944skill1:SkillUseSlot;
        private var _505171263openBtn3:BasicGlowButton;
        private var showPetTimer:Timer;
        private var _112005440vbox5:VBox;
        private var _1357563171aptStaminaEx:RoundedLabel;
        private var _677962292petEqu6:ItemSlot;
        private var _1453362841finalEnhPhyHurt:TextInput;
        private var _1023416178attStamina:BoxLabel;
        private var _607339634pageSelector:PageSelector;
        private var _1549420548delBtn5:BasicGlowButton;
        private var _1898937865finalResiLight:TextInput;
        public var _PetManagerPanel_BasicDelayButton2:BasicDelayButton;
        private var _677962297petEqu1:ItemSlot;
        private var _112005436vbox1:VBox;
        private var _103315hit:BoxLabel;
        private var _991692313petNum:BoxLabel;
        private var _908746316finalResiRage:TextInput;
        private var _550778330canvas2:Canvas;
        private var _237239562aptAgilityFinal:RoundedLabel;
        private var _839841133upBtn4:BasicGlowButton;
        private var _1879179968finalLight:TextInput;
        private var _1046717530propertyBarHp:PropertyBar;
        private var _1315489237starHbox:HBox;
        private var _505171262openBtn4:BasicGlowButton;
        private var _10889870addStamina:BoxLabel;
        public var _PetManagerPanel_BasicGlowButton1:BasicGlowButton;
        public var _PetManagerPanel_BasicGlowButton2:BasicGlowButton;
        private var _99621dp1:Canvas;
        public var _PetManagerPanel_BasicGlowButton5:BasicGlowButton;
        private var _57704678finalReduceHurt1:TextInput;
        private var _112005437vbox2:VBox;
        private var _344411274pettabBtn0:BasicGlowButton;
        private var _861878254basichortxtbutton3:BasicTxtButton;
        private var _473555694finalRebornRate:TextInput;
        private var _1751782644aptStaminaFinal:RoundedLabel;
        private var _534396457showPetFollowBtn:BasicGlowButton;
        private var _1940048781propertyCanvas:Canvas;
        public var _PetManagerPanel_Image4:Image;
        public var _PetManagerPanel_Image5:Array;
        private var _900562942skill3:SkillUseSlot;
        private var _1618724969aptEnergyFinal:RoundedLabel;
        private var _1606233953minusIntelligenceButton:Button;
        private var _74771179mAttack:BoxLabel;
        private var _354781098finalDefy:TextInput;
        private var _1091882815factor0:RoundedLabel;
        private var followPetIdCheck:int = -1;
        private var _908333075finalResiDefy:TextInput;
        private var _575917863elementImg:Image;
        private var _1549420545delBtn2:BasicGlowButton;
        private var _112005438vbox3:VBox;
        private var _169699450petFuncBtn3:BasicGlowButton;
        private var _677962294petEqu4:ItemSlot;
        private var _348170509aptEnergy:BoxLabel;
        public var petData:Object;
        private var _169699453petFuncBtn6:BasicGlowButton;
        private var _1554141558tabBtn1:BasicMultiLineButton;
        private var _505171261openBtn5:BasicGlowButton;
        private var petAC:ArrayCollection;
        private var _108251578bindImg:Image;
        private var _1991903918addIntelligenceButton:Button;
        private var _1582407209AddMultipleCheck:CheckBox;
        private var _1283394786finalResiCritical:TextInput;
        private var _579057063petDataList:List;
        private var _279478090addAgilityButton:Button;
        private var _1886549314finalDizzy:TextInput;
        private var _112005439vbox4:VBox;
        private var _1544916048defence:BoxLabel;
        private var _106557063petHp:BoxLabel;
        private var _314795602aptIntelligenceFinal:RoundedLabel;
        private var _839841136upBtn1:BasicGlowButton;
        private var _1595537735minusAgilityButton:Button;
        private var _1002706920simplecanvas2:SimpleCanvas;
        private var _1319279616attIntelligence:BoxLabel;
        private var _1318169611stateBtn:BasicDelayButton;
        private var _1167965741finalEnhMagicHurt:TextInput;
        private var _900562940skill5:SkillUseSlot;
        private var _1091882812factor3:RoundedLabel;
        private var _861878255basichortxtbutton4:BasicTxtButton;
        private var _974811045finalPraMagDef:TextInput;
        private var _405874039addEnergy:BoxLabel;
        public var firstTimeFlag:Boolean = true;
        private var _456005657petClose:BoxLabel;
        private var _344201002xibieshai:ComboBox;
        private var _677962291petEqu7:ItemSlot;
        private var _1995090974finalPoison:TextInput;
        private var _1181680126attStrength:BoxLabel;
        private var _1549420547delBtn4:BasicGlowButton;
        private var _1064350886_PetManagerPanel_HBox1:HBox;
        private var _677962296petEqu2:ItemSlot;
        private var _504961010growRateAdd:RoundedLabel;
        private var _169699449petFuncBtn2:BasicGlowButton;
        private var _109641799speed:BoxLabel;
        private var _1229780311aptIntelligenceEx:RoundedLabel;
        private var _815424624aptStrengthFinal:RoundedLabel;
        private var _1543550368aptAgility:BoxLabel;
        private var _1889342449minusStaminaButton:Button;
        private var _183433628attAgility:BoxLabel;
        private var _344411275pettabBtn1:BasicGlowButton;
        private var _1911434378aptStamina:BoxLabel;
        private var _1040925444finalCriticalDamage:TextInput;
        private var _677761861petLife:BoxLabel;
        private var _3540562star:Repeater;
        private var _415587680aptEnergyEx:RoundedLabel;
        private var selPetData:Object;
        private var _3034456btn4:BasicGlowButton;
        private var _839841134upBtn3:BasicGlowButton;
        public var _PetManagerPanel_BasicTxtButton1:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton2:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton3:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton5:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton7:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton9:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton6:BasicTxtButton;
        public var _PetManagerPanel_BasicTxtButton8:BasicTxtButton;
        private var _1407259064attack:BoxLabel;
        private var _1002706921simplecanvas3:SimpleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":626,
                    "height":488,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetManagerPanel_BasicTitleCanvas1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "y":31,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"tarcanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "height":173,
                                            "width":135,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"showCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":63.5,
                                                        "y":128.2,
                                                        "height":13,
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
                                                        "x":41,
                                                        "y":6,
                                                        "width":16,
                                                        "height":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"bindImg",
                                                "events":{"click":"__bindImg_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":24,
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
                                                    return ({
                                                        "y":5,
                                                        "width":63.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"propertyCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":40,
                                                        "height":18,
                                                        "y":3,
                                                        "x":43,
                                                        "visible":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":PropertyBar,
                                                            "id":"propertyBarHp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.cornerRadius = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "barCornerRadius":0,
                                                                    "backColor":0xFFFFFF,
                                                                    "x":5,
                                                                    "y":5,
                                                                    "width":35,
                                                                    "height":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PropertyBar,
                                                            "id":"propertyBarMp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.cornerRadius = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "barCornerRadius":0,
                                                                    "backColor":0xFFFFFF,
                                                                    "x":5,
                                                                    "y":11,
                                                                    "width":35,
                                                                    "height":5
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_PetManagerPanel_BasicGlowButton1",
                                                "events":{"click":"___PetManagerPanel_BasicGlowButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":68,
                                                        "y":144,
                                                        "styleName":"BtnNormalRed",
                                                        "width":57,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"stateBtn",
                                                "events":{"click":"__stateBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":10,
                                                        "y":144,
                                                        "styleName":"BtnNormalRed",
                                                        "width":40,
                                                        "height":19
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PetManagerPanel_BasicGlowButton2",
                                    "events":{"click":"___PetManagerPanel_BasicGlowButton2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":34.5,
                                            "styleName":"BtnNormalRed",
                                            "x":155,
                                            "width":40,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn2",
                                    "events":{"click":"__btn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":325,
                                            "y":34.5,
                                            "styleName":"BtnNormalRed",
                                            "width":40,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn4",
                                    "events":{"click":"__btn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":34.5,
                                            "styleName":"BtnNormalRed",
                                            "x":240,
                                            "width":40,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_PetManagerPanel_BasicGlowButton5",
                                    "events":{"click":"___PetManagerPanel_BasicGlowButton5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":407,
                                            "y":34.5,
                                            "styleName":"BtnNormalRed",
                                            "width":40,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"showPetFollowBtn",
                                    "events":{"click":"__showPetFollowBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":484.5,
                                            "y":34.5,
                                            "styleName":"BtnNormalRed",
                                            "width":40,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":16,
                                            "y":227,
                                            "width":128,
                                            "height":202,
                                            "styleName":"CSSBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"petDataList",
                                                "events":{
                                                    "itemClick":"__petDataList_itemClick",
                                                    "mouseDown":"__petDataList_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.right = "0";
                                                    this.borderStyle = "none";
                                                    this.left = "0";
                                                    this.verticalCenter = "-3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "percentHeight":100,
                                                        "itemRenderer":_PetManagerPanel_ClassFactory1_c()
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"petClose",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":548,
                                            "y":13.5,
                                            "width":65,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"petLife",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":395.5,
                                            "width":97,
                                            "y":13.5,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"petExp",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "left";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":198.5,
                                            "y":13.5,
                                            "width":145,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageSelector",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":17,
                                            "y":429,
                                            "width":126,
                                            "height":21
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"paixucb",
                                    "events":{"click":"__paixucb_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":206,
                                            "width":61,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"petNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":18,
                                            "y":206,
                                            "x":73
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetManagerPanel_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":154.5,
                                            "y":13.5,
                                            "width":37,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetManagerPanel_BasicTxtButton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":351.5,
                                            "y":13.5,
                                            "width":37,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_PetManagerPanel_BasicTxtButton3",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":500,
                                            "y":13.5,
                                            "width":37,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"pettabBtn0",
                                    "events":{"click":"__pettabBtn0_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "56";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":267,
                                            "width":100,
                                            "styleName":"HorizontalTab",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"pettabBtn1",
                                    "events":{"click":"__pettabBtn1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "56";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":167,
                                            "width":100,
                                            "selected":true,
                                            "styleName":"HorizontalTab",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"dp1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":157,
                                            "y":75,
                                            "width":458,
                                            "height":370,
                                            "styleName":"CanvasBorder",
                                            "visible":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":VBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalGap = 4;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":140,
                                                        "height":351,
                                                        "x":171,
                                                        "y":7,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Liên kích",
                                                                                "toolTip":"Khi tấn công vật lý có tỉ lệ nhất định được tiếp tục tấn công, đồng thời ảnh hưởng đến % liên kích (như skill Nhịp Đập Trái Tim、Hồng Liên Xung Trảm)"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalCombo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":55,
                                                                                "text":"Phản kích",
                                                                                "toolTip":"Khi chịu sát thương chí mạng có xác suất phản kích vật lý vào đối phương",
                                                                                "x":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalCounter",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Miễn tử",
                                                                                "toolTip":"Khi chịu sát thương chí mạng sẽ có xác suất không chết, chỉ có tác dụng 1 lần trong trận"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalRebornRate",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Phá kích",
                                                                                "toolTip":"Giảm tỉ lệ miễn tử của đối phương"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalBreakReborn",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"XPN",
                                                                                "toolTip":"Xác suất tạo buff XPN và miễn sát thương"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalDefy",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Kháng xuyên",
                                                                                "toolTip":"Giảm tỉ lệ xuyên phòng ngự"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalResiDefy",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Bạo kích",
                                                                                "toolTip":"Giảm tỉ lệ bị bạo kích"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalResiCritical",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Tỉ lệ bạo",
                                                                                "toolTip":"Tăng sát thương bạo kích"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalCriticalDamage",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Miễn STVL",
                                                                                "toolTip":"Giảm sát thương vật lý, làm đối phương không thể xuyên phòng ngự"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalReduceHurt1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label10",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Miễn STMP",
                                                                                "toolTip":"Giảm sát thương ma pháp, làm đối phương không thể xuyên phòng ngự"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalReduceHurt2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label11",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Tăng STVL cuối",
                                                                                "toolTip":"Tăng STVL cuối"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalEnhPhyHurt",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label12",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Tăng STMP cuối",
                                                                                "toolTip":"Tăng STMP cuối"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalEnhMagicHurt",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label13",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Giảm STVL cuối",
                                                                                "toolTip":"Giảm STVL cuối, làm đối phương không thể xuyên phòng ngự"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalPraDef",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label14",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Giảm STMP cuối",
                                                                                "toolTip":"Giảm STMP cuối, làm đối phương không thể xuyên phòng ngự"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalPraMagDef",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalGap = 4;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":140,
                                                        "height":351,
                                                        "x":312,
                                                        "y":7,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label15",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Choáng chính xác",
                                                                                "toolTip":"Tăng tỉ lệ buff choáng chính xác"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalDizzy",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label16",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Loạn chính xác",
                                                                                "toolTip":"Tăng tỉ lệ buff loạn chính xác"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalConfusion",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label17",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Tăng tỉ lệ buff hóa thạch chính xác",
                                                                                "toolTip":"Tăng tỉ lệ buff hóa thạch chính xác"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalLight",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label18",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Tăng tỉ lệ buff hôn mê chính xác",
                                                                                "toolTip":"Tăng tỉ lệ buff hôn mê chính xác"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalSleep",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label19",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Tăng tỉ lệ buff trúng độc chính xác",
                                                                                "toolTip":"Tăng tỉ lệ buff trúng độc chính xác"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalPoison",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label20",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Tăng tỉ lệ buff trào phúng chính xác",
                                                                                "toolTip":"Tăng tỉ lệ buff trào phúng chính xác"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalRage",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label21",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Kháng choáng",
                                                                                "toolTip":"Giảm tỉ lệ choáng"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalResiDizzy",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label22",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Kháng loạn",
                                                                                "toolTip":"Giảm tỉ lệ loạn"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalResiConfusion",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label23",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Kháng hóa thạch",
                                                                                "toolTip":"Giảm tỉ lệ hóa thạch"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalResiLight",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label24",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Kháng hôn mê",
                                                                                "toolTip":"Giảm tỉ lệ hôn mê"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalResiSleep",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label25",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Kháng độc",
                                                                                "toolTip":"Giảm tỉ lệ trúng độc"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalResiPoison",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
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
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetManagerPanel_Label26",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":55,
                                                                                "text":"Kháng trào phúng",
                                                                                "toolTip":"Giảm tỉ lệ trào phúng"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"finalResiRage",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56,
                                                                                "text":"12.32%",
                                                                                "height":20,
                                                                                "width":73,
                                                                                "editable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attStrength",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":9,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attAgility",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":53,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attStamina",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":31,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attIntelligence",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":75,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attEnergy",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":97,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attLastPoint",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "width":35,
                                                        "y":119
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"addStrength",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":91,
                                                        "y":9,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"addAgility",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":91,
                                                        "y":53,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"addStamina",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":91,
                                                        "y":31,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"addIntelligence",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":91,
                                                        "y":75,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"addEnergy",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":91,
                                                        "y":97,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"AddMultipleCheck",
                                                "events":{"change":"__AddMultipleCheck_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":91,
                                                        "y":119,
                                                        "width":24,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":103,
                                                        "y":121,
                                                        "width":61,
                                                        "height":20,
                                                        "label":"*10"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"addBtnCanvas",
                                                "stylesFactory":function ():void
                                                {
                                                    this.disabledOverlayAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":118,
                                                        "y":7,
                                                        "width":48,
                                                        "height":140,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"addStrengthButton",
                                                            "events":{"buttonDown":"__addStrengthButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":7,
                                                                    "y":1.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"minusStrengthButton",
                                                            "events":{"buttonDown":"__minusStrengthButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":27,
                                                                    "y":1.5,
                                                                    "styleName":"BtnReduce2"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"addAgilityButton",
                                                            "events":{"buttonDown":"__addAgilityButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":7,
                                                                    "y":45.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"minusAgilityButton",
                                                            "events":{"buttonDown":"__minusAgilityButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":27,
                                                                    "y":45.5,
                                                                    "styleName":"BtnReduce2"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"addStaminaButton",
                                                            "events":{"buttonDown":"__addStaminaButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":7,
                                                                    "y":23.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"minusStaminaButton",
                                                            "events":{"buttonDown":"__minusStaminaButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":27,
                                                                    "y":23.5,
                                                                    "styleName":"BtnReduce2"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"addIntelligenceButton",
                                                            "events":{"buttonDown":"__addIntelligenceButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":7,
                                                                    "y":67.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"minusIntelligenceButton",
                                                            "events":{"buttonDown":"__minusIntelligenceButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":27,
                                                                    "y":67.5,
                                                                    "styleName":"BtnReduce2"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"addEnergyButton",
                                                            "events":{"buttonDown":"__addEnergyButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":7,
                                                                    "y":89.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"minusEnergyButton",
                                                            "events":{"buttonDown":"__minusEnergyButton_buttonDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "autoRepeat":true,
                                                                    "x":27,
                                                                    "y":89.5,
                                                                    "styleName":"BtnReduce2"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"_PetManagerPanel_BasicDelayButton2",
                                                            "events":{"click":"___PetManagerPanel_BasicDelayButton2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingBottom = 0;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 0;
                                                                this.cornerRadius = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":114,
                                                                    "x":6,
                                                                    "styleName":"BtnNormalRed",
                                                                    "width":40,
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":9,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":31,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":53,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":75,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":97,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":119,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"petHp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":145,
                                                        "width":110,
                                                        "x":54,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"petMp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":167,
                                                        "width":110,
                                                        "x":54,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attack",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":191,
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"mAttack",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":213,
                                                        "text":"",
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"defence",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":235,
                                                        "text":"",
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"mDefence",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":0x0101,
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"hit",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":279,
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"critical",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":345,
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"speed",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":323,
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"dodge",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":54,
                                                        "y":301,
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton11",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":145,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton12",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":167,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton13",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":191,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton14",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":213,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton15",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":235,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton16",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":0x0101,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton17",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":279,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton18",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":301,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton19",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":323,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_PetManagerPanel_BasicTxtButton20",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":345,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"dp2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":157,
                                            "y":75,
                                            "width":458,
                                            "height":370,
                                            "styleName":"CanvasBorder",
                                            "visible":true,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetManagerPanel_Image4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":34,
                                                        "y":64
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"factor0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 15361583;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":80,
                                                        "y":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"factor1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 14689269;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":125,
                                                        "y":101
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"factor2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16081443;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":109,
                                                        "y":152
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"factor3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 2329845;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":51,
                                                        "y":152
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"factor4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 9301547;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"canvas3",
                                                "events":{"creationComplete":"__canvas3_creationComplete"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":232,
                                                        "width":222,
                                                        "height":118,
                                                        "x":226,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"petEqu1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":600,
                                                                    "y":14,
                                                                    "x":10,
                                                                    "slotType":4
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"petEqu2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":601,
                                                                    "y":14,
                                                                    "x":67,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"petEqu3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":602,
                                                                    "y":14,
                                                                    "x":124,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"petEqu4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":603,
                                                                    "y":14,
                                                                    "x":179,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"petEqu5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":604,
                                                                    "y":74,
                                                                    "x":10,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"petEqu6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":605,
                                                                    "y":74,
                                                                    "x":67,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"petEqu7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":606,
                                                                    "y":74,
                                                                    "x":124,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"petEqu8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":607,
                                                                    "y":74,
                                                                    "x":179,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"petFuncBtn1",
                                                "events":{"click":"__petFuncBtn1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":166,
                                                        "y":11,
                                                        "styleName":"BtnStdRed",
                                                        "width":50.9
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"petFuncBtn2",
                                                "events":{"click":"__petFuncBtn2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":167,
                                                        "y":48,
                                                        "styleName":"BtnStdRed",
                                                        "width":50.9
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"petFuncBtn3",
                                                "events":{"click":"__petFuncBtn3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":167,
                                                        "y":82,
                                                        "styleName":"BtnStdRed",
                                                        "width":50.9
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"petFuncBtn4",
                                                "events":{"click":"__petFuncBtn4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":166,
                                                        "y":116,
                                                        "styleName":"BtnStdRed",
                                                        "width":50.9
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"petFuncBtn5",
                                                "events":{"click":"__petFuncBtn5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":167,
                                                        "y":153,
                                                        "styleName":"BtnStdRed",
                                                        "width":50.9
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"petFuncBtn6",
                                                "events":{"click":"__petFuncBtn6_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":167,
                                                        "y":189,
                                                        "styleName":"BtnStdRed",
                                                        "width":50.9
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"canvas2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":220,
                                                        "y":10,
                                                        "width":236,
                                                        "height":230,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicMultiLineButton,
                                                            "id":"tabBtn0",
                                                            "events":{"click":"__tabBtn0_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":4,
                                                                    "y":3,
                                                                    "styleName":"VerticalTab",
                                                                    "selected":true,
                                                                    "height":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicMultiLineButton,
                                                            "id":"tabBtn1",
                                                            "events":{"click":"__tabBtn1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":4,
                                                                    "y":69,
                                                                    "styleName":"VerticalTab",
                                                                    "height":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicMultiLineButton,
                                                            "id":"tabBtn2",
                                                            "events":{"click":"__tabBtn2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":4,
                                                                    "y":135,
                                                                    "styleName":"VerticalTab",
                                                                    "height":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":SimpleCanvas,
                                                            "id":"simplecanvas3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":SkillUseSlot,
                                                                        "id":"skill1",
                                                                        "events":{
                                                                            "click":"__skill1_click",
                                                                            "creationComplete":"__skill1_creationComplete"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2.5,
                                                                                "y":2,
                                                                                "height":41,
                                                                                "currentState":"pet",
                                                                                "skillType":"pet",
                                                                                "width":150
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":SkillUseSlot,
                                                                        "id":"skill2",
                                                                        "events":{
                                                                            "click":"__skill2_click",
                                                                            "creationComplete":"__skill2_creationComplete"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2.5,
                                                                                "y":44,
                                                                                "height":41,
                                                                                "currentState":"pet",
                                                                                "skillType":"pet",
                                                                                "width":150
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":SkillUseSlot,
                                                                        "id":"skill3",
                                                                        "events":{
                                                                            "click":"__skill3_click",
                                                                            "creationComplete":"__skill3_creationComplete"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2.5,
                                                                                "y":86,
                                                                                "height":41,
                                                                                "currentState":"pet",
                                                                                "skillType":"pet",
                                                                                "width":150
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":SkillUseSlot,
                                                                        "id":"skill4",
                                                                        "events":{
                                                                            "click":"__skill4_click",
                                                                            "creationComplete":"__skill4_creationComplete"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2.5,
                                                                                "y":128,
                                                                                "height":41,
                                                                                "currentState":"pet",
                                                                                "skillType":"pet",
                                                                                "width":150
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":SkillUseSlot,
                                                                        "id":"skill5",
                                                                        "events":{
                                                                            "click":"__skill5_click",
                                                                            "creationComplete":"__skill5_creationComplete"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2.5,
                                                                                "y":170,
                                                                                "height":41,
                                                                                "currentState":"pet",
                                                                                "skillType":"pet",
                                                                                "width":150
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VBox,
                                                                        "id":"vbox1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalAlign = "center";
                                                                            this.verticalGap = 1;
                                                                            this.verticalAlign = "middle";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":160,
                                                                                "y":3,
                                                                                "width":50,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"delBtn1",
                                                                                    "events":{"click":"__delBtn1_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalRed",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"upBtn1",
                                                                                    "events":{"click":"__upBtn1_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalBlue",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"openBtn1",
                                                                                    "events":{"click":"__openBtn1_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalGreen",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VBox,
                                                                        "id":"vbox2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalAlign = "center";
                                                                            this.verticalGap = 1;
                                                                            this.verticalAlign = "middle";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":160,
                                                                                "y":45,
                                                                                "width":50,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"delBtn2",
                                                                                    "events":{"click":"__delBtn2_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalRed",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"upBtn2",
                                                                                    "events":{"click":"__upBtn2_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalBlue",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"openBtn2",
                                                                                    "events":{"click":"__openBtn2_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalGreen",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VBox,
                                                                        "id":"vbox3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalAlign = "center";
                                                                            this.verticalGap = 1;
                                                                            this.verticalAlign = "middle";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":160,
                                                                                "y":87,
                                                                                "width":50,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"delBtn3",
                                                                                    "events":{"click":"__delBtn3_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalRed",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"upBtn3",
                                                                                    "events":{"click":"__upBtn3_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalBlue",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"openBtn3",
                                                                                    "events":{"click":"__openBtn3_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalGreen",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VBox,
                                                                        "id":"vbox4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalAlign = "center";
                                                                            this.verticalGap = 1;
                                                                            this.verticalAlign = "middle";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":160,
                                                                                "y":129,
                                                                                "width":50,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"delBtn4",
                                                                                    "events":{"click":"__delBtn4_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalRed",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"upBtn4",
                                                                                    "events":{"click":"__upBtn4_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalBlue",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"openBtn4",
                                                                                    "events":{"click":"__openBtn4_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalGreen",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VBox,
                                                                        "id":"vbox5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalAlign = "center";
                                                                            this.verticalGap = 1;
                                                                            this.verticalAlign = "middle";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":160,
                                                                                "y":171,
                                                                                "width":50,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"delBtn5",
                                                                                    "events":{"click":"__delBtn5_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalRed",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"upBtn5",
                                                                                    "events":{"click":"__upBtn5_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalBlue",
                                                                                            "width":40.6,
                                                                                            "height":19
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"openBtn5",
                                                                                    "events":{"click":"__openBtn5_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalGreen",
                                                                                            "width":40.6,
                                                                                            "height":19
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
                                                "type":BoxLabel,
                                                "id":"growRate",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":84,
                                                        "y":223,
                                                        "width":134
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"growRateAdd",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":159,
                                                        "y":223,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"aptStrength",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":84,
                                                        "y":245,
                                                        "width":134
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"aptAgility",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":84,
                                                        "y":266,
                                                        "width":134
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"aptStamina",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":84,
                                                        "y":288,
                                                        "width":134
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"aptIntelligence",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":84,
                                                        "y":310,
                                                        "width":134
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"aptEnergy",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":84,
                                                        "y":332,
                                                        "width":134
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptStrengthEx",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF0000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":123,
                                                        "y":245,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptAgilityEx",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF0000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":123,
                                                        "y":266,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptStaminaEx",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF0000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":123,
                                                        "y":288,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptIntelligenceEx",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF0000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":123,
                                                        "y":310,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptEnergyEx",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFF0000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":123,
                                                        "y":332,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptStrengthFinal",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":159,
                                                        "y":245,
                                                        "width":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptAgilityFinal",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":159,
                                                        "y":267,
                                                        "width":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptStaminaFinal",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":159,
                                                        "y":288,
                                                        "width":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptIntelligenceFinal",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":159,
                                                        "y":310,
                                                        "width":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"aptEnergyFinal",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":159,
                                                        "y":332,
                                                        "width":59
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"basichortxtbutton1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                    this.paddingTop = 1;
                                                    this.paddingBottom = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":18,
                                                        "y":223,
                                                        "width":66,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"basichortxtbutton2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                    this.paddingTop = 1;
                                                    this.paddingBottom = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":18,
                                                        "y":245,
                                                        "width":66,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"basichortxtbutton3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                    this.paddingTop = 1;
                                                    this.paddingBottom = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":18,
                                                        "y":266,
                                                        "width":66,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"basichortxtbutton4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                    this.paddingTop = 1;
                                                    this.paddingBottom = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":18,
                                                        "y":288,
                                                        "width":66,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"basichortxtbutton5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                    this.paddingTop = 1;
                                                    this.paddingBottom = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":18,
                                                        "y":311,
                                                        "width":66,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"basichortxtbutton6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                    this.paddingTop = 1;
                                                    this.paddingBottom = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":18,
                                                        "y":332,
                                                        "width":66,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SimpleCanvas,
                                                "id":"simplecanvas2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":105,
                                                        "height":138.5,
                                                        "y":52,
                                                        "x":46,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":PentagonCanvas,
                                                            "id":"propertyPentagon",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":86,
                                                                    "height":91,
                                                                    "x":0,
                                                                    "y":19,
                                                                    "lineShow":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "id":"starHbox",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":130,
                                                                    "y":-10,
                                                                    "x":-12,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Repeater,
                                                                        "id":"star",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_PetManagerPanel_Image5",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":9,
                                                                                            "height":9
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
                                }), new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"xibieshai",
                                    "events":{"change":"__xibieshai_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":54,
                                            "y":183,
                                            "width":90,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_PetManagerPanel_RoundedLabel18",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":187,
                                            "width":61,
                                            "height":18
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
        private var _1613040912petPageAc:ArrayCollection = new ArrayCollection();
        private var PET_STATE_ARR:Array = [{
            "label":Language.PETMANAGERPANEL_S[17],
            "state":1
        }, {
            "label":Language.PETMANAGERPANEL_S[16],
            "state":3
        }];
        private const PROP_INT_KEY_ARR:Array = ["finalCombo", "finalCounter", "finalRebornRate", "finalBreakReborn", "finalDefy", "finalResiDefy", "finalResiCritical", "finalDizzy", "finalConfusion", "finalSleep", "finalPoison", "finalRage", "finalLight", "finalResiDizzy", "finalResiConfusion", "finalResiSleep", "finalResiPoison", "finalResiLight", "finalResiRage"];
        private const PROP_PER_KEY_ARR:Array = ["finalReduceHurt1", "finalReduceHurt2", "finalEnhPhyHurt", "finalEnhMagicHurt", "finalPraDef", "finalPraMagDef", "finalCriticalDamage"];
        private var _345262067xiebieshaidp:ArrayCollection = new ArrayCollection(["Tất cả", "Hệ người", "Hệ dã thú", "Hệ thực vật", "Hệ máy", "Hệ ác ma", "Hệ rồng", "Hệ BOSS"]);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetManagerPanel()
        {
            mx_internal::_document = this;
            this.width = 626;
            this.height = 488;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetManagerPanel._watcherSetupUtil = _arg_1;
        }


        public function set attIntelligence(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1319279616attIntelligence;
            if (_local_2 !== _arg_1)
            {
                this._1319279616attIntelligence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attIntelligence", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get delBtn2():BasicGlowButton
        {
            return (this._1549420545delBtn2);
        }

        public function set delBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420545delBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1549420545delBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get delBtn4():BasicGlowButton
        {
            return (this._1549420547delBtn4);
        }

        public function set addStrength(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._817036290addStrength;
            if (_local_2 !== _arg_1)
            {
                this._817036290addStrength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStrength", _local_2, _arg_1));
            };
        }

        public function set delBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420547delBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1549420547delBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn4", _local_2, _arg_1));
            };
        }

        public function set delBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420548delBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1549420548delBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get delBtn3():BasicGlowButton
        {
            return (this._1549420546delBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get skill4():SkillUseSlot
        {
            return (this._900562941skill4);
        }

        public function set delBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420546delBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1549420546delBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn3", _local_2, _arg_1));
            };
        }

        public function set skill4(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562941skill4;
            if (_local_2 !== _arg_1)
            {
                this._900562941skill4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get delBtn1():BasicGlowButton
        {
            return (this._1549420544delBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get skill2():SkillUseSlot
        {
            return (this._900562943skill2);
        }

        public function set skill2(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562943skill2;
            if (_local_2 !== _arg_1)
            {
                this._900562943skill2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get delBtn5():BasicGlowButton
        {
            return (this._1549420548delBtn5);
        }

        [Bindable(event="propertyChange")]
        private function get styleAddName():String
        {
            return (this._177868763styleAddName);
        }

        public function set stateBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1318169611stateBtn;
            if (_local_2 !== _arg_1)
            {
                this._1318169611stateBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateBtn", _local_2, _arg_1));
            };
        }

        public function set skill5(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562940skill5;
            if (_local_2 !== _arg_1)
            {
                this._900562940skill5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petClose():BoxLabel
        {
            return (this._456005657petClose);
        }

        [Bindable(event="propertyChange")]
        public function get finalResiDefy():TextInput
        {
            return (this._908333075finalResiDefy);
        }

        [Bindable(event="propertyChange")]
        public function get growRateAdd():RoundedLabel
        {
            return (this._504961010growRateAdd);
        }

        [Bindable(event="propertyChange")]
        private function get xiebieshaidp():ArrayCollection
        {
            return (this._345262067xiebieshaidp);
        }

        private function petDataListClick():void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:*;
            var _local_7:Number;
            if (petAC.length == 0)
            {
                viewClear();
                clearView();
                return;
            };
            if (petDataList.selectedItem == null)
            {
                viewClear();
                clearView();
                return;
            };
            selPetData = petDataList.selectedItem.petData;
            if (selPetData.state == PET_STATE_ARR[0]["state"])
            {
                stateBtn.label = PET_STATE_ARR[0]["label"];
            }
            else
            {
                stateBtn.label = PET_STATE_ARR[1]["label"];
            };
            stateBtn.toolTip = stateBtn.label;
            showSelPet();
            setAddStyleName();
            minusStrengthButton.styleName = "BtnReduce2";
            minusAgilityButton.styleName = "BtnReduce2";
            minusStaminaButton.styleName = "BtnReduce2";
            minusIntelligenceButton.styleName = "BtnReduce2";
            minusEnergyButton.styleName = "BtnReduce2";
            if (selPetData.state == 1)
            {
                detailUpdateView(selPetData.property, true);
            }
            else
            {
                if (selPetData.state != 1)
                {
                    detailUpdateView(selPetData.property);
                };
            };
            var _local_1:* = "";
            petData = petDataList.selectedItem.petData;
            if (petData)
            {
                clearView();
                petDataTemp = petData.creatureData;
                propertyPentagon.setName = ["　", "　", "　", "　", "　"];
                propertyPentagon.showProperty(10000, [(Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)), (Number(petData.aptAgility) + ((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)), (Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)), (Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)), (Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0))], [Number(Math.round((((Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)) + Number(((petData.aptStrengthEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))), Number(Math.round((((Number(petData.aptAgility) + ((petData.property.aptAgilityhEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)) + Number(((petData.aptAgilityEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))), Number(Math.round((((Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)) + Number(((petData.aptStaminaEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))), Number(Math.round((((Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)) + Number(((petData.aptIntelligenceEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))), Number(Math.round((((Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)) + Number(((petData.aptEnergyEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd)))))]);
                aptStrength.text = String((Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)));
                aptAgility.text = String((Number(petData.aptAgility) + ((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)));
                aptStamina.text = String((Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)));
                aptIntelligence.text = String((Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)));
                aptEnergy.text = String((Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)));
                aptStrengthEx.text = ("+" + ((petData.aptStrengthEx) || (0)));
                aptAgilityEx.text = ("+" + ((petData.aptAgilityEx) || (0)));
                aptStaminaEx.text = ("+" + ((petData.aptStaminaEx) || (0)));
                aptIntelligenceEx.text = ("+" + ((petData.aptIntelligenceEx) || (0)));
                aptEnergyEx.text = ("+" + ((petData.aptEnergyEx) || (0)));
                growRate.text = (Math.round((petData.property.growRate * 100)) / 100).toString();
                aptStrengthFinal.text = ("=> " + String(Math.round((((Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)) + Number(((petData.aptStrengthEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                aptAgilityFinal.text = ("=> " + String(Math.round((((Number(petData.aptAgility) + ((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)) + Number(((petData.aptAgilityEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                aptStaminaFinal.text = ("=> " + String(Math.round((((Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)) + Number(((petData.aptStaminaEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                aptIntelligenceFinal.text = ("=> " + String(Math.round((((Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)) + Number(((petData.aptIntelligenceEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                aptEnergyFinal.text = ("=> " + String(Math.round((((Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)) + Number(((petData.aptEnergyEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                growRateAdd.text = ("+  " + (Math.round((petData.property.growRateAdd * 100)) / 100).toString());
                aptStrength.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStrength) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)));
                aptAgility.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptAgility) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)));
                aptStamina.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStamina) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)));
                aptIntelligence.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptIntelligence) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)));
                aptEnergy.toolTip = ((((((Language.PETPANEL_S[14] + ":") + petData.aptEnergy) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)));
                aptStrengthEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStrengthEx) || (0)));
                aptAgilityEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptAgilityEx) || (0)));
                aptStaminaEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStaminaEx) || (0)));
                aptIntelligenceEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptIntelligenceEx) || (0)));
                aptEnergyEx.toolTip = ((Language.PETPANEL_S[16] + ":") + ((petData.aptEnergyEx) || (0)));
                aptStrengthFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptStrength) + ((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)) + Number(((petData.aptStrengthEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                aptAgilityFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptAgility) + ((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)) + Number(((petData.aptAgilityEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                aptStaminaFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptStamina) + ((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)) + Number(((petData.aptStaminaEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                aptIntelligenceFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptIntelligence) + ((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)) + Number(((petData.aptIntelligenceEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                aptEnergyFinal.toolTip = ((Language.PETPANEL_S[15] + ":") + String(Math.round((((Number(petData.aptEnergy) + ((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)) + Number(((petData.aptEnergyEx) || (0)))) * (Number(petData.property.growRate) + Number(petData.property.growRateAdd))))));
                _local_2 = [];
                _local_3 = 0;
                while (_local_3 <= 11)
                {
                    _local_2[_local_3] = ResManager.ICON_PET_STAR_DARK;
                    if (ToolKit.isSmallOrEqual((_local_3 + 1), petData.upgradeNum))
                    {
                        _local_2[_local_3] = ResManager.ICON_PET_STAR_LIGHT;
                    };
                    _local_3++;
                };
                star.dataProvider = _local_2;
                _local_1 = Language.PETPANEL_S[0];
                _local_1 = _local_1.replace("{upgradeNum}", petData.upgradeNum);
                starHbox.toolTip = _local_1;
                _local_4 = 1;
                while (_local_4 <= GamePredef.PETEQU_NUM)
                {
                    if (ToolKit.isBigThan(petData[("equ" + _local_4)], 0))
                    {
                        _local_5 = petData[("equ" + _local_4)];
                        _local_6 = _core.data.getSlot({"id":_local_5});
                        _local_7 = petData[("equ" + _local_4)];
                        if (_local_7 < 0)
                        {
                            this[("petEqu" + _local_4)].giid = -1;
                            this[("petEqu" + _local_4)].restore();
                        }
                        else
                        {
                            if (_local_6)
                            {
                                this[("petEqu" + _local_4)].type = _local_6.type;
                                this[("petEqu" + _local_4)].giid = _local_6.itemId;
                            };
                        };
                    }
                    else
                    {
                        this[("petEqu" + _local_4)].giid = -1;
                        this[("petEqu" + _local_4)].restore();
                    };
                    _local_4++;
                };
                drawSkillSlots(selectedTabIndex);
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill3():SkillUseSlot
        {
            return (this._900562942skill3);
        }

        public function set finalResiDefy(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._908333075finalResiDefy;
            if (_local_2 !== _arg_1)
            {
                this._908333075finalResiDefy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalResiDefy", _local_2, _arg_1));
            };
        }

        public function set growRateAdd(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._504961010growRateAdd;
            if (_local_2 !== _arg_1)
            {
                this._504961010growRateAdd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "growRateAdd", _local_2, _arg_1));
            };
        }

        public function set delBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1549420544delBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1549420544delBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delBtn1", _local_2, _arg_1));
            };
        }

        private function skillTabBtnClick(_arg_1:int):void
        {
            drawSkillSlots(_arg_1);
            selectedTabIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= 2)
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

        public function __minusStaminaButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function set petClose(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._456005657petClose;
            if (_local_2 !== _arg_1)
            {
                this._456005657petClose = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petClose", _local_2, _arg_1));
            };
        }

        public function __skill5_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get skill1():SkillUseSlot
        {
            return (this._900562944skill1);
        }

        public function set finalPoison(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1995090974finalPoison;
            if (_local_2 !== _arg_1)
            {
                this._1995090974finalPoison = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalPoison", _local_2, _arg_1));
            };
        }

        public function set skill3(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562942skill3;
            if (_local_2 !== _arg_1)
            {
                this._900562942skill3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill3", _local_2, _arg_1));
            };
        }

        public function openGuardPanel():void
        {
            if (_core.player.level < 50)
            {
                Alert.show(Language.PANEL_PETGUARD[10], "", Alert.YES, null, null);
                return;
            };
            var _local_1:Object = this._core.view.getUI(ViewManager.PANEL_PETGUARD);
            if (_local_1)
            {
                _local_1.openGuardPanel();
            };
        }

        [Bindable(event="propertyChange")]
        public function get speed():BoxLabel
        {
            return (this._109641799speed);
        }

        public function set skill1(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object;
            _local_2 = this._900562944skill1;
            if (_local_2 !== _arg_1)
            {
                this._900562944skill1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill5():SkillUseSlot
        {
            return (this._900562940skill5);
        }

        [Bindable(event="propertyChange")]
        public function get finalPraMagDef():TextInput
        {
            return (this._974811045finalPraMagDef);
        }

        [Bindable(event="propertyChange")]
        public function get addAgility():BoxLabel
        {
            return (this._850872420addAgility);
        }

        private function cancelPetFollow():void
        {
            _core.remote.call("cancelPetFollow", new Responder(cancelPetFollowHandler), _core.getShowPetId());
        }

        [Bindable(event="propertyChange")]
        public function get aptEnergyFinal():RoundedLabel
        {
            return (this._1618724969aptEnergyFinal);
        }

        [Bindable(event="propertyChange")]
        public function get finalResiConfusion():TextInput
        {
            return (this._1984280679finalResiConfusion);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn2():BasicGlowButton
        {
            return (this._169699449petFuncBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn3():BasicGlowButton
        {
            return (this._169699450petFuncBtn3);
        }

        private function _PetManagerPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = PetManagerPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn1():BasicGlowButton
        {
            return (this._169699448petFuncBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn5():BasicGlowButton
        {
            return (this._169699452petFuncBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn6():BasicGlowButton
        {
            return (this._169699453petFuncBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get petExp():BoxLabel
        {
            return (this._991700866petExp);
        }

        [Bindable(event="propertyChange")]
        public function get petFuncBtn4():BasicGlowButton
        {
            return (this._169699451petFuncBtn4);
        }

        public function set propertyBarMp(_arg_1:PropertyBar):void
        {
            var _local_2:Object;
            _local_2 = this._1046717375propertyBarMp;
            if (_local_2 !== _arg_1)
            {
                this._1046717375propertyBarMp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propertyBarMp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get attStamina():BoxLabel
        {
            return (this._1023416178attStamina);
        }

        private function showPetFollowBtnReset(_arg_1:TimerEvent):void
        {
            showPetFollowBtn.enabled = true;
            if (showPetTimer)
            {
                showPetTimer.removeEventListener(TimerEvent.TIMER, showPetFollowBtnReset);
                showPetTimer = null;
            };
        }

        public function set defence(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1544916048defence;
            if (_local_2 !== _arg_1)
            {
                this._1544916048defence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "defence", _local_2, _arg_1));
            };
        }

        public function __delBtn1_click(_arg_1:MouseEvent):void
        {
            delSkill(1);
        }

        public function set speed(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._109641799speed;
            if (_local_2 !== _arg_1)
            {
                this._109641799speed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "speed", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addAgilityButton():Button
        {
            return (this._279478090addAgilityButton);
        }

        public function set finalPraMagDef(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._974811045finalPraMagDef;
            if (_local_2 !== _arg_1)
            {
                this._974811045finalPraMagDef = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalPraMagDef", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get factor0():RoundedLabel
        {
            return (this._1091882815factor0);
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

        [Bindable(event="propertyChange")]
        public function get factor3():RoundedLabel
        {
            return (this._1091882812factor3);
        }

        [Bindable(event="propertyChange")]
        public function get factor4():RoundedLabel
        {
            return (this._1091882811factor4);
        }

        public function set addAgility(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._850872420addAgility;
            if (_local_2 !== _arg_1)
            {
                this._850872420addAgility = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addAgility", _local_2, _arg_1));
            };
        }

        public function set aptEnergyFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1618724969aptEnergyFinal;
            if (_local_2 !== _arg_1)
            {
                this._1618724969aptEnergyFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptEnergyFinal", _local_2, _arg_1));
            };
        }

        public function set minusEnergyButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1863068566minusEnergyButton;
            if (_local_2 !== _arg_1)
            {
                this._1863068566minusEnergyButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minusEnergyButton", _local_2, _arg_1));
            };
        }

        public function set finalResiConfusion(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1984280679finalResiConfusion;
            if (_local_2 !== _arg_1)
            {
                this._1984280679finalResiConfusion = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalResiConfusion", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptStrengthEx():RoundedLabel
        {
            return (this._2055403737aptStrengthEx);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:int;
            var _local_3:*;
            super.visible = _arg_1;
            if (_arg_1)
            {
                if (firstTimeFlag)
                {
                    initView();
                    followPetId = -1;
                };
                if (((petDataList) && (petDataList.selectedItem)))
                {
                    switchFollowButton((petDataList.selectedItem.petData.id == _core.getShowPetId()));
                };
                if (xibieshai.selectedIndex == 0)
                {
                    if (((((petAC) && (petAC.length > 0)) && (selPetData)) && (!(petDataList.selectedItem))))
                    {
                        _local_2 = 0;
                        while (_local_2 <= petAC.length)
                        {
                            if (_local_2 >= PAGE_MAX_PET_NUM)
                            {
                                pageSelector.pageNo = (_local_2 / PAGE_MAX_PET_NUM);
                                petDataList.selectedIndex = (_local_2 - (PAGE_MAX_PET_NUM * pageSelector.pageNo));
                            }
                            else
                            {
                                pageSelector.pageNo = 0;
                                petDataList.selectedIndex = _local_2;
                            };
                            if (petDataList.selectedItem.petData.id == selPetData.id)
                            {
                                petDataListClick();
                                break;
                            };
                            _local_2++;
                        };
                    };
                }
                else
                {
                    _local_3 = this[("petAC" + xibieshai.selectedIndex)];
                    if (((((_local_3) && (_local_3.length > 0)) && (selPetData)) && (!(petDataList.selectedItem))))
                    {
                        _local_2 = 0;
                        while (_local_2 <= _local_3.length)
                        {
                            if (_local_2 >= PAGE_MAX_PET_NUM)
                            {
                                pageSelector.pageNo = (_local_2 / PAGE_MAX_PET_NUM);
                                petDataList.selectedIndex = (_local_2 - (PAGE_MAX_PET_NUM * pageSelector.pageNo));
                            }
                            else
                            {
                                pageSelector.pageNo = 0;
                                petDataList.selectedIndex = _local_2;
                            };
                            if (petDataList.selectedItem.petData.id == selPetData.id)
                            {
                                petDataListClick();
                                return;
                            };
                            _local_2++;
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get finalReduceHurt1():TextInput
        {
            return (this._57704678finalReduceHurt1);
        }

        [Bindable(event="propertyChange")]
        public function get finalReduceHurt2():TextInput
        {
            return (this._57704679finalReduceHurt2);
        }

        public function __openBtn5_click(_arg_1:MouseEvent):void
        {
            openSkill(5);
        }

        public function set petFuncBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699449petFuncBtn2;
            if (_local_2 !== _arg_1)
            {
                this._169699449petFuncBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn2", _local_2, _arg_1));
            };
        }

        public function __petFuncBtn4_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(5);
        }

        public function set petFuncBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699450petFuncBtn3;
            if (_local_2 !== _arg_1)
            {
                this._169699450petFuncBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn3", _local_2, _arg_1));
            };
        }

        public function set petFuncBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699452petFuncBtn5;
            if (_local_2 !== _arg_1)
            {
                this._169699452petFuncBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn5", _local_2, _arg_1));
            };
        }

        public function set petFuncBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699451petFuncBtn4;
            if (_local_2 !== _arg_1)
            {
                this._169699451petFuncBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn4", _local_2, _arg_1));
            };
        }

        public function set petFuncBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699448petFuncBtn1;
            if (_local_2 !== _arg_1)
            {
                this._169699448petFuncBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn1", _local_2, _arg_1));
            };
        }

        public function set petFuncBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._169699453petFuncBtn6;
            if (_local_2 !== _arg_1)
            {
                this._169699453petFuncBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petFuncBtn6", _local_2, _arg_1));
            };
        }

        public function set petExp(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._991700866petExp;
            if (_local_2 !== _arg_1)
            {
                this._991700866petExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petExp", _local_2, _arg_1));
            };
        }

        private function _PetManagerPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PetManagerPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicGlowButton1.label = _arg_1;
            }, "_PetManagerPanel_BasicGlowButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                stateBtn.toolTip = _arg_1;
            }, "stateBtn.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                stateBtn.label = _arg_1;
            }, "stateBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGERPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicGlowButton2.toolTip = _arg_1;
            }, "_PetManagerPanel_BasicGlowButton2.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGERPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicGlowButton2.label = _arg_1;
            }, "_PetManagerPanel_BasicGlowButton2.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGERPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn2.toolTip = _arg_1;
            }, "btn2.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn2.label = _arg_1;
            }, "btn2.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGERPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn4.toolTip = _arg_1;
            }, "btn4.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn4.label = _arg_1;
            }, "btn4.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGERPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicGlowButton5.toolTip = _arg_1;
            }, "_PetManagerPanel_BasicGlowButton5.toolTip");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicGlowButton5.label = _arg_1;
            }, "_PetManagerPanel_BasicGlowButton5.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGERPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showPetFollowBtn.label = _arg_1;
            }, "showPetFollowBtn.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGERPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showPetFollowBtn.toolTip = _arg_1;
            }, "showPetFollowBtn.toolTip");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (petPageAc);
            }, function (_arg_1:Object):void
            {
                petDataList.dataProvider = _arg_1;
            }, "petDataList.dataProvider");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                paixucb.toolTip = _arg_1;
            }, "paixucb.toolTip");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                paixucb.label = _arg_1;
            }, "paixucb.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton1.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton1.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton2.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton2.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton3.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton3.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pettabBtn0.label = _arg_1;
            }, "pettabBtn0.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pettabBtn1.label = _arg_1;
            }, "pettabBtn1.label");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label1.filters = _arg_1;
            }, "_PetManagerPanel_Label1.filters");
            result[22] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label2.filters = _arg_1;
            }, "_PetManagerPanel_Label2.filters");
            result[23] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label3.filters = _arg_1;
            }, "_PetManagerPanel_Label3.filters");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label4.filters = _arg_1;
            }, "_PetManagerPanel_Label4.filters");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label5.filters = _arg_1;
            }, "_PetManagerPanel_Label5.filters");
            result[26] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label6.filters = _arg_1;
            }, "_PetManagerPanel_Label6.filters");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label7.filters = _arg_1;
            }, "_PetManagerPanel_Label7.filters");
            result[28] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label8.filters = _arg_1;
            }, "_PetManagerPanel_Label8.filters");
            result[29] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label9.filters = _arg_1;
            }, "_PetManagerPanel_Label9.filters");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label10.filters = _arg_1;
            }, "_PetManagerPanel_Label10.filters");
            result[31] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label11.filters = _arg_1;
            }, "_PetManagerPanel_Label11.filters");
            result[32] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label12.filters = _arg_1;
            }, "_PetManagerPanel_Label12.filters");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label13.filters = _arg_1;
            }, "_PetManagerPanel_Label13.filters");
            result[34] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label14.filters = _arg_1;
            }, "_PetManagerPanel_Label14.filters");
            result[35] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label15.filters = _arg_1;
            }, "_PetManagerPanel_Label15.filters");
            result[36] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label16.filters = _arg_1;
            }, "_PetManagerPanel_Label16.filters");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label17.filters = _arg_1;
            }, "_PetManagerPanel_Label17.filters");
            result[38] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label18.filters = _arg_1;
            }, "_PetManagerPanel_Label18.filters");
            result[39] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label19.filters = _arg_1;
            }, "_PetManagerPanel_Label19.filters");
            result[40] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label20.filters = _arg_1;
            }, "_PetManagerPanel_Label20.filters");
            result[41] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label21.filters = _arg_1;
            }, "_PetManagerPanel_Label21.filters");
            result[42] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label22.filters = _arg_1;
            }, "_PetManagerPanel_Label22.filters");
            result[43] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label23.filters = _arg_1;
            }, "_PetManagerPanel_Label23.filters");
            result[44] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label24.filters = _arg_1;
            }, "_PetManagerPanel_Label24.filters");
            result[45] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label25.filters = _arg_1;
            }, "_PetManagerPanel_Label25.filters");
            result[46] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetManagerPanel_Label26.filters = _arg_1;
            }, "_PetManagerPanel_Label26.filters");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_STR;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                attStrength.toolTip = _arg_1;
            }, "attStrength.toolTip");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_AGI;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                attAgility.toolTip = _arg_1;
            }, "attAgility.toolTip");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_STA;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                attStamina.toolTip = _arg_1;
            }, "attStamina.toolTip");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_INT;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                attIntelligence.toolTip = _arg_1;
            }, "attIntelligence.toolTip");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_SPR;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                attEnergy.toolTip = _arg_1;
            }, "attEnergy.toolTip");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.AADPROPCHECK;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                AddMultipleCheck.toolTip = _arg_1;
            }, "AddMultipleCheck.toolTip");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addStrengthButton.toolTip = _arg_1;
            }, "addStrengthButton.toolTip");
            result[54] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addStrengthButton.styleName = _arg_1;
            }, "addStrengthButton.styleName");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                minusStrengthButton.toolTip = _arg_1;
            }, "minusStrengthButton.toolTip");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addAgilityButton.toolTip = _arg_1;
            }, "addAgilityButton.toolTip");
            result[57] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addAgilityButton.styleName = _arg_1;
            }, "addAgilityButton.styleName");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                minusAgilityButton.toolTip = _arg_1;
            }, "minusAgilityButton.toolTip");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addStaminaButton.toolTip = _arg_1;
            }, "addStaminaButton.toolTip");
            result[60] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addStaminaButton.styleName = _arg_1;
            }, "addStaminaButton.styleName");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                minusStaminaButton.toolTip = _arg_1;
            }, "minusStaminaButton.toolTip");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addIntelligenceButton.toolTip = _arg_1;
            }, "addIntelligenceButton.toolTip");
            result[63] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addIntelligenceButton.styleName = _arg_1;
            }, "addIntelligenceButton.styleName");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                minusIntelligenceButton.toolTip = _arg_1;
            }, "minusIntelligenceButton.toolTip");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addEnergyButton.toolTip = _arg_1;
            }, "addEnergyButton.toolTip");
            result[66] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addEnergyButton.styleName = _arg_1;
            }, "addEnergyButton.styleName");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                minusEnergyButton.toolTip = _arg_1;
            }, "minusEnergyButton.toolTip");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicDelayButton2.label = _arg_1;
            }, "_PetManagerPanel_BasicDelayButton2.label");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_STR;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton5.toolTip = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton5.toolTip");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton5.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton5.label");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_STA;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton6.toolTip = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton6.toolTip");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton6.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton6.label");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_AGI;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton7.toolTip = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton7.toolTip");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton7.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton7.label");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_INT;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton8.toolTip = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton8.toolTip");
            result[76] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton8.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton8.label");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_SPR;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton9.toolTip = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton9.toolTip");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton9.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton9.label");
            result[79] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton10.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton10.label");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton11.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton11.label");
            result[81] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton12.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton12.label");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton13.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton13.label");
            result[83] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton14.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton14.label");
            result[84] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton15.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton15.label");
            result[85] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton16.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton16.label");
            result[86] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton17.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton17.label");
            result[87] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton18.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton18.label");
            result[88] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton19.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton19.label");
            result[89] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_BasicTxtButton20.label = _arg_1;
            }, "_PetManagerPanel_BasicTxtButton20.label");
            result[90] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PET_PENTAGON);
            }, function (_arg_1:Object):void
            {
                _PetManagerPanel_Image4.source = _arg_1;
            }, "_PetManagerPanel_Image4.source");
            result[91] = binding;
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
            result[92] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor0.filters = _arg_1;
            }, "factor0.filters");
            result[93] = binding;
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
            result[94] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor1.filters = _arg_1;
            }, "factor1.filters");
            result[95] = binding;
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
            result[96] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor2.filters = _arg_1;
            }, "factor2.filters");
            result[97] = binding;
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
            result[98] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor3.filters = _arg_1;
            }, "factor3.filters");
            result[99] = binding;
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
            result[100] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor4.filters = _arg_1;
            }, "factor4.filters");
            result[101] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.EQUIP_POSITION[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu1.text = _arg_1;
            }, "petEqu1.text");
            result[102] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu1.type = _arg_1;
            }, "petEqu1.type");
            result[103] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu1.acceptType = _arg_1;
            }, "petEqu1.acceptType");
            result[104] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([50]);
            }, function (_arg_1:Array):void
            {
                petEqu1.acceptPos = _arg_1;
            }, "petEqu1.acceptPos");
            result[105] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.EQUIP_POSITION[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu2.text = _arg_1;
            }, "petEqu2.text");
            result[106] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu2.type = _arg_1;
            }, "petEqu2.type");
            result[107] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu2.acceptType = _arg_1;
            }, "petEqu2.acceptType");
            result[108] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([51]);
            }, function (_arg_1:Array):void
            {
                petEqu2.acceptPos = _arg_1;
            }, "petEqu2.acceptPos");
            result[109] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.EQUIP_POSITION[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu3.text = _arg_1;
            }, "petEqu3.text");
            result[110] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu3.type = _arg_1;
            }, "petEqu3.type");
            result[111] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu3.acceptType = _arg_1;
            }, "petEqu3.acceptType");
            result[112] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([52]);
            }, function (_arg_1:Array):void
            {
                petEqu3.acceptPos = _arg_1;
            }, "petEqu3.acceptPos");
            result[113] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.EQUIP_POSITION[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu4.text = _arg_1;
            }, "petEqu4.text");
            result[114] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu4.type = _arg_1;
            }, "petEqu4.type");
            result[115] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu4.acceptType = _arg_1;
            }, "petEqu4.acceptType");
            result[116] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([53]);
            }, function (_arg_1:Array):void
            {
                petEqu4.acceptPos = _arg_1;
            }, "petEqu4.acceptPos");
            result[117] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.EQUIP_POSITION[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu5.text = _arg_1;
            }, "petEqu5.text");
            result[118] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu5.type = _arg_1;
            }, "petEqu5.type");
            result[119] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu5.acceptType = _arg_1;
            }, "petEqu5.acceptType");
            result[120] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([54]);
            }, function (_arg_1:Array):void
            {
                petEqu5.acceptPos = _arg_1;
            }, "petEqu5.acceptPos");
            result[121] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.EQUIP_POSITION[55];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu6.text = _arg_1;
            }, "petEqu6.text");
            result[122] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu6.type = _arg_1;
            }, "petEqu6.type");
            result[123] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu6.acceptType = _arg_1;
            }, "petEqu6.acceptType");
            result[124] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([55]);
            }, function (_arg_1:Array):void
            {
                petEqu6.acceptPos = _arg_1;
            }, "petEqu6.acceptPos");
            result[125] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.EQUIP_POSITION[56];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu7.text = _arg_1;
            }, "petEqu7.text");
            result[126] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu7.type = _arg_1;
            }, "petEqu7.type");
            result[127] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu7.acceptType = _arg_1;
            }, "petEqu7.acceptType");
            result[128] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([56]);
            }, function (_arg_1:Array):void
            {
                petEqu7.acceptPos = _arg_1;
            }, "petEqu7.acceptPos");
            result[129] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.EQUIP_POSITION[57];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEqu8.text = _arg_1;
            }, "petEqu8.text");
            result[130] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_EQUIPT_INSTANCE);
            }, function (_arg_1:int):void
            {
                petEqu8.type = _arg_1;
            }, "petEqu8.type");
            result[131] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEqu8.acceptType = _arg_1;
            }, "petEqu8.acceptType");
            result[132] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([57]);
            }, function (_arg_1:Array):void
            {
                petEqu8.acceptPos = _arg_1;
            }, "petEqu8.acceptPos");
            result[133] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn1.label = _arg_1;
            }, "petFuncBtn1.label");
            result[134] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn1.enabled = _arg_1;
            }, "petFuncBtn1.enabled");
            result[135] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn2.label = _arg_1;
            }, "petFuncBtn2.label");
            result[136] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn2.enabled = _arg_1;
            }, "petFuncBtn2.enabled");
            result[137] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn3.label = _arg_1;
            }, "petFuncBtn3.label");
            result[138] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn3.enabled = _arg_1;
            }, "petFuncBtn3.enabled");
            result[139] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn4.label = _arg_1;
            }, "petFuncBtn4.label");
            result[140] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn4.enabled = _arg_1;
            }, "petFuncBtn4.enabled");
            result[141] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn5.label = _arg_1;
            }, "petFuncBtn5.label");
            result[142] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn5.enabled = _arg_1;
            }, "petFuncBtn5.enabled");
            result[143] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petFuncBtn6.label = _arg_1;
            }, "petFuncBtn6.label");
            result[144] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                petFuncBtn6.enabled = _arg_1;
            }, "petFuncBtn6.enabled");
            result[145] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[146] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[147] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[148] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                simplecanvas3.label = _arg_1;
            }, "simplecanvas3.label");
            result[149] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn1.label = _arg_1;
            }, "delBtn1.label");
            result[150] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn1.enabled = _arg_1;
            }, "delBtn1.enabled");
            result[151] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn1.label = _arg_1;
            }, "upBtn1.label");
            result[152] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn1.enabled = _arg_1;
            }, "upBtn1.enabled");
            result[153] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn1.label = _arg_1;
            }, "openBtn1.label");
            result[154] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn1.enabled = _arg_1;
            }, "openBtn1.enabled");
            result[155] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn2.label = _arg_1;
            }, "delBtn2.label");
            result[156] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn2.enabled = _arg_1;
            }, "delBtn2.enabled");
            result[157] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn2.label = _arg_1;
            }, "upBtn2.label");
            result[158] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn2.enabled = _arg_1;
            }, "upBtn2.enabled");
            result[159] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn2.label = _arg_1;
            }, "openBtn2.label");
            result[160] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn2.enabled = _arg_1;
            }, "openBtn2.enabled");
            result[161] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn3.label = _arg_1;
            }, "delBtn3.label");
            result[162] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn3.enabled = _arg_1;
            }, "delBtn3.enabled");
            result[163] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn3.label = _arg_1;
            }, "upBtn3.label");
            result[164] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn3.enabled = _arg_1;
            }, "upBtn3.enabled");
            result[165] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn3.label = _arg_1;
            }, "openBtn3.label");
            result[166] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn3.enabled = _arg_1;
            }, "openBtn3.enabled");
            result[167] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn4.label = _arg_1;
            }, "delBtn4.label");
            result[168] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn4.enabled = _arg_1;
            }, "delBtn4.enabled");
            result[169] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn4.label = _arg_1;
            }, "upBtn4.label");
            result[170] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn4.enabled = _arg_1;
            }, "upBtn4.enabled");
            result[171] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn4.label = _arg_1;
            }, "openBtn4.label");
            result[172] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn4.enabled = _arg_1;
            }, "openBtn4.enabled");
            result[173] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delBtn5.label = _arg_1;
            }, "delBtn5.label");
            result[174] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                delBtn5.enabled = _arg_1;
            }, "delBtn5.enabled");
            result[175] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn5.label = _arg_1;
            }, "upBtn5.label");
            result[176] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn5.enabled = _arg_1;
            }, "upBtn5.enabled");
            result[177] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn5.label = _arg_1;
            }, "openBtn5.label");
            result[178] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                openBtn5.enabled = _arg_1;
            }, "openBtn5.enabled");
            result[179] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                growRate.toolTip = _arg_1;
            }, "growRate.toolTip");
            result[180] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                growRateAdd.toolTip = _arg_1;
            }, "growRateAdd.toolTip");
            result[181] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStrength) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStrength.toolTip = _arg_1;
            }, "aptStrength.toolTip");
            result[182] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptAgility) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptAgility.toolTip = _arg_1;
            }, "aptAgility.toolTip");
            result[183] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStamina) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStamina.toolTip = _arg_1;
            }, "aptStamina.toolTip");
            result[184] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptIntelligence) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptIntelligence.toolTip = _arg_1;
            }, "aptIntelligence.toolTip");
            result[185] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptEnergy) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptEnergy.toolTip = _arg_1;
            }, "aptEnergy.toolTip");
            result[186] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStrengthEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStrengthEx.toolTip = _arg_1;
            }, "aptStrengthEx.toolTip");
            result[187] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptAgilityEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptAgilityEx.toolTip = _arg_1;
            }, "aptAgilityEx.toolTip");
            result[188] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStaminaEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStaminaEx.toolTip = _arg_1;
            }, "aptStaminaEx.toolTip");
            result[189] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptIntelligenceEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptIntelligenceEx.toolTip = _arg_1;
            }, "aptIntelligenceEx.toolTip");
            result[190] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptEnergyEx) || (0)));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptEnergyEx.toolTip = _arg_1;
            }, "aptEnergyEx.toolTip");
            result[191] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptStrength) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStrengthFinal.toolTip = _arg_1;
            }, "aptStrengthFinal.toolTip");
            result[192] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptAgility) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptAgilityFinal.toolTip = _arg_1;
            }, "aptAgilityFinal.toolTip");
            result[193] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptStamina) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptStaminaFinal.toolTip = _arg_1;
            }, "aptStaminaFinal.toolTip");
            result[194] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptIntelligence) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptIntelligenceFinal.toolTip = _arg_1;
            }, "aptIntelligenceFinal.toolTip");
            result[195] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptEnergy) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0))))))));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                aptEnergyFinal.toolTip = _arg_1;
            }, "aptEnergyFinal.toolTip");
            result[196] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton1.label = _arg_1;
            }, "basichortxtbutton1.label");
            result[197] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEPREDEF_S[511];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton1.toolTip = _arg_1;
            }, "basichortxtbutton1.toolTip");
            result[198] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton2.label = _arg_1;
            }, "basichortxtbutton2.label");
            result[199] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEPREDEF_S[0x0200];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton2.toolTip = _arg_1;
            }, "basichortxtbutton2.toolTip");
            result[200] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton3.label = _arg_1;
            }, "basichortxtbutton3.label");
            result[201] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEPREDEF_S[513];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton3.toolTip = _arg_1;
            }, "basichortxtbutton3.toolTip");
            result[202] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton4.label = _arg_1;
            }, "basichortxtbutton4.label");
            result[203] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEPREDEF_S[0x0202];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton4.toolTip = _arg_1;
            }, "basichortxtbutton4.toolTip");
            result[204] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton5.label = _arg_1;
            }, "basichortxtbutton5.label");
            result[205] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEPREDEF_S[515];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton5.toolTip = _arg_1;
            }, "basichortxtbutton5.toolTip");
            result[206] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton6.label = _arg_1;
            }, "basichortxtbutton6.label");
            result[207] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEPREDEF_S[516];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basichortxtbutton6.toolTip = _arg_1;
            }, "basichortxtbutton6.toolTip");
            result[208] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                simplecanvas2.label = _arg_1;
            }, "simplecanvas2.label");
            result[209] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (star.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _PetManagerPanel_Image5[_arg_2[0]].source = _arg_1;
            }, "_PetManagerPanel_Image5.source");
            result[210] = binding;
            binding = new Binding(this, function ():Object
            {
                return (xiebieshaidp);
            }, function (_arg_1:Object):void
            {
                xibieshai.dataProvider = _arg_1;
            }, "xibieshai.dataProvider");
            result[211] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_RoundedLabel18.toolTip = _arg_1;
            }, "_PetManagerPanel_RoundedLabel18.toolTip");
            result[212] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETMANAGEPRANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetManagerPanel_RoundedLabel18.text = _arg_1;
            }, "_PetManagerPanel_RoundedLabel18.text");
            result[213] = binding;
            return (result);
        }

        private function useSkill(_arg_1:MouseEvent):void
        {
            var _local_2:SkillUseSlot = SkillUseSlot(_arg_1.currentTarget);
            drag(_local_2, _arg_1);
        }

        public function __minusAgilityButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get aptEnergy():BoxLabel
        {
            return (this._348170509aptEnergy);
        }

        public function showPetSoulPanel():void
        {
            if (_core.player.level < 80)
            {
                Alert.show(Language.PET_SOUL_S[36], "", Alert.YES, null, null);
                return;
            };
            var _local_1:Object = this._core.view.getUI(ViewManager.PANEL_PET_SOUL);
            if (_local_1)
            {
                _local_1.visible = true;
                _local_1.selectedPetId = this.selPetData.id;
            };
        }

        public function set aptStamina(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1911434378aptStamina;
            if (_local_2 !== _arg_1)
            {
                this._1911434378aptStamina = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStamina", _local_2, _arg_1));
            };
        }

        public function set pettabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._344411275pettabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._344411275pettabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pettabBtn1", _local_2, _arg_1));
            };
        }

        public function set attEnergy(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1270522743attEnergy;
            if (_local_2 !== _arg_1)
            {
                this._1270522743attEnergy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attEnergy", _local_2, _arg_1));
            };
        }

        public function set pettabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._344411274pettabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._344411274pettabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pettabBtn0", _local_2, _arg_1));
            };
        }

        public function set attStamina(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1023416178attStamina;
            if (_local_2 !== _arg_1)
            {
                this._1023416178attStamina = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attStamina", _local_2, _arg_1));
            };
        }

        public function ___PetManagerPanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, GamePredef.ACTION_ITEM);
        }

        [Bindable(event="propertyChange")]
        public function get vbox1():VBox
        {
            return (this._112005436vbox1);
        }

        [Bindable(event="propertyChange")]
        public function get vbox2():VBox
        {
            return (this._112005437vbox2);
        }

        [Bindable(event="propertyChange")]
        public function get vbox3():VBox
        {
            return (this._112005438vbox3);
        }

        public function __btn2_click(_arg_1:MouseEvent):void
        {
            deletePet();
        }

        [Bindable(event="propertyChange")]
        public function get minusAgilityButton():Button
        {
            return (this._1595537735minusAgilityButton);
        }

        public function set _PetManagerPanel_HBox1(_arg_1:HBox):void
        {
            var _local_2:Object;
            _local_2 = this._1064350886_PetManagerPanel_HBox1;
            if (_local_2 !== _arg_1)
            {
                this._1064350886_PetManagerPanel_HBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PetManagerPanel_HBox1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vbox5():VBox
        {
            return (this._112005440vbox5);
        }

        [Bindable(event="propertyChange")]
        public function get vbox4():VBox
        {
            return (this._112005439vbox4);
        }

        [Bindable(event="propertyChange")]
        public function get finalEnhPhyHurt():TextInput
        {
            return (this._1453362841finalEnhPhyHurt);
        }

        public function set paixucb(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._801114956paixucb;
            if (_local_2 !== _arg_1)
            {
                this._801114956paixucb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "paixucb", _local_2, _arg_1));
            };
        }

        public function set addAgilityButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._279478090addAgilityButton;
            if (_local_2 !== _arg_1)
            {
                this._279478090addAgilityButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addAgilityButton", _local_2, _arg_1));
            };
        }

        public function __skill5_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function __pettabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        public function set petLife(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._677761861petLife;
            if (_local_2 !== _arg_1)
            {
                this._677761861petLife = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petLife", _local_2, _arg_1));
            };
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

        public function onRefreshPetProp(_arg_1:Number, _arg_2:Object):void
        {
            if (((_core.player) && (_core.player.petList)))
            {
                if (_core.player.petList[_arg_1])
                {
                    _core.player.petList[_arg_1].property = _arg_2;
                    updateView(_arg_1);
                    if (_core.player.petList[_arg_1].state == 1)
                    {
                        detailUpdateView(_arg_2, true);
                    }
                    else
                    {
                        if (selPetData.state != 1)
                        {
                            detailUpdateView(_arg_2);
                        };
                    };
                };
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

        [Bindable(event="propertyChange")]
        public function get aptStrength():BoxLabel
        {
            return (this._395626106aptStrength);
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

        public function __upBtn3_click(_arg_1:MouseEvent):void
        {
            upSkill(3);
        }

        private function showMainPetCanvas():void
        {
            var _local_1:*;
            if (_core.player.petList)
            {
                for each (_local_1 in _core.player.petList)
                {
                    if (((_local_1) && (!(_local_1 == undefined))))
                    {
                        if (_local_1.state == 1)
                        {
                            _core.view.getUI(ViewManager.MAIN_PET).showPet(_local_1);
                            return;
                        };
                    };
                };
                _core.view.getUI(ViewManager.MAIN_PET).showPet(null);
            };
        }

        public function set aptStrengthEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._2055403737aptStrengthEx;
            if (_local_2 !== _arg_1)
            {
                this._2055403737aptStrengthEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStrengthEx", _local_2, _arg_1));
            };
        }

        public function __petDataList_itemClick(_arg_1:ListEvent):void
        {
            petDataListClick();
        }

        [Bindable(event="propertyChange")]
        public function get finalCombo():TextInput
        {
            return (this._1887307336finalCombo);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                petPageAc.addItem(pageAC.getItemAt(_local_3));
                _local_4++;
            };
        }

        public function set finalReduceHurt2(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._57704679finalReduceHurt2;
            if (_local_2 !== _arg_1)
            {
                this._57704679finalReduceHurt2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalReduceHurt2", _local_2, _arg_1));
            };
        }

        public function set finalReduceHurt1(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._57704678finalReduceHurt1;
            if (_local_2 !== _arg_1)
            {
                this._57704678finalReduceHurt1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalReduceHurt1", _local_2, _arg_1));
            };
        }

        public function __skill2_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get AddMultipleCheck():CheckBox
        {
            return (this._1582407209AddMultipleCheck);
        }

        [Bindable(event="propertyChange")]
        public function get finalEnhMagicHurt():TextInput
        {
            return (this._1167965741finalEnhMagicHurt);
        }

        [Bindable(event="propertyChange")]
        public function get petNum():BoxLabel
        {
            return (this._991692313petNum);
        }

        [Bindable(event="propertyChange")]
        public function get finalResiLight():TextInput
        {
            return (this._1898937865finalResiLight);
        }

        [Bindable(event="propertyChange")]
        public function get addIntelligence():BoxLabel
        {
            return (this._1420795392addIntelligence);
        }

        public function ___PetManagerPanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            changeProperty();
        }

        private function cancelPetFollowHandler(_arg_1:Object):void
        {
            if (_arg_1)
            {
                _core.setShowPetId(-1);
                switchFollowButton(false);
            };
        }

        private function set petPageAc(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._1613040912petPageAc;
            if (_local_2 !== _arg_1)
            {
                this._1613040912petPageAc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPageAc", _local_2, _arg_1));
            };
        }

        private function _PetManagerPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PETMANAGEPRANEL_U[7];
            _local_1 = Language.PETMANAGEPRANEL_U[29];
            _local_1 = Language.PETMANAGEPRANEL_U[0];
            _local_1 = Language.PETMANAGEPRANEL_U[0];
            _local_1 = Language.PETMANAGERPANEL_S[28];
            _local_1 = Language.PETMANAGERPANEL_S[28];
            _local_1 = Language.PETMANAGERPANEL_S[18];
            _local_1 = Language.PETMANAGEPRANEL_U[2];
            _local_1 = Language.PETMANAGERPANEL_S[20];
            _local_1 = Language.PETMANAGEPRANEL_U[4];
            _local_1 = Language.PETMANAGERPANEL_S[21];
            _local_1 = Language.PETMANAGEPRANEL_U[5];
            _local_1 = Language.PETMANAGERPANEL_S[23];
            _local_1 = Language.PETMANAGERPANEL_S[26];
            _local_1 = petPageAc;
            _local_1 = Language.PETMANAGEPRANEL_U[31];
            _local_1 = Language.PETMANAGEPRANEL_U[30];
            _local_1 = Language.PETMANAGEPRANEL_U[9];
            _local_1 = Language.PETMANAGEPRANEL_U[10];
            _local_1 = Language.PETMANAGEPRANEL_U[11];
            _local_1 = Language.PETPANEL_U[31];
            _local_1 = Language.PETPANEL_U[10];
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
            _local_1 = GamePredef.PROP_STR;
            _local_1 = GamePredef.PROP_AGI;
            _local_1 = GamePredef.PROP_STA;
            _local_1 = GamePredef.PROP_INT;
            _local_1 = GamePredef.PROP_SPR;
            _local_1 = GamePredef.AADPROPCHECK;
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = styleAddName;
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = styleAddName;
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = styleAddName;
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = styleAddName;
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = styleAddName;
            _local_1 = Language.PETMANAGEPRANEL_U[28];
            _local_1 = Language.PETMANAGEPRANEL_U[6];
            _local_1 = GamePredef.PROP_STR;
            _local_1 = Language.PETMANAGEPRANEL_U[16];
            _local_1 = GamePredef.PROP_STA;
            _local_1 = Language.PETMANAGEPRANEL_U[18];
            _local_1 = GamePredef.PROP_AGI;
            _local_1 = Language.PETMANAGEPRANEL_U[20];
            _local_1 = GamePredef.PROP_INT;
            _local_1 = Language.PETMANAGEPRANEL_U[22];
            _local_1 = GamePredef.PROP_SPR;
            _local_1 = Language.PETMANAGEPRANEL_U[24];
            _local_1 = Language.PETMANAGEPRANEL_U[26];
            _local_1 = Language.PETMANAGEPRANEL_U[12];
            _local_1 = Language.PETMANAGEPRANEL_U[14];
            _local_1 = Language.PETMANAGEPRANEL_U[13];
            _local_1 = Language.PETMANAGEPRANEL_U[15];
            _local_1 = Language.PETMANAGEPRANEL_U[17];
            _local_1 = Language.PETMANAGEPRANEL_U[19];
            _local_1 = Language.PETMANAGEPRANEL_U[21];
            _local_1 = Language.PETMANAGEPRANEL_U[23];
            _local_1 = Language.PETMANAGEPRANEL_U[25];
            _local_1 = Language.PETMANAGEPRANEL_U[27];
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
            _local_1 = GamePredef.EQUIP_POSITION[50];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [50];
            _local_1 = GamePredef.EQUIP_POSITION[51];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [51];
            _local_1 = GamePredef.EQUIP_POSITION[52];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [52];
            _local_1 = GamePredef.EQUIP_POSITION[53];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [53];
            _local_1 = GamePredef.EQUIP_POSITION[54];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [54];
            _local_1 = GamePredef.EQUIP_POSITION[55];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [55];
            _local_1 = GamePredef.EQUIP_POSITION[56];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [56];
            _local_1 = GamePredef.EQUIP_POSITION[57];
            _local_1 = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = [57];
            _local_1 = Language.PETPANEL_U[0];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[1];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[2];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[3];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[22];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[24];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[7];
            _local_1 = Language.PETPANEL_U[8];
            _local_1 = Language.PETPANEL_U[9];
            _local_1 = Language.PETPANEL_U[19];
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[4];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[6];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_S[12];
            _local_1 = Language.PETPANEL_S[13];
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStrength) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0)));
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptAgility) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0)));
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptStamina) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0)));
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptIntelligence) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0)));
            _local_1 = ((((((Language.PETPANEL_S[14] + ":") + petData.aptEnergy) + " ") + Language.PETPANEL_S[17]) + ":") + String(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStrengthEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptAgilityEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptStaminaEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptIntelligenceEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[16] + ":") + ((petData.aptEnergyEx) || (0)));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptStrength) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptStrengthEvolution) ? Number(petData.property.aptStrengthEvolution) : 0))))))));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptAgility) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptAgilityEvolution) ? Number(petData.property.aptAgilityEvolution) : 0))))))));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptStamina) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptStaminaEvolution) ? Number(petData.property.aptStaminaEvolution) : 0))))))));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptIntelligence) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptIntelligenceEvolution) ? Number(petData.property.aptIntelligenceEvolution) : 0))))))));
            _local_1 = ((Language.PETPANEL_S[15] + ":") + String((Number(petData.property.aptEnergy) + Number(Math.round(((Number(petData.property.growRate) + Number(petData.property.growRateAdd)) * Number(((petData.property.aptEnergyEvolution) ? Number(petData.property.aptEnergyEvolution) : 0))))))));
            _local_1 = Language.PETPANEL_U[11];
            _local_1 = Language.GAMEPREDEF_S[511];
            _local_1 = Language.PETPANEL_U[12];
            _local_1 = Language.GAMEPREDEF_S[0x0200];
            _local_1 = Language.PETPANEL_U[13];
            _local_1 = Language.GAMEPREDEF_S[513];
            _local_1 = Language.PETPANEL_U[14];
            _local_1 = Language.GAMEPREDEF_S[0x0202];
            _local_1 = Language.PETPANEL_U[15];
            _local_1 = Language.GAMEPREDEF_S[515];
            _local_1 = Language.PETPANEL_U[16];
            _local_1 = Language.GAMEPREDEF_S[516];
            _local_1 = Language.PETPANEL_U[18];
            _local_1 = star.currentItem;
            _local_1 = xiebieshaidp;
            _local_1 = Language.PETMANAGEPRANEL_U[32];
            _local_1 = Language.PETMANAGEPRANEL_U[33];
        }

        public function set finalRebornRate(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._473555694finalRebornRate;
            if (_local_2 !== _arg_1)
            {
                this._473555694finalRebornRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalRebornRate", _local_2, _arg_1));
            };
        }

        private function openSkill(index:int):void
        {
            var num:int;
            var func:Function;
            index = ((selectedTabIndex * 5) + index);
            var str:String = "";
            if (((petData) && (ToolKit.isEqual(petData[("skill" + index)], -1))))
            {
                if (ToolKit.isBigThan(index, 5))
                {
                    num = (GamePredef.GOLD_PET_SKILLOPEN[index] * GamePredef.GOLD_PET_SKILLOPEN_Q[petDataTemp.qLevel]);
                    if (((_core.player.enoughMoneyAuto(2, num)) || (_core.player.enoughMoneyAuto(2, num))))
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.petOpenSkill(petData.id, index);
                            };
                        };
                        str = Language.PETPANEL_S[8];
                        str = str.replace("{num}", num);
                        Alert.show(str, "", 3, this, func);
                    }
                    else
                    {
                        str = Language.PETPANEL_S[10];
                        str = str.replace("{num}", num);
                        _core.sysMsg(str);
                    };
                };
            };
        }

        public function petAllowToShow(_arg_1:MouseEvent):void
        {
            if (!petDataList.selectedItem)
            {
                return;
            };
            var _local_2:Number = petDataList.selectedItem.petData.id;
            if (_core.getShowPetId() != _local_2)
            {
                switchFollowButton(false);
            }
            else
            {
                switchFollowButton(true);
            };
        }

        public function set mAttack(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._74771179mAttack;
            if (_local_2 !== _arg_1)
            {
                this._74771179mAttack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mAttack", _local_2, _arg_1));
            };
        }

        public function set aptEnergy(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._348170509aptEnergy;
            if (_local_2 !== _arg_1)
            {
                this._348170509aptEnergy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptEnergy", _local_2, _arg_1));
            };
        }

        public function __xibieshai_change(_arg_1:ListEvent):void
        {
            classTypeSelect();
        }

        public function set dp1(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._99621dp1;
            if (_local_2 !== _arg_1)
            {
                this._99621dp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dp1", _local_2, _arg_1));
            };
        }

        public function set dp2(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._99622dp2;
            if (_local_2 !== _arg_1)
            {
                this._99622dp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dp2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptAgility():BoxLabel
        {
            return (this._1543550368aptAgility);
        }

        public function __bindImg_click(_arg_1:MouseEvent):void
        {
            bindedPet();
        }

        public function set vbox1(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005436vbox1;
            if (_local_2 !== _arg_1)
            {
                this._112005436vbox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox1", _local_2, _arg_1));
            };
        }

        public function __minusIntelligenceButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function set finalLight(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1879179968finalLight;
            if (_local_2 !== _arg_1)
            {
                this._1879179968finalLight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalLight", _local_2, _arg_1));
            };
        }

        public function getPetEquSuitNum(_arg_1:Number):Object
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:int;
            if (petData != null)
            {
                _local_2 = {};
                _local_3 = 1;
                while (_local_3 <= (GamePredef.PETEQU_NUM - 2))
                {
                    _local_4 = Number(petData[("equ" + _local_3)]);
                    if (_local_4 > 0)
                    {
                        _local_5 = _core.data.getSlot({"id":_local_4});
                        _local_6 = _core.data.getData(_local_5.type, _local_5.itemId);
                        if (_local_6.color >= 2)
                        {
                            _local_7 = _core.getTemplateData(_local_5.type, _local_5.itemId);
                            if (_local_7)
                            {
                                _local_8 = _local_7.suitId;
                                if (_local_2[_local_8] == null)
                                {
                                    _local_2[_local_8] = [];
                                };
                                if (_local_2[_local_8][_local_6.color] == null)
                                {
                                    _local_2[_local_8][_local_6.color] = 0;
                                };
                                _local_2[_local_8][_local_6.color] = (_local_2[_local_8][_local_6.color] + 1);
                            };
                        };
                    };
                    _local_3++;
                };
                if (_local_2[_arg_1])
                {
                    return (_local_2[_arg_1]);
                };
            };
            return (null);
        }

        [Bindable(event="propertyChange")]
        public function get addEnergy():BoxLabel
        {
            return (this._405874039addEnergy);
        }

        [Bindable(event="propertyChange")]
        public function get upBtn2():BasicGlowButton
        {
            return (this._839841135upBtn2);
        }

        public function set tarcanvas(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._933944003tarcanvas;
            if (_local_2 !== _arg_1)
            {
                this._933944003tarcanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tarcanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upBtn4():BasicGlowButton
        {
            return (this._839841133upBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get finalBreakReborn():TextInput
        {
            return (this._467845765finalBreakReborn);
        }

        public function set vbox4(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005439vbox4;
            if (_local_2 !== _arg_1)
            {
                this._112005439vbox4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox4", _local_2, _arg_1));
            };
        }

        public function __openBtn3_click(_arg_1:MouseEvent):void
        {
            openSkill(3);
        }

        public function __delBtn4_click(_arg_1:MouseEvent):void
        {
            delSkill(4);
        }

        public function __petFuncBtn2_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(1);
        }

        public function set vbox2(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005437vbox2;
            if (_local_2 !== _arg_1)
            {
                this._112005437vbox2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addStamina():BoxLabel
        {
            return (this._10889870addStamina);
        }

        public function set vbox3(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005438vbox3;
            if (_local_2 !== _arg_1)
            {
                this._112005438vbox3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptEnergyEx():RoundedLabel
        {
            return (this._415587680aptEnergyEx);
        }

        [Bindable(event="propertyChange")]
        public function get upBtn3():BasicGlowButton
        {
            return (this._839841134upBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get propertyPentagon():PentagonCanvas
        {
            return (this._805962357propertyPentagon);
        }

        [Bindable(event="propertyChange")]
        public function get upBtn5():BasicGlowButton
        {
            return (this._839841132upBtn5);
        }

        public function set addIntelligenceButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1991903918addIntelligenceButton;
            if (_local_2 !== _arg_1)
            {
                this._1991903918addIntelligenceButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addIntelligenceButton", _local_2, _arg_1));
            };
        }

        public function set minusAgilityButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1595537735minusAgilityButton;
            if (_local_2 !== _arg_1)
            {
                this._1595537735minusAgilityButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minusAgilityButton", _local_2, _arg_1));
            };
        }

        private function viewClear():void
        {
            showCanvas.url = null;
            propertyBarHp.valueMax = 0;
            propertyBarHp.value = 0;
            propertyBarMp.valueMax = 0;
            propertyBarMp.value = 0;
            propertyCanvas.toolTip = "";
            petHp.text = "";
            petMp.text = "";
            petClose.text = "";
        }

        public function set vbox5(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._112005440vbox5;
            if (_local_2 !== _arg_1)
            {
                this._112005440vbox5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox5", _local_2, _arg_1));
            };
        }

        public function set aptIntelligenceEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1229780311aptIntelligenceEx;
            if (_local_2 !== _arg_1)
            {
                this._1229780311aptIntelligenceEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptIntelligenceEx", _local_2, _arg_1));
            };
        }

        public function set btn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._3034456btn4;
            if (_local_2 !== _arg_1)
            {
                this._3034456btn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upBtn1():BasicGlowButton
        {
            return (this._839841136upBtn1);
        }

        public function set btn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCanvas():CharactorShowCanvas
        {
            return (this._307382965showCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get finalDizzy():TextInput
        {
            return (this._1886549314finalDizzy);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn1():BasicGlowButton
        {
            return (this._505171265openBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn2():BasicGlowButton
        {
            return (this._505171264openBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn3():BasicGlowButton
        {
            return (this._505171263openBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn5():BasicGlowButton
        {
            return (this._505171261openBtn5);
        }

        private function drawSkillSlots(_arg_1:int):*
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_2:int = 1;
            while (_local_2 <= 5)
            {
                this[("skill" + _local_2)].clean();
                _local_3 = ((_arg_1 * 5) + _local_2);
                if (ToolKit.isBigThan(petData[("skill" + _local_3)], 0))
                {
                    _local_4 = _core.data.getGameData(GamePredef.TBL_SKILL, petData[("skill" + _local_3)]);
                    this[("skill" + _local_2)].giid = petData[("skill" + _local_3)];
                    this[("skill" + _local_2)].enabled = (((currentState == "skill") && (_local_4.kind == 2)) ? false : true);
                    this[("delBtn" + _local_2)].visible = true;
                    this[("upBtn" + _local_2)].visible = true;
                    if (ToolKit.isBigOrEqual(_local_4.level, 3))
                    {
                        this[("upBtn" + _local_2)].enabled = false;
                    }
                    else
                    {
                        this[("upBtn" + _local_2)].enabled = true;
                    };
                    this[("openBtn" + _local_2)].visible = false;
                    this[("delBtn" + _local_2)].includeInLayout = true;
                    this[("upBtn" + _local_2)].includeInLayout = true;
                    this[("openBtn" + _local_2)].includeInLayout = false;
                }
                else
                {
                    if (ToolKit.isEqual(petData[("skill" + _local_3)], 0))
                    {
                        this[("skill" + _local_2)].enabled = true;
                        this[("delBtn" + _local_2)].visible = false;
                        this[("upBtn" + _local_2)].visible = false;
                        this[("openBtn" + _local_2)].visible = false;
                        this[("delBtn" + _local_2)].includeInLayout = false;
                        this[("upBtn" + _local_2)].includeInLayout = false;
                        this[("openBtn" + _local_2)].includeInLayout = false;
                    }
                    else
                    {
                        if (ToolKit.isEqual(petData[("skill" + _local_3)], -1))
                        {
                            if (((_local_3 >= 6) || (currentState == "skill")))
                            {
                                this[("skill" + _local_2)].enabled = false;
                                this[("openBtn" + _local_2)].visible = true;
                                this[("openBtn" + _local_2)].includeInLayout = true;
                            }
                            else
                            {
                                this[("skill" + _local_2)].enabled = true;
                                this[("openBtn" + _local_2)].visible = false;
                                this[("openBtn" + _local_2)].includeInLayout = false;
                            };
                            this[("delBtn" + _local_2)].visible = false;
                            this[("upBtn" + _local_2)].visible = false;
                            this[("delBtn" + _local_2)].includeInLayout = false;
                            this[("upBtn" + _local_2)].includeInLayout = false;
                        };
                    };
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get openBtn4():BasicGlowButton
        {
            return (this._505171262openBtn4);
        }

        public function set finalEnhPhyHurt(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1453362841finalEnhPhyHurt;
            if (_local_2 !== _arg_1)
            {
                this._1453362841finalEnhPhyHurt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalEnhPhyHurt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptStaminaEx():RoundedLabel
        {
            return (this._1357563171aptStaminaEx);
        }

        public function __skill3_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(2);
        }

        public function __upBtn1_click(_arg_1:MouseEvent):void
        {
            upSkill(1);
        }

        [Bindable(event="propertyChange")]
        public function get aptAgilityFinal():RoundedLabel
        {
            return (this._237239562aptAgilityFinal);
        }

        [Bindable(event="propertyChange")]
        public function get aptStaminaFinal():RoundedLabel
        {
            return (this._1751782644aptStaminaFinal);
        }

        public function updateView(_arg_1:Number=-1):void
        {
            var _local_5:*;
            var _local_6:Class;
            var _local_7:*;
            var _local_8:int;
            var _local_9:int;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.battlePet = null;
            petAC = new ArrayCollection();
            petAC1 = new ArrayCollection();
            petAC2 = new ArrayCollection();
            petAC3 = new ArrayCollection();
            petAC4 = new ArrayCollection();
            petAC5 = new ArrayCollection();
            petAC6 = new ArrayCollection();
            petAC7 = new ArrayCollection();
            var _local_2:int;
            if (_core.player.petList)
            {
                for each (_local_5 in _core.player.petList)
                {
                    if (((_local_5) && (_local_5.creatureData)))
                    {
                        _local_2++;
                        if (_local_5.state == 1)
                        {
                            _local_6 = ResManager.ICON_PET_BATTLE;
                            _core.battlePet = _local_5;
                            _local_7 = _core.view.getUI(ViewManager.MAIN_AUTO_EXP);
                            if (_local_7 != null)
                            {
                                _local_7.selectExpType();
                            };
                        }
                        else
                        {
                            if (_local_5.state == 2)
                            {
                                _local_6 = ResManager.ICON_PET_FOLLOW;
                            }
                            else
                            {
                                _local_6 = ResManager.ICON_PET_STANDBY;
                            };
                        };
                        petAC.addItem({
                            "id":_local_5.id,
                            "text":_local_5.petName,
                            "level":PetLogic.expToLv(_local_5.exp),
                            "icon":_local_6,
                            "sort1":_local_5.tid,
                            "sort2":_local_5.growRate,
                            "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.growRate)],
                            "petData":_local_5
                        });
                        switch (int(_local_5.creatureData.classId))
                        {
                            case 1:
                                petAC1.addItem({
                                    "id":_local_5.id,
                                    "text":_local_5.petName,
                                    "level":PetLogic.expToLv(_local_5.exp),
                                    "icon":_local_6,
                                    "sort1":_local_5.tid,
                                    "sort2":_local_5.growRate,
                                    "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.growRate)],
                                    "petData":_local_5
                                });
                                break;
                            case 2:
                                petAC2.addItem({
                                    "id":_local_5.id,
                                    "text":_local_5.petName,
                                    "level":PetLogic.expToLv(_local_5.exp),
                                    "icon":_local_6,
                                    "sort1":_local_5.tid,
                                    "sort2":_local_5.growRate,
                                    "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.growRate)],
                                    "petData":_local_5
                                });
                                break;
                            case 3:
                                petAC3.addItem({
                                    "id":_local_5.id,
                                    "text":_local_5.petName,
                                    "level":PetLogic.expToLv(_local_5.exp),
                                    "icon":_local_6,
                                    "sort1":_local_5.tid,
                                    "sort2":_local_5.growRate,
                                    "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.growRate)],
                                    "petData":_local_5
                                });
                                break;
                            case 4:
                                petAC4.addItem({
                                    "id":_local_5.id,
                                    "text":_local_5.petName,
                                    "level":PetLogic.expToLv(_local_5.exp),
                                    "icon":_local_6,
                                    "sort1":_local_5.tid,
                                    "sort2":_local_5.growRate,
                                    "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.growRate)],
                                    "petData":_local_5
                                });
                                break;
                            case 5:
                                petAC5.addItem({
                                    "id":_local_5.id,
                                    "text":_local_5.petName,
                                    "level":PetLogic.expToLv(_local_5.exp),
                                    "icon":_local_6,
                                    "sort1":_local_5.tid,
                                    "sort2":_local_5.growRate,
                                    "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.growRate)],
                                    "petData":_local_5
                                });
                                break;
                            case 6:
                                petAC6.addItem({
                                    "id":_local_5.id,
                                    "text":_local_5.petName,
                                    "level":PetLogic.expToLv(_local_5.exp),
                                    "icon":_local_6,
                                    "sort1":_local_5.tid,
                                    "sort2":_local_5.growRate,
                                    "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.growRate)],
                                    "petData":_local_5
                                });
                                break;
                            case 7:
                                petAC7.addItem({
                                    "id":_local_5.id,
                                    "text":_local_5.petName,
                                    "level":PetLogic.expToLv(_local_5.exp),
                                    "icon":_local_6,
                                    "sort1":_local_5.tid,
                                    "sort2":_local_5.growRate,
                                    "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.growRate)],
                                    "petData":_local_5
                                });
                                break;
                        };
                    };
                };
            };
            var _local_3:Sort = new Sort();
            if (paixucb.selected)
            {
                _local_3.fields = [new SortField("sort2", true, true, true), new SortField("sort1", true, true, true)];
            }
            else
            {
                _local_3.fields = [new SortField("sort1", true, true, true), new SortField("sort2", true, true, true)];
            };
            if (xibieshai.selectedIndex == 0)
            {
                petAC.sort = _local_3;
                petAC.refresh();
                initPageSelector(petAC);
            }
            else
            {
                this[("petAC" + xibieshai.selectedIndex)].sort = _local_3;
                this[("petAC" + xibieshai.selectedIndex)].refresh();
                initPageSelector(this[("petAC" + xibieshai.selectedIndex)]);
            };
            if (xibieshai.selectedIndex == 0)
            {
                petNum.text = ((_local_2.toString() + "/") + _core.player.petMaxNum);
            }
            else
            {
                petNum.text = ((this[("petAC" + xibieshai.selectedIndex)].length.toString() + "/") + _core.player.petMaxNum);
            };
            propertyBarHp.frontColor = GamePredef.PROPERTY_COLOR_HP;
            propertyBarMp.frontColor = GamePredef.PROPERTY_COLOR_MP;
            if (xibieshai.selectedIndex == 0)
            {
                if (petAC.length > 0)
                {
                    if (_arg_1 == -1)
                    {
                        _local_8 = 0;
                        while (_local_8 <= petAC.length)
                        {
                            petDataList.selectedIndex = _local_8;
                            if (_local_8 >= PAGE_MAX_PET_NUM)
                            {
                                pageSelector.pageNo = (_local_8 / PAGE_MAX_PET_NUM);
                                petDataList.selectedIndex = (_local_8 - (PAGE_MAX_PET_NUM * pageSelector.pageNo));
                            }
                            else
                            {
                                pageSelector.pageNo = 0;
                                petDataList.selectedIndex = _local_8;
                            };
                            if (petDataList.selectedItem.petData.state == 1)
                            {
                                _core.view.getUI(ViewManager.MAIN_PET).showPet(petDataList.selectedItem.petData);
                                break;
                            };
                            _local_8++;
                        };
                    }
                    else
                    {
                        if (_arg_1 > 0)
                        {
                            _local_9 = 0;
                            while (_local_9 <= petAC.length)
                            {
                                if (_local_9 >= PAGE_MAX_PET_NUM)
                                {
                                    pageSelector.pageNo = (_local_9 / PAGE_MAX_PET_NUM);
                                    petDataList.selectedIndex = (_local_9 - (PAGE_MAX_PET_NUM * pageSelector.pageNo));
                                }
                                else
                                {
                                    pageSelector.pageNo = 0;
                                    petDataList.selectedIndex = _local_9;
                                };
                                if (petDataList.selectedItem.petData.id == _arg_1) break;
                                _local_9++;
                            };
                        };
                    };
                };
            }
            else
            {
                if (this[("petAC" + xibieshai.selectedIndex)].length > 0)
                {
                    if (_arg_1 == -1)
                    {
                        _local_8 = 0;
                        while (_local_8 <= this[("petAC" + xibieshai.selectedIndex)].length)
                        {
                            petDataList.selectedIndex = _local_8;
                            if (_local_8 >= PAGE_MAX_PET_NUM)
                            {
                                pageSelector.pageNo = (_local_8 / PAGE_MAX_PET_NUM);
                                petDataList.selectedIndex = (_local_8 - (PAGE_MAX_PET_NUM * pageSelector.pageNo));
                            }
                            else
                            {
                                pageSelector.pageNo = 0;
                                petDataList.selectedIndex = _local_8;
                            };
                            if (petDataList.selectedItem.petData.state == 1)
                            {
                                _core.view.getUI(ViewManager.MAIN_PET).showPet(petDataList.selectedItem.petData);
                                break;
                            };
                            _local_8++;
                        };
                    }
                    else
                    {
                        if (_arg_1 > 0)
                        {
                            _local_9 = 0;
                            while (_local_9 <= this[("petAC" + xibieshai.selectedIndex)].length)
                            {
                                if (_local_9 >= PAGE_MAX_PET_NUM)
                                {
                                    pageSelector.pageNo = (_local_9 / PAGE_MAX_PET_NUM);
                                    petDataList.selectedIndex = (_local_9 - (PAGE_MAX_PET_NUM * pageSelector.pageNo));
                                }
                                else
                                {
                                    pageSelector.pageNo = 0;
                                    petDataList.selectedIndex = _local_9;
                                };
                                if (petDataList.selectedItem.petData.id == _arg_1) break;
                                _local_9++;
                            };
                        };
                    };
                };
            };
            showMainPetCanvas();
            petDataListClick();
            var _local_4:Object = _core.view.getUI(ViewManager.PANEL_BAG);
            if (_local_4)
            {
                _local_4.initView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get attLastPoint():BoxLabel
        {
            return (this._30739193attLastPoint);
        }

        [Bindable(event="propertyChange")]
        public function get finalCriticalDamage():TextInput
        {
            return (this._1040925444finalCriticalDamage);
        }

        public function set aptIntelligence(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._702954884aptIntelligence;
            if (_local_2 !== _arg_1)
            {
                this._702954884aptIntelligence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptIntelligence", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addEnergyButton():Button
        {
            return (this._708846363addEnergyButton);
        }

        [Bindable(event="propertyChange")]
        public function get finalResiCritical():TextInput
        {
            return (this._1283394786finalResiCritical);
        }

        public function set aptStrength(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._395626106aptStrength;
            if (_local_2 !== _arg_1)
            {
                this._395626106aptStrength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStrength", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get classImg():Image
        {
            return (this._692413227classImg);
        }

        [Bindable(event="propertyChange")]
        public function get aptAgilityEx():RoundedLabel
        {
            return (this._1588184269aptAgilityEx);
        }

        private function initPetEquListen():void
        {
            var _local_1:int = 1;
            while (_local_1 <= GamePredef.PETEQU_NUM)
            {
                this[("petEqu" + _local_1)].addEventListener(Slot.EVENT_SLOT_DCLICK, doubleClickHandler);
                _local_1++;
            };
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

        public function enableUI():void
        {
            this.btn2.enabled = true;
            this.btn4.enabled = true;
            this._btnEnabled = true;
        }

        [Bindable(event="propertyChange")]
        public function get addStaminaButton():Button
        {
            return (this._14326624addStaminaButton);
        }

        public function onPetEquipOn(_arg_1:Number, _arg_2:int, _arg_3:Number, _arg_4:Number):void
        {
            var _local_5:*;
            var _local_6:ItemSlot;
            var _local_7:*;
            if (_arg_3 > 0)
            {
                _local_5 = _core.data.getSlot({"id":_arg_3});
                if ((((_local_5) && (_local_5.type == GamePredef.TBL_EQUIPT_INSTANCE)) && (_local_5.stackNum == 0)))
                {
                    _local_5.stackNum = 1;
                    _local_6 = _core.view.getUI(ViewManager.PANEL_BAG).getBagSlot(_local_5.sid);
                    if (_local_6)
                    {
                        _local_6.stackNum = 1;
                        _local_6.enabled = true;
                        _local_6.acceptable = true;
                    };
                };
            };
            _local_5 = _core.data.getSlot({"id":_arg_4});
            if ((((_local_5) && (_local_5.type == GamePredef.TBL_EQUIPT_INSTANCE)) && (_local_5.stackNum == 1)))
            {
                this[("petEqu" + _arg_2)].type = _local_5.type;
                this[("petEqu" + _arg_2)].giid = _local_5.itemId;
                _core.data.updateSlot(_local_5);
                _local_7 = _core.view.getSlot(_local_5.sid);
                ((_local_7) && (_local_7.clean()));
            };
        }

        private function onSetSpeText(_arg_1:Object):void
        {
            var _local_2:String = _arg_1["key"];
            var _local_3:String = Number(_arg_1["value"]).toFixed(2);
            (this[_local_2] as TextInput).text = (_local_3 + "%");
        }

        public function set finalCombo(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1887307336finalCombo;
            if (_local_2 !== _arg_1)
            {
                this._1887307336finalCombo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalCombo", _local_2, _arg_1));
            };
        }

        public function disableUI():void
        {
            this.btn2.enabled = false;
            this.btn4.enabled = false;
            this._btnEnabled = false;
        }

        [Bindable(event="propertyChange")]
        public function get propertyCanvas():Canvas
        {
            return (this._1940048781propertyCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:PetManagerPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetManagerPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetManagerPanelWatcherSetupUtil");
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
        public function get growRate():BoxLabel
        {
            return (this._507317139growRate);
        }

        public function set petEqu4(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962294petEqu4;
            if (_local_2 !== _arg_1)
            {
                this._677962294petEqu4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu4", _local_2, _arg_1));
            };
        }

        public function set petEqu1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962297petEqu1;
            if (_local_2 !== _arg_1)
            {
                this._677962297petEqu1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu1", _local_2, _arg_1));
            };
        }

        public function set petEqu5(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962293petEqu5;
            if (_local_2 !== _arg_1)
            {
                this._677962293petEqu5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu5", _local_2, _arg_1));
            };
        }

        private function switchFollowButton(_arg_1:Boolean):void
        {
            showPetFollowBtn.selected = _arg_1;
            if (!showPetFollowBtn.selected)
            {
                showPetFollowBtn.label = Language.PETMANAGERPANEL_S[23];
            }
            else
            {
                showPetFollowBtn.label = Language.PETMANAGERPANEL_S[25];
            };
        }

        [Bindable(event="propertyChange")]
        public function get hit():BoxLabel
        {
            return (this._103315hit);
        }

        public function set petEqu8(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962290petEqu8;
            if (_local_2 !== _arg_1)
            {
                this._677962290petEqu8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu8", _local_2, _arg_1));
            };
        }

        private function updatePetAutoBattleSet(_arg_1:Object=null):void
        {
            var _local_3:String;
            var _local_4:Object;
            _core.clearPetBattleSetting();
            if (!_arg_1)
            {
                _arg_1 = _core.battlePet;
            };
            if (((!(_arg_1)) || (!(_arg_1.pi))))
            {
                return;
            };
            var _local_2:Object = _arg_1.pi;
            for (_local_3 in _local_2)
            {
                GamePredef.GLOBAL_SETTING[_local_3] = _local_2[_local_3];
            };
            _local_4 = _core.view.getUI(ViewManager.PANEL_BATTLESET);
            if (_local_4.initialized)
            {
                _local_4.updatePetSetting();
            };
        }

        public function set petEqu6(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962292petEqu6;
            if (_local_2 !== _arg_1)
            {
                this._677962292petEqu6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu6", _local_2, _arg_1));
            };
        }

        public function set petEqu7(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962291petEqu7;
            if (_local_2 !== _arg_1)
            {
                this._677962291petEqu7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get finalCounter():TextInput
        {
            return (this._1218397274finalCounter);
        }

        public function set AddMultipleCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._1582407209AddMultipleCheck;
            if (_local_2 !== _arg_1)
            {
                this._1582407209AddMultipleCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "AddMultipleCheck", _local_2, _arg_1));
            };
        }

        public function set addStrengthButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._426146348addStrengthButton;
            if (_local_2 !== _arg_1)
            {
                this._426146348addStrengthButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStrengthButton", _local_2, _arg_1));
            };
        }

        public function set starHbox(_arg_1:HBox):void
        {
            var _local_2:Object;
            _local_2 = this._1315489237starHbox;
            if (_local_2 !== _arg_1)
            {
                this._1315489237starHbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starHbox", _local_2, _arg_1));
            };
        }

        public function set canvas2(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._550778330canvas2;
            if (_local_2 !== _arg_1)
            {
                this._550778330canvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas2", _local_2, _arg_1));
            };
        }

        public function set finalEnhMagicHurt(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1167965741finalEnhMagicHurt;
            if (_local_2 !== _arg_1)
            {
                this._1167965741finalEnhMagicHurt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalEnhMagicHurt", _local_2, _arg_1));
            };
        }

        public function set canvas3(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._550778331canvas3;
            if (_local_2 !== _arg_1)
            {
                this._550778331canvas3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get finalResiSleep():TextInput
        {
            return (this._1892385864finalResiSleep);
        }

        [Bindable(event="propertyChange")]
        public function get aptStrengthFinal():RoundedLabel
        {
            return (this._815424624aptStrengthFinal);
        }

        [Bindable(event="propertyChange")]
        public function get propertyBarHp():PropertyBar
        {
            return (this._1046717530propertyBarHp);
        }

        public function set petEqu3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962295petEqu3;
            if (_local_2 !== _arg_1)
            {
                this._677962295petEqu3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu3", _local_2, _arg_1));
            };
        }

        private function showSelPet():void
        {
            var _local_1:Object;
            var _local_2:String;
            if (selPetData)
            {
                selPetDataTemp = selPetData.creatureData;
                if (selPetDataTemp)
                {
                    _local_2 = ResManager.getResUrl(selPetDataTemp.resCode);
                    if (showCanvas.url != _local_2)
                    {
                        showCanvas.url = _local_2;
                    };
                    showCanvas.color = ((selPetData.colorCode) ? selPetData.colorCode : selPetDataTemp.colorCode);
                }
                else
                {
                    return;
                };
                selPetData.property.finalHp = int(selPetData.property.finalHp);
                selPetData.currentHp = int(selPetData.currentHp);
                selPetData.property.finalMp = int(selPetData.property.finalMp);
                selPetData.currentMp = int(selPetData.currentMp);
                selPetData.property.finalSp = int(selPetData.property.finalSp);
                propertyBarHp.valueMax = selPetData.property.finalHp;
                propertyBarHp.value = selPetData.currentHp;
                propertyBarMp.valueMax = selPetData.property.finalMp;
                propertyBarMp.value = selPetData.currentMp;
                propertyCanvas.toolTip = ((((((("HP:" + propertyBarHp.value) + "/") + propertyBarHp.valueMax) + "\nMP:") + propertyBarMp.value) + "/") + propertyBarMp.valueMax);
                classImg.source = ResManager.CREATURE_CLASS[selPetDataTemp.classId];
                classImg.toolTip = (GamePredef.CREATURE_QLEVEL[selPetDataTemp.qLevel] + GamePredef.CREATURE_CLASS_INFO[selPetDataTemp.classId]);
                elementImg.source = ResManager.ELEMENT_KIND[selPetData.element];
                elementImg.toolTip = GamePredef.ELEMENT_INFO[selPetData.element];
                if (ToolKit.isEqual(selPetData.binded, 1))
                {
                    bindImg.source = ResManager.ICON_BIND_YES;
                    bindImg.toolTip = Language.PETMANAGERPANEL_S[11];
                }
                else
                {
                    bindImg.source = ResManager.ICON_BIND_NO;
                    bindImg.toolTip = Language.PETMANAGERPANEL_S[12];
                };
                selPetData.level = PetLogic.expToLv(selPetData.exp);
                petHp.text = ((selPetData.currentHp + "/") + selPetData.property.finalHp);
                petMp.text = ((selPetData.currentMp + "/") + selPetData.property.finalMp);
                petExp.text = (((Number(selPetData.exp) - PetLogic.lvToExp(selPetData.level)).toString() + "/") + PetLogic.lvUpExp(selPetData.level).toString());
                petLevel.text = (Language.PETMANAGERPANEL_S[13] + selPetData.level.toString());
                petClose.text = selPetData.close;
                petLife.text = selPetData.life;
                attack.text = int(selPetData.property.finalAttack).toString();
                mAttack.text = int(selPetData.property.finalMAttack).toString();
                defence.text = int(selPetData.property.finalDefence).toString();
                mDefence.text = int(selPetData.property.finalMDefence).toString();
                hit.text = int(selPetData.property.finalHit).toString();
                critical.text = int(selPetData.property.finalCritical).toString();
                dodge.text = int(selPetData.property.finalDodge).toString();
                speed.text = int(selPetData.property.finalSpeed).toString();
                attStrength.text = int(selPetData.property.finalStrength).toString();
                attAgility.text = int(selPetData.property.finalAgility).toString();
                attStamina.text = int(selPetData.property.finalStamina).toString();
                attIntelligence.text = int(selPetData.property.finalIntelligence).toString();
                attEnergy.text = int(selPetData.property.finalEnergy).toString();
                attLastPoint.text = int(selPetData.property.lastPoint).toString();
                _local_1 = selPetData.property;
                addStrength.text = "";
                addAgility.text = "";
                addStamina.text = "";
                addIntelligence.text = "";
                addEnergy.text = "";
                if (Number(_local_1.lastPoint) > 0)
                {
                    addBtnCanvas.enabled = true;
                }
                else
                {
                    addBtnCanvas.enabled = false;
                };
            };
        }

        public function set finalRage(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._355194339finalRage;
            if (_local_2 !== _arg_1)
            {
                this._355194339finalRage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalRage", _local_2, _arg_1));
            };
        }

        public function set petEqu2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._677962296petEqu2;
            if (_local_2 !== _arg_1)
            {
                this._677962296petEqu2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEqu2", _local_2, _arg_1));
            };
        }

        public function onDelPet(_arg_1:Number):void
        {
            var _local_3:Object;
            var _local_2:* = "";
            if (_core.player.petList)
            {
                if (_core.player.petList[_arg_1])
                {
                    _local_2 = Language.PETMANAGERPANEL_S[15];
                    _local_2 = _local_2.replace("{color}", GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(_core.player.petList[_arg_1].growRate)]);
                    _local_2 = _local_2.replace("{petName}", _core.player.petList[_arg_1].petName);
                    _core.sysBlueMsg(_local_2);
                };
                delete _core.player.petList[_arg_1];
                updateView();
                _core.view.getUI(ViewManager.PANEL_BAG).petInit();
                _local_3 = _core.view.getUI(ViewManager.PANEL_PET_SOUL);
                if (_local_3)
                {
                    _local_3.updatePetList();
                };
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            var _local_1:Rectangle = new Rectangle(0, 0, 135, 173);
            tarcanvas.scrollRect = _local_1;
            _core.remote.call("initViewPetMngP", new Responder(onInitViewPetMngP));
        }

        public function set petNum(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._991692313petNum;
            if (_local_2 !== _arg_1)
            {
                this._991692313petNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petNum", _local_2, _arg_1));
            };
        }

        public function __addIntelligenceButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function __openBtn1_click(_arg_1:MouseEvent):void
        {
            openSkill(1);
        }

        public function __delBtn2_click(_arg_1:MouseEvent):void
        {
            delSkill(2);
        }

        public function set finalResiLight(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1898937865finalResiLight;
            if (_local_2 !== _arg_1)
            {
                this._1898937865finalResiLight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalResiLight", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get minusStaminaButton():Button
        {
            return (this._1889342449minusStaminaButton);
        }

        private function changeNameClick():void
        {
            if (((petDataList) && (petDataList.selectedItem)))
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.PETMANAGERPANEL_S[0], Language.PETMANAGERPANEL_S[1], changePetName, petDataList.selectedItem.text, 12);
            };
        }

        public function __skill3_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        public function set finalPraDef(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1997577724finalPraDef;
            if (_local_2 !== _arg_1)
            {
                this._1997577724finalPraDef = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalPraDef", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addStrength():BoxLabel
        {
            return (this._817036290addStrength);
        }

        public function set attStrength(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1181680126attStrength;
            if (_local_2 !== _arg_1)
            {
                this._1181680126attStrength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attStrength", _local_2, _arg_1));
            };
        }

        public function set addIntelligence(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1420795392addIntelligence;
            if (_local_2 !== _arg_1)
            {
                this._1420795392addIntelligence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addIntelligence", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stateBtn():BasicDelayButton
        {
            return (this._1318169611stateBtn);
        }

        [Bindable(event="propertyChange")]
        public function get attIntelligence():BoxLabel
        {
            return (this._1319279616attIntelligence);
        }

        [Bindable(event="propertyChange")]
        public function get finalPoison():TextInput
        {
            return (this._1995090974finalPoison);
        }

        public function __petFuncBtn5_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(6);
        }

        public function ___PetManagerPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            openGuardPanel();
        }

        public function __stateBtn_click(_arg_1:MouseEvent):void
        {
            changePetState();
            nextGuide();
        }

        [Bindable(event="propertyChange")]
        public function get propertyBarMp():PropertyBar
        {
            return (this._1046717375propertyBarMp);
        }

        [Bindable(event="propertyChange")]
        public function get defence():BoxLabel
        {
            return (this._1544916048defence);
        }

        public function set showPetFollowBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._534396457showPetFollowBtn;
            if (_local_2 !== _arg_1)
            {
                this._534396457showPetFollowBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showPetFollowBtn", _local_2, _arg_1));
            };
        }

        public function __skill1_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get minusEnergyButton():Button
        {
            return (this._1863068566minusEnergyButton);
        }

        private function classTypeSelect():void
        {
            updateView();
        }

        private function upSkill(index:int):void
        {
            var skillData:Object;
            var func:Function;
            var func2:Function;
            index = ((selectedTabIndex * 5) + index);
            var str:String = "";
            if (((petData) && (ToolKit.isBigThan(petData[("skill" + index)], 0))))
            {
                skillData = _core.data.getGameData(GamePredef.TBL_SKILL, petData[("skill" + index)]);
                if (skillData)
                {
                    if (ToolKit.isBigOrEqual(skillData.level, 3))
                    {
                        _core.sysMsg(Language.PETPANEL_S[3]);
                    }
                    else
                    {
                        if (ToolKit.isEqual(skillData.level, 1))
                        {
                            if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_UP[petDataTemp.qLevel], 1))
                            {
                                func = function (_arg_1:CloseEvent):void
                                {
                                    if (_arg_1.detail == Alert.YES)
                                    {
                                        _core.remote.petUpSkill(petData.id, index);
                                    };
                                };
                                str = Language.PETPANEL_S[4];
                                str = str.replace("{skillData.name}", skillData.name);
                                Alert.show(str, "", 3, this, func);
                            }
                            else
                            {
                                str = Language.PETPANEL_S[5];
                                str = str.replace("{petSkillUpItem}", TextUtil.getCodeByTypeId(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_UP[petDataTemp.qLevel]));
                                _core.sysMsg(str);
                            };
                        }
                        else
                        {
                            if (ToolKit.isEqual(skillData.level, 2))
                            {
                                if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_UP[petDataTemp.qLevel], 3))
                                {
                                    func2 = function (_arg_1:CloseEvent):void
                                    {
                                        if (_arg_1.detail == Alert.YES)
                                        {
                                            _core.remote.petUpSkill(petData.id, index);
                                        };
                                    };
                                    str = Language.PETPANEL_S[6];
                                    str = str.replace("{skillData.name}", skillData.name);
                                    Alert.show(str, "", 3, this, func2);
                                }
                                else
                                {
                                    str = Language.PETPANEL_S[7];
                                    str = str.replace("{petSkillUpItem}", TextUtil.getCodeByTypeId(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_UP[petDataTemp.qLevel]));
                                    _core.sysMsg(str);
                                };
                            };
                        };
                    };
                };
            };
        }

        public function onUpdatePet(_arg_1:Number, _arg_2:String, _arg_3:String):void
        {
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:*;
            var _local_9:Object;
            var _local_4:* = "";
            if ((((_core.player) && (_core.player.petList)) && (_core.player.petList[_arg_1])))
            {
                if (_arg_2 == "exp")
                {
                    _local_5 = (Number(_arg_3) - _core.player.petList[_arg_1].exp);
                    if (_local_5 > 0)
                    {
                        _local_4 = Language.PETMANAGERPANEL_S[6];
                        _local_4 = _local_4.replace("{petName}", _core.player.petList[_arg_1].petName);
                        _local_4 = _local_4.replace("{exp}", (Number(_arg_3) - _core.player.petList[_arg_1].exp));
                        _core.sysBlueMsg(_local_4);
                    };
                    _local_6 = PetLogic.expToLv(Number(_arg_3));
                    _local_7 = PetLogic.expToLv(_core.player.petList[_arg_1].exp);
                    if (_local_7 < _local_6)
                    {
                        _local_4 = Language.PETMANAGERPANEL_S[8];
                        _local_4 = _local_4.replace("{petName}", _core.player.petList[_arg_1].petName);
                        _local_4 = _local_4.replace("{newLv}", _local_6);
                        _core.sysBlueMsg(_local_4);
                    };
                };
                _core.player.petList[_arg_1][_arg_2] = _arg_3;
                updateView(_arg_1);
                if (((_arg_2 == "state") && (ToolKit.isEqual(_arg_3, 1))))
                {
                    updatePetAutoBattleSet();
                };
                if (((_arg_2 == "state") && ((ToolKit.isEqual(_arg_3, 1)) || (ToolKit.isEqual(_arg_3, 3)))))
                {
                    _local_8 = _core.view.getUI(ViewManager.PANEL_FINDBACK);
                    if (_local_8.visible)
                    {
                        _local_8.resetPetMoney();
                    };
                };
                if (((_core.player.petList[_arg_1]["state"] == 1) && (_core.player.state == GamePredef.ST_BATTLE)))
                {
                    if (_arg_2 == "currentMp")
                    {
                        _core.battlePet = _core.player.petList[_arg_1];
                        _core.battlePet.skillAddMp = true;
                    };
                };
                if (((_arg_2 == "state") || (_arg_2 == "petName")))
                {
                    _local_9 = _core.view.getUI(ViewManager.PANEL_PET_SOUL);
                    if (_local_9)
                    {
                        _local_9.updatePetList();
                    };
                };
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get attEnergy():BoxLabel
        {
            return (this._1270522743attEnergy);
        }

        [Bindable(event="propertyChange")]
        public function get aptStamina():BoxLabel
        {
            return (this._1911434378aptStamina);
        }

        [Bindable(event="propertyChange")]
        public function get pettabBtn1():BasicGlowButton
        {
            return (this._344411275pettabBtn1);
        }

        public function set finalResiPoison(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1382596167finalResiPoison;
            if (_local_2 !== _arg_1)
            {
                this._1382596167finalResiPoison = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalResiPoison", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pettabBtn0():BasicGlowButton
        {
            return (this._344411274pettabBtn0);
        }

        public function set finalResiRage(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._908746316finalResiRage;
            if (_local_2 !== _arg_1)
            {
                this._908746316finalResiRage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalResiRage", _local_2, _arg_1));
            };
        }

        public function set bindImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._108251578bindImg;
            if (_local_2 !== _arg_1)
            {
                this._108251578bindImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bindImg", _local_2, _arg_1));
            };
        }

        public function set attack(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1407259064attack;
            if (_local_2 !== _arg_1)
            {
                this._1407259064attack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attack", _local_2, _arg_1));
            };
        }

        private function _changePetState(_arg_1:int):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_2:* = "";
            if (_arg_1 == 1)
            {
                if ((PetLogic.expToLv(petDataList.selectedItem.petData.exp) - 5) > _core.player.level)
                {
                    Alert.show(Language.PETMANAGERPANEL_S[2], "", Alert.OK);
                    return;
                };
                _local_3 = _core.data.gameData[GamePredef.TBL_CREATURE][petDataList.selectedItem.petData.tid];
                if (((!(_local_3)) || (_local_3.useLv > _core.player.level)))
                {
                    _local_2 = Language.PETMANAGERPANEL_S[3];
                    _local_2 = _local_2.replace("{useLv}", _local_3.useLv);
                    Alert.show(_local_2, "", Alert.OK);
                    return;
                };
                if (petDataList.selectedItem.petData.binded == 0)
                {
                    Alert.show(Language.PETMANAGERPANEL_S[5], "", 3, this, stateHandler);
                    return;
                };
                for each (_local_4 in _core.player.petList)
                {
                    if (_local_4.state == 1)
                    {
                        _core.remote.changePetState(_local_4.id, 3);
                    };
                };
            }
            else
            {
                if (_arg_1 == 2)
                {
                    for each (_local_5 in _core.player.petList)
                    {
                        if (_local_5.state == 2)
                        {
                            _core.remote.changePetState(_local_5.id, 3);
                        };
                    };
                };
            };
            _core.remote.changePetState(petDataList.selectedItem.petData.id, _arg_1);
        }

        public function set aptIntelligenceFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._314795602aptIntelligenceFinal;
            if (_local_2 !== _arg_1)
            {
                this._314795602aptIntelligenceFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptIntelligenceFinal", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get _PetManagerPanel_HBox1():HBox
        {
            return (this._1064350886_PetManagerPanel_HBox1);
        }

        public function set star(_arg_1:Repeater):void
        {
            var _local_2:Object;
            _local_2 = this._3540562star;
            if (_local_2 !== _arg_1)
            {
                this._3540562star = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star", _local_2, _arg_1));
            };
        }

        public function changeSelectPet(_arg_1:Object):void
        {
            this.petData = _arg_1;
        }

        public function __pettabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get paixucb():CheckBox
        {
            return (this._801114956paixucb);
        }

        public function __upBtn4_click(_arg_1:MouseEvent):void
        {
            upSkill(4);
        }

        private function initPageSelector(_arg_1:*):void
        {
            var _local_2:int;
            pageAC = _arg_1;
            pageSelector.lastBtnLabel = Language.PAGE_SELECTOR[2];
            pageSelector.nextBtnLabel = Language.PAGE_SELECTOR[3];
            pageSelector.btnLastPage.width = 32;
            pageSelector.btnNextPage.width = 32;
            if (pageAC.length >= PAGE_MAX_PET_NUM)
            {
                _local_2 = PAGE_MAX_PET_NUM;
            }
            else
            {
                _local_2 = pageAC.length;
            };
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                petPageAc.addItem(pageAC.getItemAt(_local_3));
                _local_3++;
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(pageAC.length, PAGE_MAX_PET_NUM);
        }

        public function set aptAgility(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1543550368aptAgility;
            if (_local_2 !== _arg_1)
            {
                this._1543550368aptAgility = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptAgility", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petLife():BoxLabel
        {
            return (this._677761861petLife);
        }

        public function set attAgility(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._183433628attAgility;
            if (_local_2 !== _arg_1)
            {
                this._183433628attAgility = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attAgility", _local_2, _arg_1));
            };
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

        private function skillLevelClicked(_arg_1:GameDataEvent):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_2:Core = Core.getInstance();
            if (((_local_2.state == GamePredef.ST_CORE_BATTLE) && (_local_2.cmdState == GamePredef.ST_BATTLE_SKILL)))
            {
                _local_3 = _arg_1.data.level;
                _local_4 = _arg_1.data.skill;
                if (_local_2.checkSkillRequire(_local_4, true, true))
                {
                    _local_2.skill = _local_4;
                    _local_2.skillLevel = _local_3;
                    if (((!(ToolKit.isEqual(_local_4.targetType, Battle.SKILL_TARGET_TYPE_SELF_PLAYER))) && (!(ToolKit.isEqual(_local_4.targetType, Battle.SKILL_TARGET_TYPE_SELF_PET)))))
                    {
                        _local_2.view.showSelect();
                    };
                    visible = false;
                };
            }
            else
            {
                drag(_arg_1.data.slot, _arg_1.data.event, _arg_1.data.level);
            };
        }

        private function addEL(_arg_1:Event):void
        {
            var _local_2:SkillUseSlot = SkillUseSlot(_arg_1.currentTarget);
            _local_2.addEventListener(GameDataEvent.SKILL_LEVEL_CLICKED, skillLevelClicked);
        }

        public function set finalBreakReborn(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._467845765finalBreakReborn;
            if (_local_2 !== _arg_1)
            {
                this._467845765finalBreakReborn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalBreakReborn", _local_2, _arg_1));
            };
        }

        private function delSkill(index:int):void
        {
            var skillData:Object;
            var _delSkill:Function;
            var func:Function;
            index = ((selectedTabIndex * 5) + index);
            if (((petData) && (ToolKit.isBigThan(petData[("skill" + index)], 0))))
            {
                if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_DEL, 1))
                {
                    skillData = _core.data.getGameData(GamePredef.TBL_SKILL, petData[("skill" + index)]);
                    if (skillData)
                    {
                        _delSkill = function (_arg_1:String):void
                        {
                            var _local_2:String;
                            if (_arg_1)
                            {
                                _local_2 = MD5.hash(_arg_1);
                                _core.remote.petDelSkill(petData.id, index, _local_2);
                            };
                        };
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                if (_core.delPass)
                                {
                                    _core.remote.petDelSkill(petData.id, index, _core.delPass);
                                }
                                else
                                {
                                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.PETPANEL_U[23], _delSkill);
                                };
                            };
                        };
                        Alert.show(((Language.PETPANEL_S[1] + skillData.name) + "?"), "", 3, this, func);
                    };
                }
                else
                {
                    _core.sysMsg(((Language.PETPANEL_S[2] + TextUtil.getCodeByTypeId(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_PET_SKILL_DEL)) + "x1!"));
                };
            };
        }

        public function set petHp(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._106557063petHp;
            if (_local_2 !== _arg_1)
            {
                this._106557063petHp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petHp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get petPageAc():ArrayCollection
        {
            return (this._1613040912petPageAc);
        }

        public function set addEnergy(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._405874039addEnergy;
            if (_local_2 !== _arg_1)
            {
                this._405874039addEnergy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEnergy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mAttack():BoxLabel
        {
            return (this._74771179mAttack);
        }

        [Bindable(event="propertyChange")]
        public function get finalRebornRate():TextInput
        {
            return (this._473555694finalRebornRate);
        }

        public function set tabBtn1(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set tabBtn0(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set upBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841135upBtn2;
            if (_local_2 !== _arg_1)
            {
                this._839841135upBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn2", _local_2, _arg_1));
            };
        }

        public function set upBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841134upBtn3;
            if (_local_2 !== _arg_1)
            {
                this._839841134upBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dp1():Canvas
        {
            return (this._99621dp1);
        }

        [Bindable(event="propertyChange")]
        public function get dp2():Canvas
        {
            return (this._99622dp2);
        }

        public function set upBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841136upBtn1;
            if (_local_2 !== _arg_1)
            {
                this._839841136upBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn1", _local_2, _arg_1));
            };
        }

        public function set upBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841132upBtn5;
            if (_local_2 !== _arg_1)
            {
                this._839841132upBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn5", _local_2, _arg_1));
            };
        }

        public function set addStamina(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10889870addStamina;
            if (_local_2 !== _arg_1)
            {
                this._10889870addStamina = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStamina", _local_2, _arg_1));
            };
        }

        public function set upBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._839841133upBtn4;
            if (_local_2 !== _arg_1)
            {
                this._839841133upBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn4", _local_2, _arg_1));
            };
        }

        private function drag(_arg_1:SkillUseSlot, _arg_2:MouseEvent, _arg_3:int=0):void
        {
            var _local_8:Number;
            var _local_9:Object;
            var _local_10:*;
            var _local_4:Image = Image(_arg_1.skillSlot.itemIcon);
            var _local_5:DragSource = new DragSource();
            _local_5.addData(_local_4, "image");
            if (_arg_1.skillSlot.type == GamePredef.TBL_SKILL)
            {
                if ((_arg_2.target is Button))
                {
                    _local_8 = Number(Button(_arg_2.target).id.substr(3, Button(_arg_2.target).id.length));
                    if (((_local_8 > 0) && (_local_8 < 10)))
                    {
                        _local_9 = _core.data.gameDataIndex[GamePredef.TBL_SKILL][_core.data.gameData[GamePredef.TBL_SKILL][_arg_1.skillSlot.slotData.id].codeName];
                        for each (_local_10 in _local_9)
                        {
                            if (_local_10.level == _local_8)
                            {
                                _arg_1.skillSlot.giid = _local_10.id;
                                break;
                            };
                        };
                    };
                };
            };
            _local_5.addData(_arg_1.skillSlot, "slot");
            _local_5.addData(_arg_3, "level");
            var _local_6:Image = new Image();
            _local_6.source = _local_4.source;
            _local_6.height = _local_4.height;
            _local_6.width = _local_4.width;
            _local_6.x = _local_4.x;
            _local_6.y = _local_4.y;
            var _local_7:int;
            if (_arg_3 > 0)
            {
                _local_7 = (-78 - (_arg_3 * 16));
            };
            DragManager.doDrag(_local_4, _local_5, _arg_2, _local_6, _local_7, 0, 0.5);
        }

        public function __minusStrengthButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function set tabBtn2(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tarcanvas():SimpleCanvas
        {
            return (this._933944003tarcanvas);
        }

        public function set aptEnergyEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._415587680aptEnergyEx;
            if (_local_2 !== _arg_1)
            {
                this._415587680aptEnergyEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptEnergyEx", _local_2, _arg_1));
            };
        }

        override public function hide():void
        {
            var _local_2:PetCmdCanvas;
            super.hide();
            var _local_1:Core = Core.getInstance();
            if (_local_1.state == GamePredef.ST_CORE_BATTLE)
            {
                _local_2 = PetCmdCanvas(_local_1.view.getUI(ViewManager.MAIN_BATTLE_PET));
                _local_2.doCmd("btnAttack");
            };
        }

        public function reset():void
        {
            var _local_1:Object;
            firstTimeFlag = true;
            for each (_local_1 in this)
            {
                if ((_local_1 is BoxLabel))
                {
                    _local_1.text = "";
                };
            };
        }

        public function __addStaminaButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btn2():BasicGlowButton
        {
            return (this._3034454btn2);
        }

        [Bindable(event="propertyChange")]
        public function get aptIntelligenceEx():RoundedLabel
        {
            return (this._1229780311aptIntelligenceEx);
        }

        [Bindable(event="propertyChange")]
        public function get addIntelligenceButton():Button
        {
            return (this._1991903918addIntelligenceButton);
        }

        [Bindable(event="propertyChange")]
        public function get btn4():BasicGlowButton
        {
            return (this._3034456btn4);
        }

        [Bindable(event="propertyChange")]
        public function get finalLight():TextInput
        {
            return (this._1879179968finalLight);
        }

        public function set showCanvas(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._307382965showCanvas;
            if (_local_2 !== _arg_1)
            {
                this._307382965showCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCanvas", _local_2, _arg_1));
            };
        }

        private function buttonClick(_arg_1:Event):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            switch (_arg_1.currentTarget.id)
            {
                case "addStrengthButton":
                    if (Number(attLastPoint.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < Multiple)))
                        {
                            tempMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_2 = Number(addStrength.text);
                    _local_2 = (_local_2 + tempMultiple);
                    addStrength.text = _local_2.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusStrengthButton.styleName = "BtnReduce";
                    break;
                case "addAgilityButton":
                    if (Number(attLastPoint.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < Multiple)))
                        {
                            tempMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_3 = Number(addAgility.text);
                    _local_3 = (_local_3 + tempMultiple);
                    addAgility.text = _local_3.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusAgilityButton.styleName = "BtnReduce";
                    break;
                case "addStaminaButton":
                    if (Number(attLastPoint.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < Multiple)))
                        {
                            tempMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_4 = Number(addStamina.text);
                    _local_4 = (_local_4 + tempMultiple);
                    addStamina.text = _local_4.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusStaminaButton.styleName = "BtnReduce";
                    break;
                case "addIntelligenceButton":
                    if (Number(attLastPoint.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < Multiple)))
                        {
                            tempMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_5 = Number(addIntelligence.text);
                    _local_5 = (_local_5 + tempMultiple);
                    addIntelligence.text = _local_5.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusIntelligenceButton.styleName = "BtnReduce";
                    break;
                case "addEnergyButton":
                    if (Number(attLastPoint.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < Multiple)))
                        {
                            tempMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_6 = Number(addEnergy.text);
                    _local_6 = (_local_6 + tempMultiple);
                    addEnergy.text = _local_6.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusEnergyButton.styleName = "BtnReduce";
                    break;
                case "minusStrengthButton":
                    if (Number(addStrength.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(addStrength.text)) && (Number(addStrength.text) < Multiple)))
                        {
                            tempMultiple = Number(addStrength.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_2 = Number(addStrength.text);
                    _local_2 = (_local_2 - tempMultiple);
                    addStrength.text = _local_2.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_2 < tempMultiple)
                    {
                        minusStrengthButton.styleName = "BtnReduce2";
                    };
                    break;
                case "minusAgilityButton":
                    if (Number(addAgility.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(addAgility.text)) && (Number(addAgility.text) < Multiple)))
                        {
                            tempMultiple = Number(addAgility.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_3 = Number(addAgility.text);
                    _local_3 = (_local_3 - tempMultiple);
                    addAgility.text = _local_3.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_3 < tempMultiple)
                    {
                        minusAgilityButton.styleName = "BtnReduce2";
                    };
                    break;
                case "minusStaminaButton":
                    if (Number(addStamina.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(addStamina.text)) && (Number(addStamina.text) < Multiple)))
                        {
                            tempMultiple = Number(addStamina.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_4 = Number(addStamina.text);
                    _local_4 = (_local_4 - tempMultiple);
                    addStamina.text = _local_4.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_4 < tempMultiple)
                    {
                        minusStaminaButton.styleName = "BtnReduce2";
                    };
                    break;
                case "minusIntelligenceButton":
                    if (Number(addIntelligence.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(addIntelligence.text)) && (Number(addIntelligence.text) < Multiple)))
                        {
                            tempMultiple = Number(addIntelligence.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_5 = Number(addIntelligence.text);
                    _local_5 = (_local_5 - tempMultiple);
                    addIntelligence.text = _local_5.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_5 < tempMultiple)
                    {
                        minusIntelligenceButton.styleName = "BtnReduce2";
                    };
                    break;
                case "minusEnergyButton":
                    if (Number(addEnergy.text) >= Multiple)
                    {
                        tempMultiple = Multiple;
                    }
                    else
                    {
                        if (((0 < Number(addEnergy.text)) && (Number(addEnergy.text) < Multiple)))
                        {
                            tempMultiple = Number(addEnergy.text);
                        }
                        else
                        {
                            tempMultiple = 0;
                        };
                    };
                    _local_6 = Number(addEnergy.text);
                    _local_6 = (_local_6 - tempMultiple);
                    addEnergy.text = _local_6.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_6 < tempMultiple)
                    {
                        minusEnergyButton.styleName = "BtnReduce2";
                    };
                    break;
            };
            setAddStyleName();
        }

        private function stateHandler(_arg_1:CloseEvent):void
        {
            var _local_2:Object;
            if (_arg_1.detail == Alert.YES)
            {
                for each (_local_2 in _core.player.petList)
                {
                    if (_local_2.state == 1)
                    {
                        _core.remote.changePetState(_local_2.id, 3);
                    };
                };
                _core.remote.changePetState(petDataList.selectedItem.petData.id, 1);
            };
        }

        public function set finalDizzy(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1886549314finalDizzy;
            if (_local_2 !== _arg_1)
            {
                this._1886549314finalDizzy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalDizzy", _local_2, _arg_1));
            };
        }

        public function getSpecPetEquSuitNum(_arg_1:int):Object
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            if (petData != null)
            {
                _local_2 = null;
                _local_3 = (GamePredef.PETEQU_NUM - 1);
                while (_local_3 <= GamePredef.PETEQU_NUM)
                {
                    _local_4 = Number(petData[("equ" + _local_3)]);
                    if (_local_4 > 0)
                    {
                        _local_5 = _core.data.getSlot({"id":_local_4});
                        _local_6 = _core.data.getData(_local_5.type, _local_5.itemId);
                        if (_local_6)
                        {
                            _local_7 = _core.getTemplateData(GamePredef.TBL_EQUIPT_TEMPLATE, _local_6.tid);
                            if (_local_7.suitId == _arg_1)
                            {
                                if (_local_6.color >= 2)
                                {
                                    if (_local_2 == null)
                                    {
                                        _local_2 = {};
                                    };
                                    if (_local_2[_local_6.color] == null)
                                    {
                                        _local_2[_local_6.color] = 0;
                                    };
                                    _local_2[_local_6.color] = (_local_2[_local_6.color] + 1);
                                };
                            };
                        };
                    };
                    _local_3++;
                };
                return (_local_2);
            };
            return (null);
        }

        public function set openBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171261openBtn5;
            if (_local_2 !== _arg_1)
            {
                this._505171261openBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn5", _local_2, _arg_1));
            };
        }

        public function set openBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171264openBtn2;
            if (_local_2 !== _arg_1)
            {
                this._505171264openBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn2", _local_2, _arg_1));
            };
        }

        public function set openBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171263openBtn3;
            if (_local_2 !== _arg_1)
            {
                this._505171263openBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptIntelligence():BoxLabel
        {
            return (this._702954884aptIntelligence);
        }

        public function set openBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171265openBtn1;
            if (_local_2 !== _arg_1)
            {
                this._505171265openBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn1", _local_2, _arg_1));
            };
        }

        public function set openBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._505171262openBtn4;
            if (_local_2 !== _arg_1)
            {
                this._505171262openBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn4", _local_2, _arg_1));
            };
        }

        public function __petFuncBtn3_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(2);
        }

        private function changeProperty():void
        {
            if (!selPetData)
            {
                return;
            };
            var _local_1:Core = Core.getInstance();
            _local_1.remote.changePetProperty(selPetData.id, {
                "addStrength":addStrength.text,
                "addAgility":addAgility.text,
                "addStamina":addStamina.text,
                "addIntelligence":addIntelligence.text,
                "addEnergy":addEnergy.text
            });
            addStrength.text = "";
            addAgility.text = "";
            addStamina.text = "";
            addIntelligence.text = "";
            addEnergy.text = "";
            setAddStyleName();
            minusStrengthButton.styleName = "BtnReduce2";
            minusAgilityButton.styleName = "BtnReduce2";
            minusStaminaButton.styleName = "BtnReduce2";
            minusIntelligenceButton.styleName = "BtnReduce2";
            minusEnergyButton.styleName = "BtnReduce2";
        }

        [Bindable(event="propertyChange")]
        public function get petDataList():List
        {
            return (this._579057063petDataList);
        }

        public function __openBtn4_click(_arg_1:MouseEvent):void
        {
            openSkill(4);
        }

        public function __delBtn5_click(_arg_1:MouseEvent):void
        {
            delSkill(5);
        }

        public function set aptStaminaEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1357563171aptStaminaEx;
            if (_local_2 !== _arg_1)
            {
                this._1357563171aptStaminaEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStaminaEx", _local_2, _arg_1));
            };
        }

        public function setAddStyleName():void
        {
            if (Number(attLastPoint.text) > 0)
            {
                styleAddName = "BtnAdd";
            }
            else
            {
                styleAddName = "BtnAdd2";
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEqu1():ItemSlot
        {
            return (this._677962297petEqu1);
        }

        public function __minusEnergyButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu4():ItemSlot
        {
            return (this._677962294petEqu4);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu5():ItemSlot
        {
            return (this._677962293petEqu5);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu6():ItemSlot
        {
            return (this._677962292petEqu6);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu7():ItemSlot
        {
            return (this._677962291petEqu7);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu8():ItemSlot
        {
            return (this._677962290petEqu8);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu2():ItemSlot
        {
            return (this._677962296petEqu2);
        }

        [Bindable(event="propertyChange")]
        public function get petEqu3():ItemSlot
        {
            return (this._677962295petEqu3);
        }

        [Bindable(event="propertyChange")]
        public function get petLevel():RoundedLabel
        {
            return (this._464115109petLevel);
        }

        [Bindable(event="propertyChange")]
        public function get starHbox():HBox
        {
            return (this._1315489237starHbox);
        }

        [Bindable(event="propertyChange")]
        public function get canvas2():Canvas
        {
            return (this._550778330canvas2);
        }

        [Bindable(event="propertyChange")]
        public function get addStrengthButton():Button
        {
            return (this._426146348addStrengthButton);
        }

        private function bindedPet():void
        {
            var func:Function;
            var tempNameStr:String;
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (petDataList.selectedItem.petData.binded == 0)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("bindedPetByPlayer", null, petDataList.selectedItem.petData.id);
                    };
                };
                tempNameStr = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(petDataList.selectedItem.petData.growRate)]) + "'>") + petDataList.selectedItem.petData.petName) + "</font>");
                msg = Language.PETMANAGERPANEL_S[29].toString().replace("{petName}", tempNameStr);
                _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = msg;
                tf.filters = GamePredef.FILTER_TEXT1;
            };
        }

        public function set aptAgilityFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._237239562aptAgilityFinal;
            if (_local_2 !== _arg_1)
            {
                this._237239562aptAgilityFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptAgilityFinal", _local_2, _arg_1));
            };
        }

        public function set attLastPoint(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._30739193attLastPoint;
            if (_local_2 !== _arg_1)
            {
                this._30739193attLastPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attLastPoint", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvas3():Canvas
        {
            return (this._550778331canvas3);
        }

        [Bindable(event="propertyChange")]
        public function get finalRage():TextInput
        {
            return (this._355194339finalRage);
        }

        public function onPetEquipOff(_arg_1:Number, _arg_2:int, _arg_3:Number):void
        {
            var _local_4:*;
            var _local_5:ItemSlot;
            _local_4 = _core.data.getSlot({"id":_arg_3});
            if ((((_local_4) && (_local_4.type == GamePredef.TBL_EQUIPT_INSTANCE)) && (_local_4.stackNum == 0)))
            {
                _local_4.stackNum = 1;
                this[("petEqu" + _arg_2)].giid = -1;
                this[("petEqu" + _arg_2)].restore();
                _local_5 = _core.view.getUI(ViewManager.PANEL_BAG).getBagSlot(_local_4.sid);
                if (_local_5)
                {
                    _local_5.stackNum = 1;
                    _local_5.enabled = true;
                    _local_5.acceptable = true;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get finalPraDef():TextInput
        {
            return (this._1997577724finalPraDef);
        }

        [Bindable(event="propertyChange")]
        public function get attStrength():BoxLabel
        {
            return (this._1181680126attStrength);
        }

        public function set finalCriticalDamage(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1040925444finalCriticalDamage;
            if (_local_2 !== _arg_1)
            {
                this._1040925444finalCriticalDamage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalCriticalDamage", _local_2, _arg_1));
            };
        }

        public function set finalSleep(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1872627967finalSleep;
            if (_local_2 !== _arg_1)
            {
                this._1872627967finalSleep = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalSleep", _local_2, _arg_1));
            };
        }

        public function set aptStaminaFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1751782644aptStaminaFinal;
            if (_local_2 !== _arg_1)
            {
                this._1751782644aptStaminaFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStaminaFinal", _local_2, _arg_1));
            };
        }

        public function __skill4_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        public function __addStrengthButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get showPetFollowBtn():BasicGlowButton
        {
            return (this._534396457showPetFollowBtn);
        }

        public function __skill4_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function set addEnergyButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._708846363addEnergyButton;
            if (_local_2 !== _arg_1)
            {
                this._708846363addEnergyButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEnergyButton", _local_2, _arg_1));
            };
        }

        public function __upBtn2_click(_arg_1:MouseEvent):void
        {
            upSkill(2);
        }

        public function detailUpdateView(_arg_1:Object=null, _arg_2:Boolean=false):void
        {
            var _local_3:Object;
            var _local_4:String;
            if (!initialized)
            {
                callLater(detailUpdateView, [_arg_1]);
                return;
            };
            for (_local_3 in PROP_INT_KEY_ARR)
            {
                _local_4 = PROP_INT_KEY_ARR[_local_3];
                (this[_local_4] as TextInput).text = Number(_arg_1[_local_4]).toFixed(2);
            };
            for (_local_3 in PROP_PER_KEY_ARR)
            {
                _local_4 = PROP_PER_KEY_ARR[_local_3];
                if (_local_4 == "finalPraDef")
                {
                    if (_arg_2)
                    {
                        _core.remote.call("getFinalPraDefPet", new Responder(onSetSpeText), _local_4, Number(_arg_1[_local_4]), _core.cid);
                    }
                    else
                    {
                        (this[_local_4] as TextInput).text = (Number(_arg_1[_local_4]).toFixed(2) + "%");
                    };
                }
                else
                {
                    if (_local_4 == "finalPraMagDef")
                    {
                        if (_arg_2)
                        {
                            _core.remote.call("finalPraMagDefPet", new Responder(onSetSpeText), _local_4, Number(_arg_1[_local_4]), _core.cid);
                        }
                        else
                        {
                            (this[_local_4] as TextInput).text = (Number(_arg_1[_local_4]).toFixed(2) + "%");
                        };
                    }
                    else
                    {
                        (this[_local_4] as TextInput).text = (Number(_arg_1[_local_4]).toFixed(2) + "%");
                    };
                };
            };
        }

        public function set finalResiCritical(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1283394786finalResiCritical;
            if (_local_2 !== _arg_1)
            {
                this._1283394786finalResiCritical = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalResiCritical", _local_2, _arg_1));
            };
        }

        public function __addAgilityButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get finalResiPoison():TextInput
        {
            return (this._1382596167finalResiPoison);
        }

        [Bindable(event="propertyChange")]
        public function get attack():BoxLabel
        {
            return (this._1407259064attack);
        }

        public function set petMp(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._106557218petMp;
            if (_local_2 !== _arg_1)
            {
                this._106557218petMp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get finalResiRage():TextInput
        {
            return (this._908746316finalResiRage);
        }

        [Bindable(event="propertyChange")]
        public function get bindImg():Image
        {
            return (this._108251578bindImg);
        }

        [Bindable(event="propertyChange")]
        public function get aptIntelligenceFinal():RoundedLabel
        {
            return (this._314795602aptIntelligenceFinal);
        }

        public function set xibieshai(_arg_1:ComboBox):void
        {
            var _local_2:Object;
            _local_2 = this._344201002xibieshai;
            if (_local_2 !== _arg_1)
            {
                this._344201002xibieshai = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xibieshai", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star():Repeater
        {
            return (this._3540562star);
        }

        public function __paixucb_click(_arg_1:MouseEvent):void
        {
            paixuselectHandler(_arg_1);
        }

        public function set finalConfusion(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._498964688finalConfusion;
            if (_local_2 !== _arg_1)
            {
                this._498964688finalConfusion = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalConfusion", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get attAgility():BoxLabel
        {
            return (this._183433628attAgility);
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

        public function set mDefence(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._97632477mDefence;
            if (_local_2 !== _arg_1)
            {
                this._97632477mDefence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mDefence", _local_2, _arg_1));
            };
        }

        public function set addBtnCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._19957965addBtnCanvas;
            if (_local_2 !== _arg_1)
            {
                this._19957965addBtnCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addBtnCanvas", _local_2, _arg_1));
            };
        }

        public function __petDataList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
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

        public function onInitViewPetMngP(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:*;
            firstTimeFlag = false;
            for each (_local_2 in _arg_1)
            {
                if (_local_2)
                {
                    for (_local_4 in _local_2.data)
                    {
                        if (!((_local_4 == "pi") || (_local_4 == "soulInfo")))
                        {
                            _local_2[_local_4] = _local_2.data[_local_4];
                        };
                    };
                };
                _local_2.creatureData = _core.data.getGameData(GamePredef.TBL_CREATURE, _local_2.data.tid);
                delete _local_2.data;
            };
            _core.player.petList = _arg_1;
            updateView();
            updatePetAutoBattleSet();
            petDataList.addEventListener(MouseEvent.CLICK, petAllowToShow);
            _local_3 = _core.view.getUI(ViewManager.PANEL_PET_SOUL);
            if (_local_3)
            {
                _local_3.updateView();
            };
        }

        public function __addEnergyButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function changePetName(_arg_1:String):void
        {
            var _local_2:Object;
            if (_core.haveSpecialStr(_arg_1))
            {
                Alert.show(Language.CHARACTORPANEL_S[11], "");
                return;
            };
            if (_core.haveBadWord(_arg_1))
            {
                Alert.show(Language.CHARACTORPANEL_S[11], "");
                return;
            };
            if (((!(_arg_1 == "")) && (!(_arg_1 == petDataList.selectedItem.text))))
            {
                _core.remote.changePetName(petDataList.selectedItem.id, _arg_1);
            }
            else
            {
                if (_arg_1 == "")
                {
                    _local_2 = _core.getTemplateData(GamePredef.TBL_CREATURE, petDataList.selectedItem.petData.tid);
                    if (((_local_2) && (!(_arg_1 == _local_2.name))))
                    {
                        _core.remote.changePetName(petDataList.selectedItem.id, _local_2.name);
                    };
                };
            };
        }

        public function set aptAgilityEx(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1588184269aptAgilityEx;
            if (_local_2 !== _arg_1)
            {
                this._1588184269aptAgilityEx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptAgilityEx", _local_2, _arg_1));
            };
        }

        public function changePetState(_state:int=0):void
        {
            var state:int;
            var label:String;
            var btPet:Object;
            var i:* = undefined;
            var func:Function;
            if (petDataList.selectedItem)
            {
                state = -1;
                label = "";
                if (_state)
                {
                    if (petDataList.selectedItem.petData.state == _state)
                    {
                        return;
                    };
                    state = _state;
                    for (i in PET_STATE_ARR)
                    {
                        if (state == PET_STATE_ARR[i]["state"])
                        {
                            label = PET_STATE_ARR[i]["label"];
                        };
                    };
                }
                else
                {
                    if (petDataList.selectedItem.petData.state == PET_STATE_ARR[0]["state"])
                    {
                        label = PET_STATE_ARR[1]["label"];
                        state = PET_STATE_ARR[1]["state"];
                    }
                    else
                    {
                        label = PET_STATE_ARR[0]["label"];
                        state = PET_STATE_ARR[0]["state"];
                    };
                };
                btPet = _core.battlePet;
                if (((btPet) && ((PetLogic.expToLv(btPet.exp) - 5) > _core.player.level)))
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            stateBtn.label = label;
                            _changePetState(state);
                        };
                    };
                    Alert.show(Language.PETMANAGERPANEL_S[27], "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    stateBtn.label = label;
                    _changePetState(state);
                };
                stateBtn.toolTip = stateBtn.label;
            };
        }

        private function clearPage():void
        {
            petPageAc.removeAll();
        }

        [Bindable(event="propertyChange")]
        public function get petHp():BoxLabel
        {
            return (this._106557063petHp);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicMultiLineButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicMultiLineButton
        {
            return (this._1554141558tabBtn1);
        }

        private function clearView():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 5)
            {
                this[("skill" + _local_1)].clean();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicMultiLineButton
        {
            return (this._1554141557tabBtn2);
        }

        private function openPetFuncPanel(_arg_1:int):void
        {
            var _local_2:Number;
            var _local_3:Object;
            var _local_4:ItemSlot;
            if (_arg_1 == 7)
            {
                if (_core.player.level < 120)
                {
                    _core.sysMsg(Language.PET_HANDBOOK_PANEL_U[112]);
                    return;
                };
                _local_2 = petData.tid;
                _local_3 = _core.view.getUI(ViewManager.PANEL_PET_EVOLUTION);
                if (_local_3)
                {
                    _local_3.open(_local_2);
                };
            }
            else
            {
                _local_4 = new ItemSlot();
                _local_4.type = GamePredef.TBL_PET;
                _local_4.slotType = Slot.SLOT_PET;
                _local_4.giid = petData.id;
                _local_4.stackNum = 1;
                _local_4.slotData = petData;
                _core.view.getUI(ViewManager.PANEL_PETFUNC).putPet(_local_4, _arg_1);
            };
        }

        public function set minusIntelligenceButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1606233953minusIntelligenceButton;
            if (_local_2 !== _arg_1)
            {
                this._1606233953minusIntelligenceButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minusIntelligenceButton", _local_2, _arg_1));
            };
        }

        public function set minusStrengthButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1864769379minusStrengthButton;
            if (_local_2 !== _arg_1)
            {
                this._1864769379minusStrengthButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minusStrengthButton", _local_2, _arg_1));
            };
        }

        public function set addStaminaButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._14326624addStaminaButton;
            if (_local_2 !== _arg_1)
            {
                this._14326624addStaminaButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStaminaButton", _local_2, _arg_1));
            };
        }

        public function set finalResiDizzy(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1906307211finalResiDizzy;
            if (_local_2 !== _arg_1)
            {
                this._1906307211finalResiDizzy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalResiDizzy", _local_2, _arg_1));
            };
        }

        public function __canvas3_creationComplete(_arg_1:FlexEvent):void
        {
            initPetEquListen();
        }

        [Bindable(event="propertyChange")]
        public function get finalSleep():TextInput
        {
            return (this._1872627967finalSleep);
        }

        private function doubleClickHandler(_arg_1:GameEvent):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
            _core.remote.petEquipOff(petData.id, _local_2.giid);
        }

        public function set propertyCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1940048781propertyCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1940048781propertyCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propertyCanvas", _local_2, _arg_1));
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object;
            _local_2 = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMp():BoxLabel
        {
            return (this._106557218petMp);
        }

        [Bindable(event="propertyChange")]
        public function get mDefence():BoxLabel
        {
            return (this._97632477mDefence);
        }

        public function set growRate(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._507317139growRate;
            if (_local_2 !== _arg_1)
            {
                this._507317139growRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "growRate", _local_2, _arg_1));
            };
        }

        public function set aptStrengthFinal(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._815424624aptStrengthFinal;
            if (_local_2 !== _arg_1)
            {
                this._815424624aptStrengthFinal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStrengthFinal", _local_2, _arg_1));
            };
        }

        public function __openBtn2_click(_arg_1:MouseEvent):void
        {
            openSkill(2);
        }

        [Bindable(event="propertyChange")]
        public function get xibieshai():ComboBox
        {
            return (this._344201002xibieshai);
        }

        public function set hit(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._103315hit;
            if (_local_2 !== _arg_1)
            {
                this._103315hit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hit", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get elementImg():Image
        {
            return (this._575917863elementImg);
        }

        public function __petFuncBtn1_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(0);
        }

        [Bindable(event="propertyChange")]
        public function get addBtnCanvas():Canvas
        {
            return (this._19957965addBtnCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get finalConfusion():TextInput
        {
            return (this._498964688finalConfusion);
        }

        public function __AddMultipleCheck_change(_arg_1:Event):void
        {
            if (AddMultipleCheck.selected)
            {
                Multiple = 10;
            }
            else
            {
                Multiple = 1;
            };
        }

        private function paixuselectHandler(_arg_1:Event):void
        {
            updateView();
        }

        private function mouseAction(_arg_1:Event, _arg_2:int):void
        {
            if (((((_core.player) && (_core.player.mapData)) && (_core.player.mapData.templateId)) && (((int(_core.player.mapData.templateId) == 2007) || (int(_core.player.mapData.templateId) == 2008)) || (int(_core.player.mapData.templateId) == 2009))))
            {
                _core.sysMidMsg(Language.MAZE_INFO_PANEL_U[13]);
                return;
            };
            if (((petDataList.selectedItem) && (selPetData)))
            {
                _core.view.getUI(ViewManager.PANEL_BAG).visible = true;
                _arg_1.stopImmediatePropagation();
                if (_core.state == GamePredef.ST_BATTLE)
                {
                    return;
                };
                _core.view.showMouse(ResManager.MOUSE_ACTION_IMG[_arg_2]);
                _core.view.mouseState = _arg_2;
                _core.view.mouseTargetType = GamePredef.MOUSE_TARGET_PET;
                _core.view.mousePetId = petDataList.selectedItem.petData.id;
            };
        }

        private function skillGetLevel(_arg_1:Number, _arg_2:int):Object
        {
            var _local_4:*;
            var _local_5:Object;
            var _local_3:Object = GameData.d[GamePredef.TBL_SKILL][_arg_1];
            if (_arg_2 > 0)
            {
                _local_4 = _core.data.gameDataIndex[GamePredef.TBL_SKILL][_local_3.codeName];
                for each (_local_5 in _local_4)
                {
                    if (Number(_local_5.level) == Number(_arg_2))
                    {
                        _local_3 = _local_5;
                        break;
                    };
                };
            };
            return (_local_3);
        }

        public function tabBtnClick(_arg_1:int):void
        {
            if (_arg_1 == 0)
            {
                dp1.visible = true;
                dp2.visible = false;
                pettabBtn0.selected = true;
                pettabBtn1.selected = false;
            }
            else
            {
                dp2.visible = true;
                dp1.visible = false;
                pettabBtn1.selected = true;
                pettabBtn0.selected = false;
            };
        }

        public function __delBtn3_click(_arg_1:MouseEvent):void
        {
            delSkill(3);
        }

        public function set critical(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1952151455critical;
            if (_local_2 !== _arg_1)
            {
                this._1952151455critical = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "critical", _local_2, _arg_1));
            };
        }

        public function set finalCounter(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1218397274finalCounter;
            if (_local_2 !== _arg_1)
            {
                this._1218397274finalCounter = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalCounter", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get minusIntelligenceButton():Button
        {
            return (this._1606233953minusIntelligenceButton);
        }

        public function set finalDefy(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._354781098finalDefy;
            if (_local_2 !== _arg_1)
            {
                this._354781098finalDefy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalDefy", _local_2, _arg_1));
            };
        }

        public function set propertyBarHp(_arg_1:PropertyBar):void
        {
            var _local_2:Object;
            _local_2 = this._1046717530propertyBarHp;
            if (_local_2 !== _arg_1)
            {
                this._1046717530propertyBarHp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propertyBarHp", _local_2, _arg_1));
            };
        }

        public function __petFuncBtn6_click(_arg_1:MouseEvent):void
        {
            openPetFuncPanel(7);
        }

        [Bindable(event="propertyChange")]
        public function get minusStrengthButton():Button
        {
            return (this._1864769379minusStrengthButton);
        }

        private function startPetFollow():void
        {
            var _local_1:Number = petDataList.selectedItem.petData.id;
            followPetIdCheck = _local_1;
            _core.remote.call("startPetFollow", new Responder(startPetFollowHandler), _local_1, _core.getShowPetId());
        }

        public function set finalResiSleep(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1892385864finalResiSleep;
            if (_local_2 !== _arg_1)
            {
                this._1892385864finalResiSleep = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "finalResiSleep", _local_2, _arg_1));
            };
        }

        private function deletePet():void
        {
            var pid:Number;
            var delFunc:Function;
            var msg:String;
            var htmlmsg:String;
            var _alert:Alert;
            var tf:IUITextField;
            var i:* = undefined;
            if (((petDataList.selectedItem) && (selPetData)))
            {
                if (((selPetData.soulInfo) && (selPetData.soulInfo["data"])))
                {
                    for (i in selPetData.soulInfo["data"])
                    {
                        if (selPetData.soulInfo["data"][i])
                        {
                            Alert.show(Language.PET_SOUL_S[50], "", Alert.YES, null, null);
                            return;
                        };
                    };
                };
                pid = petDataList.selectedItem.petData.id;
                delFunc = function (e:CloseEvent):void
                {
                    var delPetFunc:Function;
                    if (e.detail == Alert.YES)
                    {
                        if (petDataList.selectedItem.petData.growRate > GamePredef.PET_GROWRATE_NUM[1])
                        {
                            delPetFunc = function (_arg_1:String):void
                            {
                                var _local_2:String;
                                if (_arg_1)
                                {
                                    _local_2 = MD5.hash(_arg_1);
                                    _core.remote.delPetByClient(pid, _local_2);
                                };
                            };
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.PETMANAGERPANEL_S[22], delPetFunc);
                        }
                        else
                        {
                            _core.remote.delPetByClient(pid);
                        };
                    };
                };
                msg = (((Language.PETMANAGERPANEL_S[14] + "(") + petDataList.selectedItem.petData.petName) + ")");
                htmlmsg = (((((Language.PETMANAGERPANEL_S[14] + "(<font color='") + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(petDataList.selectedItem.petData.growRate)]) + "'>") + petDataList.selectedItem.petData.petName) + "</font>)");
                _alert = Alert.show(msg, "", 3, this, delFunc);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = htmlmsg;
            };
        }

        [Bindable(event="propertyChange")]
        public function get finalResiDizzy():TextInput
        {
            return (this._1906307211finalResiDizzy);
        }

        public function ___PetManagerPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            showPetSoulPanel();
        }

        public function onAddPet(_arg_1:Object):void
        {
            var _local_3:*;
            if (_core.player.petList == null)
            {
                _core.player.petList = {};
            };
            if (_arg_1)
            {
                for (_local_3 in _arg_1.data)
                {
                    if (!((_local_3 == "pi") || (_local_3 == "soulInfo")))
                    {
                        _arg_1[_local_3] = _arg_1.data[_local_3];
                    };
                };
            };
            _arg_1.creatureData = _core.data.getGameData(GamePredef.TBL_CREATURE, _arg_1.data.tid);
            delete _arg_1.data;
            _core.player.petList[_arg_1.id] = _arg_1;
            _core.sysBlueMsg(((((((((Language.PETMANAGERPANEL_S[10] + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_PET]) + "|") + _arg_1.id) + "|") + _arg_1.creatureData.name) + "|") + _core.basic.colorByGrowRate(_arg_1.growRate)) + "|0|0]"));
            updateView();
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_PET_SOUL);
            if (_local_2)
            {
                _local_2.updatePetList();
            };
        }

        [Bindable(event="propertyChange")]
        public function get critical():BoxLabel
        {
            return (this._1952151455critical);
        }

        [Bindable(event="propertyChange")]
        public function get finalDefy():TextInput
        {
            return (this._354781098finalDefy);
        }

        public function set dodge(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._95758295dodge;
            if (_local_2 !== _arg_1)
            {
                this._95758295dodge = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dodge", _local_2, _arg_1));
            };
        }

        public function __skill1_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        public function __btn4_click(_arg_1:MouseEvent):void
        {
            changeNameClick();
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(1);
        }

        private function set styleAddName(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._177868763styleAddName;
            if (_local_2 !== _arg_1)
            {
                this._177868763styleAddName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "styleAddName", _local_2, _arg_1));
            };
        }

        public function nextGuide():void
        {
        }

        public function __skill2_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function set simplecanvas2(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1002706920simplecanvas2;
            if (_local_2 !== _arg_1)
            {
                this._1002706920simplecanvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simplecanvas2", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878252basichortxtbutton1;
            if (_local_2 !== _arg_1)
            {
                this._861878252basichortxtbutton1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton1", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878253basichortxtbutton2;
            if (_local_2 !== _arg_1)
            {
                this._861878253basichortxtbutton2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton2", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton3(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878254basichortxtbutton3;
            if (_local_2 !== _arg_1)
            {
                this._861878254basichortxtbutton3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton3", _local_2, _arg_1));
            };
        }

        public function set basichortxtbutton4(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878255basichortxtbutton4;
            if (_local_2 !== _arg_1)
            {
                this._861878255basichortxtbutton4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton4", _local_2, _arg_1));
            };
        }

        private function changePetFollow():void
        {
            var _local_1:Number;
            if (showPetFollowBtn.enabled)
            {
                _local_1 = petDataList.selectedItem.petData.id;
                if (_local_1 != _core.getShowPetId())
                {
                    startPetFollow();
                }
                else
                {
                    cancelPetFollow();
                };
                showPetFollowBtn.enabled = false;
                showPetTimer = new Timer(5000, 1);
                showPetTimer.addEventListener(TimerEvent.TIMER, showPetFollowBtnReset);
                showPetTimer.start();
            };
        }

        public function set basichortxtbutton6(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878257basichortxtbutton6;
            if (_local_2 !== _arg_1)
            {
                this._861878257basichortxtbutton6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dodge():BoxLabel
        {
            return (this._95758295dodge);
        }

        public function set basichortxtbutton5(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._861878256basichortxtbutton5;
            if (_local_2 !== _arg_1)
            {
                this._861878256basichortxtbutton5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basichortxtbutton5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get simplecanvas2():SimpleCanvas
        {
            return (this._1002706920simplecanvas2);
        }

        public function __showPetFollowBtn_click(_arg_1:MouseEvent):void
        {
            changePetFollow();
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton2():BasicTxtButton
        {
            return (this._861878253basichortxtbutton2);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton3():BasicTxtButton
        {
            return (this._861878254basichortxtbutton3);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton4():BasicTxtButton
        {
            return (this._861878255basichortxtbutton4);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton5():BasicTxtButton
        {
            return (this._861878256basichortxtbutton5);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton6():BasicTxtButton
        {
            return (this._861878257basichortxtbutton6);
        }

        [Bindable(event="propertyChange")]
        public function get basichortxtbutton1():BasicTxtButton
        {
            return (this._861878252basichortxtbutton1);
        }

        public function set simplecanvas3(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1002706921simplecanvas3;
            if (_local_2 !== _arg_1)
            {
                this._1002706921simplecanvas3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simplecanvas3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get simplecanvas3():SimpleCanvas
        {
            return (this._1002706921simplecanvas3);
        }

        public function set minusStaminaButton(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1889342449minusStaminaButton;
            if (_local_2 !== _arg_1)
            {
                this._1889342449minusStaminaButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minusStaminaButton", _local_2, _arg_1));
            };
        }

        private function startPetFollowHandler(_arg_1:Object):void
        {
            if (_arg_1)
            {
                _core.setShowPetId(followPetIdCheck);
                switchFollowButton(true);
            };
        }

        public function __upBtn5_click(_arg_1:MouseEvent):void
        {
            upSkill(5);
        }

        private function set xiebieshaidp(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._345262067xiebieshaidp;
            if (_local_2 !== _arg_1)
            {
                this._345262067xiebieshaidp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xiebieshaidp", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

