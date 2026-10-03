// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ManJiuJianPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ManJiuJianOneCanvas;
    import mx.controls.NumericStepper;
    import mx.containers.ViewStack;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.controls.Alert;
    import mx.effects.Rotate;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.NumericStepperEvent;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.comp.ManJiuJianOneCartCanvas;
    import mx.events.FlexEvent;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
    import com.qeedoo.game.data.GameData;
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

    public class ManJiuJianPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1367590590cart13:ManJiuJianOneCanvas;
        private var needFlush:Boolean;
        private var _94431510cart6:ManJiuJianOneCanvas;
        private var _1354258014cpadd6:NumericStepper;
        private var _808329852vsFlop:ViewStack;
        private var _983418489cpres17:Image;
        private var arrstr:String = "";
        private var _983418491cpres19:Image;
        private var _1353750145cpres2:Image;
        private var endCpRad:Number = 0;
        private var _98663cp4:Label;
        private var _3588577uiC0:Image;
        private var _alert:Alert;
        private var _1354258019cpadd1:NumericStepper;
        private var _1353750139cpres8:Image;
        private var _1367590589cart14:ManJiuJianOneCanvas;
        private var _3060404cpn5:Label;
        private var _94431506cart2:ManJiuJianOneCanvas;
        private var _1353854116cpnum5:Label;
        private var _1682357501changeAngle:Rotate;
        private var _983418485cpres13:Image;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _98664cp5:Label;
        private var _94431511cart7:ManJiuJianOneCanvas;
        private var _980195288cpnum10:Label;
        private var _3185ct:Label;
        private var _98784ct1:Label;
        private var _loadCid:Number = 0;
        private var _1065040308msgLab:Label;
        private var _1354258013cpadd7:NumericStepper;
        private var _133638349turnAll1:DelayButton;
        private var _3060403cpn4:Label;
        private var _1353750144cpres3:Image;
        private var count:Number = 0;
        private var _98665cp6:Label;
        private var _1354258018cpadd2:NumericStepper;
        private var _1353750138cpres9:Image;
        private var _98785ct2:Label;
        public var _ManJiuJianPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _94431507cart3:ManJiuJianOneCanvas;
        private var _94431512cart8:ManJiuJianOneCanvas;
        private var _1353854115cpnum6:Label;
        private var _98666cp7:Label;
        private var _3060402cpn3:Label;
        private var _1969543397titleWrapper:Canvas;
        private var _983418486cpres14:Image;
        private var _98786ct3:Label;
        private var _1354258012cpadd8:NumericStepper;
        private var _1863324753bangBtn3:BasicGlowButton;
        private var _926303115titleWrapper0:Canvas;
        private var _1353750143cpres4:Image;
        private var _1367590593cart10:ManJiuJianOneCanvas;
        private var _94431508cart4:ManJiuJianOneCanvas;
        private var _98667cp8:Label;
        private var _133638348turnAll0:DelayButton;
        private var _1354258017cpadd3:NumericStepper;
        private var _98787ct4:Label;
        private var _1353854120cpnum1:Label;
        private var _3060401cpn2:Label;
        private var _94431513cart9:ManJiuJianOneCanvas;
        private var _983418482cpres10:Image;
        private var _115759uiC:Image;
        private var _1353854114cpnum7:Label;
        private var _1377570494buySpe:DelayButton;
        private var _98668cp9:Label;
        private var _873453352title0:Label;
        private var _3058508cp10:Label;
        private var sver:Number;
        private var _1353854119cpnum2:Label;
        private var _1354258011cpadd9:NumericStepper;
        private var _983418487cpres15:Image;
        private var _1105287949lftLab:Label;
        private var _100361836intro:IntroText;
        private var _3060400cpn1:Label;
        private var _94431509cart5:ManJiuJianOneCanvas;
        private var _3242771item:ItemSlot;
        private var _3060408cpn9:Label;
        private var _1367590592cart11:ManJiuJianOneCanvas;
        private var _1353750142cpres5:Image;
        private var run:Boolean = false;
        private var _1183750331intro1:IntroText;
        private var _3756vb:VBox;
        private var _1354258016cpadd4:NumericStepper;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _1353854113cpnum8:Label;
        private var _94872448cpn10:Label;
        private var _983418483cpres11:Image;
        private var _3060407cpn8:Label;
        private var _965520412turnAll:DelayButton;
        private var _967674419cpadd10:NumericStepper;
        public var _ManJiuJianPanel_Label14:Label;
        public var _ManJiuJianPanel_Label15:Label;
        public var _ManJiuJianPanel_Label16:Label;
        private var _1353854118cpnum3:Label;
        private var _983418513cpres20:Image;
        public var _ManJiuJianPanel_Label20:Label;
        private var _98660cp1:Label;
        public var _ManJiuJianPanel_Label24:Label;
        public var _ManJiuJianPanel_Label28:Label;
        private var _1353750141cpres6:Image;
        private var _1367590591cart12:ManJiuJianOneCanvas;
        private var _108616myt:Label;
        private var _983418488cpres16:Image;
        private var _94431504cart0:ManJiuJianOneCanvas;
        public var _ManJiuJianPanel_Label32:Label;
        public var _ManJiuJianPanel_Label36:Label;
        private var _readIndex:Number = 0;
        private var _1354258015cpadd5:NumericStepper;
        private var _983418490cpres18:Image;
        public var _ManJiuJianPanel_Label40:Label;
        public var _ManJiuJianPanel_Label44:Label;
        public var _ManJiuJianPanel_Label48:Label;
        public var _ManJiuJianPanel_Image1:Image;
        private var _3060406cpn7:Label;
        private var _1353750146cpres1:Image;
        public var _ManJiuJianPanel_Label52:Label;
        private var _98661cp2:Label;
        public var _ManJiuJianPanel_Label56:Label;
        public var _ManJiuJianPanel_Label57:Label;
        public var _ManJiuJianPanel_Label58:Label;
        private var _1353854112cpnum9:Label;
        private var ver:Number;
        private var _607339634pageSelector:PageSelector;
        public var _ManJiuJianPanel_Label62:Label;
        public var _ManJiuJianPanel_Label63:Label;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _983418484cpres12:Image;
        private var _92960979angle:Number = 0;
        private var _1353854117cpnum4:Label;
        private var _94431505cart1:ManJiuJianOneCanvas;
        private var _98662cp3:Label;
        private var _3060405cpn6:Label;
        private var _110371416title:Label;
        private var _1353750140cpres7:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ManJiuJianPanel_BasicTitleCanvas1"
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
                                "width":82,
                                "x":20,
                                "y":40
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
                                "width":82,
                                "x":102,
                                "y":40
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
                                "width":82,
                                "x":184,
                                "y":40
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
                                "width":82,
                                "x":266,
                                "y":40
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsFlop",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":60,
                                "width":679.95,
                                "height":420,
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":679.95,
                                            "height":420,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_ManJiuJianPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":1,
                                                        "y":1,
                                                        "percentWidth":100,
                                                        "percentHeight":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"uiC0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":33,
                                                        "width":350,
                                                        "height":350
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"uiC",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":107,
                                                        "y":128,
                                                        "width":160,
                                                        "height":160
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":173,
                                                        "y":88,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":234,
                                                        "y":108,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":400.95,
                                                        "y":283,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":506.95,
                                                        "y":283,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":558.95,
                                                        "y":283,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":611.95,
                                                        "y":283,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres16",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":400.95,
                                                        "y":340,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":506.95,
                                                        "y":340,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres19",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":558.95,
                                                        "y":340,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres20",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":611.95,
                                                        "y":340,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres17",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":454.95,
                                                        "y":340,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":272,
                                                        "y":159,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":273,
                                                        "y":222,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":236,
                                                        "y":274,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":174,
                                                        "y":295,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":113,
                                                        "y":274,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":76,
                                                        "y":222,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":76,
                                                        "y":158,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":114,
                                                        "y":107,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"turnAll1",
                                                "events":{"click":"__turnAll1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":136.5,
                                                        "y":158.7,
                                                        "width":100,
                                                        "height":100,
                                                        "styleName":"manjiujianBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"msgLab",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":1,
                                                        "y":10,
                                                        "width":680,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"turnAll",
                                                "events":{"click":"__turnAll_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":0x0100,
                                                        "y":390,
                                                        "width":100,
                                                        "height":23,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"buySpe",
                                                "events":{"click":"__buySpe_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":490,
                                                        "y":193,
                                                        "width":65,
                                                        "height":23,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lftLab",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 13;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":98,
                                                        "y":392,
                                                        "width":142
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"item",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":505,
                                                        "y":153,
                                                        "movable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"cpres12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":454.95,
                                                        "y":283,
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":389.95,
                                                        "y":320,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":444.95,
                                                        "y":320,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":499.95,
                                                        "y":320,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":551.95,
                                                        "y":320,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":604.95,
                                                        "y":320,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":389.95,
                                                        "y":377,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":444.95,
                                                        "y":377,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":499.95,
                                                        "y":377,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":551.95,
                                                        "y":377,
                                                        "width":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cpnum10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":604.95,
                                                        "y":377,
                                                        "width":56
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
                                            "label":"Hornor",
                                            "y":60,
                                            "width":679.95,
                                            "height":420,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "label":"Hornor",
                                                        "y":7,
                                                        "width":665,
                                                        "height":320,
                                                        "x":7,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":33,
                                                                    "x":4
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":33,
                                                                    "x":136
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":33,
                                                                    "x":268
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":33,
                                                                    "x":400
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":33,
                                                                    "x":532
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":120,
                                                                    "x":4
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":120,
                                                                    "x":136
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":120,
                                                                    "x":268
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":120,
                                                                    "x":400
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":120,
                                                                    "x":532
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":207,
                                                                    "x":4
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":207,
                                                                    "x":136
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":207,
                                                                    "x":268
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":207,
                                                                    "x":400
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ManJiuJianOneCanvas,
                                                            "id":"cart14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":207,
                                                                    "x":532
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelector,
                                                            "id":"pageSelector",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "5";
                                                                this.horizontalCenter = "0";
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
                                                        "label":"Hornor",
                                                        "y":330,
                                                        "width":665,
                                                        "height":90,
                                                        "x":6.95,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"intro1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100
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
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":679.95,
                                            "height":420,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "label":"Hornor",
                                                        "y":7,
                                                        "width":665,
                                                        "height":180,
                                                        "x":7,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"titleWrapper",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":15,
                                                                    "y":3,
                                                                    "styleName":"StandardTitle"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"title0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":4,
                                                                    "styleName":"LabelTitle",
                                                                    "width":115,
                                                                    "x":275
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_ManJiuJianPanel_Label14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":80,
                                                                    "height":20,
                                                                    "y":27,
                                                                    "x":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_ManJiuJianPanel_Label15",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":90,
                                                                    "height":20,
                                                                    "y":27,
                                                                    "x":300
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_ManJiuJianPanel_Label16",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":94,
                                                                    "height":20,
                                                                    "y":27,
                                                                    "x":144
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "id":"vb",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":130,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "x":10,
                                                                    "y":45
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
                                                        "label":"Hornor",
                                                        "y":189,
                                                        "width":665,
                                                        "height":160,
                                                        "x":7,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "label":"Hornor",
                                                                    "y":30,
                                                                    "width":466,
                                                                    "height":125,
                                                                    "x":30,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":33,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":66,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label20",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":96,
                                                                                "width":77,
                                                                                "height":20,
                                                                                "y":1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd1",
                                                                        "events":{"change":"__cpadd1_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":161,
                                                                                "y":1,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":236,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":269,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":301,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label24",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":331,
                                                                                "width":78,
                                                                                "height":20,
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd2",
                                                                        "events":{"change":"__cpadd2_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":396,
                                                                                "y":2,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":25
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":33,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":25
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":66,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":25
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label28",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":96,
                                                                                "width":77,
                                                                                "height":20,
                                                                                "y":25
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd3",
                                                                        "events":{"change":"__cpadd3_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":161,
                                                                                "y":25,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":236,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":28
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":269,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":26
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":301,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":26
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label32",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":331,
                                                                                "width":78,
                                                                                "height":20,
                                                                                "y":26
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd4",
                                                                        "events":{"change":"__cpadd4_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":396,
                                                                                "y":26,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":49
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":33,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":49
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":66,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":49
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label36",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":96,
                                                                                "width":77,
                                                                                "height":20,
                                                                                "y":49
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd5",
                                                                        "events":{"change":"__cpadd5_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":161,
                                                                                "y":49,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":76
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":33,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":74
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":66,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":74
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label40",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":96,
                                                                                "width":77,
                                                                                "height":20,
                                                                                "y":74
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd7",
                                                                        "events":{"change":"__cpadd7_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":161,
                                                                                "y":74,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":236,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":51
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":269,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":301,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label44",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":331,
                                                                                "width":78,
                                                                                "height":20,
                                                                                "y":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd6",
                                                                        "events":{"change":"__cpadd6_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":396,
                                                                                "y":52,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":236,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":77
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":269,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":76
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":301,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":76
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label48",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":331,
                                                                                "width":78,
                                                                                "height":20,
                                                                                "y":76
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd8",
                                                                        "events":{"change":"__cpadd8_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":396,
                                                                                "y":76,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":1,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":99
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":34,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":99
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":67,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":99
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label52",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":97,
                                                                                "width":76,
                                                                                "height":20,
                                                                                "y":99
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd9",
                                                                        "events":{"change":"__cpadd9_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":162,
                                                                                "y":99,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cp10",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":236,
                                                                                "width":42,
                                                                                "height":20,
                                                                                "text":"50",
                                                                                "y":99
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":269,
                                                                                "width":39,
                                                                                "height":20,
                                                                                "text":"元 共",
                                                                                "y":99
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"cpn10",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":301,
                                                                                "width":37,
                                                                                "height":20,
                                                                                "y":99
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_ManJiuJianPanel_Label56",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":331,
                                                                                "width":78,
                                                                                "height":20,
                                                                                "y":99
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"cpadd10",
                                                                        "events":{"change":"__cpadd10_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":396,
                                                                                "y":99,
                                                                                "minimum":0,
                                                                                "maximum":999999,
                                                                                "width":62,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_ManJiuJianPanel_Label57",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 13;
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":494,
                                                                    "y":47,
                                                                    "width":180,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_ManJiuJianPanel_Label58",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 13;
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":485,
                                                                    "y":83,
                                                                    "width":189,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"ct",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFF0000;
                                                                this.textAlign = "center";
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":532,
                                                                    "y":83,
                                                                    "width":64,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myt",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 65382;
                                                                this.textAlign = "center";
                                                                this.fontSize = 13;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":528,
                                                                    "y":47,
                                                                    "width":64,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"title",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":5,
                                                                    "styleName":"LabelTitle",
                                                                    "width":115,
                                                                    "x":275
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"titleWrapper0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":15,
                                                                    "y":6,
                                                                    "styleName":"StandardTitle"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"turnAll0",
                                                "events":{"click":"__turnAll0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":307.45,
                                                        "y":394,
                                                        "width":65,
                                                        "height":23,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_ManJiuJianPanel_Label62",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":348,
                                                        "width":493,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_ManJiuJianPanel_Label63",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 13;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":244,
                                                        "y":373,
                                                        "width":213,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":186,
                                                        "y":348,
                                                        "width":40,
                                                        "text":"0"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 65382;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":275,
                                                        "y":373,
                                                        "width":84,
                                                        "text":"0"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":284,
                                                        "y":348,
                                                        "width":84,
                                                        "text":"0"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF;
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":440,
                                                        "y":347,
                                                        "width":84,
                                                        "text":"0"
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
                                            "label":"Hornor",
                                            "y":60,
                                            "width":679.95,
                                            "height":420,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"intro",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100
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
        private var arr:Array = new Array();
        private var arrpush:Array = new Array();
        private var conf:Object = {};
        private var chardata:Object = {};
        private var cartObj:Object = {};
        private var itemList:ArrayCollection = new ArrayCollection();
        private var cpArr:Array = new Array();
        private var timer:Timer = new Timer(50);
        private var timer1:Timer = new Timer(3000);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ManJiuJianPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 500;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            _ManJiuJianPanel_Rotate1_i();
            this.addEventListener("creationComplete", ___ManJiuJianPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ManJiuJianPanel._watcherSetupUtil = _arg_1;
        }


        private function getManJiuJianItemPtByTid2(_arg_1:*):Number
        {
            var _local_2:*;
            if (((conf) && (conf.iInfo)))
            {
                for (_local_2 in conf.iInfo)
                {
                    if (ToolKit.isEqual(conf.iInfo[_local_2].iid, _arg_1))
                    {
                        return ((conf.iInfo[_local_2].pt) ? conf.iInfo[_local_2].pt : 0);
                    };
                };
            };
            return (0);
        }

        private function _ManJiuJianPanel_Rotate1_i():Rotate
        {
            var _local_1:Rotate = new Rotate();
            changeAngle = _local_1;
            BindingManager.executeBindings(this, "changeAngle", changeAngle);
            return (_local_1);
        }

        public function __buySpe_click(_arg_1:MouseEvent):void
        {
            buyManJiuJianSpecialItem();
        }

        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
        }

        public function __cpadd5_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
        }

        [Bindable(event="propertyChange")]
        public function get uiC():Image
        {
            return (this._115759uiC);
        }

        public function __turnAll0_click(_arg_1:MouseEvent):void
        {
            buyCartItems();
        }

        private function buyManJiuJianSpecialItem():void
        {
            var handler:Function;
            var gfunc:Function;
            if (chardata.lt[conf.sid])
            {
                _core.sysMsg(Language.MANJIUJIAN_PANEL[22]);
                return;
            };
            var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var goldLockFlag:Boolean = bagPanel.goldLockFlag;
            if (((goldLockFlag) || (!(bagPanel))))
            {
                _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyManJiuJianSpecialItem", null);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.MANJIUJIAN_PANEL[29].replace("{num}", conf.sp);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        [Bindable(event="propertyChange")]
        public function get myt():Label
        {
            return (this._108616myt);
        }

        public function set uiC(_arg_1:Image):void
        {
            var _local_2:Object = this._115759uiC;
            if (_local_2 !== _arg_1)
            {
                this._115759uiC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "uiC", _local_2, _arg_1));
            };
        }

        public function set cpadd10(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._967674419cpadd10;
            if (_local_2 !== _arg_1)
            {
                this._967674419cpadd10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd10", _local_2, _arg_1));
            };
        }

        public function resetCartPage():void
        {
            var _local_1:*;
            var _local_2:Number;
            var _local_3:ManJiuJianOneCartCanvas;
            if (needFlush)
            {
                vb.removeAllChildren();
                for (_local_1 in cartObj)
                {
                    if (cartObj[_local_1])
                    {
                        _local_2 = (cartObj[_local_1] * getManJiuJianItemPtByTid2(_local_1));
                        if (_local_2)
                        {
                            _local_3 = new ManJiuJianOneCartCanvas();
                            _local_3.ItemId = _local_1;
                            _local_3.BuyCount = cartObj[_local_1];
                            _local_3.Point = _local_2;
                            vb.addChild(_local_3);
                        };
                    };
                };
                countCart();
                changeCpNum();
                needFlush = false;
            };
        }

        public function ___ManJiuJianPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get ct():Label
        {
            return (this._3185ct);
        }

        [Bindable(event="propertyChange")]
        public function get titleWrapper0():Canvas
        {
            return (this._926303115titleWrapper0);
        }

        public function onbroadCastManJiuJianMsg(_arg_1:Array):void
        {
            var _local_2:Array;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            if (run)
            {
                _local_2 = new Array();
                _local_3 = 0;
                while (_local_3 < _arg_1.length)
                {
                    if (_arg_1[_local_3].n == _core.player.name)
                    {
                        arrpush.push(_arg_1[_local_3]);
                    }
                    else
                    {
                        _local_2.push(_arg_1[_local_3]);
                    };
                    _local_3++;
                };
                _arg_1 = _local_2;
            };
            if (_arg_1.length == 0)
            {
                return;
            };
            if (_arg_1.length >= 5)
            {
                arr = _arg_1.splice((_arg_1.length - 5), 5);
            }
            else
            {
                _local_4 = _arg_1.length;
                _local_5 = ((arr.length + _local_4) - 5);
                if (_local_5)
                {
                    arr.splice(0, _local_5);
                };
                _local_3 = 0;
                while (_local_3 < _arg_1.length)
                {
                    arr.push(_arg_1[_local_3]);
                    _local_3++;
                };
            };
        }

        private function moveTurnTable(_arg_1:Event):void
        {
            count++;
            if (count <= 60)
            {
                changeAngle.stop();
                angle = (angle + 18);
                changeAngle.play();
            }
            else
            {
                if (count <= 50)
                {
                    if ((count % 2) == 0)
                    {
                        changeAngle.stop();
                        angle = (angle + 18);
                        changeAngle.play();
                    };
                }
                else
                {
                    if ((count % 3) == 0)
                    {
                        changeAngle.stop();
                        angle = (angle + 18);
                        changeAngle.play();
                        if (ToolKit.isEqual(((angle - 18) % 360), endCpRad))
                        {
                            changeAngle.stop();
                            run = false;
                            onbroadCastManJiuJianMsg(arrpush);
                            resetCp(false);
                            arrpush = new Array();
                            if (timer.running)
                            {
                                timer.stop();
                            };
                            if (timer.hasEventListener(TimerEvent.TIMER))
                            {
                                timer.removeEventListener(TimerEvent.TIMER, moveTurnTable);
                            };
                        };
                    };
                };
            };
        }

        public function set myt(_arg_1:Label):void
        {
            var _local_2:Object = this._108616myt;
            if (_local_2 !== _arg_1)
            {
                this._108616myt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myt", _local_2, _arg_1));
            };
        }

        public function set msgLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1065040308msgLab;
            if (_local_2 !== _arg_1)
            {
                this._1065040308msgLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "msgLab", _local_2, _arg_1));
            };
        }

        private function buyCartItems():void
        {
            var cpstr:String;
            var itemstr:String;
            var iid:* = undefined;
            var handler:Function;
            var cp:Number;
            var buyItemNum:Number;
            var limitNum:Number;
            var gfunc:Function;
            cpstr = "";
            itemstr = "";
            var minusMoney:Number = 0;
            var allMoney:Number = 0;
            var i:Number = 1;
            while (i <= 10)
            {
                cp = conf[("cp" + i)];
                if (((ToolKit.isBigThan(this[("cpadd" + i)].value, 0)) && (ToolKit.isSmallOrEqual(this[("cpadd" + i)].value, chardata.cp[cp]))))
                {
                    cpstr = ((((cpstr + "|") + cp) + "-") + this[("cpadd" + i)].value);
                    minusMoney = (minusMoney + (cp * Number(this[("cpadd" + i)].value)));
                }
                else
                {
                    if (((ToolKit.isSmallThan(this[("cpadd" + i)].value, 0)) || (ToolKit.isBigThan(this[("cpadd" + i)].value, chardata.cp[cp]))))
                    {
                        return;
                    };
                };
                i++;
            };
            for (iid in cartObj)
            {
                buyItemNum = getManJiuJianItemNumByTid(iid);
                limitNum = getManJiuJianItemNumByTid2(iid);
                if (ToolKit.isSmallThan(limitNum, ToolKit.add(buyItemNum, cartObj[iid])))
                {
                    return;
                };
                itemstr = ((((itemstr + "|") + iid) + "-") + cartObj[iid]);
                allMoney = (allMoney + (getManJiuJianItemPtByTid2(iid) * Number(cartObj[iid])));
            };
            if (itemstr.indexOf("|") >= 0)
            {
                itemstr = itemstr.substr(1, (itemstr.length - 1));
            };
            if (cpstr.indexOf("|") >= 0)
            {
                cpstr = cpstr.substr(1, (cpstr.length - 1));
            };
            var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var goldLockFlag:Boolean = bagPanel.goldLockFlag;
            if (((goldLockFlag) || (!(bagPanel))))
            {
                _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyManJiuJianItem", null, itemstr, cpstr);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.MANJIUJIAN_PANEL[29].replace("{num}", ct4.text);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        public function set title(_arg_1:Label):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function __cpadd1_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
        }

        [Bindable(event="propertyChange")]
        public function get turnAll0():DelayButton
        {
            return (this._133638348turnAll0);
        }

        [Bindable(event="propertyChange")]
        public function get turnAll1():DelayButton
        {
            return (this._133638349turnAll1);
        }

        public function onUpdateManJiuJianTurnTableTime(_arg_1:Number):void
        {
            if (initialized)
            {
                chardata.ft = _arg_1;
                lftLab.htmlText = Language.MANJIUJIAN_PANEL[5].replace("{num}", chardata.ft);
            };
        }

        private function countCart():void
        {
            var _local_3:*;
            var _local_4:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_1:Number = 0;
            var _local_2:Number = 0;
            for (_local_3 in cartObj)
            {
                _local_6 = getManJiuJianItemNumByTid(_local_3);
                _local_7 = getManJiuJianItemNumByTid2(_local_3);
                _local_1 = ToolKit.add(_local_1, (getManJiuJianItemPtByTid2(_local_3) * Number(cartObj[_local_3])));
                _local_2 = ToolKit.add(_local_2, Number(cartObj[_local_3]));
            };
            ct1.text = String(_local_2);
            ct2.text = String(_local_1);
            _local_4 = ((Number(myt.text)) ? Number(myt.text) : 0);
            var _local_5:Number = ((Number(ct.text)) ? Number(ct.text) : 0);
            ct3.text = ((_local_4 > _local_5) ? String((_local_5 * 10)) : String((_local_4 * 10)));
            ct4.text = String(((ToolKit.minus(_local_1, ((Number(ct3.text)) ? Number(ct3.text) : 0)) > 0) ? ToolKit.minus(_local_1, ((Number(ct3.text)) ? Number(ct3.text) : 0)) : 0));
        }

        [Bindable(event="propertyChange")]
        public function get angle():Number
        {
            return (this._92960979angle);
        }

        public function __bangBtn3_click(_arg_1:MouseEvent):void
        {
            changeView(3);
        }

        public function set ct(_arg_1:Label):void
        {
            var _local_2:Object = this._3185ct;
            if (_local_2 !== _arg_1)
            {
                this._3185ct = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct", _local_2, _arg_1));
            };
        }

        public function set cpres10(_arg_1:Image):void
        {
            var _local_2:Object = this._983418482cpres10;
            if (_local_2 !== _arg_1)
            {
                this._983418482cpres10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres10", _local_2, _arg_1));
            };
        }

        public function set cpres11(_arg_1:Image):void
        {
            var _local_2:Object = this._983418483cpres11;
            if (_local_2 !== _arg_1)
            {
                this._983418483cpres11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres11", _local_2, _arg_1));
            };
        }

        public function set intro(_arg_1:IntroText):void
        {
            var _local_2:Object = this._100361836intro;
            if (_local_2 !== _arg_1)
            {
                this._100361836intro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "intro", _local_2, _arg_1));
            };
        }

        public function set cpres12(_arg_1:Image):void
        {
            var _local_2:Object = this._983418484cpres12;
            if (_local_2 !== _arg_1)
            {
                this._983418484cpres12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres12", _local_2, _arg_1));
            };
        }

        public function set cpres13(_arg_1:Image):void
        {
            var _local_2:Object = this._983418485cpres13;
            if (_local_2 !== _arg_1)
            {
                this._983418485cpres13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres13", _local_2, _arg_1));
            };
        }

        public function set cpres15(_arg_1:Image):void
        {
            var _local_2:Object = this._983418487cpres15;
            if (_local_2 !== _arg_1)
            {
                this._983418487cpres15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres15", _local_2, _arg_1));
            };
        }

        public function set cpres16(_arg_1:Image):void
        {
            var _local_2:Object = this._983418488cpres16;
            if (_local_2 !== _arg_1)
            {
                this._983418488cpres16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres16", _local_2, _arg_1));
            };
        }

        public function set titleWrapper0(_arg_1:Canvas):void
        {
            var _local_2:Object = this._926303115titleWrapper0;
            if (_local_2 !== _arg_1)
            {
                this._926303115titleWrapper0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleWrapper0", _local_2, _arg_1));
            };
        }

        public function set cpres17(_arg_1:Image):void
        {
            var _local_2:Object = this._983418489cpres17;
            if (_local_2 !== _arg_1)
            {
                this._983418489cpres17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres17", _local_2, _arg_1));
            };
        }

        public function set cpres14(_arg_1:Image):void
        {
            var _local_2:Object = this._983418486cpres14;
            if (_local_2 !== _arg_1)
            {
                this._983418486cpres14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres14", _local_2, _arg_1));
            };
        }

        public function set cpres19(_arg_1:Image):void
        {
            var _local_2:Object = this._983418491cpres19;
            if (_local_2 !== _arg_1)
            {
                this._983418491cpres19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres19", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lftLab():Label
        {
            return (this._1105287949lftLab);
        }

        [Bindable(event="propertyChange")]
        public function get title0():Label
        {
            return (this._873453352title0);
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function set cpres18(_arg_1:Image):void
        {
            var _local_2:Object = this._983418490cpres18;
            if (_local_2 !== _arg_1)
            {
                this._983418490cpres18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres18", _local_2, _arg_1));
            };
        }

        public function __cpadd6_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
        }

        [Bindable(event="propertyChange")]
        public function get cart0():ManJiuJianOneCanvas
        {
            return (this._94431504cart0);
        }

        [Bindable(event="propertyChange")]
        public function get cart1():ManJiuJianOneCanvas
        {
            return (this._94431505cart1);
        }

        [Bindable(event="propertyChange")]
        public function get cart3():ManJiuJianOneCanvas
        {
            return (this._94431507cart3);
        }

        [Bindable(event="propertyChange")]
        public function get cart4():ManJiuJianOneCanvas
        {
            return (this._94431508cart4);
        }

        [Bindable(event="propertyChange")]
        public function get cart5():ManJiuJianOneCanvas
        {
            return (this._94431509cart5);
        }

        [Bindable(event="propertyChange")]
        public function get cart7():ManJiuJianOneCanvas
        {
            return (this._94431511cart7);
        }

        [Bindable(event="propertyChange")]
        public function get cart8():ManJiuJianOneCanvas
        {
            return (this._94431512cart8);
        }

        [Bindable(event="propertyChange")]
        public function get cart2():ManJiuJianOneCanvas
        {
            return (this._94431506cart2);
        }

        [Bindable(event="propertyChange")]
        public function get cart6():ManJiuJianOneCanvas
        {
            return (this._94431510cart6);
        }

        public function set cpres20(_arg_1:Image):void
        {
            var _local_2:Object = this._983418513cpres20;
            if (_local_2 !== _arg_1)
            {
                this._983418513cpres20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres20", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cart9():ManJiuJianOneCanvas
        {
            return (this._94431513cart9);
        }

        private function _ManJiuJianPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MANJIUJIAN_PANEL[0];
            _local_1 = Language.MANJIUJIAN_PANEL[1];
            _local_1 = Language.MANJIUJIAN_PANEL[2];
            _local_1 = Language.MANJIUJIAN_PANEL[3];
            _local_1 = Language.MANJIUJIAN_PANEL[4];
            _local_1 = uiC;
            _local_1 = (angle - 18);
            _local_1 = angle;
            _local_1 = ResManager.getIconUrl(4130220000514);
            _local_1 = ResManager.getIconUrl(4130220000513);
            _local_1 = ResManager.getIconUrl(4130220000512);
            _local_1 = Language.MANJIUJIAN_PANEL[26];
            _local_1 = Language.MANJIUJIAN_PANEL[27];
            _local_1 = Language.MANJIUJIAN_PANEL[17];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.MANJIUJIAN_PANEL[18];
            _local_1 = Language.MANJIUJIAN_PANEL[20];
            _local_1 = Language.MANJIUJIAN_PANEL[19];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[15];
            _local_1 = Language.MANJIUJIAN_PANEL[11];
            _local_1 = Language.MANJIUJIAN_PANEL[12];
            _local_1 = Language.MANJIUJIAN_PANEL[21];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.MANJIUJIAN_PANEL[27];
            _local_1 = Language.MANJIUJIAN_PANEL[13];
            _local_1 = Language.MANJIUJIAN_PANEL[14];
        }

        private function _ManJiuJianPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ManJiuJianPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn3.label = _arg_1;
            }, "bangBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (uiC);
            }, function (_arg_1:Object):void
            {
                changeAngle.target = _arg_1;
            }, "changeAngle.target");
            result[5] = binding;
            binding = new Binding(this, function ():Number
            {
                return (angle - 18);
            }, function (_arg_1:Number):void
            {
                changeAngle.angleFrom = _arg_1;
            }, "changeAngle.angleFrom");
            result[6] = binding;
            binding = new Binding(this, function ():Number
            {
                return (angle);
            }, function (_arg_1:Number):void
            {
                changeAngle.angleTo = _arg_1;
            }, "changeAngle.angleTo");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000514));
            }, function (_arg_1:Object):void
            {
                _ManJiuJianPanel_Image1.source = _arg_1;
            }, "_ManJiuJianPanel_Image1.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000513));
            }, function (_arg_1:Object):void
            {
                uiC0.source = _arg_1;
            }, "uiC0.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000512));
            }, function (_arg_1:Object):void
            {
                uiC.source = _arg_1;
            }, "uiC.source");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                turnAll.label = _arg_1;
            }, "turnAll.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buySpe.label = _arg_1;
            }, "buySpe.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title0.text = _arg_1;
            }, "title0.text");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                title0.filters = _arg_1;
            }, "title0.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label14.text = _arg_1;
            }, "_ManJiuJianPanel_Label14.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label15.text = _arg_1;
            }, "_ManJiuJianPanel_Label15.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label16.text = _arg_1;
            }, "_ManJiuJianPanel_Label16.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label20.text = _arg_1;
            }, "_ManJiuJianPanel_Label20.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label24.text = _arg_1;
            }, "_ManJiuJianPanel_Label24.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label28.text = _arg_1;
            }, "_ManJiuJianPanel_Label28.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label32.text = _arg_1;
            }, "_ManJiuJianPanel_Label32.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label36.text = _arg_1;
            }, "_ManJiuJianPanel_Label36.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label40.text = _arg_1;
            }, "_ManJiuJianPanel_Label40.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label44.text = _arg_1;
            }, "_ManJiuJianPanel_Label44.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label48.text = _arg_1;
            }, "_ManJiuJianPanel_Label48.text");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label52.text = _arg_1;
            }, "_ManJiuJianPanel_Label52.text");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label56.text = _arg_1;
            }, "_ManJiuJianPanel_Label56.text");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label57.text = _arg_1;
            }, "_ManJiuJianPanel_Label57.text");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label58.text = _arg_1;
            }, "_ManJiuJianPanel_Label58.text");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                title.filters = _arg_1;
            }, "title.filters");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                turnAll0.label = _arg_1;
            }, "turnAll0.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label62.text = _arg_1;
            }, "_ManJiuJianPanel_Label62.text");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MANJIUJIAN_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ManJiuJianPanel_Label63.text = _arg_1;
            }, "_ManJiuJianPanel_Label63.text");
            result[34] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get cart10():ManJiuJianOneCanvas
        {
            return (this._1367590593cart10);
        }

        [Bindable(event="propertyChange")]
        public function get cart12():ManJiuJianOneCanvas
        {
            return (this._1367590591cart12);
        }

        [Bindable(event="propertyChange")]
        public function get buySpe():DelayButton
        {
            return (this._1377570494buySpe);
        }

        [Bindable(event="propertyChange")]
        public function get cart14():ManJiuJianOneCanvas
        {
            return (this._1367590589cart14);
        }

        [Bindable(event="propertyChange")]
        public function get cart11():ManJiuJianOneCanvas
        {
            return (this._1367590592cart11);
        }

        [Bindable(event="propertyChange")]
        public function get cart13():ManJiuJianOneCanvas
        {
            return (this._1367590590cart13);
        }

        public function runBroadMsg(_arg_1:Event):void
        {
            if (arr.length == 0)
            {
                return;
            };
            if (arr.length == 1)
            {
                msgLab.text = Language.MANJIUJIAN_PANEL[28].replace("{name}", arr[_readIndex].n).replace("{num}", arr[_readIndex].cp);
            }
            else
            {
                msgLab.text = Language.MANJIUJIAN_PANEL[28].replace("{name}", arr[_readIndex].n).replace("{num}", arr[_readIndex].cp);
                _readIndex++;
                if (_readIndex >= arr.length)
                {
                    _readIndex = 0;
                };
            };
        }

        private function getManJiuJianItemNumByTid2(_arg_1:*):Number
        {
            var _local_2:*;
            if (((conf) && (conf.iInfo)))
            {
                for (_local_2 in conf.iInfo)
                {
                    if (ToolKit.isEqual(conf.iInfo[_local_2].iid, _arg_1))
                    {
                        return ((conf.iInfo[_local_2].lt) ? conf.iInfo[_local_2].lt : 0);
                    };
                };
            };
            return (0);
        }

        public function set vb(_arg_1:VBox):void
        {
            var _local_2:Object = this._3756vb;
            if (_local_2 !== _arg_1)
            {
                this._3756vb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vb", _local_2, _arg_1));
            };
        }

        public function set cpn1(_arg_1:Label):void
        {
            var _local_2:Object = this._3060400cpn1;
            if (_local_2 !== _arg_1)
            {
                this._3060400cpn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn1", _local_2, _arg_1));
            };
        }

        public function set cpn2(_arg_1:Label):void
        {
            var _local_2:Object = this._3060401cpn2;
            if (_local_2 !== _arg_1)
            {
                this._3060401cpn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cp2():Label
        {
            return (this._98661cp2);
        }

        [Bindable(event="propertyChange")]
        public function get cp3():Label
        {
            return (this._98662cp3);
        }

        [Bindable(event="propertyChange")]
        public function get cp4():Label
        {
            return (this._98663cp4);
        }

        [Bindable(event="propertyChange")]
        public function get cp6():Label
        {
            return (this._98665cp6);
        }

        [Bindable(event="propertyChange")]
        public function get cp7():Label
        {
            return (this._98666cp7);
        }

        [Bindable(event="propertyChange")]
        public function get cp9():Label
        {
            return (this._98668cp9);
        }

        public function set cpn4(_arg_1:Label):void
        {
            var _local_2:Object = this._3060403cpn4;
            if (_local_2 !== _arg_1)
            {
                this._3060403cpn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn4", _local_2, _arg_1));
            };
        }

        public function set cpn8(_arg_1:Label):void
        {
            var _local_2:Object = this._3060407cpn8;
            if (_local_2 !== _arg_1)
            {
                this._3060407cpn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cp5():Label
        {
            return (this._98664cp5);
        }

        public function set cpn9(_arg_1:Label):void
        {
            var _local_2:Object = this._3060408cpn9;
            if (_local_2 !== _arg_1)
            {
                this._3060408cpn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn9", _local_2, _arg_1));
            };
        }

        public function set cpn6(_arg_1:Label):void
        {
            var _local_2:Object = this._3060405cpn6;
            if (_local_2 !== _arg_1)
            {
                this._3060405cpn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn6", _local_2, _arg_1));
            };
        }

        public function onInitManJiuJianPanelData(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Number;
            if (_loadCid != _core.player.id)
            {
                _core.remote.call("initManJiuJianPanelData", new Responder(onInitManJiuJianPanelData), null, null);
                _loadCid = _core.player.id;
                return;
            };
            if (_arg_1)
            {
                if (_arg_1["mjjArr"])
                {
                    arr = new Array();
                };
                if (_arg_1["mjjData"])
                {
                    chardata = _arg_1["mjjData"];
                    lftLab.htmlText = Language.MANJIUJIAN_PANEL[5].replace("{num}", chardata.ft);
                };
                if (_arg_1["mjjConf"])
                {
                    conf = _arg_1["mjjConf"];
                    ver = conf.ver;
                    sver = conf.sver;
                    showItemShop();
                    intro.htmlText = conf.des;
                    intro1.htmlText = conf.sdes;
                    cpArr = new Array();
                    _local_2 = 0;
                    _local_3 = 1;
                    while (_local_3 <= 10)
                    {
                        cpArr[_local_3] = {};
                        cpArr[_local_3].r = _local_2;
                        _local_2 = (_local_2 + 36);
                        cpArr[_local_3].cp = conf[("cp" + _local_3)];
                        if (conf[("res" + _local_3)])
                        {
                            this[("cpres" + _local_3)].source = ResManager.getIconUrl(conf[("res" + _local_3)]);
                            this[("cpres" + ToolKit.add(10, _local_3))].source = ResManager.getIconUrl(conf[("res" + _local_3)]);
                        };
                        if (((chardata.cp) && (chardata.cp[conf[("cp" + _local_3)]])))
                        {
                            this[("cpnum" + _local_3)].text = Number(chardata.cp[conf[("cp" + _local_3)]]);
                        }
                        else
                        {
                            this[("cpnum" + _local_3)].text = "0";
                        };
                        _local_3++;
                    };
                    item.type = GamePredef.TBL_ITEM_TEMPLATE;
                    item.giid = conf.sid;
                    item.slotData = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][conf.sid];
                };
                resetCp(false);
                if (timer1.running)
                {
                    timer1.stop();
                };
                if (timer1.hasEventListener(TimerEvent.TIMER))
                {
                    timer1.removeEventListener(TimerEvent.TIMER, runBroadMsg);
                };
                timer1.addEventListener(TimerEvent.TIMER, runBroadMsg);
                timer1.start();
            };
        }

        [Bindable(event="propertyChange")]
        public function get cp8():Label
        {
            return (this._98667cp8);
        }

        public function set cpn7(_arg_1:Label):void
        {
            var _local_2:Object = this._3060406cpn7;
            if (_local_2 !== _arg_1)
            {
                this._3060406cpn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cp1():Label
        {
            return (this._98660cp1);
        }

        [Bindable(event="propertyChange")]
        public function get cpres1():Image
        {
            return (this._1353750146cpres1);
        }

        [Bindable(event="propertyChange")]
        public function get cpres2():Image
        {
            return (this._1353750145cpres2);
        }

        private function setSlot():void
        {
            var _local_2:Number;
            var _local_1:int;
            while (_local_1 < 15)
            {
                _local_2 = _local_1;
                if (_local_1 < itemList.length)
                {
                    this[("cart" + _local_2)].Point = itemList[_local_1].point;
                    this[("cart" + _local_2)].ItemId = itemList[_local_1].giid;
                    this[("cart" + _local_2)].slotData();
                    this[("cart" + _local_2)].setLimit(itemList[_local_1].limit, ToolKit.add(getManJiuJianItemNumByTid(itemList[_local_1].giid), ((cartObj[itemList[_local_1].giid]) ? cartObj[itemList[_local_1].giid] : 0)));
                    this[("cart" + _local_2)].visible = true;
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpres6():Image
        {
            return (this._1353750141cpres6);
        }

        private function addDataToList():ArrayCollection
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:Object = ((conf["iInfo"]) ? conf["iInfo"] : null);
            for each (_local_3 in _local_2)
            {
                if (_local_3 != null)
                {
                    _local_4 = new Object();
                    _local_4.type = _local_3.tid;
                    _local_4.giid = _local_3.iid;
                    _local_4.point = _local_3.pt;
                    _local_4.limit = _local_3.lt;
                    _local_1.addItem(_local_4);
                };
            };
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get cpres8():Image
        {
            return (this._1353750139cpres8);
        }

        public function set cpn3(_arg_1:Label):void
        {
            var _local_2:Object = this._3060402cpn3;
            if (_local_2 !== _arg_1)
            {
                this._3060402cpn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpres3():Image
        {
            return (this._1353750144cpres3);
        }

        [Bindable(event="propertyChange")]
        public function get cpres4():Image
        {
            return (this._1353750143cpres4);
        }

        public function __turnAll_click(_arg_1:MouseEvent):void
        {
            playManJiuJianTurnTableAll();
        }

        public function __cpadd2_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
        }

        [Bindable(event="propertyChange")]
        public function get cpres7():Image
        {
            return (this._1353750140cpres7);
        }

        public function set cpn5(_arg_1:Label):void
        {
            var _local_2:Object = this._3060404cpn5;
            if (_local_2 !== _arg_1)
            {
                this._3060404cpn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn5", _local_2, _arg_1));
            };
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            changeView(2);
        }

        public function set turnAll0(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._133638348turnAll0;
            if (_local_2 !== _arg_1)
            {
                this._133638348turnAll0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "turnAll0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpres5():Image
        {
            return (this._1353750142cpres5);
        }

        [Bindable(event="propertyChange")]
        public function get vsFlop():ViewStack
        {
            return (this._808329852vsFlop);
        }

        [Bindable(event="propertyChange")]
        public function get cpadd1():NumericStepper
        {
            return (this._1354258019cpadd1);
        }

        [Bindable(event="propertyChange")]
        public function get cpadd2():NumericStepper
        {
            return (this._1354258018cpadd2);
        }

        [Bindable(event="propertyChange")]
        public function get cpadd3():NumericStepper
        {
            return (this._1354258017cpadd3);
        }

        [Bindable(event="propertyChange")]
        public function get cpadd5():NumericStepper
        {
            return (this._1354258015cpadd5);
        }

        [Bindable(event="propertyChange")]
        public function get cpadd6():NumericStepper
        {
            return (this._1354258014cpadd6);
        }

        [Bindable(event="propertyChange")]
        public function get cpadd7():NumericStepper
        {
            return (this._1354258013cpadd7);
        }

        [Bindable(event="propertyChange")]
        public function get cpadd8():NumericStepper
        {
            return (this._1354258012cpadd8);
        }

        [Bindable(event="propertyChange")]
        public function get cpadd9():NumericStepper
        {
            return (this._1354258011cpadd9);
        }

        public function set angle(_arg_1:Number):void
        {
            var _local_2:Object = this._92960979angle;
            if (_local_2 !== _arg_1)
            {
                this._92960979angle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "angle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpadd4():NumericStepper
        {
            return (this._1354258016cpadd4);
        }

        [Bindable(event="propertyChange")]
        public function get cpres9():Image
        {
            return (this._1353750138cpres9);
        }

        public function set turnAll1(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._133638349turnAll1;
            if (_local_2 !== _arg_1)
            {
                this._133638349turnAll1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "turnAll1", _local_2, _arg_1));
            };
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_5:Number;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                _local_5 = _local_4;
                if (_local_3 < itemList.length)
                {
                    this[("cart" + _local_5)].Point = itemList[_local_3].point;
                    this[("cart" + _local_5)].ItemId = itemList[_local_3].giid;
                    this[("cart" + _local_5)].slotData();
                    this[("cart" + _local_5)].setLimit(itemList[_local_3].limit, ToolKit.add(getManJiuJianItemNumByTid(itemList[_local_3].giid), ((cartObj[itemList[_local_3].giid]) ? cartObj[itemList[_local_3].giid] : 0)));
                    this[("cart" + _local_5)].visible = true;
                };
                _local_4++;
            };
        }

        public function set title0(_arg_1:Label):void
        {
            var _local_2:Object = this._873453352title0;
            if (_local_2 !== _arg_1)
            {
                this._873453352title0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title0", _local_2, _arg_1));
            };
        }

        public function removeCart(_arg_1:Number):void
        {
            if (cartObj[_arg_1])
            {
                delete cartObj[_arg_1];
            };
            needFlush = true;
            resetCartPage();
            pageSelector.refreshPage();
        }

        [Bindable(event="propertyChange")]
        public function get ct2():Label
        {
            return (this._98785ct2);
        }

        [Bindable(event="propertyChange")]
        public function get ct3():Label
        {
            return (this._98786ct3);
        }

        [Bindable(event="propertyChange")]
        public function get ct4():Label
        {
            return (this._98787ct4);
        }

        public function set lftLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1105287949lftLab;
            if (_local_2 !== _arg_1)
            {
                this._1105287949lftLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lftLab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ct1():Label
        {
            return (this._98784ct1);
        }

        public function __cpadd7_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
        }

        [Bindable(event="propertyChange")]
        public function get uiC0():Image
        {
            return (this._3588577uiC0);
        }

        public function set changeAngle(_arg_1:Rotate):void
        {
            var _local_2:Object = this._1682357501changeAngle;
            if (_local_2 !== _arg_1)
            {
                this._1682357501changeAngle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeAngle", _local_2, _arg_1));
            };
        }

        public function changeCpNum():void
        {
            var _local_2:Number;
            var _local_4:*;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_1:Number = 0;
            _local_2 = 1;
            while (_local_2 <= 10)
            {
                _local_1 = ToolKit.add(_local_1, (conf[("cp" + _local_2)] * Number(this[("cpadd" + _local_2)].value)));
                _local_2++;
            };
            var _local_3:Number = 0;
            for (_local_4 in cartObj)
            {
                _local_6 = getManJiuJianItemNumByTid(_local_4);
                _local_7 = getManJiuJianItemNumByTid2(_local_4);
                _local_3 = ToolKit.add(_local_3, (getManJiuJianItemPtByTid2(_local_4) * Number(cartObj[_local_4])));
            };
            _local_5 = 0;
            _local_2 = 1;
            while (_local_2 <= 10)
            {
                if (ToolKit.isSmallThan(_local_3, conf[("s" + _local_2)])) break;
                _local_5 = conf[("p" + _local_2)];
                _local_2++;
            };
            ct.text = String(_local_5);
            myt.text = String(_local_1);
            ct3.text = String((((_local_5 > _local_1) ? _local_1 : _local_5) * 10));
            ct4.text = String(((ToolKit.minus(_local_3, Number(ct3.text)) > 0) ? ToolKit.minus(_local_3, Number(ct3.text)) : 0));
        }

        public function resetCp(_arg_1:Boolean):void
        {
            var _local_3:String;
            var _local_2:Number = 1;
            while (_local_2 <= 10)
            {
                _local_3 = conf[("cp" + _local_2)];
                this[("cp" + _local_2)].text = _local_3;
                this[("cpn" + _local_2)].text = ((chardata.cp[_local_3]) ? chardata.cp[_local_3] : "0");
                this[("cpadd" + _local_2)].maximum = ((chardata.cp[_local_3]) ? chardata.cp[_local_3] : "0");
                this[("cpnum" + _local_2)].text = (((chardata.cp) && (chardata.cp[Number(_local_3)])) ? chardata.cp[Number(_local_3)] : "0");
                if (_arg_1)
                {
                    this[("cpadd" + _local_2)].value = "0";
                };
                _local_2++;
            };
        }

        public function set cart0(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431504cart0;
            if (_local_2 !== _arg_1)
            {
                this._94431504cart0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart0", _local_2, _arg_1));
            };
        }

        public function set cart1(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431505cart1;
            if (_local_2 !== _arg_1)
            {
                this._94431505cart1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart1", _local_2, _arg_1));
            };
        }

        public function set cart3(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431507cart3;
            if (_local_2 !== _arg_1)
            {
                this._94431507cart3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart3", _local_2, _arg_1));
            };
        }

        public function set cart4(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431508cart4;
            if (_local_2 !== _arg_1)
            {
                this._94431508cart4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart4", _local_2, _arg_1));
            };
        }

        public function set item(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        public function set cart8(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431512cart8;
            if (_local_2 !== _arg_1)
            {
                this._94431512cart8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart8", _local_2, _arg_1));
            };
        }

        public function set cart5(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431509cart5;
            if (_local_2 !== _arg_1)
            {
                this._94431509cart5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart5", _local_2, _arg_1));
            };
        }

        private function playManJiuJianTurnTableAll():void
        {
            if (run)
            {
                _core.sysMsg(Language.MANJIUJIAN_PANEL[24]);
                return;
            };
            if (ToolKit.isSmallOrEqual(chardata.ft, 0))
            {
                _core.sysMsg(Language.MANJIUJIAN_PANEL[25]);
                return;
            };
            _core.remote.call("playManJiuJianTurnTableAll", null);
        }

        public function set cart7(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431511cart7;
            if (_local_2 !== _arg_1)
            {
                this._94431511cart7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart7", _local_2, _arg_1));
            };
        }

        public function set titleWrapper(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1969543397titleWrapper;
            if (_local_2 !== _arg_1)
            {
                this._1969543397titleWrapper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleWrapper", _local_2, _arg_1));
            };
        }

        public function onTurnTable(_arg_1:Number, _arg_2:Object, _arg_3:Number):void
        {
            var _local_4:*;
            var _local_5:*;
            if (initialized)
            {
                run = true;
                if (timer.running)
                {
                    timer.stop();
                };
                if (timer.hasEventListener(TimerEvent.TIMER))
                {
                    timer.removeEventListener(TimerEvent.TIMER, moveTurnTable);
                };
                count = 0;
                for (_local_4 in cpArr)
                {
                    if (ToolKit.isEqual(cpArr[_local_4].cp, _arg_1))
                    {
                        endCpRad = cpArr[_local_4].r;
                        break;
                    };
                };
                if (_arg_2)
                {
                    for (_local_5 in _arg_2)
                    {
                        chardata.cp[_local_5] = _arg_2[_local_5];
                    };
                }
                else
                {
                    if (!chardata.cp[_arg_1])
                    {
                        chardata.cp[_arg_1] = 0;
                    };
                    chardata.cp[_arg_1] = ToolKit.add(chardata.cp[_arg_1], 1);
                };
                chardata.ft = _arg_3;
                lftLab.htmlText = Language.MANJIUJIAN_PANEL[5].replace("{num}", chardata.ft);
                timer.addEventListener(TimerEvent.TIMER, moveTurnTable);
                timer.start();
            };
        }

        public function set cart6(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431510cart6;
            if (_local_2 !== _arg_1)
            {
                this._94431510cart6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart6", _local_2, _arg_1));
            };
        }

        public function set cart2(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431506cart2;
            if (_local_2 !== _arg_1)
            {
                this._94431506cart2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart2", _local_2, _arg_1));
            };
        }

        public function set cart9(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._94431513cart9;
            if (_local_2 !== _arg_1)
            {
                this._94431513cart9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpadd10():NumericStepper
        {
            return (this._967674419cpadd10);
        }

        public function onUpdateManJiuJianLimitItemAll(_arg_1:Object, _arg_2:Object):void
        {
            var _local_3:*;
            var _local_4:*;
            if (initialized)
            {
                for (_local_3 in _arg_1)
                {
                    chardata.lt[_local_3] = _arg_1[_local_3];
                };
                for (_local_4 in _arg_2)
                {
                    chardata.cp[_local_4] = _arg_2[_local_4];
                };
                cartObj = {};
                needFlush = true;
                resetCartPage();
                resetCp(true);
                pageSelector.refreshPage();
            };
        }

        [Bindable(event="propertyChange")]
        public function get msgLab():Label
        {
            return (this._1065040308msgLab);
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        [Bindable(event="propertyChange")]
        public function get title():Label
        {
            return (this._110371416title);
        }

        [Bindable(event="propertyChange")]
        public function get intro():IntroText
        {
            return (this._100361836intro);
        }

        [Bindable(event="propertyChange")]
        public function get cpres10():Image
        {
            return (this._983418482cpres10);
        }

        [Bindable(event="propertyChange")]
        public function get cpres11():Image
        {
            return (this._983418483cpres11);
        }

        [Bindable(event="propertyChange")]
        public function get cpres12():Image
        {
            return (this._983418484cpres12);
        }

        private function changeView(_arg_1:Number):void
        {
            vsFlop.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 4)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
            if (_arg_1 == 2)
            {
                resetCartPage();
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpres14():Image
        {
            return (this._983418486cpres14);
        }

        [Bindable(event="propertyChange")]
        public function get cpres16():Image
        {
            return (this._983418488cpres16);
        }

        [Bindable(event="propertyChange")]
        public function get cpres18():Image
        {
            return (this._983418490cpres18);
        }

        [Bindable(event="propertyChange")]
        public function get cpres19():Image
        {
            return (this._983418491cpres19);
        }

        public function __cpadd3_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
        }

        public function set cart11(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._1367590592cart11;
            if (_local_2 !== _arg_1)
            {
                this._1367590592cart11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart11", _local_2, _arg_1));
            };
        }

        public function set cart12(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._1367590591cart12;
            if (_local_2 !== _arg_1)
            {
                this._1367590591cart12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart12", _local_2, _arg_1));
            };
        }

        private function clearPage():void
        {
            var _local_2:Number;
            var _local_1:int;
            while (_local_1 < 15)
            {
                _local_2 = _local_1;
                this[("cart" + _local_2)].visible = false;
                _local_1++;
            };
        }

        public function set cart14(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._1367590589cart14;
            if (_local_2 !== _arg_1)
            {
                this._1367590589cart14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpres15():Image
        {
            return (this._983418487cpres15);
        }

        [Bindable(event="propertyChange")]
        public function get cpres17():Image
        {
            return (this._983418489cpres17);
        }

        public function set buySpe(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1377570494buySpe;
            if (_local_2 !== _arg_1)
            {
                this._1377570494buySpe = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buySpe", _local_2, _arg_1));
            };
        }

        public function onUpdateManJiuJianLimitItem(_arg_1:Number, _arg_2:Number):void
        {
            if (initialized)
            {
                chardata.lt[_arg_1] = _arg_2;
                if (_arg_1 != conf.sid)
                {
                    pageSelector.refreshPage();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpres13():Image
        {
            return (this._983418485cpres13);
        }

        public function set cp10(_arg_1:Label):void
        {
            var _local_2:Object = this._3058508cp10;
            if (_local_2 !== _arg_1)
            {
                this._3058508cp10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp10", _local_2, _arg_1));
            };
        }

        public function set intro1(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1183750331intro1;
            if (_local_2 !== _arg_1)
            {
                this._1183750331intro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "intro1", _local_2, _arg_1));
            };
        }

        public function set cart13(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._1367590590cart13;
            if (_local_2 !== _arg_1)
            {
                this._1367590590cart13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpres20():Image
        {
            return (this._983418513cpres20);
        }

        public function set cart10(_arg_1:ManJiuJianOneCanvas):void
        {
            var _local_2:Object = this._1367590593cart10;
            if (_local_2 !== _arg_1)
            {
                this._1367590593cart10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cart10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vb():VBox
        {
            return (this._3756vb);
        }

        [Bindable(event="propertyChange")]
        public function get cpn1():Label
        {
            return (this._3060400cpn1);
        }

        [Bindable(event="propertyChange")]
        public function get cpn4():Label
        {
            return (this._3060403cpn4);
        }

        [Bindable(event="propertyChange")]
        public function get cpn6():Label
        {
            return (this._3060405cpn6);
        }

        [Bindable(event="propertyChange")]
        public function get cpn7():Label
        {
            return (this._3060406cpn7);
        }

        [Bindable(event="propertyChange")]
        public function get cpn8():Label
        {
            return (this._3060407cpn8);
        }

        [Bindable(event="propertyChange")]
        public function get cpn2():Label
        {
            return (this._3060401cpn2);
        }

        [Bindable(event="propertyChange")]
        public function get cpn3():Label
        {
            return (this._3060402cpn3);
        }

        public function set cpnum7(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854114cpnum7;
            if (_local_2 !== _arg_1)
            {
                this._1353854114cpnum7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum7", _local_2, _arg_1));
            };
        }

        public function set cpnum4(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854117cpnum4;
            if (_local_2 !== _arg_1)
            {
                this._1353854117cpnum4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum4", _local_2, _arg_1));
            };
        }

        public function set cpnum8(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854113cpnum8;
            if (_local_2 !== _arg_1)
            {
                this._1353854113cpnum8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpn9():Label
        {
            return (this._3060408cpn9);
        }

        public function set cpnum2(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854119cpnum2;
            if (_local_2 !== _arg_1)
            {
                this._1353854119cpnum2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum2", _local_2, _arg_1));
            };
        }

        public function showItemShop():void
        {
            if (initialized)
            {
                itemList.removeAll();
                itemList = addDataToList();
                setSlot();
                pageSelector.onPageChanged = onPageChanged;
                pageSelector.onPageCleared = clearPage;
                pageSelector.initPageSeletor(itemList.length, 15);
            };
        }

        public function set cpnum5(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854116cpnum5;
            if (_local_2 !== _arg_1)
            {
                this._1353854116cpnum5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum5", _local_2, _arg_1));
            };
        }

        public function set cp1(_arg_1:Label):void
        {
            var _local_2:Object = this._98660cp1;
            if (_local_2 !== _arg_1)
            {
                this._98660cp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp1", _local_2, _arg_1));
            };
        }

        public function set cpnum6(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854115cpnum6;
            if (_local_2 !== _arg_1)
            {
                this._1353854115cpnum6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum6", _local_2, _arg_1));
            };
        }

        public function set cp2(_arg_1:Label):void
        {
            var _local_2:Object = this._98661cp2;
            if (_local_2 !== _arg_1)
            {
                this._98661cp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp2", _local_2, _arg_1));
            };
        }

        public function __cpadd8_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
        }

        public function set cp3(_arg_1:Label):void
        {
            var _local_2:Object = this._98662cp3;
            if (_local_2 !== _arg_1)
            {
                this._98662cp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp3", _local_2, _arg_1));
            };
        }

        public function set cp4(_arg_1:Label):void
        {
            var _local_2:Object = this._98663cp4;
            if (_local_2 !== _arg_1)
            {
                this._98663cp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp4", _local_2, _arg_1));
            };
        }

        public function set cpnum9(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854112cpnum9;
            if (_local_2 !== _arg_1)
            {
                this._1353854112cpnum9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum9", _local_2, _arg_1));
            };
        }

        public function set cp5(_arg_1:Label):void
        {
            var _local_2:Object = this._98664cp5;
            if (_local_2 !== _arg_1)
            {
                this._98664cp5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp5", _local_2, _arg_1));
            };
        }

        public function set cp6(_arg_1:Label):void
        {
            var _local_2:Object = this._98665cp6;
            if (_local_2 !== _arg_1)
            {
                this._98665cp6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp6", _local_2, _arg_1));
            };
        }

        public function set cp7(_arg_1:Label):void
        {
            var _local_2:Object = this._98666cp7;
            if (_local_2 !== _arg_1)
            {
                this._98666cp7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp7", _local_2, _arg_1));
            };
        }

        public function set cp8(_arg_1:Label):void
        {
            var _local_2:Object = this._98667cp8;
            if (_local_2 !== _arg_1)
            {
                this._98667cp8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp8", _local_2, _arg_1));
            };
        }

        public function set cp9(_arg_1:Label):void
        {
            var _local_2:Object = this._98668cp9;
            if (_local_2 !== _arg_1)
            {
                this._98668cp9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cp9", _local_2, _arg_1));
            };
        }

        public function set cpnum1(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854120cpnum1;
            if (_local_2 !== _arg_1)
            {
                this._1353854120cpnum1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpn5():Label
        {
            return (this._3060404cpn5);
        }

        public function set cpnum3(_arg_1:Label):void
        {
            var _local_2:Object = this._1353854118cpnum3;
            if (_local_2 !== _arg_1)
            {
                this._1353854118cpnum3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum3", _local_2, _arg_1));
            };
        }

        public function set cpres2(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750145cpres2;
            if (_local_2 !== _arg_1)
            {
                this._1353750145cpres2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres2", _local_2, _arg_1));
            };
        }

        public function set cpn10(_arg_1:Label):void
        {
            var _local_2:Object = this._94872448cpn10;
            if (_local_2 !== _arg_1)
            {
                this._94872448cpn10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpn10", _local_2, _arg_1));
            };
        }

        public function set cpres4(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750143cpres4;
            if (_local_2 !== _arg_1)
            {
                this._1353750143cpres4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get changeAngle():Rotate
        {
            return (this._1682357501changeAngle);
        }

        public function set cpres6(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750141cpres6;
            if (_local_2 !== _arg_1)
            {
                this._1353750141cpres6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres6", _local_2, _arg_1));
            };
        }

        public function set cpres3(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750144cpres3;
            if (_local_2 !== _arg_1)
            {
                this._1353750144cpres3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres3", _local_2, _arg_1));
            };
        }

        public function set cpres7(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750140cpres7;
            if (_local_2 !== _arg_1)
            {
                this._1353750140cpres7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres7", _local_2, _arg_1));
            };
        }

        public function set cpres8(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750139cpres8;
            if (_local_2 !== _arg_1)
            {
                this._1353750139cpres8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres8", _local_2, _arg_1));
            };
        }

        public function set cpres9(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750138cpres9;
            if (_local_2 !== _arg_1)
            {
                this._1353750138cpres9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres9", _local_2, _arg_1));
            };
        }

        public function set cpres5(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750142cpres5;
            if (_local_2 !== _arg_1)
            {
                this._1353750142cpres5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get titleWrapper():Canvas
        {
            return (this._1969543397titleWrapper);
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlot
        {
            return (this._3242771item);
        }

        public function __cpadd10_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
        }

        public function set cpres1(_arg_1:Image):void
        {
            var _local_2:Object = this._1353750146cpres1;
            if (_local_2 !== _arg_1)
            {
                this._1353750146cpres1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpres1", _local_2, _arg_1));
            };
        }

        private function playManJiuJianTurnTable():void
        {
            if (run)
            {
                _core.sysMsg(Language.MANJIUJIAN_PANEL[24]);
                return;
            };
            if (ToolKit.isSmallOrEqual(chardata.ft, 0))
            {
                _core.sysMsg(Language.MANJIUJIAN_PANEL[25]);
                return;
            };
            _core.remote.call("playManJiuJianTurnTableOne", null);
        }

        public function set cpadd1(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258019cpadd1;
            if (_local_2 !== _arg_1)
            {
                this._1354258019cpadd1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd1", _local_2, _arg_1));
            };
        }

        public function set cpadd2(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258018cpadd2;
            if (_local_2 !== _arg_1)
            {
                this._1354258018cpadd2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd2", _local_2, _arg_1));
            };
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

        public function set cpadd5(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258015cpadd5;
            if (_local_2 !== _arg_1)
            {
                this._1354258015cpadd5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd5", _local_2, _arg_1));
            };
        }

        private function getManJiuJianItemNumByTid(_arg_1:*):Number
        {
            if (((chardata) && (chardata.lt)))
            {
                return ((chardata.lt[_arg_1]) ? chardata.lt[_arg_1] : 0);
            };
            return (0);
        }

        public function set cpadd8(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258012cpadd8;
            if (_local_2 !== _arg_1)
            {
                this._1354258012cpadd8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd8", _local_2, _arg_1));
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        public function set cpadd6(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258014cpadd6;
            if (_local_2 !== _arg_1)
            {
                this._1354258014cpadd6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cp10():Label
        {
            return (this._3058508cp10);
        }

        public function set cpadd3(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258017cpadd3;
            if (_local_2 !== _arg_1)
            {
                this._1354258017cpadd3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd3", _local_2, _arg_1));
            };
        }

        public function __cpadd4_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
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

        public function set cpadd9(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258011cpadd9;
            if (_local_2 !== _arg_1)
            {
                this._1354258011cpadd9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd9", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get cpnum4():Label
        {
            return (this._1353854117cpnum4);
        }

        [Bindable(event="propertyChange")]
        public function get cpnum1():Label
        {
            return (this._1353854120cpnum1);
        }

        public function addCart(_arg_1:Number):void
        {
            var _local_2:Number = ToolKit.minus(getManJiuJianItemNumByTid2(_arg_1), getManJiuJianItemNumByTid(_arg_1));
            _local_2 = ToolKit.minus(_local_2, ((cartObj[_arg_1]) ? cartObj[_arg_1] : 0));
            if (ToolKit.isSmallOrEqual(_local_2, 0))
            {
                _core.sysMsg(Language.MANJIUJIAN_PANEL[22]);
                return;
            };
            if (!cartObj[_arg_1])
            {
                cartObj[_arg_1] = 0;
            };
            cartObj[_arg_1] = ToolKit.add(cartObj[_arg_1], 1);
            pageSelector.refreshPage();
            needFlush = true;
        }

        public function set cpadd4(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258016cpadd4;
            if (_local_2 !== _arg_1)
            {
                this._1354258016cpadd4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd4", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get cpnum8():Label
        {
            return (this._1353854113cpnum8);
        }

        [Bindable(event="propertyChange")]
        public function get cpnum9():Label
        {
            return (this._1353854112cpnum9);
        }

        public function set cpadd7(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1354258013cpadd7;
            if (_local_2 !== _arg_1)
            {
                this._1354258013cpadd7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpadd7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpnum3():Label
        {
            return (this._1353854118cpnum3);
        }

        [Bindable(event="propertyChange")]
        public function get cpnum6():Label
        {
            return (this._1353854115cpnum6);
        }

        [Bindable(event="propertyChange")]
        public function get cpnum2():Label
        {
            return (this._1353854119cpnum2);
        }

        [Bindable(event="propertyChange")]
        public function get cpnum5():Label
        {
            return (this._1353854116cpnum5);
        }

        public function __turnAll1_click(_arg_1:MouseEvent):void
        {
            playManJiuJianTurnTable();
        }

        [Bindable(event="propertyChange")]
        public function get cpn10():Label
        {
            return (this._94872448cpn10);
        }

        [Bindable(event="propertyChange")]
        public function get cpnum7():Label
        {
            return (this._1353854114cpnum7);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:ManJiuJianPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ManJiuJianPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ManJiuJianPanelWatcherSetupUtil");
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
        public function get intro1():IntroText
        {
            return (this._1183750331intro1);
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

        public function set cpnum10(_arg_1:Label):void
        {
            var _local_2:Object = this._980195288cpnum10;
            if (_local_2 !== _arg_1)
            {
                this._980195288cpnum10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpnum10", _local_2, _arg_1));
            };
        }

        public function __cpadd9_change(_arg_1:NumericStepperEvent):void
        {
            changeCpNum();
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

        public function set ct2(_arg_1:Label):void
        {
            var _local_2:Object = this._98785ct2;
            if (_local_2 !== _arg_1)
            {
                this._98785ct2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct2", _local_2, _arg_1));
            };
        }

        public function set ct3(_arg_1:Label):void
        {
            var _local_2:Object = this._98786ct3;
            if (_local_2 !== _arg_1)
            {
                this._98786ct3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct3", _local_2, _arg_1));
            };
        }

        public function set ct4(_arg_1:Label):void
        {
            var _local_2:Object = this._98787ct4;
            if (_local_2 !== _arg_1)
            {
                this._98787ct4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct4", _local_2, _arg_1));
            };
        }

        public function set ct1(_arg_1:Label):void
        {
            var _local_2:Object = this._98784ct1;
            if (_local_2 !== _arg_1)
            {
                this._98784ct1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct1", _local_2, _arg_1));
            };
        }

        public function set turnAll(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._965520412turnAll;
            if (_local_2 !== _arg_1)
            {
                this._965520412turnAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "turnAll", _local_2, _arg_1));
            };
        }

        public function set uiC0(_arg_1:Image):void
        {
            var _local_2:Object = this._3588577uiC0;
            if (_local_2 !== _arg_1)
            {
                this._3588577uiC0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "uiC0", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initManJiuJianPanelData", new Responder(onInitManJiuJianPanelData), ver, sver);
        }

        [Bindable(event="propertyChange")]
        public function get cpnum10():Label
        {
            return (this._980195288cpnum10);
        }

        [Bindable(event="propertyChange")]
        public function get turnAll():DelayButton
        {
            return (this._965520412turnAll);
        }


    }
}//package com.qeedoo.ui.view.compDragable

