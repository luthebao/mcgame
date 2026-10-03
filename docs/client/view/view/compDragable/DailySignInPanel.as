// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DailySignInPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Text;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.binding.Binding;
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

    public class DailySignInPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1757036852numberleft37:Image;
        private var _2071124149surpriseDayItem1:ItemSlot;
        private var _496582453imbackground36:Image;
        private var _496582422imbackground26:Image;
        private var _221232623numberright31:Image;
        private var _808329852vsFlop:ViewStack;
        private var _2023086287imsignin7:Image;
        private var _2023086291imsignin3:Image;
        private var _1932526115numberright6:Image;
        private var _1708834411imsignin16:Image;
        private var _875332321consumeLimit:RoundedLabel;
        private var _1032778572critNum:Number = 0;
        private var _221232617numberright37:Image;
        private var _1757036786numberleft13:Image;
        private var _1757036846numberleft31:Image;
        private var _221232654numberright21:Image;
        private var _1757036818numberleft24:Image;
        private var _496582387imbackground12:Image;
        public var _DailySignInPanel_Image1:Image;
        private var _1757036821numberleft27:Image;
        private var _221232592numberright41:Image;
        private var _221232680numberright16:Image;
        private var _496582455imbackground38:Image;
        private var _496582424imbackground28:Image;
        private var _2094228774imbackground8:Image;
        private var _1708834441imsignin25:Image;
        private var _1708834414imsignin19:Image;
        private var _221232648numberright27:Image;
        private var _221232685numberright11:Image;
        private var _1932526109numberright0:Image;
        private var _893311866textSurpriseDay:Text;
        private var _1708834406imsignin11:Image;
        private var _749415270numberleft6:Image;
        private var _496582391imbackground16:Image;
        private var _1932526112numberright3:Image;
        private var _2094228768imbackground2:Image;
        private var _1708834471imsignin34:Image;
        private var _1708834444imsignin28:Image;
        private var _1757036783numberleft10:Image;
        private var _749415273numberleft9:Image;
        private var _1757036815numberleft21:Image;
        private var _221232679numberright17:Image;
        private var _1914146189lbNowCirtical:Label;
        private var _496582389imbackground14:Image;
        private var _1708834436imsignin20:Image;
        private var _221232621numberright33:Image;
        private var _1708834409imsignin14:Image;
        private var _1757036854numberleft39:Image;
        private var _749415265numberleft1:Image;
        private var _1708834474imsignin37:Image;
        public var _DailySignInPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _221232615numberright39:Image;
        private var _221232652numberright23:Image;
        private var _749415268numberleft4:Image;
        private var _1708834439imsignin23:Image;
        private var _860835146lbNowData:Label;
        private var _496582450imbackground33:Image;
        private var _496582393imbackground18:Image;
        private var _2023086288imsignin6:Image;
        private var _1932526117numberright8:Image;
        private var _2023086292imsignin2:Image;
        private var _2094228772imbackground6:Image;
        private var _1757036876numberleft40:Image;
        public var _DailySignInPanel_BasicGlowButton5:BasicGlowButton;
        private var _1757036848numberleft33:Image;
        private var _221232646numberright29:Image;
        private var _221232683numberright13:Image;
        private var _1757036788numberleft15:Image;
        private var _496582479imbackground41:Image;
        private var _496582448imbackground31:Image;
        private var _496582417imbackground21:Image;
        private var _1708834469imsignin32:Image;
        private var _1757036791numberleft18:Image;
        private var _455359180everyDayItem:ItemSlot;
        private var _1757036851numberleft36:Image;
        private var _1757036823numberleft29:Image;
        private var _2094228766imbackground0:Image;
        private var _1708834410imsignin15:Image;
        private var _221232677numberright19:Image;
        private var _1708834499imsignin41:Image;
        private var _221232624numberright30:Image;
        private var _1932526114numberright5:Image;
        private var _496582452imbackground35:Image;
        private var _496582421imbackground25:Image;
        private var _1708834440imsignin24:Image;
        private var _1708834413imsignin18:Image;
        private var _1757036785numberleft12:Image;
        private var _1757036845numberleft30:Image;
        private var _1757036817numberleft23:Image;
        private var _221232650numberright25:Image;
        private var _2071124148surpriseDayItem2:ItemSlot;
        private var _2071124146surpriseDayItem4:ItemSlot;
        public var _DailySignInPanel_Label1:Label;
        private var _221232618numberright36:Image;
        private var _1708834405imsignin10:Image;
        private var _221232655numberright20:Image;
        private var _939184532buttonSignIn:Button;
        private var _496582419imbackground23:Image;
        private var _1757036820numberleft26:Image;
        private var _1708834470imsignin33:Image;
        private var _2023086285imsignin9:Image;
        private var _2094228770imbackground4:Image;
        private var _1622748191textLuckyDay:Text;
        private var _1708834443imsignin27:Image;
        private var _749415271numberleft7:Image;
        private var _221232593numberright40:Image;
        private var _496582386imbackground11:Image;
        private var _221232681numberright15:Image;
        private var _2094228775imbackground9:Image;
        private var _1708834408imsignin13:Image;
        private var _221232649numberright26:Image;
        private var _221232686numberright10:Image;
        private var _1932526111numberright2:Image;
        private var _496582454imbackground37:Image;
        private var _1708834473imsignin36:Image;
        private var _496582423imbackground27:Image;
        private var _1757036814numberleft20:Image;
        private var _2094228769imbackground3:Image;
        private var _749415266numberleft2:Image;
        private var _2023086289imsignin5:Image;
        private var _2023086293imsignin1:Image;
        private var _1708834438imsignin22:Image;
        private var _221232622numberright32:Image;
        private var _1757036853numberleft38:Image;
        private var _496582390imbackground15:Image;
        private var _749415269numberleft5:Image;
        private var _1708834476imsignin39:Image;
        private var _496582388imbackground13:Image;
        private var _1708834468imsignin31:Image;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _221232616numberright38:Image;
        private var _1932526116numberright7:Image;
        private var firstDay:Number = 0;
        private var _221232653numberright22:Image;
        private var _2043717127buttonGetAward:BasicGlowButton;
        private var _496582425imbackground29:Image;
        private var _496582456imbackground39:Image;
        private var _1757036787numberleft14:Image;
        private var _1757036847numberleft32:Image;
        private var _1757036819numberleft25:Image;
        private var _1708834498imsignin40:Image;
        private var _2094228773imbackground7:Image;
        private var _1757036790numberleft17:Image;
        private var _1757036850numberleft35:Image;
        private var _221232647numberright28:Image;
        private var _221232684numberright12:Image;
        private var _1757036822numberleft28:Image;
        private var _496582392imbackground17:Image;
        private var _1708834412imsignin17:Image;
        private var _2023086286imsignin8:Image;
        private var _2023086290imsignin4:Image;
        private var _1790492452btnUpCirtical:BasicGlowButton;
        private var _496582478imbackground40:Image;
        private var _2094228767imbackground1:Image;
        private var _496582447imbackground30:Image;
        private var _496582416imbackground20:Image;
        private var _221232620numberright34:Image;
        private var _1932526113numberright4:Image;
        private var _221232678numberright18:Image;
        private var _1708834442imsignin26:Image;
        private var _1757036784numberleft11:Image;
        private var _1757036816numberleft22:Image;
        private var _1708834407imsignin12:Image;
        private var _749415272numberleft8:Image;
        private var _221232651numberright24:Image;
        private var _496582451imbackground34:Image;
        private var _496582420imbackground24:Image;
        private var _496582394imbackground19:Image;
        private var _2023086294imsignin0:Image;
        public var _DailySignInPanel_Text3:Text;
        private var _1708834472imsignin35:Image;
        private var _1878711376playRule:Text;
        private var _1708834445imsignin29:Image;
        private var _749415264numberleft0:Image;
        private var _496582449imbackground32:Image;
        private var _496582418imbackground22:Image;
        private var _1708834437imsignin21:Image;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _221232619numberright35:Image;
        private var _2094228771imbackground5:Image;
        private var _1932526110numberright1:Image;
        private var _221232682numberright14:Image;
        private var _749415267numberleft3:Image;
        private var _1932526118numberright9:Image;
        private var _1708834475imsignin38:Image;
        private var _1757036877numberleft41:Image;
        private var _1757036789numberleft16:Image;
        private var _496582385imbackground10:Image;
        private var _2071124147surpriseDayItem3:ItemSlot;
        private var _1757036849numberleft34:Image;
        private var _1708834467imsignin30:Image;
        private var _1757036792numberleft19:Image;
        private var _2071124145surpriseDayItem5:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":710,
                    "height":470,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_DailySignInPanel_BasicTitleCanvas1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn0",
                        "events":{"click":"__bangBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "labelPlacement":"bottom",
                                "width":70,
                                "x":20,
                                "y":35
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
                                "width":70,
                                "x":89,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"consumeLimit",
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":35,
                                "text":""
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsFlop",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":55,
                                "width":690,
                                "height":390,
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":690,
                                            "height":390,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_DailySignInPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":441,
                                                        "y":10,
                                                        "width":245,
                                                        "height":370,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DailySignInPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"everyDayItem",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SlotDailySignIn",
                                                                    "x":171,
                                                                    "y":10,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"textSurpriseDay",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":58,
                                                                    "width":225,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"surpriseDayItem5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SlotDailySignIn",
                                                                    "x":202,
                                                                    "y":106,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"surpriseDayItem4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SlotDailySignIn",
                                                                    "x":154,
                                                                    "y":106,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"surpriseDayItem3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SlotDailySignIn",
                                                                    "x":106,
                                                                    "y":106,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"surpriseDayItem2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SlotDailySignIn",
                                                                    "x":58,
                                                                    "y":106,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"surpriseDayItem1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SlotDailySignIn",
                                                                    "x":10,
                                                                    "y":106,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"textLuckyDay",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":158,
                                                                    "width":225,
                                                                    "height":88
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"buttonGetAward",
                                                            "events":{"click":"__buttonGetAward_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":92.75,
                                                                    "y":230,
                                                                    "width":69.5,
                                                                    "height":32
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_DailySignInPanel_Text3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":278,
                                                                    "width":225,
                                                                    "height":39
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"buttonSignIn",
                                                            "events":{"click":"__buttonSignIn_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":52.5,
                                                                    "y":317,
                                                                    "styleName":"dailySignInDoBtn",
                                                                    "width":140,
                                                                    "height":53
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lbNowData",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 15;
                                                    this.textAlign = "center";
                                                    this.color = 0xF9F900;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":130,
                                                        "y":10,
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lbNowCirtical",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.textAlign = "right";
                                                    this.color = 0xF9F900;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":360
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btnUpCirtical",
                                                "events":{"click":"__btnUpCirtical_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":232.75,
                                                        "y":348,
                                                        "width":91.5,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_DailySignInPanel_BasicGlowButton5",
                                                "events":{"click":"___DailySignInPanel_BasicGlowButton5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":347.5,
                                                        "y":348,
                                                        "width":69.5,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":77,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":90,
                                                        "y":77,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":77,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":200,
                                                        "y":77,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":77,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":310,
                                                        "y":77,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":365,
                                                        "y":77,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":117,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":90,
                                                        "y":117,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":117,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":200,
                                                        "y":117,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":117,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":310,
                                                        "y":117,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":365,
                                                        "y":117,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":157,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":90,
                                                        "y":157,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground16",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":157,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground17",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":200,
                                                        "y":157,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":157,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground19",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":310,
                                                        "y":157,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground20",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":365,
                                                        "y":157,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground21",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":197,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground22",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":90,
                                                        "y":197,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground23",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":197,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground24",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":200,
                                                        "y":197,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground25",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":197,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground26",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":310,
                                                        "y":197,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground27",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":365,
                                                        "y":197,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground28",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":237,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground29",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":90,
                                                        "y":237,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground30",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":237,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground31",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":200,
                                                        "y":237,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground32",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":237,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground33",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":310,
                                                        "y":237,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground34",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":365,
                                                        "y":237,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground35",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":35,
                                                        "y":277,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground36",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":90,
                                                        "y":277,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground37",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":277,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground38",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":200,
                                                        "y":277,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground39",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":277,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground40",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":310,
                                                        "y":277,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imbackground41",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":365,
                                                        "y":277,
                                                        "width":53,
                                                        "height":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":72,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":93,
                                                        "y":72,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":72,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":203,
                                                        "y":72,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":258,
                                                        "y":72,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":313,
                                                        "y":72,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":368,
                                                        "y":72,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":112,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":93,
                                                        "y":112,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":112,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":203,
                                                        "y":112,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":258,
                                                        "y":112,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":313,
                                                        "y":112,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":368,
                                                        "y":112,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":152,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":93,
                                                        "y":152,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin16",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":152,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin17",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":203,
                                                        "y":152,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":258,
                                                        "y":152,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin19",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":313,
                                                        "y":152,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin20",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":368,
                                                        "y":152,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin21",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":192,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin22",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":93,
                                                        "y":192,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin23",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":192,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin24",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":203,
                                                        "y":192,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin25",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":258,
                                                        "y":192,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin26",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":313,
                                                        "y":192,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin27",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":368,
                                                        "y":192,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin28",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":232,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin29",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":93,
                                                        "y":232,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin30",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":232,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin31",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":203,
                                                        "y":232,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin32",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":258,
                                                        "y":232,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin33",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":313,
                                                        "y":232,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin34",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":368,
                                                        "y":232,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin35",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":272,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin36",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":93,
                                                        "y":272,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin37",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":272,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin38",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":203,
                                                        "y":272,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin39",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":258,
                                                        "y":272,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin40",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":313,
                                                        "y":272,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"imsignin41",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":368,
                                                        "y":272,
                                                        "width":46,
                                                        "height":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":59,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":102,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":114,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":157,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":169,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":212,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":224,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":267,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":279,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":322,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":334,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":377,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":389,
                                                        "y":87,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":59,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":102,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":114,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":157,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":169,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":212,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":224,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":267,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":279,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":322,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":334,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":377,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":389,
                                                        "y":127,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":59,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":102,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":114,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft16",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":157,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright16",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":169,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft17",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":212,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright17",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":224,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":267,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":279,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft19",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":322,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright19",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":334,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft20",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":377,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright20",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":389,
                                                        "y":167,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft21",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright21",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":59,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft22",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":102,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright22",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":114,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft23",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":157,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright23",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":169,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft24",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":212,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright24",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":224,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft25",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":267,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright25",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":279,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft26",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":322,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright26",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":334,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft27",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":377,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright27",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":389,
                                                        "y":207,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft28",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright28",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":59,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft29",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":102,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright29",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":114,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft30",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":157,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright30",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":169,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft31",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":212,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright31",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":224,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft32",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":267,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright32",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":279,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft33",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":322,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright33",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":334,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft34",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":377,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright34",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":389,
                                                        "y":247,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft35",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright35",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":59,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft36",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":102,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright36",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":114,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft37",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":157,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright37",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":169,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft38",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":212,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright38",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":224,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft39",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":267,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright39",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":279,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft40",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":322,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright40",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":334,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberleft41",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":377,
                                                        "y":287,
                                                        "width":14,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"numberright41",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":389,
                                                        "y":287,
                                                        "width":14,
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
                                            "styleName":"CanvasBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":690,
                                            "height":390,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"playRule",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 14;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "width":670,
                                                        "height":370
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
        private var dailySignInActConf:Object = {};
        private var dailySignInActData:Object = {};
        private var dateNow:Object = {};
        private var _core:Core = Core.getInstance();
        private var resNumber:Array = [4130220000885, 4130220000886, 4130220000887, 4130220000888, 4130220000889, 4130220000890, 4130220000891, 4130220000892, 4130220000896, 4130220000895];
        private var weakArr:Array = ["", "1", "2", "3", "4", "5", "6", "7"];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DailySignInPanel()
        {
            mx_internal::_document = this;
            this.width = 710;
            this.height = 470;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            this.addEventListener("creationComplete", ___DailySignInPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DailySignInPanel._watcherSetupUtil = _arg_1;
        }


        public function set numberright23(_arg_1:Image):void
        {
            var _local_2:Object = this._221232652numberright23;
            if (_local_2 !== _arg_1)
            {
                this._221232652numberright23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright23", _local_2, _arg_1));
            };
        }

        public function set numberright28(_arg_1:Image):void
        {
            var _local_2:Object = this._221232647numberright28;
            if (_local_2 !== _arg_1)
            {
                this._221232647numberright28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright28", _local_2, _arg_1));
            };
        }

        public function set textLuckyDay(_arg_1:Text):void
        {
            var _local_2:Object = this._1622748191textLuckyDay;
            if (_local_2 !== _arg_1)
            {
                this._1622748191textLuckyDay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textLuckyDay", _local_2, _arg_1));
            };
        }

        private function setBtnsEnable():void
        {
            var _local_1:Number = ((Number(dailySignInActData.getAwardTime.day) + 7) - Number(dailySignInActConf.luckyDay));
            if (((((dailySignInActData.getAwardTime.day > 0) && (dateNow.date == dailySignInActData.getAwardTime.day)) && (!(dailySignInActData.getAwardTime.flag))) && (ifSignInAll(dateNow.date))))
            {
                buttonGetAward.enabled = true;
            }
            else
            {
                buttonGetAward.enabled = false;
            };
            if (dailySignInActData.actDays[dateNow.date])
            {
                buttonSignIn.enabled = false;
            }
            else
            {
                buttonSignIn.enabled = true;
            };
        }

        public function set numberright29(_arg_1:Image):void
        {
            var _local_2:Object = this._221232646numberright29;
            if (_local_2 !== _arg_1)
            {
                this._221232646numberright29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright29", _local_2, _arg_1));
            };
        }

        public function set numberright21(_arg_1:Image):void
        {
            var _local_2:Object = this._221232654numberright21;
            if (_local_2 !== _arg_1)
            {
                this._221232654numberright21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright21", _local_2, _arg_1));
            };
        }

        public function set numberright17(_arg_1:Image):void
        {
            var _local_2:Object = this._221232679numberright17;
            if (_local_2 !== _arg_1)
            {
                this._221232679numberright17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright17", _local_2, _arg_1));
            };
        }

        public function set numberright31(_arg_1:Image):void
        {
            var _local_2:Object = this._221232623numberright31;
            if (_local_2 !== _arg_1)
            {
                this._221232623numberright31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright31", _local_2, _arg_1));
            };
        }

        public function set numberright30(_arg_1:Image):void
        {
            var _local_2:Object = this._221232624numberright30;
            if (_local_2 !== _arg_1)
            {
                this._221232624numberright30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright30", _local_2, _arg_1));
            };
        }

        public function set numberright34(_arg_1:Image):void
        {
            var _local_2:Object = this._221232620numberright34;
            if (_local_2 !== _arg_1)
            {
                this._221232620numberright34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright34", _local_2, _arg_1));
            };
        }

        public function set numberright35(_arg_1:Image):void
        {
            var _local_2:Object = this._221232619numberright35;
            if (_local_2 !== _arg_1)
            {
                this._221232619numberright35 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright35", _local_2, _arg_1));
            };
        }

        public function set numberright33(_arg_1:Image):void
        {
            var _local_2:Object = this._221232621numberright33;
            if (_local_2 !== _arg_1)
            {
                this._221232621numberright33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright33", _local_2, _arg_1));
            };
        }

        public function set numberright37(_arg_1:Image):void
        {
            var _local_2:Object = this._221232617numberright37;
            if (_local_2 !== _arg_1)
            {
                this._221232617numberright37 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright37", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get textLuckyDay():Text
        {
            return (this._1622748191textLuckyDay);
        }

        public function set critNum(_arg_1:Number):void
        {
            var _local_2:Object = this._1032778572critNum;
            if (_local_2 !== _arg_1)
            {
                this._1032778572critNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "critNum", _local_2, _arg_1));
            };
        }

        public function set numberright38(_arg_1:Image):void
        {
            var _local_2:Object = this._221232616numberright38;
            if (_local_2 !== _arg_1)
            {
                this._221232616numberright38 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright38", _local_2, _arg_1));
            };
        }

        public function set numberright39(_arg_1:Image):void
        {
            var _local_2:Object = this._221232615numberright39;
            if (_local_2 !== _arg_1)
            {
                this._221232615numberright39 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright39", _local_2, _arg_1));
            };
        }

        public function set numberright36(_arg_1:Image):void
        {
            var _local_2:Object = this._221232618numberright36;
            if (_local_2 !== _arg_1)
            {
                this._221232618numberright36 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright36", _local_2, _arg_1));
            };
        }

        public function set numberright1(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526110numberright1;
            if (_local_2 !== _arg_1)
            {
                this._1932526110numberright1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright1", _local_2, _arg_1));
            };
        }

        public function set numberright0(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526109numberright0;
            if (_local_2 !== _arg_1)
            {
                this._1932526109numberright0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright0", _local_2, _arg_1));
            };
        }

        public function set numberright4(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526113numberright4;
            if (_local_2 !== _arg_1)
            {
                this._1932526113numberright4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright4", _local_2, _arg_1));
            };
        }

        public function set numberright5(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526114numberright5;
            if (_local_2 !== _arg_1)
            {
                this._1932526114numberright5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright5", _local_2, _arg_1));
            };
        }

        public function set numberright32(_arg_1:Image):void
        {
            var _local_2:Object = this._221232622numberright32;
            if (_local_2 !== _arg_1)
            {
                this._221232622numberright32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright32", _local_2, _arg_1));
            };
        }

        public function set numberright3(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526112numberright3;
            if (_local_2 !== _arg_1)
            {
                this._1932526112numberright3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright3", _local_2, _arg_1));
            };
        }

        public function set numberright2(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526111numberright2;
            if (_local_2 !== _arg_1)
            {
                this._1932526111numberright2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright2", _local_2, _arg_1));
            };
        }

        public function set numberright7(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526116numberright7;
            if (_local_2 !== _arg_1)
            {
                this._1932526116numberright7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get playRule():Text
        {
            return (this._1878711376playRule);
        }

        public function set numberright8(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526117numberright8;
            if (_local_2 !== _arg_1)
            {
                this._1932526117numberright8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright8", _local_2, _arg_1));
            };
        }

        public function set numberright6(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526115numberright6;
            if (_local_2 !== _arg_1)
            {
                this._1932526115numberright6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright6", _local_2, _arg_1));
            };
        }

        public function set numberright40(_arg_1:Image):void
        {
            var _local_2:Object = this._221232593numberright40;
            if (_local_2 !== _arg_1)
            {
                this._221232593numberright40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright40", _local_2, _arg_1));
            };
        }

        public function set numberright41(_arg_1:Image):void
        {
            var _local_2:Object = this._221232592numberright41;
            if (_local_2 !== _arg_1)
            {
                this._221232592numberright41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright41", _local_2, _arg_1));
            };
        }

        public function set numberright9(_arg_1:Image):void
        {
            var _local_2:Object = this._1932526118numberright9;
            if (_local_2 !== _arg_1)
            {
                this._1932526118numberright9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get textSurpriseDay():Text
        {
            return (this._893311866textSurpriseDay);
        }

        public function set playRule(_arg_1:Text):void
        {
            var _local_2:Object = this._1878711376playRule;
            if (_local_2 !== _arg_1)
            {
                this._1878711376playRule = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playRule", _local_2, _arg_1));
            };
        }

        private function getAward():void
        {
            _core.remote.call("dailySignInActGetAward", new Responder(onDailySignInActGetAward));
        }

        public function set imsignin11(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834406imsignin11;
            if (_local_2 !== _arg_1)
            {
                this._1708834406imsignin11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin11", _local_2, _arg_1));
            };
        }

        public function __btnUpCirtical_click(_arg_1:MouseEvent):void
        {
            upCirticalProbablity();
        }

        public function set imsignin10(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834405imsignin10;
            if (_local_2 !== _arg_1)
            {
                this._1708834405imsignin10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin10", _local_2, _arg_1));
            };
        }

        public function set imsignin14(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834409imsignin14;
            if (_local_2 !== _arg_1)
            {
                this._1708834409imsignin14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin14", _local_2, _arg_1));
            };
        }

        public function setBtnsDailySignInAct(_arg_1:Object):void
        {
            dailySignInActData = _arg_1;
            setBtnsEnable();
        }

        public function set imsignin15(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834410imsignin15;
            if (_local_2 !== _arg_1)
            {
                this._1708834410imsignin15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin15", _local_2, _arg_1));
            };
        }

        public function set imsignin19(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834414imsignin19;
            if (_local_2 !== _arg_1)
            {
                this._1708834414imsignin19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin19", _local_2, _arg_1));
            };
        }

        public function set imsignin18(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834413imsignin18;
            if (_local_2 !== _arg_1)
            {
                this._1708834413imsignin18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin18", _local_2, _arg_1));
            };
        }

        public function ___DailySignInPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function oninitDailySignInActConsumeLimit(_arg_1:Number):void
        {
            consumeLimit.text = "";
            var _local_2:* = int(_arg_1);
            if (_local_2 >= 0)
            {
                consumeLimit.text = ("Trong thời gian sự kiện số vàng và điểm thưởng tiêu phí tích lũy:" + _local_2);
            };
        }

        public function set imsignin17(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834412imsignin17;
            if (_local_2 !== _arg_1)
            {
                this._1708834412imsignin17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin17", _local_2, _arg_1));
            };
        }

        public function set imsignin13(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834408imsignin13;
            if (_local_2 !== _arg_1)
            {
                this._1708834408imsignin13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin13", _local_2, _arg_1));
            };
        }

        public function set imsignin16(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834411imsignin16;
            if (_local_2 !== _arg_1)
            {
                this._1708834411imsignin16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin16", _local_2, _arg_1));
            };
        }

        public function set imsignin12(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834407imsignin12;
            if (_local_2 !== _arg_1)
            {
                this._1708834407imsignin12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft12():Image
        {
            return (this._1757036785numberleft12);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft13():Image
        {
            return (this._1757036786numberleft13);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft14():Image
        {
            return (this._1757036787numberleft14);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft15():Image
        {
            return (this._1757036788numberleft15);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft11():Image
        {
            return (this._1757036784numberleft11);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft19():Image
        {
            return (this._1757036792numberleft19);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft17():Image
        {
            return (this._1757036790numberleft17);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft16():Image
        {
            return (this._1757036789numberleft16);
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function set imsignin20(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834436imsignin20;
            if (_local_2 !== _arg_1)
            {
                this._1708834436imsignin20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin20", _local_2, _arg_1));
            };
        }

        public function set imsignin21(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834437imsignin21;
            if (_local_2 !== _arg_1)
            {
                this._1708834437imsignin21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin21", _local_2, _arg_1));
            };
        }

        public function set imsignin22(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834438imsignin22;
            if (_local_2 !== _arg_1)
            {
                this._1708834438imsignin22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin22", _local_2, _arg_1));
            };
        }

        public function set imsignin23(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834439imsignin23;
            if (_local_2 !== _arg_1)
            {
                this._1708834439imsignin23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin23", _local_2, _arg_1));
            };
        }

        public function set imsignin24(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834440imsignin24;
            if (_local_2 !== _arg_1)
            {
                this._1708834440imsignin24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin24", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft10():Image
        {
            return (this._1757036783numberleft10);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft25():Image
        {
            return (this._1757036819numberleft25);
        }

        public function set imsignin26(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834442imsignin26;
            if (_local_2 !== _arg_1)
            {
                this._1708834442imsignin26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin26", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft20():Image
        {
            return (this._1757036814numberleft20);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft22():Image
        {
            return (this._1757036816numberleft22);
        }

        public function set imsignin25(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834441imsignin25;
            if (_local_2 !== _arg_1)
            {
                this._1708834441imsignin25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin25", _local_2, _arg_1));
            };
        }

        public function set imsignin29(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834445imsignin29;
            if (_local_2 !== _arg_1)
            {
                this._1708834445imsignin29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin29", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft26():Image
        {
            return (this._1757036820numberleft26);
        }

        public function set imsignin27(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834443imsignin27;
            if (_local_2 !== _arg_1)
            {
                this._1708834443imsignin27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin27", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get consumeLimit():RoundedLabel
        {
            return (this._875332321consumeLimit);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground3():Image
        {
            return (this._2094228769imbackground3);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground0():Image
        {
            return (this._2094228766imbackground0);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground2():Image
        {
            return (this._2094228768imbackground2);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground4():Image
        {
            return (this._2094228770imbackground4);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground5():Image
        {
            return (this._2094228771imbackground5);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground7():Image
        {
            return (this._2094228773imbackground7);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground8():Image
        {
            return (this._2094228774imbackground8);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground1():Image
        {
            return (this._2094228767imbackground1);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft29():Image
        {
            return (this._1757036823numberleft29);
        }

        public function set imsignin28(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834444imsignin28;
            if (_local_2 !== _arg_1)
            {
                this._1708834444imsignin28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin28", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft21():Image
        {
            return (this._1757036815numberleft21);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground6():Image
        {
            return (this._2094228772imbackground6);
        }

        [Bindable(event="propertyChange")]
        public function get everyDayItem():ItemSlot
        {
            return (this._455359180everyDayItem);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground9():Image
        {
            return (this._2094228775imbackground9);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft27():Image
        {
            return (this._1757036821numberleft27);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft28():Image
        {
            return (this._1757036822numberleft28);
        }

        private function setLuckyDayCongLab():void
        {
            var _local_1:int = firstDay;
            if (_local_1 == 0)
            {
                _local_1 = 7;
            };
            var _local_2:Number = (8 - _local_1);
            var _local_3:Number = ((((_local_2 - 7) + Number(dailySignInActConf.luckyDay)) > 0) ? ((_local_2 - 7) + Number(dailySignInActConf.luckyDay)) : (_local_2 + Number(dailySignInActConf.luckyDay)));
            var _local_4:int = 1;
            var _local_5:int;
            while (_local_5 < 5)
            {
                if (dateNow.date <= (_local_3 + (7 * _local_5)))
                {
                    _local_4 = (_local_5 + 1);
                    break;
                };
                _local_5++;
            };
            textLuckyDay.htmlText = Language.DAILY_SIGNIN[3].replace("{day1}", weakArr[dailySignInActConf.luckyDay]).replace("{point}", dailySignInActConf.luckyPoint[_local_4]).replace("{gold}", dailySignInActConf.luckyGold[_local_4]);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft37():Image
        {
            return (this._1757036852numberleft37);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft30():Image
        {
            return (this._1757036845numberleft30);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft18():Image
        {
            return (this._1757036791numberleft18);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft24():Image
        {
            return (this._1757036818numberleft24);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft34():Image
        {
            return (this._1757036849numberleft34);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft35():Image
        {
            return (this._1757036850numberleft35);
        }

        private function getTheFirstDayByMonth(_arg_1:Number, _arg_2:Number):Number
        {
            var _local_3:Date = new Date(_arg_1, _arg_2, 1);
            var _local_4:Number = _local_3.getDay();
            return (_local_4);
        }

        public function onDailySignInActDoSignin(_arg_1:Object):*
        {
            if (!_arg_1)
            {
                return;
            };
            dailySignInActData = _arg_1["data"];
            critNum = dailySignInActData.crit;
            var _local_2:int = ((firstDay + _arg_1["date"]) - 1);
            this[("imsignin" + _local_2)].source = ResManager.getIconUrl(4130220000884);
            if (dailySignInActData.actDays[dateNow.date])
            {
                buttonSignIn.enabled = false;
            };
            setBtnsEnable();
        }

        public function set imsignin30(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834467imsignin30;
            if (_local_2 !== _arg_1)
            {
                this._1708834467imsignin30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin30", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft32():Image
        {
            return (this._1757036847numberleft32);
        }

        public function set imsignin32(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834469imsignin32;
            if (_local_2 !== _arg_1)
            {
                this._1708834469imsignin32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin32", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft36():Image
        {
            return (this._1757036851numberleft36);
        }

        public function set imsignin33(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834470imsignin33;
            if (_local_2 !== _arg_1)
            {
                this._1708834470imsignin33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin33", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft38():Image
        {
            return (this._1757036853numberleft38);
        }

        public function set imsignin31(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834468imsignin31;
            if (_local_2 !== _arg_1)
            {
                this._1708834468imsignin31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin31", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft40():Image
        {
            return (this._1757036876numberleft40);
        }

        public function set imsignin34(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834471imsignin34;
            if (_local_2 !== _arg_1)
            {
                this._1708834471imsignin34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin34", _local_2, _arg_1));
            };
        }

        public function set imsignin38(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834475imsignin38;
            if (_local_2 !== _arg_1)
            {
                this._1708834475imsignin38 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin38", _local_2, _arg_1));
            };
        }

        public function set imsignin39(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834476imsignin39;
            if (_local_2 !== _arg_1)
            {
                this._1708834476imsignin39 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin39", _local_2, _arg_1));
            };
        }

        public function set imsignin36(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834473imsignin36;
            if (_local_2 !== _arg_1)
            {
                this._1708834473imsignin36 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin36", _local_2, _arg_1));
            };
        }

        public function set imsignin37(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834474imsignin37;
            if (_local_2 !== _arg_1)
            {
                this._1708834474imsignin37 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin37", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberleft33():Image
        {
            return (this._1757036848numberleft33);
        }

        [Bindable(event="propertyChange")]
        public function get lbNowData():Label
        {
            return (this._860835146lbNowData);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft23():Image
        {
            return (this._1757036817numberleft23);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft31():Image
        {
            return (this._1757036846numberleft31);
        }

        public function set imsignin35(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834472imsignin35;
            if (_local_2 !== _arg_1)
            {
                this._1708834472imsignin35 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin35", _local_2, _arg_1));
            };
        }

        public function set textSurpriseDay(_arg_1:Text):void
        {
            var _local_2:Object = this._893311866textSurpriseDay;
            if (_local_2 !== _arg_1)
            {
                this._893311866textSurpriseDay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textSurpriseDay", _local_2, _arg_1));
            };
        }

        public function set imsignin41(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834499imsignin41;
            if (_local_2 !== _arg_1)
            {
                this._1708834499imsignin41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin41", _local_2, _arg_1));
            };
        }

        public function set imsignin40(_arg_1:Image):void
        {
            var _local_2:Object = this._1708834498imsignin40;
            if (_local_2 !== _arg_1)
            {
                this._1708834498imsignin40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin40", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lbNowCirtical():Label
        {
            return (this._1914146189lbNowCirtical);
        }

        private function onInitDailySignInActData(_arg_1:Object):void
        {
            var _local_7:*;
            var _local_10:Number;
            var _local_11:int;
            var _local_12:int;
            if (!_arg_1)
            {
                return;
            };
            dateNow = _arg_1["time"];
            dailySignInActConf = _arg_1["conf"];
            dailySignInActData = _arg_1["data"];
            firstDay = getTheFirstDayByMonth(dateNow.year, (dateNow.month - 1));
            var _local_2:Number = getTheDaysNumberByMonth(dateNow.year, dateNow.month);
            lbNowData.htmlText = Language.DAILY_SIGNIN[8].replace("{year}", dateNow.year).replace("{month}", dateNow.month);
            textSurpriseDay.htmlText = Language.DAILY_SIGNIN[2].replace("{day}", weakArr[dailySignInActConf.surpriseDay]);
            setLuckyDayCongLab();
            var _local_3:Object = {};
            var _local_4:int = 1;
            var _local_5:int = 1;
            var _local_6:String = Language.DAILY_SIGNIN[5];
            for (_local_7 in dailySignInActConf.iInfo)
            {
                if (dailySignInActConf.iInfo[_local_7].inc == 1)
                {
                    if (_local_5 > 1) continue;
                    everyDayItem.type = GamePredef.TBL_ITEM_TEMPLATE;
                    everyDayItem.giid = dailySignInActConf.iInfo[_local_7].iid;
                    everyDayItem.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][dailySignInActConf.iInfo[_local_7].iid];
                    everyDayItem.stackNum = dailySignInActConf.iInfo[_local_7].number;
                    _local_5++;
                }
                else
                {
                    if (dailySignInActConf.iInfo[_local_7].inc == 2)
                    {
                        if (_local_4 > 5) continue;
                        this[("surpriseDayItem" + _local_4)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("surpriseDayItem" + _local_4)].giid = dailySignInActConf.iInfo[_local_7].iid;
                        this[("surpriseDayItem" + _local_4)].slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][dailySignInActConf.iInfo[_local_7].iid];
                        this[("surpriseDayItem" + _local_4)].stackNum = dailySignInActConf.iInfo[_local_7].number;
                        _local_4++;
                    }
                    else
                    {
                        if (dailySignInActConf.iInfo[_local_7].inc == 4)
                        {
                            _local_6 = (_local_6 + (((GameData.d[GamePredef.TBL_ITEM_TEMPLATE][dailySignInActConf.iInfo[_local_7].iid].name + "*") + dailySignInActConf.iInfo[_local_7].number) + "、"));
                        };
                    };
                };
            };
            playRule.htmlText = (_local_6.substr(0, (_local_6.length - 1)) + "。");
            if (dailySignInActConf.closeOnKey == 0)
            {
                setButtonUpCircle(false);
            }
            else
            {
                setButtonUpCircle(true);
            };
            var _local_8:int;
            while (_local_8 < 42)
            {
                this[("numberleft" + _local_8)].source = null;
                this[("numberright" + _local_8)].source = null;
                this[("imbackground" + _local_8)].source = null;
                this[("imsignin" + _local_8)].source = null;
                _local_8++;
            };
            var _local_9:int;
            while (_local_9 < _local_2)
            {
                _local_10 = (firstDay + _local_9);
                _local_11 = int(((_local_9 + 1) / 10));
                _local_12 = ((_local_9 + 1) % 10);
                this[("numberleft" + _local_10)].source = ResManager.getIconUrl(resNumber[_local_11]);
                this[("numberright" + _local_10)].source = ResManager.getIconUrl(resNumber[_local_12]);
                if ((_local_10 % 7) == (dailySignInActConf.surpriseDay % 7))
                {
                    this[("imbackground" + _local_10)].source = ResManager.getIconUrl(4130220000881);
                }
                else
                {
                    if ((_local_10 % 7) == (dailySignInActConf.luckyDay % 7))
                    {
                        this[("imbackground" + _local_10)].source = ResManager.getIconUrl(4130220000880);
                    };
                };
                if (dailySignInActData.actDays[(_local_9 + 1)])
                {
                    this[("imsignin" + _local_10)].source = ResManager.getIconUrl(4130220000884);
                };
                _local_9++;
            };
            setBtnsEnable();
            critNum = dailySignInActData.crit;
        }

        [Bindable(event="propertyChange")]
        public function get numberleft41():Image
        {
            return (this._1757036877numberleft41);
        }

        [Bindable(event="propertyChange")]
        public function get buttonSignIn():Button
        {
            return (this._939184532buttonSignIn);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft39():Image
        {
            return (this._1757036854numberleft39);
        }

        private function setButtonUpCircle(_arg_1:Boolean):void
        {
            lbNowCirtical.visible = _arg_1;
            btnUpCirtical.visible = _arg_1;
        }

        private function toRetroactive():void
        {
            if (ifSignInAll((Number(dateNow.date) - 1)))
            {
                Alert.show(Language.DAILY_SIGNIN[17].toString(), "", Alert.YES);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("dailySignInActRetroactive", null);
                };
            };
            Alert.show(Language.DAILY_SIGNIN[13].toString().replace("{num}", dailySignInActConf.retroactivePrice), "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get vsFlop():ViewStack
        {
            return (this._808329852vsFlop);
        }

        private function upCirticalProbablity():void
        {
            if (!dailySignInActConf)
            {
                return;
            };
            if (critNum >= 100)
            {
                Alert.show(Language.DAILY_SIGNIN[16].toString(), "", Alert.YES);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("dailySignInUpActCrit", null);
                };
            };
            Alert.show(Language.DAILY_SIGNIN[14].toString().replace("{num}", dailySignInActConf.critPrice), "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get numberright12():Image
        {
            return (this._221232684numberright12);
        }

        private function getTheDaysNumberByMonth(_arg_1:Number, _arg_2:Number):Number
        {
            var _local_3:Date = new Date(_arg_1, _arg_2);
            var _local_4:Number = _local_3.dateUTC;
            return (_local_4);
        }

        [Bindable(event="propertyChange")]
        public function get numberright14():Image
        {
            return (this._221232682numberright14);
        }

        [Bindable(event="propertyChange")]
        public function get numberright19():Image
        {
            return (this._221232677numberright19);
        }

        [Bindable(event="propertyChange")]
        public function get numberright13():Image
        {
            return (this._221232683numberright13);
        }

        private function onDailySignInActGetAward(_arg_1:Number):void
        {
            if (_arg_1)
            {
                buttonGetAward.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright16():Image
        {
            return (this._221232680numberright16);
        }

        public function set numberleft11(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036784numberleft11;
            if (_local_2 !== _arg_1)
            {
                this._1757036784numberleft11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright10():Image
        {
            return (this._221232686numberright10);
        }

        private function ifSignInAll(_arg_1:Number):*
        {
            var _local_2:Object = dailySignInActData.actDays;
            var _local_3:Number = getTheFirstDateThisMonth();
            var _local_4:Number = _local_3;
            while (_local_4 <= _arg_1)
            {
                if (!_local_2[_local_4])
                {
                    return (false);
                };
                _local_4++;
            };
            return (true);
        }

        public function set imbackground12(_arg_1:Image):void
        {
            var _local_2:Object = this._496582387imbackground12;
            if (_local_2 !== _arg_1)
            {
                this._496582387imbackground12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground12", _local_2, _arg_1));
            };
        }

        public function set imbackground13(_arg_1:Image):void
        {
            var _local_2:Object = this._496582388imbackground13;
            if (_local_2 !== _arg_1)
            {
                this._496582388imbackground13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground13", _local_2, _arg_1));
            };
        }

        public function set imbackground10(_arg_1:Image):void
        {
            var _local_2:Object = this._496582385imbackground10;
            if (_local_2 !== _arg_1)
            {
                this._496582385imbackground10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground10", _local_2, _arg_1));
            };
        }

        public function set imbackground14(_arg_1:Image):void
        {
            var _local_2:Object = this._496582389imbackground14;
            if (_local_2 !== _arg_1)
            {
                this._496582389imbackground14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground14", _local_2, _arg_1));
            };
        }

        public function set numberleft10(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036783numberleft10;
            if (_local_2 !== _arg_1)
            {
                this._1757036783numberleft10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft10", _local_2, _arg_1));
            };
        }

        public function set imbackground16(_arg_1:Image):void
        {
            var _local_2:Object = this._496582391imbackground16;
            if (_local_2 !== _arg_1)
            {
                this._496582391imbackground16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground16", _local_2, _arg_1));
            };
        }

        public function set numberleft15(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036788numberleft15;
            if (_local_2 !== _arg_1)
            {
                this._1757036788numberleft15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft15", _local_2, _arg_1));
            };
        }

        public function set numberleft12(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036785numberleft12;
            if (_local_2 !== _arg_1)
            {
                this._1757036785numberleft12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft12", _local_2, _arg_1));
            };
        }

        public function set imbackground11(_arg_1:Image):void
        {
            var _local_2:Object = this._496582386imbackground11;
            if (_local_2 !== _arg_1)
            {
                this._496582386imbackground11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground11", _local_2, _arg_1));
            };
        }

        public function set numberleft14(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036787numberleft14;
            if (_local_2 !== _arg_1)
            {
                this._1757036787numberleft14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright25():Image
        {
            return (this._221232650numberright25);
        }

        public function set imbackground17(_arg_1:Image):void
        {
            var _local_2:Object = this._496582392imbackground17;
            if (_local_2 !== _arg_1)
            {
                this._496582392imbackground17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground17", _local_2, _arg_1));
            };
        }

        public function set numberleft13(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036786numberleft13;
            if (_local_2 !== _arg_1)
            {
                this._1757036786numberleft13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft13", _local_2, _arg_1));
            };
        }

        public function set numberleft18(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036791numberleft18;
            if (_local_2 !== _arg_1)
            {
                this._1757036791numberleft18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft18", _local_2, _arg_1));
            };
        }

        public function set numberleft19(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036792numberleft19;
            if (_local_2 !== _arg_1)
            {
                this._1757036792numberleft19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft19", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get buttonGetAward():BasicGlowButton
        {
            return (this._2043717127buttonGetAward);
        }

        [Bindable(event="propertyChange")]
        public function get numberright17():Image
        {
            return (this._221232679numberright17);
        }

        [Bindable(event="propertyChange")]
        public function get numberright28():Image
        {
            return (this._221232647numberright28);
        }

        public function set imbackground18(_arg_1:Image):void
        {
            var _local_2:Object = this._496582393imbackground18;
            if (_local_2 !== _arg_1)
            {
                this._496582393imbackground18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground18", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright22():Image
        {
            return (this._221232653numberright22);
        }

        [Bindable(event="propertyChange")]
        public function get numberright24():Image
        {
            return (this._221232651numberright24);
        }

        [Bindable(event="propertyChange")]
        public function get numberright26():Image
        {
            return (this._221232649numberright26);
        }

        [Bindable(event="propertyChange")]
        public function get numberright15():Image
        {
            return (this._221232681numberright15);
        }

        [Bindable(event="propertyChange")]
        public function get numberright31():Image
        {
            return (this._221232623numberright31);
        }

        [Bindable(event="propertyChange")]
        public function get numberright21():Image
        {
            return (this._221232654numberright21);
        }

        [Bindable(event="propertyChange")]
        public function get numberright35():Image
        {
            return (this._221232619numberright35);
        }

        public function set numberleft16(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036789numberleft16;
            if (_local_2 !== _arg_1)
            {
                this._1757036789numberleft16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft16", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright38():Image
        {
            return (this._221232616numberright38);
        }

        [Bindable(event="propertyChange")]
        public function get numberright27():Image
        {
            return (this._221232648numberright27);
        }

        [Bindable(event="propertyChange")]
        public function get numberright34():Image
        {
            return (this._221232620numberright34);
        }

        public function set numberleft20(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036814numberleft20;
            if (_local_2 !== _arg_1)
            {
                this._1757036814numberleft20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft20", _local_2, _arg_1));
            };
        }

        public function set imbackground20(_arg_1:Image):void
        {
            var _local_2:Object = this._496582416imbackground20;
            if (_local_2 !== _arg_1)
            {
                this._496582416imbackground20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground20", _local_2, _arg_1));
            };
        }

        public function set imbackground19(_arg_1:Image):void
        {
            var _local_2:Object = this._496582394imbackground19;
            if (_local_2 !== _arg_1)
            {
                this._496582394imbackground19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground19", _local_2, _arg_1));
            };
        }

        public function set imbackground21(_arg_1:Image):void
        {
            var _local_2:Object = this._496582417imbackground21;
            if (_local_2 !== _arg_1)
            {
                this._496582417imbackground21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground21", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright6():Image
        {
            return (this._1932526115numberright6);
        }

        public function set imbackground15(_arg_1:Image):void
        {
            var _local_2:Object = this._496582390imbackground15;
            if (_local_2 !== _arg_1)
            {
                this._496582390imbackground15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground15", _local_2, _arg_1));
            };
        }

        public function set imbackground24(_arg_1:Image):void
        {
            var _local_2:Object = this._496582420imbackground24;
            if (_local_2 !== _arg_1)
            {
                this._496582420imbackground24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground24", _local_2, _arg_1));
            };
        }

        public function set numberleft23(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036817numberleft23;
            if (_local_2 !== _arg_1)
            {
                this._1757036817numberleft23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft23", _local_2, _arg_1));
            };
        }

        public function set imbackground22(_arg_1:Image):void
        {
            var _local_2:Object = this._496582418imbackground22;
            if (_local_2 !== _arg_1)
            {
                this._496582418imbackground22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground22", _local_2, _arg_1));
            };
        }

        public function set imbackground26(_arg_1:Image):void
        {
            var _local_2:Object = this._496582422imbackground26;
            if (_local_2 !== _arg_1)
            {
                this._496582422imbackground26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground26", _local_2, _arg_1));
            };
        }

        public function set imbackground23(_arg_1:Image):void
        {
            var _local_2:Object = this._496582419imbackground23;
            if (_local_2 !== _arg_1)
            {
                this._496582419imbackground23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground23", _local_2, _arg_1));
            };
        }

        public function set imbackground27(_arg_1:Image):void
        {
            var _local_2:Object = this._496582423imbackground27;
            if (_local_2 !== _arg_1)
            {
                this._496582423imbackground27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground27", _local_2, _arg_1));
            };
        }

        public function set numberleft22(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036816numberleft22;
            if (_local_2 !== _arg_1)
            {
                this._1757036816numberleft22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft22", _local_2, _arg_1));
            };
        }

        public function set numberleft24(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036818numberleft24;
            if (_local_2 !== _arg_1)
            {
                this._1757036818numberleft24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft24", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright32():Image
        {
            return (this._221232622numberright32);
        }

        public function set numberleft25(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036819numberleft25;
            if (_local_2 !== _arg_1)
            {
                this._1757036819numberleft25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft25", _local_2, _arg_1));
            };
        }

        public function set imbackground28(_arg_1:Image):void
        {
            var _local_2:Object = this._496582424imbackground28;
            if (_local_2 !== _arg_1)
            {
                this._496582424imbackground28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground28", _local_2, _arg_1));
            };
        }

        public function set imbackground25(_arg_1:Image):void
        {
            var _local_2:Object = this._496582421imbackground25;
            if (_local_2 !== _arg_1)
            {
                this._496582421imbackground25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground25", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright23():Image
        {
            return (this._221232652numberright23);
        }

        public function set consumeLimit(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._875332321consumeLimit;
            if (_local_2 !== _arg_1)
            {
                this._875332321consumeLimit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeLimit", _local_2, _arg_1));
            };
        }

        private function getTheFirstDateThisMonth():*
        {
            var _local_1:Date = new Date(dailySignInActConf.start);
            var _local_2:* = (_local_1.getMonth() + 1);
            var _local_3:* = _local_1.getFullYear();
            if (((_local_3 == dailySignInActData.actYear) && (_local_2 == dailySignInActData.actMonth)))
            {
                return (_local_1.getDate());
            };
            return (1);
        }

        public function set imbackground29(_arg_1:Image):void
        {
            var _local_2:Object = this._496582425imbackground29;
            if (_local_2 !== _arg_1)
            {
                this._496582425imbackground29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground29", _local_2, _arg_1));
            };
        }

        public function set imbackground3(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228769imbackground3;
            if (_local_2 !== _arg_1)
            {
                this._2094228769imbackground3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground3", _local_2, _arg_1));
            };
        }

        public function set imbackground0(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228766imbackground0;
            if (_local_2 !== _arg_1)
            {
                this._2094228766imbackground0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground0", _local_2, _arg_1));
            };
        }

        public function set imbackground1(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228767imbackground1;
            if (_local_2 !== _arg_1)
            {
                this._2094228767imbackground1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground1", _local_2, _arg_1));
            };
        }

        public function set imbackground5(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228771imbackground5;
            if (_local_2 !== _arg_1)
            {
                this._2094228771imbackground5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground5", _local_2, _arg_1));
            };
        }

        public function set imbackground2(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228768imbackground2;
            if (_local_2 !== _arg_1)
            {
                this._2094228768imbackground2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright30():Image
        {
            return (this._221232624numberright30);
        }

        public function set imbackground7(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228773imbackground7;
            if (_local_2 !== _arg_1)
            {
                this._2094228773imbackground7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground7", _local_2, _arg_1));
            };
        }

        public function set imbackground4(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228770imbackground4;
            if (_local_2 !== _arg_1)
            {
                this._2094228770imbackground4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground4", _local_2, _arg_1));
            };
        }

        public function set numberleft29(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036823numberleft29;
            if (_local_2 !== _arg_1)
            {
                this._1757036823numberleft29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft29", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright40():Image
        {
            return (this._221232593numberright40);
        }

        public function set imsignin0(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086294imsignin0;
            if (_local_2 !== _arg_1)
            {
                this._2023086294imsignin0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin0", _local_2, _arg_1));
            };
        }

        public function set imbackground9(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228775imbackground9;
            if (_local_2 !== _arg_1)
            {
                this._2094228775imbackground9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground9", _local_2, _arg_1));
            };
        }

        public function set btnUpCirtical(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1790492452btnUpCirtical;
            if (_local_2 !== _arg_1)
            {
                this._1790492452btnUpCirtical = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnUpCirtical", _local_2, _arg_1));
            };
        }

        public function set numberleft28(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036822numberleft28;
            if (_local_2 !== _arg_1)
            {
                this._1757036822numberleft28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft28", _local_2, _arg_1));
            };
        }

        public function set imsignin3(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086291imsignin3;
            if (_local_2 !== _arg_1)
            {
                this._2023086291imsignin3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin3", _local_2, _arg_1));
            };
        }

        public function set imbackground8(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228774imbackground8;
            if (_local_2 !== _arg_1)
            {
                this._2094228774imbackground8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground8", _local_2, _arg_1));
            };
        }

        public function set imsignin4(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086290imsignin4;
            if (_local_2 !== _arg_1)
            {
                this._2023086290imsignin4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin4", _local_2, _arg_1));
            };
        }

        public function set imbackground30(_arg_1:Image):void
        {
            var _local_2:Object = this._496582447imbackground30;
            if (_local_2 !== _arg_1)
            {
                this._496582447imbackground30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground30", _local_2, _arg_1));
            };
        }

        public function set imsignin2(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086292imsignin2;
            if (_local_2 !== _arg_1)
            {
                this._2023086292imsignin2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin2", _local_2, _arg_1));
            };
        }

        public function set imbackground31(_arg_1:Image):void
        {
            var _local_2:Object = this._496582448imbackground31;
            if (_local_2 !== _arg_1)
            {
                this._496582448imbackground31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground31", _local_2, _arg_1));
            };
        }

        public function set numberleft26(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036820numberleft26;
            if (_local_2 !== _arg_1)
            {
                this._1757036820numberleft26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft26", _local_2, _arg_1));
            };
        }

        public function set imbackground32(_arg_1:Image):void
        {
            var _local_2:Object = this._496582449imbackground32;
            if (_local_2 !== _arg_1)
            {
                this._496582449imbackground32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground32", _local_2, _arg_1));
            };
        }

        public function set numberleft27(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036821numberleft27;
            if (_local_2 !== _arg_1)
            {
                this._1757036821numberleft27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft27", _local_2, _arg_1));
            };
        }

        public function set imbackground33(_arg_1:Image):void
        {
            var _local_2:Object = this._496582450imbackground33;
            if (_local_2 !== _arg_1)
            {
                this._496582450imbackground33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground33", _local_2, _arg_1));
            };
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        public function set imbackground34(_arg_1:Image):void
        {
            var _local_2:Object = this._496582451imbackground34;
            if (_local_2 !== _arg_1)
            {
                this._496582451imbackground34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground34", _local_2, _arg_1));
            };
        }

        public function set everyDayItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._455359180everyDayItem;
            if (_local_2 !== _arg_1)
            {
                this._455359180everyDayItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "everyDayItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin14():Image
        {
            return (this._1708834409imsignin14);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin11():Image
        {
            return (this._1708834406imsignin11);
        }

        public function set imbackground38(_arg_1:Image):void
        {
            var _local_2:Object = this._496582455imbackground38;
            if (_local_2 !== _arg_1)
            {
                this._496582455imbackground38 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground38", _local_2, _arg_1));
            };
        }

        private function _DailySignInPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DAILY_SIGNIN[0];
            _local_1 = Language.DAILY_SIGNIN[6];
            _local_1 = Language.DAILY_SIGNIN[7];
            _local_1 = ResManager.getIconUrl(4130220000883);
            _local_1 = Language.DAILY_SIGNIN[1];
            _local_1 = ResManager.getIconUrl(4130220000882);
            _local_1 = Language.DAILY_SIGNIN[2];
            _local_1 = Language.DAILY_SIGNIN[3];
            _local_1 = Language.DAILY_SIGNIN[10];
            _local_1 = Language.DAILY_SIGNIN[4];
            _local_1 = Language.DAILY_SIGNIN[8];
            _local_1 = Language.DAILY_SIGNIN[9].replace("{num}", critNum);
            _local_1 = Language.DAILY_SIGNIN[11];
            _local_1 = Language.DAILY_SIGNIN[12];
        }

        public function set imbackground36(_arg_1:Image):void
        {
            var _local_2:Object = this._496582453imbackground36;
            if (_local_2 !== _arg_1)
            {
                this._496582453imbackground36 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground36", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin16():Image
        {
            return (this._1708834411imsignin16);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin10():Image
        {
            return (this._1708834405imsignin10);
        }

        private function changeView(_arg_1:Number):void
        {
            vsFlop.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 2)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
        }

        [Bindable(event="propertyChange")]
        public function get imsignin12():Image
        {
            return (this._1708834407imsignin12);
        }

        public function set imbackground35(_arg_1:Image):void
        {
            var _local_2:Object = this._496582452imbackground35;
            if (_local_2 !== _arg_1)
            {
                this._496582452imbackground35 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground35", _local_2, _arg_1));
            };
        }

        public function set imsignin1(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086293imsignin1;
            if (_local_2 !== _arg_1)
            {
                this._2023086293imsignin1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin15():Image
        {
            return (this._1708834410imsignin15);
        }

        public function updateDailySignInActCrit(_arg_1:Number):*
        {
            critNum = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get imsignin19():Image
        {
            return (this._1708834414imsignin19);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin13():Image
        {
            return (this._1708834408imsignin13);
        }

        public function set imbackground6(_arg_1:Image):void
        {
            var _local_2:Object = this._2094228772imbackground6;
            if (_local_2 !== _arg_1)
            {
                this._2094228772imbackground6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin18():Image
        {
            return (this._1708834413imsignin18);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin22():Image
        {
            return (this._1708834438imsignin22);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin23():Image
        {
            return (this._1708834439imsignin23);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin25():Image
        {
            return (this._1708834441imsignin25);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin26():Image
        {
            return (this._1708834442imsignin26);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin21():Image
        {
            return (this._1708834437imsignin21);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin29():Image
        {
            return (this._1708834445imsignin29);
        }

        public function set imbackground37(_arg_1:Image):void
        {
            var _local_2:Object = this._496582454imbackground37;
            if (_local_2 !== _arg_1)
            {
                this._496582454imbackground37 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground37", _local_2, _arg_1));
            };
        }

        public function ___DailySignInPanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            toRetroactive();
        }

        [Bindable(event="propertyChange")]
        public function get numberright0():Image
        {
            return (this._1932526109numberright0);
        }

        public function set imsignin8(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086286imsignin8;
            if (_local_2 !== _arg_1)
            {
                this._2023086286imsignin8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin8", _local_2, _arg_1));
            };
        }

        public function set lbNowData(_arg_1:Label):void
        {
            var _local_2:Object = this._860835146lbNowData;
            if (_local_2 !== _arg_1)
            {
                this._860835146lbNowData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lbNowData", _local_2, _arg_1));
            };
        }

        public function set numberleft17(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036790numberleft17;
            if (_local_2 !== _arg_1)
            {
                this._1757036790numberleft17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft17", _local_2, _arg_1));
            };
        }

        public function set surpriseDayItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2071124149surpriseDayItem1;
            if (_local_2 !== _arg_1)
            {
                this._2071124149surpriseDayItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "surpriseDayItem1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin24():Image
        {
            return (this._1708834440imsignin24);
        }

        private function _DailySignInPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DailySignInPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_DailySignInPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000883));
            }, function (_arg_1:Object):void
            {
                _DailySignInPanel_Image1.source = _arg_1;
            }, "_DailySignInPanel_Image1.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DailySignInPanel_Label1.text = _arg_1;
            }, "_DailySignInPanel_Label1.text");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000882));
            }, function (_arg_1:Object):void
            {
                everyDayItem.setStyle("backgroundImage", _arg_1);
            }, "everyDayItem.backgroundImage");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                textSurpriseDay.text = _arg_1;
            }, "textSurpriseDay.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                textLuckyDay.text = _arg_1;
            }, "textLuckyDay.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buttonGetAward.label = _arg_1;
            }, "buttonGetAward.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DailySignInPanel_Text3.text = _arg_1;
            }, "_DailySignInPanel_Text3.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lbNowData.text = _arg_1;
            }, "lbNowData.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[9].replace("{num}", critNum);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lbNowCirtical.text = _arg_1;
            }, "lbNowCirtical.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnUpCirtical.label = _arg_1;
            }, "btnUpCirtical.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DAILY_SIGNIN[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DailySignInPanel_BasicGlowButton5.label = _arg_1;
            }, "_DailySignInPanel_BasicGlowButton5.label");
            result[13] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin27():Image
        {
            return (this._1708834443imsignin27);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin28():Image
        {
            return (this._1708834444imsignin28);
        }

        public function set imbackground39(_arg_1:Image):void
        {
            var _local_2:Object = this._496582456imbackground39;
            if (_local_2 !== _arg_1)
            {
                this._496582456imbackground39 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground39", _local_2, _arg_1));
            };
        }

        public function set imbackground41(_arg_1:Image):void
        {
            var _local_2:Object = this._496582479imbackground41;
            if (_local_2 !== _arg_1)
            {
                this._496582479imbackground41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground41", _local_2, _arg_1));
            };
        }

        public function set imsignin9(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086285imsignin9;
            if (_local_2 !== _arg_1)
            {
                this._2023086285imsignin9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin9", _local_2, _arg_1));
            };
        }

        public function set numberleft37(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036852numberleft37;
            if (_local_2 !== _arg_1)
            {
                this._1757036852numberleft37 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft37", _local_2, _arg_1));
            };
        }

        public function set imbackground40(_arg_1:Image):void
        {
            var _local_2:Object = this._496582478imbackground40;
            if (_local_2 !== _arg_1)
            {
                this._496582478imbackground40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imbackground40", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin17():Image
        {
            return (this._1708834412imsignin17);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin20():Image
        {
            return (this._1708834436imsignin20);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin34():Image
        {
            return (this._1708834471imsignin34);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin35():Image
        {
            return (this._1708834472imsignin35);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin36():Image
        {
            return (this._1708834473imsignin36);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin31():Image
        {
            return (this._1708834468imsignin31);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin32():Image
        {
            return (this._1708834469imsignin32);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin33():Image
        {
            return (this._1708834470imsignin33);
        }

        [Bindable(event="propertyChange")]
        public function get numberright39():Image
        {
            return (this._221232615numberright39);
        }

        public function set numberleft31(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036846numberleft31;
            if (_local_2 !== _arg_1)
            {
                this._1757036846numberleft31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft31", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin37():Image
        {
            return (this._1708834474imsignin37);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin39():Image
        {
            return (this._1708834476imsignin39);
        }

        public function set imsignin6(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086288imsignin6;
            if (_local_2 !== _arg_1)
            {
                this._2023086288imsignin6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin6", _local_2, _arg_1));
            };
        }

        public function set imsignin7(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086287imsignin7;
            if (_local_2 !== _arg_1)
            {
                this._2023086287imsignin7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright29():Image
        {
            return (this._221232646numberright29);
        }

        public function set numberleft35(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036850numberleft35;
            if (_local_2 !== _arg_1)
            {
                this._1757036850numberleft35 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft35", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin38():Image
        {
            return (this._1708834475imsignin38);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin30():Image
        {
            return (this._1708834467imsignin30);
        }

        [Bindable(event="propertyChange")]
        public function get numberright36():Image
        {
            return (this._221232618numberright36);
        }

        public function set imsignin5(_arg_1:Image):void
        {
            var _local_2:Object = this._2023086289imsignin5;
            if (_local_2 !== _arg_1)
            {
                this._2023086289imsignin5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imsignin5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin41():Image
        {
            return (this._1708834499imsignin41);
        }

        public function set numberleft2(_arg_1:Image):void
        {
            var _local_2:Object = this._749415266numberleft2;
            if (_local_2 !== _arg_1)
            {
                this._749415266numberleft2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft2", _local_2, _arg_1));
            };
        }

        public function set numberleft4(_arg_1:Image):void
        {
            var _local_2:Object = this._749415268numberleft4;
            if (_local_2 !== _arg_1)
            {
                this._749415268numberleft4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft4", _local_2, _arg_1));
            };
        }

        public function set numberleft5(_arg_1:Image):void
        {
            var _local_2:Object = this._749415269numberleft5;
            if (_local_2 !== _arg_1)
            {
                this._749415269numberleft5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright5():Image
        {
            return (this._1932526114numberright5);
        }

        public function set numberleft0(_arg_1:Image):void
        {
            var _local_2:Object = this._749415264numberleft0;
            if (_local_2 !== _arg_1)
            {
                this._749415264numberleft0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin40():Image
        {
            return (this._1708834498imsignin40);
        }

        public function set numberleft9(_arg_1:Image):void
        {
            var _local_2:Object = this._749415273numberleft9;
            if (_local_2 !== _arg_1)
            {
                this._749415273numberleft9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright37():Image
        {
            return (this._221232617numberright37);
        }

        public function set numberleft3(_arg_1:Image):void
        {
            var _local_2:Object = this._749415267numberleft3;
            if (_local_2 !== _arg_1)
            {
                this._749415267numberleft3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft3", _local_2, _arg_1));
            };
        }

        public function set numberleft36(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036851numberleft36;
            if (_local_2 !== _arg_1)
            {
                this._1757036851numberleft36 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft36", _local_2, _arg_1));
            };
        }

        public function set numberleft1(_arg_1:Image):void
        {
            var _local_2:Object = this._749415265numberleft1;
            if (_local_2 !== _arg_1)
            {
                this._749415265numberleft1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft1", _local_2, _arg_1));
            };
        }

        public function set numberleft21(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036815numberleft21;
            if (_local_2 !== _arg_1)
            {
                this._1757036815numberleft21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft21", _local_2, _arg_1));
            };
        }

        public function set numberleft39(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036854numberleft39;
            if (_local_2 !== _arg_1)
            {
                this._1757036854numberleft39 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft39", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright7():Image
        {
            return (this._1932526116numberright7);
        }

        public function set numberleft32(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036847numberleft32;
            if (_local_2 !== _arg_1)
            {
                this._1757036847numberleft32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft32", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright9():Image
        {
            return (this._1932526118numberright9);
        }

        public function set numberleft33(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036848numberleft33;
            if (_local_2 !== _arg_1)
            {
                this._1757036848numberleft33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft33", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright33():Image
        {
            return (this._221232621numberright33);
        }

        public function set numberleft34(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036849numberleft34;
            if (_local_2 !== _arg_1)
            {
                this._1757036849numberleft34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft34", _local_2, _arg_1));
            };
        }

        public function set numberleft8(_arg_1:Image):void
        {
            var _local_2:Object = this._749415272numberleft8;
            if (_local_2 !== _arg_1)
            {
                this._749415272numberleft8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright11():Image
        {
            return (this._221232685numberright11);
        }

        [Bindable(event="propertyChange")]
        public function get numberright41():Image
        {
            return (this._221232592numberright41);
        }

        public function set numberleft38(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036853numberleft38;
            if (_local_2 !== _arg_1)
            {
                this._1757036853numberleft38 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft38", _local_2, _arg_1));
            };
        }

        public function set numberleft30(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036845numberleft30;
            if (_local_2 !== _arg_1)
            {
                this._1757036845numberleft30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft30", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imbackground10():Image
        {
            return (this._496582385imbackground10);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground14():Image
        {
            return (this._496582389imbackground14);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground16():Image
        {
            return (this._496582391imbackground16);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground12():Image
        {
            return (this._496582387imbackground12);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground13():Image
        {
            return (this._496582388imbackground13);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground18():Image
        {
            return (this._496582393imbackground18);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground15():Image
        {
            return (this._496582390imbackground15);
        }

        [Bindable(event="propertyChange")]
        public function get numberright1():Image
        {
            return (this._1932526110numberright1);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground19():Image
        {
            return (this._496582394imbackground19);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground11():Image
        {
            return (this._496582386imbackground11);
        }

        public function set numberleft40(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036876numberleft40;
            if (_local_2 !== _arg_1)
            {
                this._1757036876numberleft40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft40", _local_2, _arg_1));
            };
        }

        public function set numberleft41(_arg_1:Image):void
        {
            var _local_2:Object = this._1757036877numberleft41;
            if (_local_2 !== _arg_1)
            {
                this._1757036877numberleft41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft41", _local_2, _arg_1));
            };
        }

        public function set surpriseDayItem4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2071124146surpriseDayItem4;
            if (_local_2 !== _arg_1)
            {
                this._2071124146surpriseDayItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "surpriseDayItem4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imbackground17():Image
        {
            return (this._496582392imbackground17);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground21():Image
        {
            return (this._496582417imbackground21);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground23():Image
        {
            return (this._496582419imbackground23);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground24():Image
        {
            return (this._496582420imbackground24);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground20():Image
        {
            return (this._496582416imbackground20);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground28():Image
        {
            return (this._496582424imbackground28);
        }

        public function __buttonSignIn_click(_arg_1:MouseEvent):void
        {
            signIn();
        }

        [Bindable(event="propertyChange")]
        public function get imbackground29():Image
        {
            return (this._496582425imbackground29);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground22():Image
        {
            return (this._496582418imbackground22);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground26():Image
        {
            return (this._496582422imbackground26);
        }

        public function set buttonSignIn(_arg_1:Button):void
        {
            var _local_2:Object = this._939184532buttonSignIn;
            if (_local_2 !== _arg_1)
            {
                this._939184532buttonSignIn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonSignIn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imsignin0():Image
        {
            return (this._2023086294imsignin0);
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin4():Image
        {
            return (this._2023086290imsignin4);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground27():Image
        {
            return (this._496582423imbackground27);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground31():Image
        {
            return (this._496582448imbackground31);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground32():Image
        {
            return (this._496582449imbackground32);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground33():Image
        {
            return (this._496582450imbackground33);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground35():Image
        {
            return (this._496582452imbackground35);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground36():Image
        {
            return (this._496582453imbackground36);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground30():Image
        {
            return (this._496582447imbackground30);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground25():Image
        {
            return (this._496582421imbackground25);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground39():Image
        {
            return (this._496582456imbackground39);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin8():Image
        {
            return (this._2023086286imsignin8);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground34():Image
        {
            return (this._496582451imbackground34);
        }

        [Bindable(event="propertyChange")]
        public function get btnUpCirtical():BasicGlowButton
        {
            return (this._1790492452btnUpCirtical);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground37():Image
        {
            return (this._496582454imbackground37);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground38():Image
        {
            return (this._496582455imbackground38);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin7():Image
        {
            return (this._2023086287imsignin7);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin1():Image
        {
            return (this._2023086293imsignin1);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin3():Image
        {
            return (this._2023086291imsignin3);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin5():Image
        {
            return (this._2023086289imsignin5);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin9():Image
        {
            return (this._2023086285imsignin9);
        }

        [Bindable(event="propertyChange")]
        public function get surpriseDayItem2():ItemSlot
        {
            return (this._2071124148surpriseDayItem2);
        }

        [Bindable(event="propertyChange")]
        public function get surpriseDayItem3():ItemSlot
        {
            return (this._2071124147surpriseDayItem3);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground40():Image
        {
            return (this._496582478imbackground40);
        }

        [Bindable(event="propertyChange")]
        public function get imbackground41():Image
        {
            return (this._496582479imbackground41);
        }

        [Bindable(event="propertyChange")]
        public function get numberright4():Image
        {
            return (this._1932526113numberright4);
        }

        [Bindable(event="propertyChange")]
        public function get imsignin6():Image
        {
            return (this._2023086288imsignin6);
        }

        public function set lbNowCirtical(_arg_1:Label):void
        {
            var _local_2:Object = this._1914146189lbNowCirtical;
            if (_local_2 !== _arg_1)
            {
                this._1914146189lbNowCirtical = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lbNowCirtical", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright8():Image
        {
            return (this._1932526117numberright8);
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
        public function get imsignin2():Image
        {
            return (this._2023086292imsignin2);
        }

        [Bindable(event="propertyChange")]
        public function get numberright18():Image
        {
            return (this._221232678numberright18);
        }

        public function set vsFlop(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._808329852vsFlop;
            if (_local_2 !== _arg_1)
            {
                this._808329852vsFlop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsFlop", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get surpriseDayItem5():ItemSlot
        {
            return (this._2071124145surpriseDayItem5);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft3():Image
        {
            return (this._749415267numberleft3);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft5():Image
        {
            return (this._749415269numberleft5);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft6():Image
        {
            return (this._749415270numberleft6);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft0():Image
        {
            return (this._749415264numberleft0);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft1():Image
        {
            return (this._749415265numberleft1);
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

        [Bindable(event="propertyChange")]
        public function get numberright3():Image
        {
            return (this._1932526112numberright3);
        }

        public function set surpriseDayItem3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2071124147surpriseDayItem3;
            if (_local_2 !== _arg_1)
            {
                this._2071124147surpriseDayItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "surpriseDayItem3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get surpriseDayItem1():ItemSlot
        {
            return (this._2071124149surpriseDayItem1);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft8():Image
        {
            return (this._749415272numberleft8);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft9():Image
        {
            return (this._749415273numberleft9);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft2():Image
        {
            return (this._749415266numberleft2);
        }

        [Bindable(event="propertyChange")]
        public function get numberright20():Image
        {
            return (this._221232655numberright20);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft4():Image
        {
            return (this._749415268numberleft4);
        }

        public function set numberleft6(_arg_1:Image):void
        {
            var _local_2:Object = this._749415270numberleft6;
            if (_local_2 !== _arg_1)
            {
                this._749415270numberleft6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft6", _local_2, _arg_1));
            };
        }

        public function set numberleft7(_arg_1:Image):void
        {
            var _local_2:Object = this._749415271numberleft7;
            if (_local_2 !== _arg_1)
            {
                this._749415271numberleft7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberleft7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get critNum():Number
        {
            return (this._1032778572critNum);
        }

        [Bindable(event="propertyChange")]
        public function get surpriseDayItem4():ItemSlot
        {
            return (this._2071124146surpriseDayItem4);
        }

        [Bindable(event="propertyChange")]
        public function get numberleft7():Image
        {
            return (this._749415271numberleft7);
        }

        public function set surpriseDayItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2071124148surpriseDayItem2;
            if (_local_2 !== _arg_1)
            {
                this._2071124148surpriseDayItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "surpriseDayItem2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numberright2():Image
        {
            return (this._1932526111numberright2);
        }

        override public function initialize():void
        {
            var target:DailySignInPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DailySignInPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DailySignInPanelWatcherSetupUtil");
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

        public function set numberright10(_arg_1:Image):void
        {
            var _local_2:Object = this._221232686numberright10;
            if (_local_2 !== _arg_1)
            {
                this._221232686numberright10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright10", _local_2, _arg_1));
            };
        }

        public function set numberright11(_arg_1:Image):void
        {
            var _local_2:Object = this._221232685numberright11;
            if (_local_2 !== _arg_1)
            {
                this._221232685numberright11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright11", _local_2, _arg_1));
            };
        }

        public function __buttonGetAward_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        public function set numberright13(_arg_1:Image):void
        {
            var _local_2:Object = this._221232683numberright13;
            if (_local_2 !== _arg_1)
            {
                this._221232683numberright13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        public function set numberright12(_arg_1:Image):void
        {
            var _local_2:Object = this._221232684numberright12;
            if (_local_2 !== _arg_1)
            {
                this._221232684numberright12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright12", _local_2, _arg_1));
            };
        }

        public function set numberright14(_arg_1:Image):void
        {
            var _local_2:Object = this._221232682numberright14;
            if (_local_2 !== _arg_1)
            {
                this._221232682numberright14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright14", _local_2, _arg_1));
            };
        }

        public function set numberright19(_arg_1:Image):void
        {
            var _local_2:Object = this._221232677numberright19;
            if (_local_2 !== _arg_1)
            {
                this._221232677numberright19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright19", _local_2, _arg_1));
            };
        }

        public function set numberright16(_arg_1:Image):void
        {
            var _local_2:Object = this._221232680numberright16;
            if (_local_2 !== _arg_1)
            {
                this._221232680numberright16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright16", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn1():BasicGlowButton
        {
            return (this._1863324755bangBtn1);
        }

        public function set numberright15(_arg_1:Image):void
        {
            var _local_2:Object = this._221232681numberright15;
            if (_local_2 !== _arg_1)
            {
                this._221232681numberright15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright15", _local_2, _arg_1));
            };
        }

        public function set numberright18(_arg_1:Image):void
        {
            var _local_2:Object = this._221232678numberright18;
            if (_local_2 !== _arg_1)
            {
                this._221232678numberright18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright18", _local_2, _arg_1));
            };
        }

        public function set surpriseDayItem5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2071124145surpriseDayItem5;
            if (_local_2 !== _arg_1)
            {
                this._2071124145surpriseDayItem5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "surpriseDayItem5", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initDailySignInActData", new Responder(onInitDailySignInActData));
            _core.remote.call("initDailySignInActConsumeLimit", null);
        }

        private function signIn():void
        {
            _core.remote.call("dailySignInActDoSignin", new Responder(onDailySignInActDoSignin));
        }

        public function set numberright22(_arg_1:Image):void
        {
            var _local_2:Object = this._221232653numberright22;
            if (_local_2 !== _arg_1)
            {
                this._221232653numberright22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright22", _local_2, _arg_1));
            };
        }

        public function set numberright24(_arg_1:Image):void
        {
            var _local_2:Object = this._221232651numberright24;
            if (_local_2 !== _arg_1)
            {
                this._221232651numberright24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright24", _local_2, _arg_1));
            };
        }

        public function set numberright26(_arg_1:Image):void
        {
            var _local_2:Object = this._221232649numberright26;
            if (_local_2 !== _arg_1)
            {
                this._221232649numberright26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright26", _local_2, _arg_1));
            };
        }

        public function set numberright20(_arg_1:Image):void
        {
            var _local_2:Object = this._221232655numberright20;
            if (_local_2 !== _arg_1)
            {
                this._221232655numberright20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright20", _local_2, _arg_1));
            };
        }

        public function set buttonGetAward(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2043717127buttonGetAward;
            if (_local_2 !== _arg_1)
            {
                this._2043717127buttonGetAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonGetAward", _local_2, _arg_1));
            };
        }

        public function set numberright25(_arg_1:Image):void
        {
            var _local_2:Object = this._221232650numberright25;
            if (_local_2 !== _arg_1)
            {
                this._221232650numberright25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright25", _local_2, _arg_1));
            };
        }

        public function set numberright27(_arg_1:Image):void
        {
            var _local_2:Object = this._221232648numberright27;
            if (_local_2 !== _arg_1)
            {
                this._221232648numberright27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberright27", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

