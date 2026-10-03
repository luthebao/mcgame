// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CharactorPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.StarIcon;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Image;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.controls.Button;
    import mx.controls.CheckBox;
    import mx.core.UIComponent;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.TextArea;
    import mx.containers.ViewStack;
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import com.qeedoo.game.utils.TimeUtil;
    import flash.net.Responder;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.utils.LanguageUtil;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.ItemConfig;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.event.GameEvent;
    import com.adobe.crypto.MD5;
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

    public class CharactorPanel extends DragableCanvas implements IBindingClient 
    {

        private static var firstLoad:Boolean = true;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109757473star3:StarIcon;
        private var _3119057eq16:ItemSlot;
        private var _1420795392addIntelligence:RoundedLabel;
        private var _1205539178infoClass:BoxLabel;
        private var _699206467PopLabel:BasicTxtButton;
        private var _10433186vigorTxt7:BoxLabel;
        private var _177868763styleAddName:String;
        private var _787926635btnPosToolTip:String;
        private var _1649711042actpoint:BoxLabel;
        private var _3119056eq15:ItemSlot;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _109757474star4:StarIcon;
        private var _1155663430lb_sLevel:RoundedLabel;
        private var _104387img:Image;
        private var _1328020574MWCanvas:Canvas;
        private var LAST_PLAYER_ID:int = -1;
        private var _123813654mountImg:Image;
        private var _100613eq1:ItemSlot;
        private var _1061902657mwSub5:ItemSlot;
        private var _19957965addBtnCanvas:SimpleCanvas;
        private var _1378810356btn_js:BasicGlowButton;
        private var _3119055eq14:ItemSlot;
        private var _1864769379minusStrengthButton:Button;
        private var _817036290addStrength:RoundedLabel;
        private var _1113783315wingHide:CheckBox;
        private var _850872420addAgility:RoundedLabel;
        private var _1271911908iconImage02:Image;
        private var _109757475star5:StarIcon;
        private var _323428904vigorTxt10:BoxLabel;
        private var _694777522img_star:Image;
        private var _708846363addEnergyButton:Button;
        private var _1952151455critical:BoxLabel;
        private var _1180791939GXLabel:BasicTxtButton;
        private var _1662853568elemUIC:UIComponent;
        private var _10433187vigorTxt6:BoxLabel;
        private var _3119054eq13:ItemSlot;
        private var _1246589433vigorTxt:BoxLabel;
        private var _100615eq3:ItemSlot;
        private var _1099375777infoRebirthExp:BoxLabel;
        public var hasMount:int = -1;
        private var _892485646star11:StarIcon;
        private var _3491mp:BoxLabel;
        private var _1863068566minusEnergyButton:Button;
        private var _109757476star6:StarIcon;
        private var _652133081XGCanvas:Canvas;
        private var _1365556561levelUpButton:BasicGlowButton;
        private var _97632477mDefence:BoxLabel;
        private var _189045043chivalTxt:BoxLabel;
        private var _1378824616btnPos:BasicDelayButton;
        private var _3119053eq12:ItemSlot;
        private var _1275572471chivalLabel:BasicTxtButton;
        private var _3336hp:BoxLabel;
        private var _1271911911iconImage05:Image;
        public var _CharactorPanel_BasicTxtButton10:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton11:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton12:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton13:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton14:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton15:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton16:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton17:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton18:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton19:BasicTxtButton;
        private var _1271911939iconImage12:Image;
        private var _95758295dodge:BoxLabel;
        private var _1061902661mwSub1:ItemSlot;
        private var _2033231541starLvUping:Boolean = false;
        public var _CharactorPanel_BasicTxtButton20:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton21:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton22:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton23:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton24:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton25:BasicTxtButton;
        private var _1271911914iconImage08:Image;
        private var _1577469134lb_leftSecDesc:RoundedLabel;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _100617eq5:ItemSlot;
        private var _1109587368lb_add:RoundedLabel;
        public var _CharactorPanel_Image14:Image;
        private var _14326624addStaminaButton:Button;
        private var _109757477star7:StarIcon;
        private var _557678129showDetailProp:BasicGlowButton;
        private var _3119052eq11:ItemSlot;
        private var _10433188vigorTxt5:BoxLabel;
        private var _1062100349mwMain:ItemSlot;
        private var _426146348addStrengthButton:Button;
        private var _94069048btnOK:BasicDelayButton;
        private var _30739193attLastPoint:BoxLabel;
        private var _3119051eq10:ItemSlot;
        private var _100619eq7:ItemSlot;
        private var _1555913437ta_desc:TextArea;
        private var _1542401647decoBtn:BasicGlowButton;
        private var _109757478star8:StarIcon;
        private var _100620eq8:ItemSlot;
        private var _1270522743attEnergy:BoxLabel;
        private var _1628156161lb_leftSec:RoundedLabel;
        public var _CharactorPanel_Canvas2:Canvas;
        public var _CharactorPanel_Canvas3:Canvas;
        private var _508557257mWRepairButton:BasicGlowButton;
        private var _1023416178attStamina:BoxLabel;
        private var _1378810134btn_qx:BasicGlowButton;
        private var _106755206pmImg:Image;
        private var _1378810086btn_sj:BasicGlowButton;
        private var _206211513PKLabel:BasicTxtButton;
        public var _CharactorPanel_BasicGlowButton1:BasicGlowButton;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _10433189vigorTxt4:BoxLabel;
        private var _206036743btnName:BasicGlowButton;
        private var _1378809934btn_xg:BasicGlowButton;
        private var _109757479star9:StarIcon;
        private var _323428902vigorTxt12:BoxLabel;
        private var _1271911907iconImage01:Image;
        private var _selectStarType:int;
        private var _1221167690infoTitle:BoxLabel;
        private var _103315hit:BoxLabel;
        private var _1061902658mwSub4:ItemSlot;
        private var detailPanel:* = null;
        public var _CharactorPanel_BasicGlowButton12:BasicGlowButton;
        public var _CharactorPanel_BasicGlowButton13:BasicGlowButton;
        private var _10433190vigorTxt3:BoxLabel;
        private var _111185pop:BoxLabel;
        private var _114581tab:ViewStack;
        private var _106706549pkTxt:BoxLabel;
        private var _177753177infoName:BoxLabel;
        private var _10889870addStamina:RoundedLabel;
        private var tempPropMultiple:int = 0;
        private var _37085260lb_name:RoundedLabel;
        private var _459185494actpointLabel:BasicTxtButton;
        private var _1940048781propertyCanvas:Canvas;
        private var _1271911910iconImage04:Image;
        private var _1271911938iconImage11:Image;
        private var _892485647star10:StarIcon;
        private var _1271911913iconImage07:Image;
        private var _1606233953minusIntelligenceButton:Button;
        private var _74771179mAttack:BoxLabel;
        private var _100614eq2:ItemSlot;
        private var _808946632makerActiveInfo:TextArea;
        private var _331517891vigorLabel:BasicTxtButton;
        private var _695539687dressHide:CheckBox;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _10433191vigorTxt2:BoxLabel;
        private var mc:MovieClip;
        private var maskMc:MovieClip;
        private var _1991903918addIntelligenceButton:Button;
        private var _279478090addAgilityButton:Button;
        private var _100616eq4:ItemSlot;
        private var _1544916048defence:BoxLabel;
        private var maxMc:MovieClip;
        private var _10433184vigorTxt9:BoxLabel;
        private var _interval:Number;
        private var firstFlag:Boolean = true;
        public var _CharactorPanel_BasicTxtButton1:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton2:BasicTxtButton;
        public var _CharactorPanel_BasicTxtButton3:BasicTxtButton;
        private var _1595537735minusAgilityButton:Button;
        private var _1319279616attIntelligence:BoxLabel;
        private var _892485645star12:StarIcon;
        private var _405874039addEnergy:RoundedLabel;
        private var _323428903vigorTxt11:BoxLabel;
        private var _104729418ngImg:Image;
        private var _starTimer:Timer;
        private var _1271911909iconImage03:Image;
        private var _10433192vigorTxt1:BoxLabel;
        public var firstTimeFlag:Boolean = true;
        private var _283222949lb_addition:RoundedLabel;
        private var PropMultiple:int = 1;
        private var _100618eq6:ItemSlot;
        private var _1295447866starActiveInfo:TextArea;
        public var _CharactorPanel_RoundedLabel1:RoundedLabel;
        private var _109757471star1:StarIcon;
        private var _1181680126attStrength:BoxLabel;
        private var _1554141555tabBtn4:BasicGlowButton;
        private var _721177480imgCanva:Canvas;
        private var _1378810059btn_tf:BasicGlowButton;
        private var _1061902660mwSub2:ItemSlot;
        private var _108274547rbImg:Image;
        private var _109641799speed:BoxLabel;
        public var _CharactorPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var changeFlag:String = "☆";
        private var _10433185vigorTxt8:BoxLabel;
        private var _1889342449minusStaminaButton:Button;
        private var _109757472star2:StarIcon;
        private var _lvUpStarType:int;
        private var _1061902659mwSub3:ItemSlot;
        private var _183433628attAgility:BoxLabel;
        private var _1965289807MountCanvas:Canvas;
        private var _1271911937iconImage10:Image;
        private var _1271911912iconImage06:Image;
        private var _100621eq9:ItemSlot;
        private var _1271911915iconImage09:Image;
        private var _2097958236btnTitle:BasicGlowButton;
        public var _CharactorPanel_Image1:Image;
        private var _727902236AddPropCheck:CheckBox;
        private var _1213662070infoLevel:BoxLabel;
        private var _844311679spirituality:Label;
        private var _1407259064attack:BoxLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":315,
                    "height":460,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_CharactorPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":295,
                                "height":417,
                                "horizontalScrollPolicy":"off",
                                "x":10,
                                "y":37,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"tab",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":385,
                                            "tabEnabled":false,
                                            "styleName":"TabNavPlayer",
                                            "width":285,
                                            "x":5,
                                            "y":22,
                                            "creationPolicy":"all",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_CharactorPanel_Canvas2",
                                                "events":{"show":"___CharactorPanel_Canvas2_show"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_CharactorPanel_Image1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":10,
                                                                    "width":192,
                                                                    "height":191
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":UIComponent,
                                                            "id":"elemUIC",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "y":16,
                                                                    "width":80,
                                                                    "height":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":1,
                                                                    "y":10,
                                                                    "slotType":4,
                                                                    "x":11,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":2,
                                                                    "y":82,
                                                                    "x":11,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":3,
                                                                    "x":57,
                                                                    "y":119,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":4,
                                                                    "y":46,
                                                                    "slotType":4,
                                                                    "x":11,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":5,
                                                                    "y":120,
                                                                    "slotType":4,
                                                                    "x":11,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":6,
                                                                    "x":11,
                                                                    "y":156,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":7,
                                                                    "y":119,
                                                                    "slotType":4,
                                                                    "x":187,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":8,
                                                                    "y":10,
                                                                    "slotType":4,
                                                                    "x":232,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":9,
                                                                    "y":82,
                                                                    "slotType":4,
                                                                    "x":232,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":10,
                                                                    "y":46,
                                                                    "slotType":4,
                                                                    "x":232,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":11,
                                                                    "y":155,
                                                                    "slotType":4,
                                                                    "x":232,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":12,
                                                                    "y":119,
                                                                    "slotType":4,
                                                                    "x":232,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":13,
                                                                    "y":156,
                                                                    "slotType":4,
                                                                    "x":187,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":14,
                                                                    "y":156,
                                                                    "slotType":4,
                                                                    "x":57,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":21,
                                                                    "x":57,
                                                                    "y":83,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"eq16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":22,
                                                                    "x":187,
                                                                    "y":82,
                                                                    "slotType":4,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"dressHide",
                                                            "events":{"click":"__dressHide_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":90,
                                                                    "y":81
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"wingHide",
                                                            "events":{"click":"__wingHide_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":174,
                                                                    "y":81
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"makerActiveInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selectable":false,
                                                                    "x":46,
                                                                    "y":13,
                                                                    "width":68,
                                                                    "height":60,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"starActiveInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selectable":false,
                                                                    "x":163,
                                                                    "y":13,
                                                                    "width":68,
                                                                    "height":60,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_CharactorPanel_BasicGlowButton1",
                                                            "events":{"click":"___CharactorPanel_BasicGlowButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-30";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"decoBtn",
                                                            "events":{"click":"__decoBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "20";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "y":175,
                                                                    "visible":true
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_CharactorPanel_Canvas3",
                                                "events":{"show":"___CharactorPanel_Canvas3_show"},
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
                                                                    "x":169,
                                                                    "y":10,
                                                                    "width":98,
                                                                    "height":216,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"infoName",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":0,
                                                                                "width":94.5,
                                                                                "text":"ss名称",
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"infoClass",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":22,
                                                                                "width":93.5,
                                                                                "text":"ss职业",
                                                                                "height":18,
                                                                                "x":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"infoLevel",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":44,
                                                                                "width":50,
                                                                                "text":"ss等级",
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"infoRebirthExp",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":88,
                                                                                "text":"战绩",
                                                                                "width":94.5,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"pkTxt",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":110,
                                                                                "text":"ssPK",
                                                                                "width":94.5,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"pop",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":132,
                                                                                "text":"ss人气",
                                                                                "width":94.5,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"chivalTxt",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":154,
                                                                                "text":"ss荣誉",
                                                                                "width":94.5,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"actpoint",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":176,
                                                                                "text":"ss活力",
                                                                                "width":94.5,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"vigorTxt",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":198,
                                                                                "text":"ss精力",
                                                                                "width":94.5,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BoxLabel,
                                                                        "id":"infoTitle",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":66,
                                                                                "width":94.5,
                                                                                "text":"",
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"levelUpButton",
                                                                        "events":{"click":"__levelUpButton_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":43,
                                                                                "styleName":"BtnNormalRed",
                                                                                "width":38,
                                                                                "height":18,
                                                                                "x":55.5
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btnTitle",
                                                            "events":{"click":"__btnTitle_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":125,
                                                                    "y":76,
                                                                    "styleName":"BtnNormalRed",
                                                                    "buttonMode":true,
                                                                    "useHandCursor":true,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_CharactorPanel_BasicTxtButton1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":125,
                                                                    "y":10,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btnName",
                                                            "events":{"click":"__btnName_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":125,
                                                                    "y":10,
                                                                    "styleName":"BtnNormalRed",
                                                                    "width":38,
                                                                    "height":18,
                                                                    "buttonMode":true,
                                                                    "useHandCursor":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_CharactorPanel_BasicTxtButton2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":125,
                                                                    "y":32,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_CharactorPanel_BasicTxtButton3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":125,
                                                                    "y":54,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"GXLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":125,
                                                                    "y":98,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"PKLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":125,
                                                                    "y":120,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"PopLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                                this.textAlign = "right";
                                                                this.right = "122";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":142,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"chivalLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                                this.right = "122";
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":164,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"actpointLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                                this.right = "122";
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":186,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"vigorLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                                this.right = "122";
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":208,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38.5,
                                                                    "y":231,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38.5,
                                                                    "y":0x0100,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38.5,
                                                                    "y":282,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38.5,
                                                                    "y":307,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38.5,
                                                                    "y":333,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38.5,
                                                                    "y":357,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":231,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":0x0100,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":282,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":307,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":333,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"vigorTxt12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":357,
                                                                    "width":94.5,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage01",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":229,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage02",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":254,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage03",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":280,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage04",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":306,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage05",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":331,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage06",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":356,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage07",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":141,
                                                                    "y":229,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage08",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":141,
                                                                    "y":0xFF,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage09",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":141,
                                                                    "y":280,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":141,
                                                                    "y":306,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":141,
                                                                    "y":331,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"iconImage12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":141,
                                                                    "y":356,
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"MWCanvas",
                                                "events":{"show":"__MWCanvas_show"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_CharactorPanel_Image14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":5,
                                                                    "width":188,
                                                                    "height":189
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"mwMain",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":15,
                                                                    "y":84,
                                                                    "slotType":4,
                                                                    "x":126.5,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"mwSub1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":16,
                                                                    "y":22,
                                                                    "slotType":4,
                                                                    "x":80,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"mwSub2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":17,
                                                                    "y":22,
                                                                    "slotType":4,
                                                                    "x":170,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"mwSub3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":18,
                                                                    "y":107,
                                                                    "slotType":4,
                                                                    "x":197,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"mwSub4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":19,
                                                                    "y":157,
                                                                    "slotType":4,
                                                                    "x":126,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"mwSub5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "index":20,
                                                                    "y":107,
                                                                    "slotType":4,
                                                                    "x":59,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"spirituality",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 3591381;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":17,
                                                                    "y":172,
                                                                    "width":103,
                                                                    "text":"123456",
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"mWRepairButton",
                                                            "events":{"click":"__mWRepairButton_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.paddingBottom = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":50,
                                                                    "y":165
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"XGCanvas",
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
                                                            "id":"imgCanva",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_star",
                                                            "events":{
                                                                "click":"__img_star_click",
                                                                "mouseOver":"__img_star_mouseOver",
                                                                "mouseOut":"__img_star_mouseOut"
                                                            },
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "-50";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "0";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":285,
                                                                    "width":285,
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star1",
                                                                        "events":{"click":"__star1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "72";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":205,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star2",
                                                                        "events":{"click":"__star2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "26";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":232,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star3",
                                                                        "events":{"click":"__star3_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-25";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":232,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":3
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star4",
                                                                        "events":{"click":"__star4_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-69";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":208,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":4
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star5",
                                                                        "events":{"click":"__star5_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-98";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":160,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":5
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star6",
                                                                        "events":{"click":"__star6_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-100";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":109,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":6
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star7",
                                                                        "events":{"click":"__star7_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-73";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":61,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":7
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star8",
                                                                        "events":{"click":"__star8_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-25";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":36,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":8
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star9",
                                                                        "events":{"click":"__star9_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "27";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":36,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":9
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star10",
                                                                        "events":{"click":"__star10_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "73";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":62,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":10
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star11",
                                                                        "events":{"click":"__star11_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "98";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":109,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":11
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":StarIcon,
                                                                        "id":"star12",
                                                                        "events":{"click":"__star12_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "98";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":161,
                                                                                "width":18,
                                                                                "height":18,
                                                                                "stype":12
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"_CharactorPanel_RoundedLabel1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":18,
                                                                                "width":65,
                                                                                "x":195,
                                                                                "y":10
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"lb_sLevel",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFF00;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0x0100,
                                                                                "y":10
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lb_name",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.bottom = "75";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"ta_desc",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.bottom = "10";
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.color = 16774324;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":195,
                                                                    "height":60,
                                                                    "mouseEnabled":false,
                                                                    "editable":false,
                                                                    "enabled":true,
                                                                    "selectable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lb_add",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "80";
                                                                this.bottom = "63";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"height":18});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lb_addition",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "165";
                                                                this.bottom = "63";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"height":18});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btn_js",
                                                            "events":{"click":"__btn_js_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.paddingTop = 1;
                                                                this.bottom = "100";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalYellowButton",
                                                                    "labelPlacement":"bottom",
                                                                    "width":65,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btn_sj",
                                                            "events":{"click":"__btn_sj_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.paddingTop = 1;
                                                                this.bottom = "66";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalYellowButton",
                                                                    "labelPlacement":"bottom",
                                                                    "width":65,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btn_qx",
                                                            "events":{"click":"__btn_qx_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.paddingTop = 1;
                                                                this.bottom = "66";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalYellowButton",
                                                                    "labelPlacement":"bottom",
                                                                    "width":65,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btn_tf",
                                                            "events":{"click":"__btn_tf_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.paddingTop = 1;
                                                                this.bottom = "38";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalYellowButton",
                                                                    "labelPlacement":"bottom",
                                                                    "width":65,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btn_xg",
                                                            "events":{"click":"__btn_xg_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.paddingTop = 1;
                                                                this.bottom = "10";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CrystalYellowButton",
                                                                    "labelPlacement":"bottom",
                                                                    "width":65,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lb_leftSec",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.bottom = "100";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"lb_leftSecDesc",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "83";
                                                                this.bottom = "100";
                                                                this.color = 0xFF00;
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_CharactorPanel_BasicGlowButton12",
                                                            "events":{"click":"___CharactorPanel_BasicGlowButton12_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "y":132
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"MountCanvas",
                                                "events":{"show":"__MountCanvas_show"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"mountImg",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "40";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":180,
                                                                    "width":180,
                                                                    "y":10,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_CharactorPanel_BasicGlowButton13",
                                                            "events":{"click":"___CharactorPanel_BasicGlowButton13_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                                this.paddingBottom = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":50,
                                                                    "y":165
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
                                    "id":"propertyCanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":181,
                                            "y":204,
                                            "width":275,
                                            "x":5,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":8,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton11",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":30,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton12",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":50,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton13",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":72,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton14",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":95,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton15",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":117,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton16",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":139,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton17",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":159,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton18",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.2,
                                                        "y":8,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton19",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.2,
                                                        "y":30,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton20",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.2,
                                                        "y":52,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton21",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.2,
                                                        "y":73,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton22",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.2,
                                                        "y":95,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton23",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.2,
                                                        "y":117,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton24",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.2,
                                                        "y":139,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorPanel_BasicTxtButton25",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.2,
                                                        "y":159,
                                                        "width":37,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attStrength",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37,
                                                        "y":52,
                                                        "width":60.5,
                                                        "text":"1234",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attAgility",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37,
                                                        "y":95,
                                                        "width":60.433334,
                                                        "text":"1234",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attStamina",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37,
                                                        "y":72.95,
                                                        "width":60,
                                                        "text":"1234",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attIntelligence",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37.1,
                                                        "y":117,
                                                        "width":60.4,
                                                        "text":"1234",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attEnergy",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37.1,
                                                        "y":139,
                                                        "width":60.4,
                                                        "text":"1234",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"hp",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":36,
                                                        "y":8,
                                                        "width":104,
                                                        "text":"123456/123456",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"mp",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37,
                                                        "y":30,
                                                        "width":103,
                                                        "text":"123456/123456",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SimpleCanvas,
                                                "id":"addBtnCanvas",
                                                "stylesFactory":function ():void
                                                {
                                                    this.disabledOverlayAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":71.1,
                                                        "y":49,
                                                        "width":76.1,
                                                        "height":130,
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
                                                                    "x":29.95,
                                                                    "y":2
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
                                                                    "x":29.95,
                                                                    "y":46
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
                                                                    "x":29.95,
                                                                    "y":24
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
                                                                    "x":29.9,
                                                                    "y":67
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
                                                                    "x":29.9,
                                                                    "y":88
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
                                                                    "x":52.7,
                                                                    "y":2,
                                                                    "styleName":"BtnReduce2"
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
                                                                    "x":52.7,
                                                                    "y":46,
                                                                    "styleName":"BtnReduce2"
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
                                                                    "x":52.7,
                                                                    "y":23.95,
                                                                    "styleName":"BtnReduce2"
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
                                                                    "x":52.7,
                                                                    "y":68,
                                                                    "styleName":"BtnReduce2"
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
                                                                    "x":52.7,
                                                                    "y":88,
                                                                    "styleName":"BtnReduce2"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"addStrength",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0.95,
                                                                    "y":3,
                                                                    "width":19,
                                                                    "text":"99",
                                                                    "styleName":"LabelPropertyText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"addAgility",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":1,
                                                                    "y":46,
                                                                    "width":19,
                                                                    "text":"99",
                                                                    "styleName":"LabelPropertyText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"addStamina",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":1,
                                                                    "y":24,
                                                                    "width":19,
                                                                    "text":"99",
                                                                    "styleName":"LabelPropertyText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"addIntelligence",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0.95,
                                                                    "y":68,
                                                                    "width":19,
                                                                    "text":"99",
                                                                    "styleName":"LabelPropertyText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"addEnergy",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0.95,
                                                                    "y":90,
                                                                    "width":19,
                                                                    "text":"99",
                                                                    "styleName":"LabelPropertyText"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"AddPropCheck",
                                                            "events":{"change":"__AddPropCheck_change"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":110,
                                                                    "width":18,
                                                                    "height":18
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
                                                                    "x":12,
                                                                    "y":110,
                                                                    "width":32,
                                                                    "height":20,
                                                                    "label":"*10"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"btnOK",
                                                            "events":{"click":"__btnOK_click"},
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
                                                                    "y":110,
                                                                    "height":19,
                                                                    "width":40,
                                                                    "x":32.85,
                                                                    "styleName":"BtnNormalRed"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attack",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":191,
                                                        "y":8,
                                                        "text":"123456",
                                                        "width":66,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"mAttack",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":191,
                                                        "y":30,
                                                        "text":"123456",
                                                        "width":66,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"defence",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":191,
                                                        "y":52,
                                                        "text":"123456",
                                                        "width":66,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"mDefence",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":191,
                                                        "y":73,
                                                        "text":"123456",
                                                        "width":66,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"hit",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":191,
                                                        "y":96,
                                                        "width":66,
                                                        "text":"123456",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"dodge",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":191,
                                                        "y":117,
                                                        "width":66,
                                                        "text":"123456",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"critical",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":191,
                                                        "y":160,
                                                        "text":"123456",
                                                        "width":66,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"speed",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":191,
                                                        "y":139,
                                                        "width":66,
                                                        "text":"123456",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"attLastPoint",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37.1,
                                                        "y":160,
                                                        "width":35,
                                                        "text":"12345",
                                                        "height":18
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "y":3,
                                            "width":45,
                                            "styleName":"HorizontalTab",
                                            "height":20,
                                            "selected":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":61,
                                            "y":3,
                                            "width":45,
                                            "styleName":"HorizontalTab",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":155,
                                            "y":3,
                                            "width":45,
                                            "styleName":"HorizontalTab",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":108,
                                            "y":3,
                                            "width":45,
                                            "styleName":"HorizontalTab",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn4",
                                    "events":{"click":"__tabBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":203,
                                            "y":3,
                                            "width":45,
                                            "styleName":"HorizontalTab",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"btnPos",
                                    "events":{"click":"__btnPos_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":250,
                                            "y":1,
                                            "styleName":"BtnBatPos",
                                            "width":55,
                                            "height":19
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "stylesFactory":function ():void
                        {
                            this.left = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":230,
                                "width":150,
                                "y":60,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"pmImg",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":20,
                                "width":25,
                                "y":60,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ngImg",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":25,
                                "width":25,
                                "y":85,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"rbImg",
                        "events":{"click":"__rbImg_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "100";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":45,
                                "width":40,
                                "y":60,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"showDetailProp",
                        "events":{"click":"__showDetailProp_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":303,
                                "y":147,
                                "height":155,
                                "width":12,
                                "styleName":"EquipBagRight"
                            });
                        }
                    })]
                });
            }
        });
        private var _90794110_core:Core = Core.getInstance();
        private var element:Class = CharactorPanel_element;
        private var newGradeLevel:Array = ["", "Nhập Môn", "Bậc Thầy", "Siêu Phàm"];
        private var newGradeLevelInfo:Array = ["", "+10000HP", "+10000HP,+3000Phòng", "+10000HP,+3000Công,+3000Phòng,+100Tốc"];
        private var _dm:DataManager = DataManager.getInstance();
        private var chivalArr:Array = [0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 3, 4, 4, 5, 6, 7, 9, 10, 11, 13, 14, 16, 18, 20, 22, 25, 27, 30, 32, 35, 38, 41, 45, 48, 52, 56, 59, 64, 68, 72];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CharactorPanel()
        {
            mx_internal::_document = this;
            this.width = 315;
            this.height = 460;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CharactorPanel._watcherSetupUtil = _arg_1;
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

        public function __btn_sj_click(_arg_1:MouseEvent):void
        {
            beginStarLvUp();
        }

        public function set addStrength(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._817036290addStrength;
            if (_local_2 !== _arg_1)
            {
                this._817036290addStrength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStrength", _local_2, _arg_1));
            };
        }

        public function set wingHide(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._1113783315wingHide;
            if (_local_2 !== _arg_1)
            {
                this._1113783315wingHide = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingHide", _local_2, _arg_1));
            };
        }

        public function __star3_click(_arg_1:MouseEvent):void
        {
            clickStar(3);
        }

        [Bindable(event="propertyChange")]
        public function get dressHide():CheckBox
        {
            return (this._695539687dressHide);
        }

        public function ___CharactorPanel_Canvas3_show(_arg_1:FlexEvent):void
        {
            updateProperty();
        }

        public function __minusStaminaButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function set dressHide(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._695539687dressHide;
            if (_local_2 !== _arg_1)
            {
                this._695539687dressHide = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dressHide", _local_2, _arg_1));
            };
        }

        private function setBattlePos():void
        {
            btnPos.selected = (!(btnPos.selected));
            if (btnPos.selected)
            {
                btnPos.label = Language.CHARACTORPANEL_U[6];
            }
            else
            {
                btnPos.label = Language.CHARACTORPANEL_U[5];
            };
            _core.remote.setBp(btnPos.selected);
            _core.player.bp = int(btnPos.selected);
        }

        [Bindable(event="propertyChange")]
        public function get vigorLabel():BasicTxtButton
        {
            return (this._331517891vigorLabel);
        }

        [Bindable(event="propertyChange")]
        public function get actpoint():BoxLabel
        {
            return (this._1649711042actpoint);
        }

        public function set star2(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757472star2;
            if (_local_2 !== _arg_1)
            {
                this._109757472star2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star2", _local_2, _arg_1));
            };
        }

        public function set star3(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757473star3;
            if (_local_2 !== _arg_1)
            {
                this._109757473star3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star3", _local_2, _arg_1));
            };
        }

        public function set star4(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757474star4;
            if (_local_2 !== _arg_1)
            {
                this._109757474star4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star4", _local_2, _arg_1));
            };
        }

        public function set star1(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757471star1;
            if (_local_2 !== _arg_1)
            {
                this._109757471star1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star1", _local_2, _arg_1));
            };
        }

        public function set star5(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757475star5;
            if (_local_2 !== _arg_1)
            {
                this._109757475star5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star5", _local_2, _arg_1));
            };
        }

        public function set star6(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757476star6;
            if (_local_2 !== _arg_1)
            {
                this._109757476star6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star6", _local_2, _arg_1));
            };
        }

        public function set star8(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757478star8;
            if (_local_2 !== _arg_1)
            {
                this._109757478star8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star8", _local_2, _arg_1));
            };
        }

        public function __star8_click(_arg_1:MouseEvent):void
        {
            clickStar(8);
        }

        public function set star7(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757477star7;
            if (_local_2 !== _arg_1)
            {
                this._109757477star7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star7", _local_2, _arg_1));
            };
        }

        public function resetStars():void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (((_starTimer) && (_starTimer.running)))
            {
                _starTimer.stop();
                _starTimer = null;
            };
            starLvUping = false;
            _lvUpStarType = -1;
            _interval = 0;
            lb_sLevel.text = "";
            lb_addition.text = "";
            lb_leftSecDesc.text = "";
            lb_name.text = "";
            ta_desc.text = "";
            lb_add.text = "";
            var _local_1:Object = _core.data.gameDataIndex2[GamePredef.TBL_STARS_TEMPLATE][1];
            for each (_local_2 in _local_1)
            {
                _local_3 = new Object();
                _local_3.currentId = 0;
                _local_3.finishDate = -1;
                _local_3.nextId = _local_2.id;
                this[("star" + _local_2.type)].setData(_local_3);
                this[("star" + _local_2.type)].stopEffect();
            };
        }

        public function set star9(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._109757479star9;
            if (_local_2 !== _arg_1)
            {
                this._109757479star9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get speed():BoxLabel
        {
            return (this._109641799speed);
        }

        [Bindable(event="propertyChange")]
        public function get addAgility():RoundedLabel
        {
            return (this._850872420addAgility);
        }

        public function set makerActiveInfo(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._808946632makerActiveInfo;
            if (_local_2 !== _arg_1)
            {
                this._808946632makerActiveInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makerActiveInfo", _local_2, _arg_1));
            };
        }

        public function set vigorLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._331517891vigorLabel;
            if (_local_2 !== _arg_1)
            {
                this._331517891vigorLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorLabel", _local_2, _arg_1));
            };
        }

        public function set actpoint(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1649711042actpoint;
            if (_local_2 !== _arg_1)
            {
                this._1649711042actpoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actpoint", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        public function __AddPropCheck_change(_arg_1:Event):void
        {
            if (AddPropCheck.selected)
            {
                PropMultiple = 10;
            }
            else
            {
                PropMultiple = 1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get attStamina():BoxLabel
        {
            return (this._1023416178attStamina);
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

        public function set infoName(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._177753177infoName;
            if (_local_2 !== _arg_1)
            {
                this._177753177infoName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addAgilityButton():Button
        {
            return (this._279478090addAgilityButton);
        }

        public function __btnPos_click(_arg_1:MouseEvent):void
        {
            setBattlePos();
        }

        [Bindable(event="propertyChange")]
        public function get starActiveInfo():TextArea
        {
            return (this._1295447866starActiveInfo);
        }

        public function set addAgility(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._850872420addAgility;
            if (_local_2 !== _arg_1)
            {
                this._850872420addAgility = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addAgility", _local_2, _arg_1));
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

        private function updateStarsData(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Number;
            var _local_2:int;
            for (_local_3 in _arg_1)
            {
                _local_5 = new Object();
                _local_5.currentId = _arg_1[_local_3].tid;
                _local_5.finishDate = _arg_1[_local_3].finishDate;
                _local_5.nextId = getNextStarId(_local_5.currentId, _local_3);
                this[("star" + _local_3)].setData(_local_5);
                if (_local_5.finishDate > 0)
                {
                    _local_7 = ((new Date().getTime() + _core.timeLag) - TimeUtil.timeOSOffSet);
                    if (_local_7 >= _local_5.finishDate)
                    {
                        _core.remote.call("finishStarLvUp", new Responder(onFinishStarLvUp), _local_3);
                    }
                    else
                    {
                        onBeginStarLvUp(_arg_1);
                    };
                };
                _local_6 = GameData.d[GamePredef.TBL_STARS_TEMPLATE][_local_5.currentId];
                if (_local_6)
                {
                    _local_2 = (_local_2 + parseInt(_local_6.level));
                };
            };
            lb_sLevel.text = _local_2.toString();
            _local_4 = 1;
            while (_local_4 <= 12)
            {
                this[("star" + _local_4)].checkLvUpCond(_local_2);
                _local_4++;
            };
            if (firstFlag)
            {
                clickStar(1);
                firstFlag = false;
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((_arg_1) && (firstTimeFlag)))
            {
                initView();
                firstTimeFlag = false;
            };
        }

        public function updateMount():void
        {
            var _local_3:*;
            var _local_4:String;
            var _local_5:Object;
            if (!this.initialized)
            {
                return;
            };
            if (((!(this.visible)) || (!(tab.selectedIndex == 4))))
            {
                return;
            };
            propertyCanvas.x = 20;
            propertyCanvas.y = 212;
            var _local_1:Boolean;
            var _local_2:Object = GameData.d[GamePredef.TBL_MOUNT_DRESS];
            for (_local_3 in _local_2)
            {
                if (((_local_2[_local_3]) && (Number(_local_2[_local_3]["resCode"]) == _core.player.mountResCode)))
                {
                    _local_4 = ResManager.hash(ResManager.getIconUrlNoHash(Number(_local_2[_local_3]["iconCode"])));
                    mountImg.source = _local_4;
                    _local_1 = true;
                    break;
                };
            };
            if (!_local_1)
            {
                _local_5 = GameData.d[GamePredef.TBL_MOUNT_DRESS][1];
                if (!_local_5)
                {
                    return;
                };
                _local_4 = ResManager.hash(ResManager.getIconUrlNoHash(Number(_local_5["iconCode"])));
                mountImg.source = _local_4;
            };
            mountImg.visible = true;
        }

        public function set imgCanva(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._721177480imgCanva;
            if (_local_2 !== _arg_1)
            {
                this._721177480imgCanva = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgCanva", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mountImg():Image
        {
            return (this._123813654mountImg);
        }

        [Bindable(event="propertyChange")]
        public function get chivalLabel():BasicTxtButton
        {
            return (this._1275572471chivalLabel);
        }

        [Bindable(event="propertyChange")]
        public function get lb_leftSec():RoundedLabel
        {
            return (this._1628156161lb_leftSec);
        }

        private function set _core(_arg_1:Core):void
        {
            var _local_2:Object;
            _local_2 = this._90794110_core;
            if (_local_2 !== _arg_1)
            {
                this._90794110_core = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_core", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get eq1():ItemSlot
        {
            return (this._100613eq1);
        }

        public function set GXLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1180791939GXLabel;
            if (_local_2 !== _arg_1)
            {
                this._1180791939GXLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "GXLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get eq3():ItemSlot
        {
            return (this._100615eq3);
        }

        [Bindable(event="propertyChange")]
        public function get eq5():ItemSlot
        {
            return (this._100617eq5);
        }

        [Bindable(event="propertyChange")]
        public function get eq6():ItemSlot
        {
            return (this._100618eq6);
        }

        public function __minusAgilityButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function set spirituality(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._844311679spirituality;
            if (_local_2 !== _arg_1)
            {
                this._844311679spirituality = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "spirituality", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get eq4():ItemSlot
        {
            return (this._100616eq4);
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

        private function dressHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_DRESS);
            ((_local_2) && (_local_2.show()));
        }

        [Bindable(event="propertyChange")]
        public function get eq9():ItemSlot
        {
            return (this._100621eq9);
        }

        [Bindable(event="propertyChange")]
        public function get eq8():ItemSlot
        {
            return (this._100620eq8);
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

        public function handleStarLvComplete(_arg_1:TimerEvent):void
        {
            var _local_2:int;
            _interval = 0;
            var _local_3:int = 1;
            while (_local_3 <= 12)
            {
                if (this[("star" + _local_3)].starData.finishDate > 0)
                {
                    _local_2 = _local_3;
                    break;
                };
                _local_3++;
            };
            _core.remote.call("finishStarLvUp", new Responder(onFinishStarLvUp), _local_2);
        }

        [Bindable(event="propertyChange")]
        public function get eq2():ItemSlot
        {
            return (this._100614eq2);
        }

        [Bindable(event="propertyChange")]
        public function get eq7():ItemSlot
        {
            return (this._100619eq7);
        }

        public function set pmImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._106755206pmImg;
            if (_local_2 !== _arg_1)
            {
                this._106755206pmImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pmImg", _local_2, _arg_1));
            };
        }

        private function setIconImagesSouce():void
        {
            var _local_1:String;
            var _local_2:String;
            iconImage01.source = ResManager.ICON_CURRENCY_BTPOINT;
            iconImage02.source = ResManager.ICON_CURRENCY_DOGMEDAL;
            iconImage03.source = ResManager.ICON_CURRENCY_ACHILLESMEDAL;
            iconImage04.source = ResManager.ICON_CURRENCY_BTPOINT;
            iconImage05.source = ResManager.ICON_MAGIC_SOULPNT;
            iconImage06.source = ResManager.ICON_PVP_DOGMEDAL;
            iconImage07.source = ResManager.ICON_BATTLE_EXP;
            iconImage08.source = ResManager.ICON_ELEMENT;
            iconImage09.source = ResManager.ICON_MAGIC_SOULPNT;
            iconImage10.source = ResManager.ICON_MAGIC_SOULPNT;
            iconImage11.source = ResManager.ICON_ELEMENT;
            iconImage12.source = ResManager.ICON_ELEMENT;
            if (_core.player.levelRe > 0)
            {
                this.rbImg.source = ResManager[("ICON_REBIRTH_" + _core.player.classId)];
                _local_1 = Language.PLAYER_RELEVEL_TITLE_U[_core.player.levelRe];
                _local_1 = ((_local_1) || (Language.PLAYER_RELEVEL_TITLE_U[Language.PLAYER_RELEVEL_TITLE_U.length]));
                _local_2 = GamePredef.PLAYER_RELEVEL_EXP[_core.player.levelRe];
                _local_2 = ((_local_2) || ("-"));
                rbImg.toolTip = LanguageUtil.replace(Language.CHARACTORPANEL_U[73], {
                    "military":_local_1,
                    "feats":_core.player.expRe,
                    "nextFeats":_local_2
                });
            }
            else
            {
                this.rbImg.visible = false;
            };
        }

        public function setDressHideCBSelected(_arg_1:Boolean):void
        {
            if (dressHide)
            {
                dressHide.selected = _arg_1;
            };
            GamePredef.GLOBAL_SETTING["dressHide"] = _arg_1;
        }

        private function showPropertyPanel():void
        {
            _core.view.hide(ViewManager.PANEL_CHARACTOR_HONOR);
            _core.view.changeVisible(ViewManager.PANEL_CHARACTOR_PROPERTY);
            _core.view.getUI(ViewManager.PANEL_CHARACTOR_PROPERTY).startFollow(this);
        }

        [Bindable(event="propertyChange")]
        public function get chivalTxt():BoxLabel
        {
            return (this._189045043chivalTxt);
        }

        [Bindable(event="propertyChange")]
        public function get minusAgilityButton():Button
        {
            return (this._1595537735minusAgilityButton);
        }

        public function __img_star_mouseOver(_arg_1:MouseEvent):void
        {
            img_star.filters = [GamePredef.FILTER_ALLOW_SELECTED];
        }

        private function initStars():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_1:Object = _core.data.gameDataIndex2[GamePredef.TBL_STARS_TEMPLATE][1];
            for each (_local_2 in _local_1)
            {
                _local_3 = new Object();
                _local_3.currentId = 0;
                _local_3.finishDate = -1;
                _local_3.nextId = _local_2.id;
                this[("star" + _local_2.type)].setData(_local_3);
            };
            ((_core.player) && (updateStarsData(_core.player.starsData)));
        }

        [Bindable(event="propertyChange")]
        private function get starLvUping():Boolean
        {
            return (this._2033231541starLvUping);
        }

        [Bindable(event="propertyChange")]
        public function get img_star():Image
        {
            return (this._694777522img_star);
        }

        [Bindable(event="propertyChange")]
        public function get btnOK():BasicDelayButton
        {
            return (this._94069048btnOK);
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

        [Bindable(event="propertyChange")]
        public function get infoClass():BoxLabel
        {
            return (this._1205539178infoClass);
        }

        public function __mWRepairButton_click(_arg_1:MouseEvent):void
        {
            magicWeaponRepair(_arg_1);
        }

        public function __btn_js_click(_arg_1:MouseEvent):void
        {
            speedUpStarLvUp();
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(4, 0, 1, 2, 3);
        }

        public function setSlot(_arg_1:Object):void
        {
            _dm.initSlotData(_arg_1);
        }

        public function __star1_click(_arg_1:MouseEvent):void
        {
            clickStar(1);
        }

        public function set starActiveInfo(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1295447866starActiveInfo;
            if (_local_2 !== _arg_1)
            {
                this._1295447866starActiveInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starActiveInfo", _local_2, _arg_1));
            };
        }

        public function onChangeName(_arg_1:String):void
        {
            var _local_2:String = _arg_1;
            if (_core.haveSpecialStr(_local_2))
            {
                Alert.show(Language.CHARACTORPANEL_S[11], "");
                return;
            };
            if (_core.haveSpecialStr2(_local_2))
            {
                Alert.show(Language.CHARSELECTCANVAS_S[19], "");
                return;
            };
            if (_core.haveBadWord(_local_2))
            {
                return;
            };
            _core.remote.changeNameFree(_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get PKLabel():BasicTxtButton
        {
            return (this._206211513PKLabel);
        }

        [Bindable(event="propertyChange")]
        public function get lb_sLevel():RoundedLabel
        {
            return (this._1155663430lb_sLevel);
        }

        private function updateProperty():void
        {
            propertyCanvas.x = 20;
            propertyCanvas.y = 162;
        }

        public function __star6_click(_arg_1:MouseEvent):void
        {
            clickStar(6);
        }

        public function updateLastPoint():void
        {
            if (!_core.player)
            {
                return;
            };
            if ((((_core.player.property) && (_core.player.property.lastPoint)) && (attLastPoint)))
            {
                attLastPoint.text = int(_core.player.property.lastPoint).toString();
            };
        }

        public function set mountImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._123813654mountImg;
            if (_local_2 !== _arg_1)
            {
                this._123813654mountImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountImg", _local_2, _arg_1));
            };
        }

        public function setDressHide():void
        {
            var _local_1:Boolean;
            if (dressHide)
            {
                _local_1 = dressHide.selected;
            }
            else
            {
                _local_1 = _core.view.getUI(ViewManager.PANEL_SYSTEM).getDressHideCB();
            };
            if (_local_1)
            {
                _core.remote.call("setDressHide", new Responder(onSetDressHide), true);
            }
            else
            {
                _core.remote.call("setDressHide", new Responder(onSetDressHide), false);
            };
        }

        public function __rbImg_click(_arg_1:MouseEvent):void
        {
            showRebirthDetail();
        }

        public function showRebirthDetail():void
        {
        }

        public function __showDetailProp_click(_arg_1:MouseEvent):void
        {
            changeDetailVis();
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt():BoxLabel
        {
            return (this._1246589433vigorTxt);
        }

        public function set chivalLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1275572471chivalLabel;
            if (_local_2 !== _arg_1)
            {
                this._1275572471chivalLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chivalLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get addIntelligence():RoundedLabel
        {
            return (this._1420795392addIntelligence);
        }

        public function __dressHide_click(_arg_1:MouseEvent):void
        {
            setDressHide();
        }

        public function set eq1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100613eq1;
            if (_local_2 !== _arg_1)
            {
                this._100613eq1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq1", _local_2, _arg_1));
            };
        }

        public function set eq2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100614eq2;
            if (_local_2 !== _arg_1)
            {
                this._100614eq2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq2", _local_2, _arg_1));
            };
        }

        public function set eq3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100615eq3;
            if (_local_2 !== _arg_1)
            {
                this._100615eq3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq3", _local_2, _arg_1));
            };
        }

        public function set eq4(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100616eq4;
            if (_local_2 !== _arg_1)
            {
                this._100616eq4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq4", _local_2, _arg_1));
            };
        }

        public function set lb_leftSec(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1628156161lb_leftSec;
            if (_local_2 !== _arg_1)
            {
                this._1628156161lb_leftSec = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_leftSec", _local_2, _arg_1));
            };
        }

        public function set eq5(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100617eq5;
            if (_local_2 !== _arg_1)
            {
                this._100617eq5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq5", _local_2, _arg_1));
            };
        }

        public function set eq6(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100618eq6;
            if (_local_2 !== _arg_1)
            {
                this._100618eq6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq6", _local_2, _arg_1));
            };
        }

        public function set hp(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._3336hp;
            if (_local_2 !== _arg_1)
            {
                this._3336hp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hp", _local_2, _arg_1));
            };
        }

        public function set eq8(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100620eq8;
            if (_local_2 !== _arg_1)
            {
                this._100620eq8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq8", _local_2, _arg_1));
            };
        }

        public function set eq9(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100621eq9;
            if (_local_2 !== _arg_1)
            {
                this._100621eq9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq9", _local_2, _arg_1));
            };
        }

        public function __star12_click(_arg_1:MouseEvent):void
        {
            clickStar(12);
        }

        public function set eq7(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._100619eq7;
            if (_local_2 !== _arg_1)
            {
                this._100619eq7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq7", _local_2, _arg_1));
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

        public function set ta_desc(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1555913437ta_desc;
            if (_local_2 !== _arg_1)
            {
                this._1555913437ta_desc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ta_desc", _local_2, _arg_1));
            };
        }

        private function openEffectPanel():void
        {
            _core.view.changeVisible(ViewManager.PANEL_STAR_EFFECT);
            _core.view.getUI(ViewManager.PANEL_STAR_EFFECT).startFollow(this);
        }

        public function set XGCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._652133081XGCanvas;
            if (_local_2 !== _arg_1)
            {
                this._652133081XGCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "XGCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pop():BoxLabel
        {
            return (this._111185pop);
        }

        [Bindable(event="propertyChange")]
        public function get infoTitle():BoxLabel
        {
            return (this._1221167690infoTitle);
        }

        private function changeName():void
        {
            if (infoName.text.indexOf(changeFlag) < 0)
            {
                return;
            };
            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.CHARACTORPANEL_S[9], Language.CHARACTORPANEL_S[10], onChangeName);
        }

        [Bindable(event="propertyChange")]
        public function get lb_add():RoundedLabel
        {
            return (this._1109587368lb_add);
        }

        public function set chivalTxt(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._189045043chivalTxt;
            if (_local_2 !== _arg_1)
            {
                this._189045043chivalTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chivalTxt", _local_2, _arg_1));
            };
        }

        private function setWingHide():void
        {
            _core.remote.call("setWingHide", new Responder(onSetWingHide), wingHide.selected);
        }

        public function set btnOK(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._94069048btnOK;
            if (_local_2 !== _arg_1)
            {
                this._94069048btnOK = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnOK", _local_2, _arg_1));
            };
        }

        public function __minusIntelligenceButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get addEnergy():RoundedLabel
        {
            return (this._405874039addEnergy);
        }

        [Bindable(event="propertyChange")]
        public function get addStamina():RoundedLabel
        {
            return (this._10889870addStamina);
        }

        [Bindable(event="propertyChange")]
        public function get mwMain():ItemSlot
        {
            return (this._1062100349mwMain);
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

        public function __wingHide_click(_arg_1:MouseEvent):void
        {
            setWingHide();
        }

        private function initCharEquListen():void
        {
            var _local_1:int = GamePredef.SLOT_SID_EQUIP[0];
            while (_local_1 <= (GamePredef.SLOT_SID_EQUIP[1] - 6))
            {
                this[("eq" + _local_1)].addEventListener(Slot.EVENT_SLOT_DCLICK, equDClickHandler);
                _local_1++;
            };
            mwMain.addEventListener(Slot.EVENT_SLOT_DCLICK, equDClickHandler);
            mwSub1.addEventListener(Slot.EVENT_SLOT_DCLICK, equDClickHandler);
            mwSub2.addEventListener(Slot.EVENT_SLOT_DCLICK, equDClickHandler);
            mwSub3.addEventListener(Slot.EVENT_SLOT_DCLICK, equDClickHandler);
            mwSub4.addEventListener(Slot.EVENT_SLOT_DCLICK, equDClickHandler);
            mwSub5.addEventListener(Slot.EVENT_SLOT_DCLICK, equDClickHandler);
        }

        public function set img_star(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._694777522img_star;
            if (_local_2 !== _arg_1)
            {
                this._694777522img_star = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_star", _local_2, _arg_1));
            };
        }

        private function set starLvUping(_arg_1:Boolean):void
        {
            var _local_2:Object;
            _local_2 = this._2033231541starLvUping;
            if (_local_2 !== _arg_1)
            {
                this._2033231541starLvUping = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starLvUping", _local_2, _arg_1));
            };
        }

        public function set levelUpButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1365556561levelUpButton;
            if (_local_2 !== _arg_1)
            {
                this._1365556561levelUpButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelUpButton", _local_2, _arg_1));
            };
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

        public function set actpointLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._459185494actpointLabel;
            if (_local_2 !== _arg_1)
            {
                this._459185494actpointLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actpointLabel", _local_2, _arg_1));
            };
        }

        public function set vigorTxt1(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433192vigorTxt1;
            if (_local_2 !== _arg_1)
            {
                this._10433192vigorTxt1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt1", _local_2, _arg_1));
            };
        }

        public function set vigorTxt2(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433191vigorTxt2;
            if (_local_2 !== _arg_1)
            {
                this._10433191vigorTxt2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt2", _local_2, _arg_1));
            };
        }

        public function set vigorTxt3(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433190vigorTxt3;
            if (_local_2 !== _arg_1)
            {
                this._10433190vigorTxt3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt3", _local_2, _arg_1));
            };
        }

        public function set vigorTxt4(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433189vigorTxt4;
            if (_local_2 !== _arg_1)
            {
                this._10433189vigorTxt4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt4", _local_2, _arg_1));
            };
        }

        public function set btnTitle(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._2097958236btnTitle;
            if (_local_2 !== _arg_1)
            {
                this._2097958236btnTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnTitle", _local_2, _arg_1));
            };
        }

        public function set vigorTxt8(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433185vigorTxt8;
            if (_local_2 !== _arg_1)
            {
                this._10433185vigorTxt8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt8", _local_2, _arg_1));
            };
        }

        public function set vigorTxt5(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433188vigorTxt5;
            if (_local_2 !== _arg_1)
            {
                this._10433188vigorTxt5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt5", _local_2, _arg_1));
            };
        }

        public function set vigorTxt9(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433184vigorTxt9;
            if (_local_2 !== _arg_1)
            {
                this._10433184vigorTxt9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt9", _local_2, _arg_1));
            };
        }

        public function set vigorTxt6(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433187vigorTxt6;
            if (_local_2 !== _arg_1)
            {
                this._10433187vigorTxt6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt6", _local_2, _arg_1));
            };
        }

        public function ___CharactorPanel_BasicGlowButton12_click(_arg_1:MouseEvent):void
        {
            awakenHandler(_arg_1);
        }

        public function handleStarTimer(_arg_1:TimerEvent):void
        {
            var _local_2:int = int((_interval / (3600 * 24)));
            var _local_3:int = int(((_interval % (3600 * 24)) / 3600));
            var _local_4:int = int(((_interval % 3600) / 60));
            var _local_5:int = ((_interval % 3600) % 60);
            lb_leftSecDesc.text = Language.CHARACTORPANEL_S[67].toString().replace("{d}", _local_2).replace("{h}", _local_3).replace("{m}", _local_4).replace("{s}", _local_5);
            _interval--;
        }

        private function _CharactorPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHARACTORPANEL_U[7];
            _local_1 = Language.CHARACTORPANEL_U[3];
            _local_1 = ResManager.TOTEM_CHARACTER;
            _local_1 = Language.CHARACTORPANEL_S[12];
            _local_1 = [1];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[13];
            _local_1 = [2];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[14];
            _local_1 = [3];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[15];
            _local_1 = [4];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[16];
            _local_1 = [5];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[17];
            _local_1 = [6];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[18];
            _local_1 = [7];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[19];
            _local_1 = [8];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[20];
            _local_1 = [9];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[21];
            _local_1 = [10];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[22];
            _local_1 = [11];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[23];
            _local_1 = [12];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[41];
            _local_1 = [13];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[53];
            _local_1 = [14];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[54];
            _local_1 = [21];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_S[63];
            _local_1 = [22];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = getDressHideData();
            _local_1 = Language.CHARACTORPANEL_S[56];
            _local_1 = getWingHideData();
            _local_1 = Language.CHARACTORPANEL_S[64];
            _local_1 = Language.CHARACTORPANEL_S[24];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.CHARACTORPANEL_S[26];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.DRESS_PANEL[48];
            _local_1 = Language.DECORATE_PANEL[17];
            _local_1 = Language.CHARACTORINFOPANEL_S[46];
            _local_1 = Language.CHARACTORPANEL_U[2];
            _local_1 = Language.CHARACTORPANEL_S[35];
            _local_1 = Language.CHARACTORPANEL_U[1];
            _local_1 = Language.CHARACTORPANEL_U[24];
            _local_1 = LanguageUtil.replace(Language.CHARACTORPANEL_U[74], {
                "name":infoName.text,
                "gender":GamePredef.GENDER_NAME[_core.player.gender],
                "cid":_core.cid
            });
            _local_1 = Language.CHARACTORPANEL_U[24];
            _local_1 = (infoName.text.indexOf(changeFlag) > 0);
            _local_1 = Language.CHARACTORPANEL_U[25];
            _local_1 = Language.CHARACTORPANEL_S[58];
            _local_1 = Language.CHARACTORPANEL_U[26];
            _local_1 = Language.CHARACTORPANEL_S[59];
            _local_1 = Language.CHARACTORPANEL_U[66];
            _local_1 = Language.CHARACTORPANEL_U[69];
            _local_1 = Language.CHARACTORPANEL_U[35];
            _local_1 = Language.CHARACTORPANEL_S[37];
            _local_1 = Language.CHARACTORPANEL_U[36];
            _local_1 = Language.CHARACTORPANEL_S[38];
            _local_1 = Language.CHARACTORPANEL_U[37];
            _local_1 = Language.CHARACTORPANEL_U[38];
            _local_1 = Language.CHARACTORPANEL_S[40];
            _local_1 = Language.CHARACTORPANEL_U[39];
            _local_1 = Language.CHARACTORPANEL_S[40];
            _local_1 = _core.player.btPnt;
            _local_1 = _core.player.dogM;
            _local_1 = _core.player.cbM;
            _local_1 = _core.player.paPnt;
            _local_1 = _core.player.soulPnt;
            _local_1 = _core.player.threePvpPnt;
            _local_1 = _core.player.stoneSealPoint;
            _local_1 = _core.player.elementPnt;
            _local_1 = _core.player.pvePoint;
            _local_1 = _core.player.wisdonCrystal;
            _local_1 = _core.player.npPnt;
            _local_1 = _core.player.mysteryCrystal;
            _local_1 = Language.CHARACTORPANEL_U[40];
            _local_1 = Language.CHARACTORPANEL_U[41];
            _local_1 = Language.CHARACTORPANEL_U[43];
            _local_1 = Language.CHARACTORPANEL_U[46];
            _local_1 = Language.CHARACTORPANEL_U[62];
            _local_1 = Language.CHARACTORPANEL_U[63];
            _local_1 = Language.CHARACTORPANEL_S[57];
            _local_1 = Language.CHARACTORPANEL_U[68];
            _local_1 = Language.CHARACTORPANEL_U[70];
            _local_1 = Language.CHARACTORPANEL_U[71];
            _local_1 = Language.CHARACTORPANEL_U[72];
            _local_1 = Language.CHARACTORPANEL_U[75];
            _local_1 = Language.CHARACTORPANEL_U[32];
            _local_1 = ResManager.TOTEM_MAGIC_WEAPON;
            _local_1 = Language.CHARACTORPANEL_U[33];
            _local_1 = [15];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "1");
            _local_1 = [16];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "2");
            _local_1 = [17];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "3");
            _local_1 = [18];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "4");
            _local_1 = [19];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "5");
            _local_1 = [20];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = Language.CHARACTORPANEL_U[61];
            _local_1 = Language.CHARACTORPANEL_S[77];
            _local_1 = Language.CHARACTORPANEL_U[47];
            _local_1 = starLvUping;
            _local_1 = Language.CHARACTORPANEL_U[59];
            _local_1 = Language.CHARACTORPANEL_S[71];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.CHARACTORPANEL_U[50];
            _local_1 = starLvUping;
            _local_1 = Language.CHARACTORPANEL_U[49];
            _local_1 = (!(starLvUping));
            _local_1 = Language.CHARACTORPANEL_U[60];
            _local_1 = Language.CHARACTORPANEL_U[48];
            _local_1 = Language.CHARACTORPANEL_U[58];
            _local_1 = Language.CHARACTORPANEL_U[55];
            _local_1 = starLvUping;
            _local_1 = starLvUping;
            _local_1 = Language.AWAKEN_PANEL[0];
            _local_1 = Language.CHARACTORPANEL_U[64];
            _local_1 = Language.CHARACTORPANEL_U[65];
            _local_1 = Language.CHARACTORPANEL_U[8];
            _local_1 = Language.CHARACTORPANEL_U[10];
            _local_1 = Language.CHARACTORPANEL_U[12];
            _local_1 = Language.CHARACTORPANEL_U[14];
            _local_1 = Language.CHARACTORPANEL_U[16];
            _local_1 = Language.CHARACTORPANEL_U[18];
            _local_1 = Language.CHARACTORPANEL_U[20];
            _local_1 = Language.CHARACTORPANEL_U[22];
            _local_1 = Language.CHARACTORPANEL_U[9];
            _local_1 = Language.CHARACTORPANEL_U[11];
            _local_1 = Language.CHARACTORPANEL_U[13];
            _local_1 = Language.CHARACTORPANEL_U[15];
            _local_1 = Language.CHARACTORPANEL_U[17];
            _local_1 = Language.CHARACTORPANEL_U[19];
            _local_1 = Language.CHARACTORPANEL_U[21];
            _local_1 = Language.CHARACTORPANEL_U[23];
            _local_1 = GamePredef.PROP_STR;
            _local_1 = GamePredef.PROP_AGI;
            _local_1 = GamePredef.PROP_STA;
            _local_1 = GamePredef.PROP_INT;
            _local_1 = GamePredef.PROP_SPR;
            _local_1 = GamePredef.PROP_STR;
            _local_1 = styleAddName;
            _local_1 = GamePredef.PROP_AGI;
            _local_1 = styleAddName;
            _local_1 = GamePredef.PROP_STA;
            _local_1 = styleAddName;
            _local_1 = GamePredef.PROP_INT;
            _local_1 = styleAddName;
            _local_1 = GamePredef.PROP_SPR;
            _local_1 = styleAddName;
            _local_1 = GamePredef.AADPROPCHECK;
            _local_1 = Language.CHARACTORPANEL_U[0];
            _local_1 = Language.CHARACTORPANEL_U[3];
            _local_1 = Language.CHARACTORPANEL_U[32];
            _local_1 = Language.CHARACTORPANEL_U[4];
            _local_1 = Language.CHARACTORPANEL_U[47];
            _local_1 = Language.MOUNTPANEL_U[0];
            _local_1 = Language.CHARACTORPANEL_S[60];
        }

        public function set vigorTxt7(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10433186vigorTxt7;
            if (_local_2 !== _arg_1)
            {
                this._10433186vigorTxt7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt7", _local_2, _arg_1));
            };
        }

        public function set infoClass(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1205539178infoClass;
            if (_local_2 !== _arg_1)
            {
                this._1205539178infoClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoClass", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2, 0, 1, 3, 4);
        }

        [Bindable(event="propertyChange")]
        public function get attLastPoint():BoxLabel
        {
            return (this._30739193attLastPoint);
        }

        private function beginStarLvUp():void
        {
            if (_interval > 0)
            {
                Alert.show(Language.CHARACTORPANEL_S[65]);
                return;
            };
            if (_selectStarType <= 0)
            {
                Alert.show(Language.CHARACTORPANEL_S[66]);
                return;
            };
            var _local_1:Object = this[("star" + _selectStarType)].starData;
            _core.remote.call("beginStarLvUp", new Responder(onBeginStarLvUp), _local_1.nextId);
        }

        public function updateView():void
        {
            updateProp();
            updateInfo();
            if (((tab.selectedIndex == 0) || (tab.selectedIndex == 2)))
            {
                updateEquip();
            };
        }

        public function onSetWingHide(_arg_1:*):void
        {
            if (_arg_1 == -1)
            {
                wingHide.selected = false;
                GamePredef.GLOBAL_SETTING["wingHide"] = false;
            }
            else
            {
                GamePredef.GLOBAL_SETTING["wingHide"] = _arg_1;
            };
        }

        private function magicWeaponRepair(_arg_1:MouseEvent):void
        {
            var _local_2:Array;
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:uint;
            var _local_7:uint;
            var _local_8:Array;
            _arg_1.stopImmediatePropagation();
            if (_core.state == GamePredef.ST_BATTLE)
            {
                return;
            };
            if (_arg_1.ctrlKey)
            {
                _local_2 = new Array();
                _local_3 = null;
                _local_4 = 0;
                if (((mwMain.slotData) && (ToolKit.isBigThan(mwMain.slotData.id, 0))))
                {
                    _local_3 = _core.data.gameData[mwMain.slotData.type][mwMain.slotData.itemId];
                    if (!_local_3)
                    {
                        return;
                    };
                    _local_4 = (_local_4 + (_local_3.endureMax - _local_3.endureLeft));
                    _local_2.push(mwMain.slotData.id);
                };
                _local_6 = 1;
                while (_local_6 < 6)
                {
                    _local_5 = this[("mwSub" + _local_6)].slotData;
                    if (((_local_5) && (ToolKit.isBigThan(_local_5.id, 0))))
                    {
                        _local_3 = _core.data.gameData[_local_5.type][_local_5.itemId];
                        if (!_local_3)
                        {
                            return;
                        };
                        _local_4 = (_local_4 + (_local_3.endureMax - _local_3.endureLeft));
                        _local_2.push(_local_5.id);
                    };
                    _local_6++;
                };
                _local_7 = uint(Math.ceil((_local_4 / GamePredef.MAGIC_WEAPON_REPAIR_ENDURE_BASIC)));
                _local_8 = _core.basic.getItemSlotList(ItemConfig.ITEM_DARKBLUE_STONE, _local_7);
                if (_local_8)
                {
                    _core.remote.magicWeaponAllRepair(_local_2, _local_8);
                }
                else
                {
                    _core.sysMidNote(Language.CHARACTORPANEL_S[78].replace("{num}", _local_7));
                };
            }
            else
            {
                _core.view.showMouse(ResManager.MOUSE_ACTION_IMG[GamePredef.ACTION_REPAIR_MAGIC_WEAPON]);
                _core.view.mouseState = GamePredef.ACTION_REPAIR_MAGIC_WEAPON;
                _core.view.mouseTargetType = GamePredef.MOUSE_TARGET_CHA;
            };
        }

        [Bindable(event="propertyChange")]
        public function get addEnergyButton():Button
        {
            return (this._708846363addEnergyButton);
        }

        public function __img_star_click(_arg_1:MouseEvent):void
        {
            clickStar(img_star.data.type);
        }

        [Bindable(event="propertyChange")]
        public function get lb_leftSecDesc():RoundedLabel
        {
            return (this._1577469134lb_leftSecDesc);
        }

        [Bindable(event="propertyChange")]
        public function get PopLabel():BasicTxtButton
        {
            return (this._699206467PopLabel);
        }

        public function __star4_click(_arg_1:MouseEvent):void
        {
            clickStar(4);
        }

        public function set mp(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._3491mp;
            if (_local_2 !== _arg_1)
            {
                this._3491mp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ngImg():Image
        {
            return (this._104729418ngImg);
        }

        public function enableUI():void
        {
            this.btnOK.enabled = true;
            this.levelUpButton.enabled = true;
            this.btnName.enabled = false;
            this.decoBtn.enabled = true;
        }

        public function cancelLvUp():void
        {
            if (_interval <= 0)
            {
                _core.sysMidNote(Language.CHARACTORPANEL_S[74]);
                return;
            };
            if (_core.player.starsData[_selectStarType].finishDate < 0)
            {
                _core.sysMidNote(Language.CHARACTORPANEL_S[75].toString().replace("{name}", lb_name.text));
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("cancelStarLvUp", new Responder(onCancelStarLvUp), _selectStarType);
                };
            };
            Alert.show(Language.CHARACTORPANEL_S[76].toString().replace("{name}", lb_name.text.substr(0, 3)), null, (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get addStaminaButton():Button
        {
            return (this._14326624addStaminaButton);
        }

        [Bindable(event="propertyChange")]
        public function get infoRebirthExp():BoxLabel
        {
            return (this._1099375777infoRebirthExp);
        }

        public function set PKLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._206211513PKLabel;
            if (_local_2 !== _arg_1)
            {
                this._206211513PKLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "PKLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rbImg():Image
        {
            return (this._108274547rbImg);
        }

        public function set lb_sLevel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1155663430lb_sLevel;
            if (_local_2 !== _arg_1)
            {
                this._1155663430lb_sLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_sLevel", _local_2, _arg_1));
            };
        }

        public function disableUI():void
        {
            this.btnOK.enabled = false;
            this.levelUpButton.enabled = false;
            this.btnName.enabled = false;
            this.decoBtn.enabled = false;
        }

        [Bindable(event="propertyChange")]
        public function get infoLevel():BoxLabel
        {
            return (this._1213662070infoLevel);
        }

        private function awakenHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_AWAKEN);
            ((_local_2) && (_local_2.show()));
        }

        [Bindable(event="propertyChange")]
        public function get propertyCanvas():Canvas
        {
            return (this._1940048781propertyCanvas);
        }

        override public function initialize():void
        {
            var target:CharactorPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CharactorPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CharactorPanelWatcherSetupUtil");
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
        public function get hit():BoxLabel
        {
            return (this._103315hit);
        }

        private function newProperty(_arg_1:Object):Object
        {
            return (null);
        }

        public function __star10_click(_arg_1:MouseEvent):void
        {
            clickStar(10);
        }

        [Bindable(event="propertyChange")]
        public function get MWCanvas():Canvas
        {
            return (this._1328020574MWCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get lb_addition():RoundedLabel
        {
            return (this._283222949lb_addition);
        }

        public function __star9_click(_arg_1:MouseEvent):void
        {
            clickStar(9);
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

        public function set vigorTxt10(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._323428904vigorTxt10;
            if (_local_2 !== _arg_1)
            {
                this._323428904vigorTxt10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt10", _local_2, _arg_1));
            };
        }

        public function set vigorTxt11(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._323428903vigorTxt11;
            if (_local_2 !== _arg_1)
            {
                this._323428903vigorTxt11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt11", _local_2, _arg_1));
            };
        }

        private function getWingHideData():Boolean
        {
            return (Boolean(GamePredef.GLOBAL_SETTING["wingHide"]));
        }

        private function getDressHideData():Boolean
        {
            if (GamePredef.GLOBAL_SETTING["dressHide"] == -1)
            {
                return (false);
            };
            return (Boolean(Number(GamePredef.GLOBAL_SETTING["dressHide"])));
        }

        public function set vigorTxt12(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._323428902vigorTxt12;
            if (_local_2 !== _arg_1)
            {
                this._323428902vigorTxt12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt12", _local_2, _arg_1));
            };
        }

        public function set iconImage03(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911909iconImage03;
            if (_local_2 !== _arg_1)
            {
                this._1271911909iconImage03 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage03", _local_2, _arg_1));
            };
        }

        public function set iconImage04(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911910iconImage04;
            if (_local_2 !== _arg_1)
            {
                this._1271911910iconImage04 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage04", _local_2, _arg_1));
            };
        }

        public function set iconImage05(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911911iconImage05;
            if (_local_2 !== _arg_1)
            {
                this._1271911911iconImage05 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage05", _local_2, _arg_1));
            };
        }

        public function set iconImage06(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911912iconImage06;
            if (_local_2 !== _arg_1)
            {
                this._1271911912iconImage06 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage06", _local_2, _arg_1));
            };
        }

        public function set iconImage07(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911913iconImage07;
            if (_local_2 !== _arg_1)
            {
                this._1271911913iconImage07 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage07", _local_2, _arg_1));
            };
        }

        public function updateProp():void
        {
            var _local_2:String;
            if (!_core.player)
            {
                return;
            };
            if (((!(firstLoad)) && (((((!(addStrength.text == "")) || (!(addAgility.text == ""))) || (!(addStamina.text == ""))) || (!(addIntelligence.text == ""))) || (!(addEnergy.text == "")))))
            {
                return;
            };
            addElement();
            var _local_1:Object = _core.player.property;
            if (_local_1)
            {
                if (((_local_1.makerActive) && (_local_1.qualityType > 0)))
                {
                    makerActiveInfo.text = (Language.CHARACTORPANEL_S[25] + "\n");
                    if (_local_1.qualityType == 10)
                    {
                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "10%\n"));
                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "2%\n"));
                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "2%"));
                    }
                    else
                    {
                        if (_local_1.qualityType == 11)
                        {
                            makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "10%\n"));
                            makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "5%\n"));
                            makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "5%"));
                        }
                        else
                        {
                            if (_local_1.qualityType == 15)
                            {
                                makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "16%\n"));
                                makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "8%\n"));
                                makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "8%"));
                            }
                            else
                            {
                                if (_local_1.qualityType == 16)
                                {
                                    makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "30%\n"));
                                    makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "15%\n"));
                                    makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "15%"));
                                }
                                else
                                {
                                    if (_local_1.qualityType == 20)
                                    {
                                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "40%\n"));
                                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "20%\n"));
                                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "20%"));
                                    };
                                };
                            };
                        };
                    };
                    makerActiveInfo.visible = true;
                }
                else
                {
                    makerActiveInfo.visible = false;
                };
                if (_local_1.starType > 0)
                {
                    starActiveInfo.text = (Language.CHARACTORPANEL_S[27] + "\n");
                    if (_local_1.starType == 8)
                    {
                        starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[348] + "10%\n"));
                        starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[349] + "5%\n"));
                        starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[350] + "5%"));
                    }
                    else
                    {
                        if (_local_1.starType == 9)
                        {
                            starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[348] + "20%\n"));
                            starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[349] + "10%\n"));
                            starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[350] + "10%"));
                        }
                        else
                        {
                            if (_local_1.starType == 10)
                            {
                                starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[348] + "30%\n"));
                                starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[349] + "15%\n"));
                                starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[350] + "15%"));
                            };
                        };
                    };
                    starActiveInfo.visible = true;
                }
                else
                {
                    starActiveInfo.visible = false;
                };
                hp.text = ((int(_core.player.currentHp) + "/") + int(_local_1.finalHp).toString());
                mp.text = ((int(_core.player.currentMp) + "/") + int(_local_1.finalMp).toString());
                attack.text = int(_local_1.finalAttack).toString();
                mAttack.text = int(_local_1.finalMAttack).toString();
                defence.text = int(_local_1.finalDefence).toString();
                mDefence.text = int(_local_1.finalMDefence).toString();
                hit.text = int(_local_1.finalHit).toString();
                critical.text = int(_local_1.finalCritical).toString();
                dodge.text = int(_local_1.finalDodge).toString();
                speed.text = int(_local_1.finalSpeed).toString();
                attStrength.text = int(_local_1.finalStrength).toString();
                attAgility.text = int(_local_1.finalAgility).toString();
                attStamina.text = int(_local_1.finalStamina).toString();
                attIntelligence.text = int(_local_1.finalIntelligence).toString();
                attEnergy.text = int(_local_1.finalEnergy).toString();
                attLastPoint.text = int(_local_1.lastPoint).toString();
                spirituality.text = Language.CHARACTORINFOPANEL_S[52].toString().replace("{spirituality}", _local_1.spirituality);
                addStrength.text = "";
                addAgility.text = "";
                addStamina.text = "";
                addIntelligence.text = "";
                addEnergy.text = "";
                _local_1.ee = Number(_local_1.ee);
                _local_1.en = Number(_local_1.en);
                _local_1.ef = Boolean(_local_1.ef);
                mc.gotoAndStop((1 + _local_1.ee));
                maskMc.gotoAndStop((1 + _local_1.en));
                maxMc.visible = _local_1.ef;
                elemUIC.toolTip = (Language.CHARACTORPANEL_S[2] + GamePredef.ELEMENT_INFO[_local_1.ee]);
                _local_2 = Language.CHARACTORPANEL_S[3];
                if (_local_1.en < 4)
                {
                    _local_2 = Language.CHARACTORPANEL_S[3];
                }
                else
                {
                    if (((_local_1.en >= 4) && (_local_1.en < 9)))
                    {
                        _local_2 = Language.CHARACTORPANEL_S[4];
                    }
                    else
                    {
                        if (((_local_1.en >= 9) && (_local_1.en < 13)))
                        {
                            _local_2 = Language.CHARACTORPANEL_S[5];
                        };
                    };
                };
                if (_local_1.ef)
                {
                    _local_2 = Language.CHARACTORPANEL_S[36];
                };
                elemUIC.toolTip = (elemUIC.toolTip + (Language.CHARACTORPANEL_S[6] + _local_2));
                if (Number(_local_1.lastPoint) > 0)
                {
                    addBtnCanvas.enabled = true;
                }
                else
                {
                    addBtnCanvas.enabled = false;
                };
                firstLoad = false;
            };
        }

        public function set iconImage08(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911914iconImage08;
            if (_local_2 !== _arg_1)
            {
                this._1271911914iconImage08 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage08", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (!_dm.sInited)
            {
                _core.remote.call("getInitSlot", new Responder(setSlot));
            };
            updateView();
            initCharEquListen();
            setAddStyleName();
        }

        public function set iconImage09(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911915iconImage09;
            if (_local_2 !== _arg_1)
            {
                this._1271911915iconImage09 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage09", _local_2, _arg_1));
            };
        }

        public function __btn_qx_click(_arg_1:MouseEvent):void
        {
            cancelLvUp();
        }

        public function set iconImage02(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911908iconImage02;
            if (_local_2 !== _arg_1)
            {
                this._1271911908iconImage02 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage02", _local_2, _arg_1));
            };
        }

        public function __addIntelligenceButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function set iconImage01(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911907iconImage01;
            if (_local_2 !== _arg_1)
            {
                this._1271911907iconImage01 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage01", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get minusStaminaButton():Button
        {
            return (this._1889342449minusStaminaButton);
        }

        public function set vigorTxt(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1246589433vigorTxt;
            if (_local_2 !== _arg_1)
            {
                this._1246589433vigorTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vigorTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wingHide():CheckBox
        {
            return (this._1113783315wingHide);
        }

        public function clickStar(_arg_1:int):void
        {
            var _local_2:int = 1;
            while (_local_2 <= 12)
            {
                this[("star" + _local_2)].setSourceN();
                _local_2++;
            };
            this[("star" + _arg_1)].setSourceC();
            _selectStarType = _arg_1;
            showStar(_arg_1);
        }

        public function set addIntelligence(_arg_1:RoundedLabel):void
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
        public function get addStrength():RoundedLabel
        {
            return (this._817036290addStrength);
        }

        public function set iconImage12(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911939iconImage12;
            if (_local_2 !== _arg_1)
            {
                this._1271911939iconImage12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get attIntelligence():BoxLabel
        {
            return (this._1319279616attIntelligence);
        }

        public function set iconImage10(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911937iconImage10;
            if (_local_2 !== _arg_1)
            {
                this._1271911937iconImage10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage10", _local_2, _arg_1));
            };
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

        public function set iconImage11(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1271911938iconImage11;
            if (_local_2 !== _arg_1)
            {
                this._1271911938iconImage11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImage11", _local_2, _arg_1));
            };
        }

        public function set btn_js(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1378810356btn_js;
            if (_local_2 !== _arg_1)
            {
                this._1378810356btn_js = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_js", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star1():StarIcon
        {
            return (this._109757471star1);
        }

        [Bindable(event="propertyChange")]
        public function get star2():StarIcon
        {
            return (this._109757472star2);
        }

        [Bindable(event="propertyChange")]
        public function get star3():StarIcon
        {
            return (this._109757473star3);
        }

        [Bindable(event="propertyChange")]
        public function get star4():StarIcon
        {
            return (this._109757474star4);
        }

        [Bindable(event="propertyChange")]
        public function get star5():StarIcon
        {
            return (this._109757475star5);
        }

        [Bindable(event="propertyChange")]
        public function get star6():StarIcon
        {
            return (this._109757476star6);
        }

        [Bindable(event="propertyChange")]
        public function get star7():StarIcon
        {
            return (this._109757477star7);
        }

        [Bindable(event="propertyChange")]
        public function get star8():StarIcon
        {
            return (this._109757478star8);
        }

        [Bindable(event="propertyChange")]
        public function get star9():StarIcon
        {
            return (this._109757479star9);
        }

        [Bindable(event="propertyChange")]
        public function get makerActiveInfo():TextArea
        {
            return (this._808946632makerActiveInfo);
        }

        private function changeDetailVis():void
        {
            detailPanel = _core.view.getUI(ViewManager.DETAIL_PROP_PANEL);
            detailPanel.ownerType = DetailPropPanel.OWNER_TYPE_CHAR;
            detailPanel.startFollow(this);
            detailPanel.visible = (!(detailPanel.visible));
            detailPanel.updateCharDetailData();
            showDetailProp.styleName = "EquipBagLeft";
        }

        [Bindable(event="propertyChange")]
        public function get defence():BoxLabel
        {
            return (this._1544916048defence);
        }

        public function onInitViewProp(_arg_1:Object):void
        {
            if (_core.player)
            {
                _core.player.property = _arg_1;
                updateView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoName():BoxLabel
        {
            return (this._177753177infoName);
        }

        private function equDClickHandler(_arg_1:GameEvent):void
        {
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
            _core.remote.equipOff(_local_2.slotData.id, -1);
        }

        public function __img_star_mouseOut(_arg_1:MouseEvent):void
        {
            img_star.filters = null;
        }

        public function set showDetailProp(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._557678129showDetailProp;
            if (_local_2 !== _arg_1)
            {
                this._557678129showDetailProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showDetailProp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get minusEnergyButton():Button
        {
            return (this._1863068566minusEnergyButton);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0, 1, 2, 3, 4);
        }

        [Bindable(event="propertyChange")]
        public function get imgCanva():Canvas
        {
            return (this._721177480imgCanva);
        }

        [Bindable(event="propertyChange")]
        public function get GXLabel():BasicTxtButton
        {
            return (this._1180791939GXLabel);
        }

        [Bindable(event="propertyChange")]
        public function get attEnergy():BoxLabel
        {
            return (this._1270522743attEnergy);
        }

        public function set elemUIC(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._1662853568elemUIC;
            if (_local_2 !== _arg_1)
            {
                this._1662853568elemUIC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elemUIC", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pmImg():Image
        {
            return (this._106755206pmImg);
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

        public function set infoTitle(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1221167690infoTitle;
            if (_local_2 !== _arg_1)
            {
                this._1221167690infoTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoTitle", _local_2, _arg_1));
            };
        }

        public function onFinishStarLvUp(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:Object;
            if (_arg_1)
            {
                _local_2 = Language.CHARACTORPANEL_S[68];
                _core.sysMidNote(_local_2);
                _core.sysMsg(_local_2);
                starLvUping = false;
                btn_sj.visible = true;
                btn_qx.visible = false;
                _core.player.starsData = _arg_1;
                _lvUpStarType = -1;
                updateStarsData(_arg_1);
                _local_3 = _core.view.getUI(ViewManager.PANEL_STAR_SPEED_UP);
                _local_3.hide();
            };
        }

        [Bindable(event="propertyChange")]
        public function get spirituality():Label
        {
            return (this._844311679spirituality);
        }

        public function set btnPos(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1378824616btnPos;
            if (_local_2 !== _arg_1)
            {
                this._1378824616btnPos = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPos", _local_2, _arg_1));
            };
        }

        public function set pop(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._111185pop;
            if (_local_2 !== _arg_1)
            {
                this._111185pop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pop", _local_2, _arg_1));
            };
        }

        public function set lb_add(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1109587368lb_add;
            if (_local_2 !== _arg_1)
            {
                this._1109587368lb_add = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_add", _local_2, _arg_1));
            };
        }

        public function __btnTitle_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_TITLE);
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

        public function __star2_click(_arg_1:MouseEvent):void
        {
            clickStar(2);
        }

        public function updateCharImage(_arg_1:Number):void
        {
            img.source = ResManager.getIconUrl(_arg_1);
        }

        private function set btnPosToolTip(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._787926635btnPosToolTip;
            if (_local_2 !== _arg_1)
            {
                this._787926635btnPosToolTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPosToolTip", _local_2, _arg_1));
            };
        }

        public function set decoBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1542401647decoBtn;
            if (_local_2 !== _arg_1)
            {
                this._1542401647decoBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoBtn", _local_2, _arg_1));
            };
        }

        public function updateEquip():void
        {
            var _local_1:Object;
            var _local_2:Object;
            propertyCanvas.x = 20;
            propertyCanvas.y = 212;
            for each (_local_1 in _dm.sList)
            {
                if (!((_local_1.sid < GamePredef.SLOT_SID_EQUIP[0]) || (_local_1.sid > GamePredef.SLOT_SID_EQUIP[1])))
                {
                    _local_2 = _core.view.getSlot(_local_1.sid);
                    _local_2.slotData = _local_1;
                    _local_2.type = _local_1.type;
                    _local_2.giid = _local_1.itemId;
                    _local_2.stackNum = _local_1.stackNum;
                };
            };
        }

        public function ___CharactorPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            dressHandler(_arg_1);
        }

        public function set pkTxt(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._106706549pkTxt;
            if (_local_2 !== _arg_1)
            {
                this._106706549pkTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pkTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hp():BoxLabel
        {
            return (this._3336hp);
        }

        public function __star7_click(_arg_1:MouseEvent):void
        {
            clickStar(7);
        }

        public function set addEnergy(_arg_1:RoundedLabel):void
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

        public function updateInfo():void
        {
            var _local_4:String;
            var _local_5:Object;
            var _local_6:*;
            var _local_7:Number;
            setIconImagesSouce();
            infoName.text = _core.player.name;
            infoLevel.text = _core.player.level.toString();
            infoClass.text = (_core.player.classLevel + _core.player.className);
            infoRebirthExp.text = String(_core.player.expBattle);
            infoTitle.text = "";
            if (_core.player.t > 0)
            {
                _local_5 = _core.data.getGameData(GamePredef.TBL_TITLE, _core.player.t);
                if (_local_5)
                {
                    infoTitle.text = _local_5.n;
                };
            };
            var _local_1:uint = ((int(_core.player.honor) >= 0) ? _core.player.honor : 0);
            var _local_2:uint = ((int(_core.player.chival) >= 0) ? _core.player.chival : 0);
            pkTxt.text = _local_1.toString();
            pop.text = _core.player.pop.toString();
            actpoint.text = ((_core.player.actpoint + "/") + _core.player.maxActpoint);
            chivalTxt.text = _local_2.toString();
            vigorTxt.text = ((_core.player.vigor + "/") + _core.player.maxVigor);
            chivalLabel.toolTip = ((_core.player.level < 40) ? Language.CHARACTORPANEL_S[32].toString().replace("{chivalArr}", chivalArr[_core.player.level]) : Language.CHARACTORPANEL_S[33].toString());
            img.source = ResManager.getIconUrl(_core.player.imgCode);
            if ((((_core.player) && (_core.player.pmLevel)) && (Number(_core.player.pmLevel) > 0)))
            {
                if (ResManager[("PM_ZUAN" + _core.player.pmLevel)])
                {
                    pmImg.source = ResManager[("PM_ZUAN" + _core.player.pmLevel)];
                };
            };
            if (((_core.player) && (_core.player.newGrade > 0)))
            {
                _local_6 = int(_core.player.newGrade);
                if (ResManager[("NEW_GRADE" + _local_6)])
                {
                    ngImg.source = ResManager[("NEW_GRADE" + _local_6)];
                    ngImg.toolTip = ((((newGradeLevel[_local_6] + "的") + _core.player.className) + "\n") + newGradeLevelInfo[_local_6]);
                }
                else
                {
                    ngImg.visible = false;
                    ngImg.toolTip = "";
                    ngImg.source = "";
                };
            }
            else
            {
                ngImg.visible = false;
                ngImg.toolTip = "";
                ngImg.source = "";
            };
            var _local_3:String = _core.player.expSkill.toString();
            if (_core.player.level >= GamePredef.MAX_LEVEL)
            {
                _local_4 = "-";
            }
            else
            {
                _local_7 = _core.basic.levelUpExp(_core.player.level);
                _local_4 = Math.round(_local_7).toString();
            };
            levelUpButton.toolTip = Language.CHARACTORPANEL_S[34].toString().replace("{exp}", _local_3).replace("{next}", _local_4);
            btnPos.selected = (_core.player.bp > 0);
            if (btnPos.selected)
            {
                btnPos.label = Language.CHARACTORPANEL_U[6];
            }
            else
            {
                btnPos.label = Language.CHARACTORPANEL_U[5];
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

        public function set addStamina(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._10889870addStamina;
            if (_local_2 !== _arg_1)
            {
                this._10889870addStamina = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addStamina", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get XGCanvas():Canvas
        {
            return (this._652133081XGCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get ta_desc():TextArea
        {
            return (this._1555913437ta_desc);
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

        public function __minusStrengthButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function set mwMain(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1062100349mwMain;
            if (_local_2 !== _arg_1)
            {
                this._1062100349mwMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mwMain", _local_2, _arg_1));
            };
        }

        public function __levelUpButton_click(_arg_1:MouseEvent):void
        {
            levelUp();
            setLevelUPStyleName();
        }

        private function levelUp():void
        {
            var _levelUp:Function;
            if (_core.player.level >= GamePredef.MAX_LEVEL)
            {
                return;
            };
            _levelUp = function (_arg_1:String):void
            {
                var _local_2:String;
                if (_arg_1)
                {
                    _local_2 = MD5.hash(_arg_1);
                    _core.remote.call("lvUp", new Responder(onLevelUp), _core.player.level, _local_2);
                    levelUpButton.enabled = false;
                };
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:Number;
                var _local_3:Number;
                if (Alert.YES == _arg_1.detail)
                {
                    _local_2 = _core.player.expSkill;
                    _local_3 = _core.basic.levelUpExp(_core.player.level);
                    if (_local_2 >= _local_3)
                    {
                        if (_core.delPass)
                        {
                            _core.remote.call("lvUp", new Responder(onLevelUp), _core.player.level, _core.delPass);
                            levelUpButton.enabled = false;
                        }
                        else
                        {
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.CHARACTORPANEL_U[2], _levelUp);
                        };
                    };
                };
            };
            Alert.show(Language.CHARACTORPANEL_U[31], "", (Alert.YES | Alert.NO), this, func);
        }

        [Bindable(event="propertyChange")]
        public function get levelUpButton():BasicGlowButton
        {
            return (this._1365556561levelUpButton);
        }

        public function __addStaminaButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt1():BoxLabel
        {
            return (this._10433192vigorTxt1);
        }

        [Bindable(event="propertyChange")]
        public function get addIntelligenceButton():Button
        {
            return (this._1991903918addIntelligenceButton);
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt3():BoxLabel
        {
            return (this._10433190vigorTxt3);
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt4():BoxLabel
        {
            return (this._10433189vigorTxt4);
        }

        [Bindable(event="propertyChange")]
        public function get btnTitle():BasicGlowButton
        {
            return (this._2097958236btnTitle);
        }

        public function reset():void
        {
            firstFlag = true;
            firstTimeFlag = true;
            hasMount = -1;
            resetStars();
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt8():BoxLabel
        {
            return (this._10433185vigorTxt8);
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt2():BoxLabel
        {
            return (this._10433191vigorTxt2);
        }

        public function set MountCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1965289807MountCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1965289807MountCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MountCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt5():BoxLabel
        {
            return (this._10433188vigorTxt5);
        }

        public function onSetDressHide(_arg_1:*):void
        {
            if (_arg_1 == -1)
            {
                dressHide.selected = false;
                _core.view.getUI(ViewManager.PANEL_SYSTEM).setDressHideCB(false);
                GamePredef.GLOBAL_SETTING["dressHide"] = false;
            }
            else
            {
                _core.view.getUI(ViewManager.PANEL_SYSTEM).setDressHideCB(_arg_1);
                GamePredef.GLOBAL_SETTING["dressHide"] = _arg_1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt9():BoxLabel
        {
            return (this._10433184vigorTxt9);
        }

        public function onChangeProperty():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt7():BoxLabel
        {
            return (this._10433186vigorTxt7);
        }

        [Bindable(event="propertyChange")]
        public function get actpointLabel():BasicTxtButton
        {
            return (this._459185494actpointLabel);
        }

        private function getNeedExp(_arg_1:int, _arg_2:Number):String
        {
            if (_arg_1 >= GamePredef.MAX_LEVEL)
            {
                return (Language.CHARACTORPANEL_S[7]);
            };
            var _local_3:int = _core.basic.levelUpExp(_core.player.level);
            return (Language.CHARACTORPANEL_S[8] + _local_3.toString());
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt6():BoxLabel
        {
            return (this._10433187vigorTxt6);
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
                    if (Number(attLastPoint.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_2 = Number(addStrength.text);
                    _local_2 = (_local_2 + tempPropMultiple);
                    addStrength.text = _local_2.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusStrengthButton.styleName = "BtnReduce";
                    break;
                case "addAgilityButton":
                    if (Number(attLastPoint.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_3 = Number(addAgility.text);
                    _local_3 = (_local_3 + tempPropMultiple);
                    addAgility.text = _local_3.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusAgilityButton.styleName = "BtnReduce";
                    break;
                case "addStaminaButton":
                    if (Number(attLastPoint.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_4 = Number(addStamina.text);
                    _local_4 = (_local_4 + tempPropMultiple);
                    addStamina.text = _local_4.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusStaminaButton.styleName = "BtnReduce";
                    break;
                case "addIntelligenceButton":
                    if (Number(attLastPoint.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_5 = Number(addIntelligence.text);
                    _local_5 = (_local_5 + tempPropMultiple);
                    addIntelligence.text = _local_5.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusIntelligenceButton.styleName = "BtnReduce";
                    break;
                case "addEnergyButton":
                    if (Number(attLastPoint.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(attLastPoint.text)) && (Number(attLastPoint.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(attLastPoint.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_6 = Number(addEnergy.text);
                    _local_6 = (_local_6 + tempPropMultiple);
                    addEnergy.text = _local_6.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 - tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    minusEnergyButton.styleName = "BtnReduce";
                    break;
                case "minusStrengthButton":
                    if (Number(addStrength.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(addStrength.text)) && (Number(addStrength.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(addStrength.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_2 = Number(addStrength.text);
                    _local_2 = (_local_2 - tempPropMultiple);
                    addStrength.text = _local_2.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_2 < PropMultiple)
                    {
                        minusStrengthButton.styleName = "BtnReduce2";
                    };
                    break;
                case "minusAgilityButton":
                    if (Number(addAgility.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(addAgility.text)) && (Number(addAgility.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(addAgility.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_3 = Number(addAgility.text);
                    _local_3 = (_local_3 - tempPropMultiple);
                    addAgility.text = _local_3.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_3 < PropMultiple)
                    {
                        minusAgilityButton.styleName = "BtnReduce2";
                    };
                    break;
                case "minusStaminaButton":
                    if (Number(addStamina.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(addStamina.text)) && (Number(addStamina.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(addStamina.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_4 = Number(addStamina.text);
                    _local_4 = (_local_4 - tempPropMultiple);
                    addStamina.text = _local_4.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_4 < PropMultiple)
                    {
                        minusStaminaButton.styleName = "BtnReduce2";
                    };
                    break;
                case "minusIntelligenceButton":
                    if (Number(addIntelligence.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(addIntelligence.text)) && (Number(addIntelligence.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(addIntelligence.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_5 = Number(addIntelligence.text);
                    _local_5 = (_local_5 - tempPropMultiple);
                    addIntelligence.text = _local_5.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_5 < PropMultiple)
                    {
                        minusIntelligenceButton.styleName = "BtnReduce2";
                    };
                    break;
                case "minusEnergyButton":
                    if (Number(addEnergy.text) >= PropMultiple)
                    {
                        tempPropMultiple = PropMultiple;
                    }
                    else
                    {
                        if (((0 < Number(addEnergy.text)) && (Number(addEnergy.text) < PropMultiple)))
                        {
                            tempPropMultiple = Number(addEnergy.text);
                        }
                        else
                        {
                            tempPropMultiple = 0;
                        };
                    };
                    _local_6 = Number(addEnergy.text);
                    _local_6 = (_local_6 - tempPropMultiple);
                    addEnergy.text = _local_6.toString();
                    _local_7 = Number(attLastPoint.text);
                    _local_7 = (_local_7 + tempPropMultiple);
                    attLastPoint.text = _local_7.toString();
                    if (_local_6 < PropMultiple)
                    {
                        minusEnergyButton.styleName = "BtnReduce2";
                    };
                    break;
            };
            setAddStyleName();
        }

        public function set mwSub2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1061902660mwSub2;
            if (_local_2 !== _arg_1)
            {
                this._1061902660mwSub2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mwSub2", _local_2, _arg_1));
            };
        }

        public function set mwSub3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1061902659mwSub3;
            if (_local_2 !== _arg_1)
            {
                this._1061902659mwSub3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mwSub3", _local_2, _arg_1));
            };
        }

        public function set mwSub4(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1061902658mwSub4;
            if (_local_2 !== _arg_1)
            {
                this._1061902658mwSub4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mwSub4", _local_2, _arg_1));
            };
        }

        public function set mwSub1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1061902661mwSub1;
            if (_local_2 !== _arg_1)
            {
                this._1061902661mwSub1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mwSub1", _local_2, _arg_1));
            };
        }

        public function __MWCanvas_show(_arg_1:FlexEvent):void
        {
            updateEquip();
        }

        public function set mwSub5(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1061902657mwSub5;
            if (_local_2 !== _arg_1)
            {
                this._1061902657mwSub5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mwSub5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mp():BoxLabel
        {
            return (this._3491mp);
        }

        private function changeProperty():void
        {
            _core.remote.changeProperty({
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

        public function __minusEnergyButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt10():BoxLabel
        {
            return (this._323428904vigorTxt10);
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt11():BoxLabel
        {
            return (this._323428903vigorTxt11);
        }

        [Bindable(event="propertyChange")]
        public function get vigorTxt12():BoxLabel
        {
            return (this._323428902vigorTxt12);
        }

        [Bindable(event="propertyChange")]
        public function get addStrengthButton():Button
        {
            return (this._426146348addStrengthButton);
        }

        public function set btn_qx(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1378810134btn_qx;
            if (_local_2 !== _arg_1)
            {
                this._1378810134btn_qx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_qx", _local_2, _arg_1));
            };
        }

        private function decoHandler(_arg_1:Event):void
        {
            var _local_2:Object;
            _arg_1.stopImmediatePropagation();
            if (_core.player.decoInfo)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_DECORATE);
                ((_local_2) && (_local_2.show()));
                trace("显示魂器主面板");
            }
            else
            {
                _core.remote.call("initDecoratePanel", null, _core.cid);
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconImage03():Image
        {
            return (this._1271911909iconImage03);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage04():Image
        {
            return (this._1271911910iconImage04);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage05():Image
        {
            return (this._1271911911iconImage05);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage07():Image
        {
            return (this._1271911913iconImage07);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage08():Image
        {
            return (this._1271911914iconImage08);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage02():Image
        {
            return (this._1271911908iconImage02);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage06():Image
        {
            return (this._1271911912iconImage06);
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
        public function get iconImage01():Image
        {
            return (this._1271911907iconImage01);
        }

        public function ___CharactorPanel_BasicGlowButton13_click(_arg_1:MouseEvent):void
        {
            showMount();
        }

        [Bindable(event="propertyChange")]
        public function get iconImage10():Image
        {
            return (this._1271911937iconImage10);
        }

        [Bindable(event="propertyChange")]
        public function get attStrength():BoxLabel
        {
            return (this._1181680126attStrength);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage09():Image
        {
            return (this._1271911915iconImage09);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage11():Image
        {
            return (this._1271911938iconImage11);
        }

        [Bindable(event="propertyChange")]
        public function get iconImage12():Image
        {
            return (this._1271911939iconImage12);
        }

        [Bindable(event="propertyChange")]
        public function get btn_js():BasicGlowButton
        {
            return (this._1378810356btn_js);
        }

        public function set btnName(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._206036743btnName;
            if (_local_2 !== _arg_1)
            {
                this._206036743btnName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnName", _local_2, _arg_1));
            };
        }

        public function __addStrengthButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function setLevelUPStyleName():void
        {
            styleAddName = "BtnAdd";
        }

        [Bindable(event="propertyChange")]
        public function get showDetailProp():BasicGlowButton
        {
            return (this._557678129showDetailProp);
        }

        public function set btn_sj(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1378810086btn_sj;
            if (_local_2 !== _arg_1)
            {
                this._1378810086btn_sj = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_sj", _local_2, _arg_1));
            };
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3, 0, 1, 2, 4);
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

        public function __addAgilityButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get elemUIC():UIComponent
        {
            return (this._1662853568elemUIC);
        }

        [Bindable(event="propertyChange")]
        public function get attack():BoxLabel
        {
            return (this._1407259064attack);
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

        [Bindable(event="propertyChange")]
        public function get btnPos():BasicDelayButton
        {
            return (this._1378824616btnPos);
        }

        private function onLevelUp(_arg_1:Boolean):void
        {
            levelUpButton.enabled = true;
            if (_core.view.getUI(ViewManager.PANEL_ACTIVE).visible)
            {
                _core.view.getUI(ViewManager.PANEL_ACTIVE).visible = false;
                _core.view.getUI(ViewManager.PANEL_ACTIVE).visible = true;
            };
            if (_core.view.getUI(ViewManager.PANEL_SKILLMANAGER).visible)
            {
                _core.view.getUI(ViewManager.PANEL_SKILLMANAGER).update();
            };
        }

        [Bindable(event="propertyChange")]
        public function get attAgility():BoxLabel
        {
            return (this._183433628attAgility);
        }

        public function set addBtnCanvas(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._19957965addBtnCanvas;
            if (_local_2 !== _arg_1)
            {
                this._19957965addBtnCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addBtnCanvas", _local_2, _arg_1));
            };
        }

        public function set btn_tf(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1378810059btn_tf;
            if (_local_2 !== _arg_1)
            {
                this._1378810059btn_tf = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_tf", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get decoBtn():BasicGlowButton
        {
            return (this._1542401647decoBtn);
        }

        public function __btnName_click(_arg_1:MouseEvent):void
        {
            changeName();
        }

        [Bindable(event="propertyChange")]
        private function get btnPosToolTip():String
        {
            return (this._787926635btnPosToolTip);
        }

        public function set lb_leftSecDesc(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1577469134lb_leftSecDesc;
            if (_local_2 !== _arg_1)
            {
                this._1577469134lb_leftSecDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_leftSecDesc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pkTxt():BoxLabel
        {
            return (this._106706549pkTxt);
        }

        public function __addEnergyButton_buttonDown(_arg_1:FlexEvent):void
        {
            buttonClick(_arg_1);
        }

        public function set PopLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._699206467PopLabel;
            if (_local_2 !== _arg_1)
            {
                this._699206467PopLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "PopLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        public function __star5_click(_arg_1:MouseEvent):void
        {
            clickStar(5);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicGlowButton
        {
            return (this._1554141555tabBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        private function speedUpStarLvUp():void
        {
            if (_lvUpStarType <= 0)
            {
                Alert.show(Language.CHARACTORPANEL_S[69]);
                return;
            };
            var _local_1:Number = this[("star" + _lvUpStarType)].starData.finishDate;
            if (_local_1 <= 0)
            {
                Alert.show(Language.CHARACTORPANEL_S[70]);
                return;
            };
            _core.view.changeVisible(ViewManager.PANEL_STAR_SPEED_UP);
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_STAR_SPEED_UP);
            _local_2.startFollow(this);
            _local_2.setSelectStar(_lvUpStarType);
        }

        public function set ngImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._104729418ngImg;
            if (_local_2 !== _arg_1)
            {
                this._104729418ngImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ngImg", _local_2, _arg_1));
            };
        }

        private function showHonorPanel():void
        {
            _core.view.hide(ViewManager.PANEL_CHARACTOR_PROPERTY);
            _core.view.changeVisible(ViewManager.PANEL_CHARACTOR_HONOR);
            _core.view.getUI(ViewManager.PANEL_CHARACTOR_HONOR).startFollow(this);
        }

        public function __btn_xg_click(_arg_1:MouseEvent):void
        {
            openEffectPanel();
        }

        private function addStarAddition():void
        {
            _core.view.changeVisible(ViewManager.PANEL_STAR_ADDITION);
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_STAR_ADDITION);
            _local_1.startFollow(this);
        }

        [Bindable(event="propertyChange")]
        public function get MountCanvas():Canvas
        {
            return (this._1965289807MountCanvas);
        }

        private function _CharactorPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_CharactorPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_Canvas2.label = _arg_1;
            }, "_CharactorPanel_Canvas2.label");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_CHARACTER);
            }, function (_arg_1:Object):void
            {
                _CharactorPanel_Image1.source = _arg_1;
            }, "_CharactorPanel_Image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq1.text = _arg_1;
            }, "eq1.text");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([1]);
            }, function (_arg_1:Array):void
            {
                eq1.acceptPos = _arg_1;
            }, "eq1.acceptPos");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq1.acceptType = _arg_1;
            }, "eq1.acceptType");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq2.text = _arg_1;
            }, "eq2.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([2]);
            }, function (_arg_1:Array):void
            {
                eq2.acceptPos = _arg_1;
            }, "eq2.acceptPos");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq2.acceptType = _arg_1;
            }, "eq2.acceptType");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq3.text = _arg_1;
            }, "eq3.text");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([3]);
            }, function (_arg_1:Array):void
            {
                eq3.acceptPos = _arg_1;
            }, "eq3.acceptPos");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq3.acceptType = _arg_1;
            }, "eq3.acceptType");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq4.text = _arg_1;
            }, "eq4.text");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([4]);
            }, function (_arg_1:Array):void
            {
                eq4.acceptPos = _arg_1;
            }, "eq4.acceptPos");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq4.acceptType = _arg_1;
            }, "eq4.acceptType");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq5.text = _arg_1;
            }, "eq5.text");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([5]);
            }, function (_arg_1:Array):void
            {
                eq5.acceptPos = _arg_1;
            }, "eq5.acceptPos");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq5.acceptType = _arg_1;
            }, "eq5.acceptType");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq6.text = _arg_1;
            }, "eq6.text");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([6]);
            }, function (_arg_1:Array):void
            {
                eq6.acceptPos = _arg_1;
            }, "eq6.acceptPos");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq6.acceptType = _arg_1;
            }, "eq6.acceptType");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq7.text = _arg_1;
            }, "eq7.text");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([7]);
            }, function (_arg_1:Array):void
            {
                eq7.acceptPos = _arg_1;
            }, "eq7.acceptPos");
            result[22] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq7.acceptType = _arg_1;
            }, "eq7.acceptType");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq8.text = _arg_1;
            }, "eq8.text");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([8]);
            }, function (_arg_1:Array):void
            {
                eq8.acceptPos = _arg_1;
            }, "eq8.acceptPos");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq8.acceptType = _arg_1;
            }, "eq8.acceptType");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq9.text = _arg_1;
            }, "eq9.text");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([9]);
            }, function (_arg_1:Array):void
            {
                eq9.acceptPos = _arg_1;
            }, "eq9.acceptPos");
            result[28] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq9.acceptType = _arg_1;
            }, "eq9.acceptType");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq10.text = _arg_1;
            }, "eq10.text");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([10]);
            }, function (_arg_1:Array):void
            {
                eq10.acceptPos = _arg_1;
            }, "eq10.acceptPos");
            result[31] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq10.acceptType = _arg_1;
            }, "eq10.acceptType");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq11.text = _arg_1;
            }, "eq11.text");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([11]);
            }, function (_arg_1:Array):void
            {
                eq11.acceptPos = _arg_1;
            }, "eq11.acceptPos");
            result[34] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq11.acceptType = _arg_1;
            }, "eq11.acceptType");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq12.text = _arg_1;
            }, "eq12.text");
            result[36] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([12]);
            }, function (_arg_1:Array):void
            {
                eq12.acceptPos = _arg_1;
            }, "eq12.acceptPos");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq12.acceptType = _arg_1;
            }, "eq12.acceptType");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq13.text = _arg_1;
            }, "eq13.text");
            result[39] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([13]);
            }, function (_arg_1:Array):void
            {
                eq13.acceptPos = _arg_1;
            }, "eq13.acceptPos");
            result[40] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq13.acceptType = _arg_1;
            }, "eq13.acceptType");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq14.text = _arg_1;
            }, "eq14.text");
            result[42] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([14]);
            }, function (_arg_1:Array):void
            {
                eq14.acceptPos = _arg_1;
            }, "eq14.acceptPos");
            result[43] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq14.acceptType = _arg_1;
            }, "eq14.acceptType");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq15.text = _arg_1;
            }, "eq15.text");
            result[45] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([21]);
            }, function (_arg_1:Array):void
            {
                eq15.acceptPos = _arg_1;
            }, "eq15.acceptPos");
            result[46] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq15.acceptType = _arg_1;
            }, "eq15.acceptType");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[63];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eq16.text = _arg_1;
            }, "eq16.text");
            result[48] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([22]);
            }, function (_arg_1:Array):void
            {
                eq16.acceptPos = _arg_1;
            }, "eq16.acceptPos");
            result[49] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                eq16.acceptType = _arg_1;
            }, "eq16.acceptType");
            result[50] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getDressHideData());
            }, function (_arg_1:Boolean):void
            {
                dressHide.selected = _arg_1;
            }, "dressHide.selected");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[56];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dressHide.toolTip = _arg_1;
            }, "dressHide.toolTip");
            result[52] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getWingHideData());
            }, function (_arg_1:Boolean):void
            {
                wingHide.selected = _arg_1;
            }, "wingHide.selected");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[64];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wingHide.toolTip = _arg_1;
            }, "wingHide.toolTip");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makerActiveInfo.toolTip = _arg_1;
            }, "makerActiveInfo.toolTip");
            result[55] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                makerActiveInfo.filters = _arg_1;
            }, "makerActiveInfo.filters");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                starActiveInfo.toolTip = _arg_1;
            }, "starActiveInfo.toolTip");
            result[57] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                starActiveInfo.filters = _arg_1;
            }, "starActiveInfo.filters");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicGlowButton1.label = _arg_1;
            }, "_CharactorPanel_BasicGlowButton1.label");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                decoBtn.label = _arg_1;
            }, "decoBtn.label");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_Canvas3.label = _arg_1;
            }, "_CharactorPanel_Canvas3.label");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                levelUpButton.label = _arg_1;
            }, "levelUpButton.label");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnTitle.toolTip = _arg_1;
            }, "btnTitle.toolTip");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnTitle.label = _arg_1;
            }, "btnTitle.label");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton1.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton1.label");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = LanguageUtil.replace(Language.CHARACTORPANEL_U[74], {
                    "name":infoName.text,
                    "gender":GamePredef.GENDER_NAME[_core.player.gender],
                    "cid":_core.cid
                });
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton1.toolTip = _arg_1;
            }, "_CharactorPanel_BasicTxtButton1.toolTip");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnName.label = _arg_1;
            }, "btnName.label");
            result[67] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (infoName.text.indexOf(changeFlag) > 0);
            }, function (_arg_1:Boolean):void
            {
                btnName.visible = _arg_1;
            }, "btnName.visible");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton2.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton2.label");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton2.toolTip = _arg_1;
            }, "_CharactorPanel_BasicTxtButton2.toolTip");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton3.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton3.label");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton3.toolTip = _arg_1;
            }, "_CharactorPanel_BasicTxtButton3.toolTip");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[66];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                GXLabel.label = _arg_1;
            }, "GXLabel.label");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[69];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                GXLabel.toolTip = _arg_1;
            }, "GXLabel.toolTip");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                PKLabel.label = _arg_1;
            }, "PKLabel.label");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                PKLabel.toolTip = _arg_1;
            }, "PKLabel.toolTip");
            result[76] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                PopLabel.label = _arg_1;
            }, "PopLabel.label");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                PopLabel.toolTip = _arg_1;
            }, "PopLabel.toolTip");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                chivalLabel.label = _arg_1;
            }, "chivalLabel.label");
            result[79] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actpointLabel.label = _arg_1;
            }, "actpointLabel.label");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actpointLabel.toolTip = _arg_1;
            }, "actpointLabel.toolTip");
            result[81] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorLabel.label = _arg_1;
            }, "vigorLabel.label");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorLabel.toolTip = _arg_1;
            }, "vigorLabel.toolTip");
            result[83] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.btPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt1.text = _arg_1;
            }, "vigorTxt1.text");
            result[84] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.dogM;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt2.text = _arg_1;
            }, "vigorTxt2.text");
            result[85] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.cbM;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt3.text = _arg_1;
            }, "vigorTxt3.text");
            result[86] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.paPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt4.text = _arg_1;
            }, "vigorTxt4.text");
            result[87] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.soulPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt5.text = _arg_1;
            }, "vigorTxt5.text");
            result[88] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.threePvpPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt6.text = _arg_1;
            }, "vigorTxt6.text");
            result[89] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.stoneSealPoint;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt7.text = _arg_1;
            }, "vigorTxt7.text");
            result[90] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.elementPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt8.text = _arg_1;
            }, "vigorTxt8.text");
            result[91] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.pvePoint;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt9.text = _arg_1;
            }, "vigorTxt9.text");
            result[92] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.wisdonCrystal;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt10.text = _arg_1;
            }, "vigorTxt10.text");
            result[93] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.npPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt11.text = _arg_1;
            }, "vigorTxt11.text");
            result[94] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.mysteryCrystal;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vigorTxt12.text = _arg_1;
            }, "vigorTxt12.text");
            result[95] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage01.toolTip = _arg_1;
            }, "iconImage01.toolTip");
            result[96] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage02.toolTip = _arg_1;
            }, "iconImage02.toolTip");
            result[97] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage03.toolTip = _arg_1;
            }, "iconImage03.toolTip");
            result[98] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage04.toolTip = _arg_1;
            }, "iconImage04.toolTip");
            result[99] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[62];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage05.toolTip = _arg_1;
            }, "iconImage05.toolTip");
            result[100] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[63];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage06.toolTip = _arg_1;
            }, "iconImage06.toolTip");
            result[101] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[57];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage07.toolTip = _arg_1;
            }, "iconImage07.toolTip");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage08.toolTip = _arg_1;
            }, "iconImage08.toolTip");
            result[103] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage09.toolTip = _arg_1;
            }, "iconImage09.toolTip");
            result[104] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage10.toolTip = _arg_1;
            }, "iconImage10.toolTip");
            result[105] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage11.toolTip = _arg_1;
            }, "iconImage11.toolTip");
            result[106] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[75];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                iconImage12.toolTip = _arg_1;
            }, "iconImage12.toolTip");
            result[107] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                MWCanvas.label = _arg_1;
            }, "MWCanvas.label");
            result[108] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_MAGIC_WEAPON);
            }, function (_arg_1:Object):void
            {
                _CharactorPanel_Image14.source = _arg_1;
            }, "_CharactorPanel_Image14.source");
            result[109] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mwMain.text = _arg_1;
            }, "mwMain.text");
            result[110] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([15]);
            }, function (_arg_1:Array):void
            {
                mwMain.acceptPos = _arg_1;
            }, "mwMain.acceptPos");
            result[111] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                mwMain.acceptType = _arg_1;
            }, "mwMain.acceptType");
            result[112] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = (Language.CHARACTORPANEL_U[34] + "1");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mwSub1.text = _arg_1;
            }, "mwSub1.text");
            result[113] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([16]);
            }, function (_arg_1:Array):void
            {
                mwSub1.acceptPos = _arg_1;
            }, "mwSub1.acceptPos");
            result[114] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                mwSub1.acceptType = _arg_1;
            }, "mwSub1.acceptType");
            result[115] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = (Language.CHARACTORPANEL_U[34] + "2");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mwSub2.text = _arg_1;
            }, "mwSub2.text");
            result[116] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([17]);
            }, function (_arg_1:Array):void
            {
                mwSub2.acceptPos = _arg_1;
            }, "mwSub2.acceptPos");
            result[117] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                mwSub2.acceptType = _arg_1;
            }, "mwSub2.acceptType");
            result[118] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = (Language.CHARACTORPANEL_U[34] + "3");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mwSub3.text = _arg_1;
            }, "mwSub3.text");
            result[119] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([18]);
            }, function (_arg_1:Array):void
            {
                mwSub3.acceptPos = _arg_1;
            }, "mwSub3.acceptPos");
            result[120] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                mwSub3.acceptType = _arg_1;
            }, "mwSub3.acceptType");
            result[121] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = (Language.CHARACTORPANEL_U[34] + "4");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mwSub4.text = _arg_1;
            }, "mwSub4.text");
            result[122] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([19]);
            }, function (_arg_1:Array):void
            {
                mwSub4.acceptPos = _arg_1;
            }, "mwSub4.acceptPos");
            result[123] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                mwSub4.acceptType = _arg_1;
            }, "mwSub4.acceptType");
            result[124] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = (Language.CHARACTORPANEL_U[34] + "5");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mwSub5.text = _arg_1;
            }, "mwSub5.text");
            result[125] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([20]);
            }, function (_arg_1:Array):void
            {
                mwSub5.acceptPos = _arg_1;
            }, "mwSub5.acceptPos");
            result[126] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                mwSub5.acceptType = _arg_1;
            }, "mwSub5.acceptType");
            result[127] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mWRepairButton.label = _arg_1;
            }, "mWRepairButton.label");
            result[128] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[77];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mWRepairButton.toolTip = _arg_1;
            }, "mWRepairButton.toolTip");
            result[129] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                XGCanvas.label = _arg_1;
            }, "XGCanvas.label");
            result[130] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (starLvUping);
            }, function (_arg_1:Boolean):void
            {
                img_star.visible = _arg_1;
            }, "img_star.visible");
            result[131] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_RoundedLabel1.text = _arg_1;
            }, "_CharactorPanel_RoundedLabel1.text");
            result[132] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_RoundedLabel1.toolTip = _arg_1;
            }, "_CharactorPanel_RoundedLabel1.toolTip");
            result[133] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ta_desc.filters = _arg_1;
            }, "ta_desc.filters");
            result[134] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_js.label = _arg_1;
            }, "btn_js.label");
            result[135] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (starLvUping);
            }, function (_arg_1:Boolean):void
            {
                btn_js.visible = _arg_1;
            }, "btn_js.visible");
            result[136] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_sj.label = _arg_1;
            }, "btn_sj.label");
            result[137] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(starLvUping));
            }, function (_arg_1:Boolean):void
            {
                btn_sj.enabled = _arg_1;
            }, "btn_sj.enabled");
            result[138] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[60];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_qx.label = _arg_1;
            }, "btn_qx.label");
            result[139] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_tf.label = _arg_1;
            }, "btn_tf.label");
            result[140] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_xg.label = _arg_1;
            }, "btn_xg.label");
            result[141] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[55];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lb_leftSec.text = _arg_1;
            }, "lb_leftSec.text");
            result[142] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (starLvUping);
            }, function (_arg_1:Boolean):void
            {
                lb_leftSec.visible = _arg_1;
            }, "lb_leftSec.visible");
            result[143] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (starLvUping);
            }, function (_arg_1:Boolean):void
            {
                lb_leftSecDesc.visible = _arg_1;
            }, "lb_leftSecDesc.visible");
            result[144] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.AWAKEN_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicGlowButton12.label = _arg_1;
            }, "_CharactorPanel_BasicGlowButton12.label");
            result[145] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[64];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicGlowButton13.label = _arg_1;
            }, "_CharactorPanel_BasicGlowButton13.label");
            result[146] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[65];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicGlowButton13.toolTip = _arg_1;
            }, "_CharactorPanel_BasicGlowButton13.toolTip");
            result[147] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton10.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton10.label");
            result[148] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton11.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton11.label");
            result[149] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton12.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton12.label");
            result[150] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton13.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton13.label");
            result[151] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton14.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton14.label");
            result[152] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton15.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton15.label");
            result[153] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton16.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton16.label");
            result[154] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton17.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton17.label");
            result[155] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton18.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton18.label");
            result[156] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton19.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton19.label");
            result[157] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton20.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton20.label");
            result[158] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton21.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton21.label");
            result[159] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton22.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton22.label");
            result[160] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton23.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton23.label");
            result[161] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton24.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton24.label");
            result[162] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorPanel_BasicTxtButton25.label = _arg_1;
            }, "_CharactorPanel_BasicTxtButton25.label");
            result[163] = binding;
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
            result[164] = binding;
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
            result[165] = binding;
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
            result[166] = binding;
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
            result[167] = binding;
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
            result[168] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_STR;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addStrengthButton.toolTip = _arg_1;
            }, "addStrengthButton.toolTip");
            result[169] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addStrengthButton.styleName = _arg_1;
            }, "addStrengthButton.styleName");
            result[170] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_AGI;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addAgilityButton.toolTip = _arg_1;
            }, "addAgilityButton.toolTip");
            result[171] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addAgilityButton.styleName = _arg_1;
            }, "addAgilityButton.styleName");
            result[172] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_STA;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addStaminaButton.toolTip = _arg_1;
            }, "addStaminaButton.toolTip");
            result[173] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addStaminaButton.styleName = _arg_1;
            }, "addStaminaButton.styleName");
            result[174] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_INT;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addIntelligenceButton.toolTip = _arg_1;
            }, "addIntelligenceButton.toolTip");
            result[175] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addIntelligenceButton.styleName = _arg_1;
            }, "addIntelligenceButton.styleName");
            result[176] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.PROP_SPR;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addEnergyButton.toolTip = _arg_1;
            }, "addEnergyButton.toolTip");
            result[177] = binding;
            binding = new Binding(this, function ():Object
            {
                return (styleAddName);
            }, function (_arg_1:Object):void
            {
                addEnergyButton.styleName = _arg_1;
            }, "addEnergyButton.styleName");
            result[178] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = GamePredef.AADPROPCHECK;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                AddPropCheck.toolTip = _arg_1;
            }, "AddPropCheck.toolTip");
            result[179] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnOK.label = _arg_1;
            }, "btnOK.label");
            result[180] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[181] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[182] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[183] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[184] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.MOUNTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[185] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARACTORPANEL_S[60];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPos.toolTip = _arg_1;
            }, "btnPos.toolTip");
            result[186] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get mwSub1():ItemSlot
        {
            return (this._1061902661mwSub1);
        }

        [Bindable(event="propertyChange")]
        public function get mwSub2():ItemSlot
        {
            return (this._1061902660mwSub2);
        }

        [Bindable(event="propertyChange")]
        public function get mwSub3():ItemSlot
        {
            return (this._1061902659mwSub3);
        }

        public function set infoRebirthExp(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1099375777infoRebirthExp;
            if (_local_2 !== _arg_1)
            {
                this._1099375777infoRebirthExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoRebirthExp", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get mwSub4():ItemSlot
        {
            return (this._1061902658mwSub4);
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

        [Bindable(event="propertyChange")]
        public function get mwSub5():ItemSlot
        {
            return (this._1061902657mwSub5);
        }

        public function onAddStarAddition(_arg_1:int):void
        {
            if (_arg_1 == _selectStarType)
            {
                clickStar(_arg_1);
            };
        }

        public function __star11_click(_arg_1:MouseEvent):void
        {
            clickStar(11);
        }

        public function set rbImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._108274547rbImg;
            if (_local_2 !== _arg_1)
            {
                this._108274547rbImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rbImg", _local_2, _arg_1));
            };
        }

        public function set infoLevel(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1213662070infoLevel;
            if (_local_2 !== _arg_1)
            {
                this._1213662070infoLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLevel", _local_2, _arg_1));
            };
        }

        private function showStar(_arg_1:int):void
        {
            var _local_2:Object = GameData.d[GamePredef.TBL_STARS_TEMPLATE][this[("star" + _arg_1)].starData.currentId];
            var _local_3:Object = GameData.d[GamePredef.TBL_STARS_TEMPLATE][this[("star" + _arg_1)].starData.nextId];
            var _local_4:Number = 1;
            if (_core.player.starsData[_arg_1])
            {
                _local_4 = _core.player.starsData[_arg_1].addition;
            };
            var _local_5:String = _local_4.toFixed(2);
            lb_addition.text = _local_5;
            var _local_6:int = _core.getStarColor(_local_4);
            lb_addition.setStyle("color", GamePredef.CODE_ITEM_COLOR[_local_6]);
            lb_add.text = Language.CHARACTORPANEL_U[56];
            if (_local_2)
            {
                lb_name.text = ((_local_2.name + " Lv.") + _local_2.level);
                ta_desc.htmlText = _local_2.description;
            }
            else
            {
                if (_local_3)
                {
                    lb_name.text = (_local_3.name + " Lv.0");
                    ta_desc.htmlText = _local_3.description;
                };
            };
            if (((_core.player.starsData[_arg_1]) && (_core.player.starsData[_arg_1].finishDate > 0)))
            {
                btn_sj.visible = false;
                btn_qx.visible = true;
            }
            else
            {
                btn_sj.visible = true;
                btn_qx.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_qx():BasicGlowButton
        {
            return (this._1378810134btn_qx);
        }

        [Bindable(event="propertyChange")]
        public function get btnName():BasicGlowButton
        {
            return (this._206036743btnName);
        }

        private function addElement():void
        {
            if (!mc)
            {
                mc = new ((element as Class))();
                elemUIC.addChild(mc);
                maskMc = MovieClip(mc.getChildByName("maskMC"));
                maxMc = MovieClip(mc.getChildByName("maxMc"));
                mc.gotoAndStop(1);
                maskMc.gotoAndStop(1);
                maxMc.visible = false;
            };
        }

        private function showMount():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_MOUNT);
            if (_local_1)
            {
                if (LAST_PLAYER_ID != _core.player.id)
                {
                    _local_1.initView();
                    LAST_PLAYER_ID = _core.player.id;
                }
                else
                {
                    _local_1.visible = true;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_sj():BasicGlowButton
        {
            return (this._1378810086btn_sj);
        }

        [Bindable(event="propertyChange")]
        public function get mDefence():BoxLabel
        {
            return (this._97632477mDefence);
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

        public function set tab(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._114581tab;
            if (_local_2 !== _arg_1)
            {
                this._114581tab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab", _local_2, _arg_1));
            };
        }

        public function onCheckHaveMount(_arg_1:int):void
        {
            hasMount = _arg_1;
            if (!_arg_1)
            {
                Alert.show(Language.CHARACTORPANEL_S[81]);
                return;
            };
            tabBtnClick(4, 0, 1, 2, 3);
        }

        [Bindable(event="propertyChange")]
        public function get addBtnCanvas():SimpleCanvas
        {
            return (this._19957965addBtnCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get btn_tf():BasicGlowButton
        {
            return (this._1378810059btn_tf);
        }

        public function tabBtnClick(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            var _local_6:Image;
            pmImg.visible = false;
            ngImg.visible = false;
            rbImg.visible = false;
            if (_arg_1 == 3)
            {
                if (_core.player.level < 80)
                {
                    Alert.show(Language.CHARACTORPANEL_S[73]);
                    return;
                };
                if (imgCanva.getChildren().length <= 0)
                {
                    _local_6 = new Image();
                    _local_6.source = ResManager.IMG_STARS_BACKGROUND;
                    _local_6.width = 285;
                    _local_6.height = 385;
                    _local_6.owner = XGCanvas;
                    _local_6.x = 0;
                    _local_6.y = 0;
                    imgCanva.addChild(_local_6);
                };
                initStars();
            }
            else
            {
                imgCanva.removeAllChildren();
            };
            if (((2 == _arg_1) && (_core.player.level < 50)))
            {
                Alert.show(Language.CHARACTORPANEL_S[62]);
                return;
            };
            if (_arg_1 == 4)
            {
                if (!_core.player.expRe)
                {
                    Alert.show(Language.CHARACTORPANEL_S[81]);
                    return;
                };
                if (hasMount != 1)
                {
                    _core.remote.call("checkHaveMount", new Responder(onCheckHaveMount), null);
                    return;
                };
            };
            tab.selectedIndex = _arg_1;
            this[("tabBtn" + _arg_1)].selected = true;
            this[("tabBtn" + _arg_2)].selected = false;
            this[("tabBtn" + _arg_3)].selected = false;
            this[("tabBtn" + _arg_4)].selected = false;
            this[("tabBtn" + _arg_5)].selected = false;
            if ((((_arg_1 == 1) && (_arg_2 == 0)) && (_arg_3 == 2)))
            {
                propertyCanvas.visible = false;
                pmImg.visible = true;
                ngImg.visible = true;
                img.visible = true;
                if (_core.player.levelRe > 0)
                {
                    rbImg.visible = true;
                };
            }
            else
            {
                if (_arg_1 == 3)
                {
                    propertyCanvas.visible = false;
                    img.visible = false;
                }
                else
                {
                    propertyCanvas.visible = true;
                    img.visible = false;
                };
            };
        }

        public function set MWCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1328020574MWCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1328020574MWCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWCanvas", _local_2, _arg_1));
            };
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

        public function set lb_addition(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._283222949lb_addition;
            if (_local_2 !== _arg_1)
            {
                this._283222949lb_addition = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_addition", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get minusStrengthButton():Button
        {
            return (this._1864769379minusStrengthButton);
        }

        public function set btn_xg(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1378809934btn_xg;
            if (_local_2 !== _arg_1)
            {
                this._1378809934btn_xg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_xg", _local_2, _arg_1));
            };
        }

        public function onBeginStarLvUp(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:*;
            var _local_4:int;
            var _local_5:Object;
            if (_arg_1)
            {
                _core.player.starsData = _arg_1;
                _local_2 = (new Date().getTime() + _core.timeLag);
                for (_local_3 in _arg_1)
                {
                    if (_arg_1[_local_3].finishDate > 0)
                    {
                        _lvUpStarType = _local_3;
                        this[("star" + _local_3)].starData.finishDate = _arg_1[_local_3].finishDate;
                        _interval = ((this[("star" + _local_3)].starData.finishDate - _local_2) / 1000);
                        if (_interval <= 0)
                        {
                            _interval = 1;
                        };
                        _local_4 = getNextStarId(_arg_1[_local_3].tid, _local_3);
                        _local_5 = GameData.d[GamePredef.TBL_STARS_TEMPLATE][_local_4];
                        if (_local_5)
                        {
                            img_star.source = ResManager.getIconUrl(_local_5.resCode);
                            img_star.toolTip = Language.CHARACTORPANEL_S[72].toString().replace("{name}", _local_5.name);
                            img_star.data = _local_5;
                        };
                        break;
                    };
                };
                if (((_starTimer) && (_starTimer.running)))
                {
                    _starTimer.stop();
                    _starTimer = null;
                };
                starLvUping = true;
                btn_sj.visible = false;
                btn_qx.visible = true;
                _interval = Math.round(_interval);
                _starTimer = new Timer(1000, _interval);
                _starTimer.addEventListener(TimerEvent.TIMER, handleStarTimer);
                _starTimer.addEventListener(TimerEvent.TIMER_COMPLETE, handleStarLvComplete);
                _starTimer.start();
            };
        }

        public function set lb_name(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._37085260lb_name;
            if (_local_2 !== _arg_1)
            {
                this._37085260lb_name = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_name", _local_2, _arg_1));
            };
        }

        public function ___CharactorPanel_Canvas2_show(_arg_1:FlexEvent):void
        {
            updateEquip();
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get minusIntelligenceButton():Button
        {
            return (this._1606233953minusIntelligenceButton);
        }

        public function onCancelStarLvUp(_arg_1:Object):void
        {
            starLvUping = false;
            btn_sj.visible = true;
            btn_qx.visible = false;
            _core.player.starsData = _arg_1;
            _lvUpStarType = -1;
            _interval = 0;
            updateStarsData(_arg_1);
        }

        public function set mWRepairButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._508557257mWRepairButton;
            if (_local_2 !== _arg_1)
            {
                this._508557257mWRepairButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mWRepairButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        public function set eq11(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3119052eq11;
            if (_local_2 !== _arg_1)
            {
                this._3119052eq11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq11", _local_2, _arg_1));
            };
        }

        public function set eq13(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3119054eq13;
            if (_local_2 !== _arg_1)
            {
                this._3119054eq13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get critical():BoxLabel
        {
            return (this._1952151455critical);
        }

        public function set eq12(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3119053eq12;
            if (_local_2 !== _arg_1)
            {
                this._3119053eq12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq12", _local_2, _arg_1));
            };
        }

        public function set eq10(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3119051eq10;
            if (_local_2 !== _arg_1)
            {
                this._3119051eq10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq10", _local_2, _arg_1));
            };
        }

        public function set eq16(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3119057eq16;
            if (_local_2 !== _arg_1)
            {
                this._3119057eq16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq16", _local_2, _arg_1));
            };
        }

        public function __MountCanvas_show(_arg_1:FlexEvent):void
        {
            updateMount();
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

        public function set eq15(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3119056eq15;
            if (_local_2 !== _arg_1)
            {
                this._3119056eq15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq15", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_xg():BasicGlowButton
        {
            return (this._1378809934btn_xg);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1, 0, 2, 3, 4);
        }

        [Bindable(event="propertyChange")]
        public function get lb_name():RoundedLabel
        {
            return (this._37085260lb_name);
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

        public function set eq14(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3119055eq14;
            if (_local_2 !== _arg_1)
            {
                this._3119055eq14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eq14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function set AddPropCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._727902236AddPropCheck;
            if (_local_2 !== _arg_1)
            {
                this._727902236AddPropCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "AddPropCheck", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mWRepairButton():BasicGlowButton
        {
            return (this._508557257mWRepairButton);
        }

        [Bindable(event="propertyChange")]
        public function get eq10():ItemSlot
        {
            return (this._3119051eq10);
        }

        [Bindable(event="propertyChange")]
        public function get eq11():ItemSlot
        {
            return (this._3119052eq11);
        }

        [Bindable(event="propertyChange")]
        public function get eq12():ItemSlot
        {
            return (this._3119053eq12);
        }

        [Bindable(event="propertyChange")]
        public function get eq14():ItemSlot
        {
            return (this._3119055eq14);
        }

        [Bindable(event="propertyChange")]
        public function get eq16():ItemSlot
        {
            return (this._3119057eq16);
        }

        [Bindable(event="propertyChange")]
        public function get eq13():ItemSlot
        {
            return (this._3119054eq13);
        }

        private function getNextStarId(_arg_1:int, _arg_2:int):int
        {
            var _local_5:Object;
            var _local_3:Object = _core.data.gameDataIndex[GamePredef.TBL_STARS_TEMPLATE][_arg_2];
            var _local_4:Object = GameData.d[GamePredef.TBL_STARS_TEMPLATE][_arg_1];
            if (!_local_4)
            {
                for each (_local_5 in _local_3)
                {
                    if (parseInt(_local_5.level) == 1)
                    {
                        return (_local_5.id);
                    };
                };
            }
            else
            {
                for each (_local_5 in _local_3)
                {
                    if (parseInt(_local_5.level) == (parseFloat(_local_4.level) + 1))
                    {
                        return (_local_5.id);
                    };
                };
            };
            return (-1);
        }

        [Bindable(event="propertyChange")]
        public function get eq15():ItemSlot
        {
            return (this._3119056eq15);
        }

        public function __btn_tf_click(_arg_1:MouseEvent):void
        {
            addStarAddition();
        }

        public function __decoBtn_click(_arg_1:MouseEvent):void
        {
            decoHandler(_arg_1);
        }

        public function __btnOK_click(_arg_1:MouseEvent):void
        {
            changeProperty();
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

        public function set star12(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._892485645star12;
            if (_local_2 !== _arg_1)
            {
                this._892485645star12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star12", _local_2, _arg_1));
            };
        }

        public function set star10(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._892485647star10;
            if (_local_2 !== _arg_1)
            {
                this._892485647star10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get styleAddName():String
        {
            return (this._177868763styleAddName);
        }

        [Bindable(event="propertyChange")]
        public function get AddPropCheck():CheckBox
        {
            return (this._727902236AddPropCheck);
        }

        [Bindable(event="propertyChange")]
        public function get dodge():BoxLabel
        {
            return (this._95758295dodge);
        }

        [Bindable(event="propertyChange")]
        public function get star10():StarIcon
        {
            return (this._892485647star10);
        }

        [Bindable(event="propertyChange")]
        public function get star11():StarIcon
        {
            return (this._892485646star11);
        }

        [Bindable(event="propertyChange")]
        public function get star12():StarIcon
        {
            return (this._892485645star12);
        }

        public function set star11(_arg_1:StarIcon):void
        {
            var _local_2:Object;
            _local_2 = this._892485646star11;
            if (_local_2 !== _arg_1)
            {
                this._892485646star11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star11", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

