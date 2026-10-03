// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetStonePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.PetStoneSlot;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.PetStoneBag;
    import mx.controls.LinkButton;
    import mx.controls.RadioButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import mx.controls.Image;
    import mx.controls.NumericStepper;
    import mx.controls.RadioButtonGroup;
    import mx.controls.TextArea;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.NumericStepperEvent;
    import flash.net.Responder;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.events.IndexChangedEvent;
    import mx.events.CloseEvent;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.ui.view.comp.PetStoneEquipBag;
    import style.Assets;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.FlexEvent;
    import flash.events.Event;
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

    public class PetStonePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1584105757viewStack:ViewStack;
        private var _1404245682setSlot2:PetStoneSlot;
        private var _1343200970needSilLbl:Label;
        private var _1404245684setSlot4:PetStoneSlot;
        private var _1404245686setSlot6:PetStoneSlot;
        private var equipBagAdded:Boolean = false;
        private var _2090889325subSlot1:PetStoneSlot;
        private var _682241456nextStoneSlot:PetStoneSlot;
        private var _1464994982energySlot:PetStoneSlot;
        private var _2090889323subSlot3:PetStoneSlot;
        private var _503675810petStoneBag:PetStoneBag;
        public var _PetStonePanel_LinkButton1:LinkButton;
        private var _1881374169norSkillCbx:RadioButton;
        public var _PetStonePanel_Label10:Label;
        public var _PetStonePanel_Label11:Label;
        public var _PetStonePanel_Label12:Label;
        public var _PetStonePanel_Label17:Label;
        public var _PetStonePanel_Label18:Label;
        public var _PetStonePanel_Label20:Label;
        public var _PetStonePanel_Label21:Label;
        private var _1505682713equSlot:PetStoneSlot;
        public var _PetStonePanel_IntroText1:IntroText;
        public var _PetStonePanel_IntroText2:IntroText;
        public var _PetStonePanel_IntroText3:IntroText;
        public var _PetStonePanel_IntroText4:IntroText;
        public var _PetStonePanel_IntroText5:IntroText;
        private var _1990994044skillName:Label;
        private var _1404245681setSlot1:PetStoneSlot;
        private var _1404245683setSlot3:PetStoneSlot;
        private var _1404245685setSlot5:PetStoneSlot;
        public var _PetStonePanel_Label1:Label;
        public var _PetStonePanel_Label2:Label;
        public var _PetStonePanel_Label3:Label;
        public var _PetStonePanel_Label4:Label;
        public var _PetStonePanel_Label6:Label;
        public var _PetStonePanel_Label7:Label;
        public var _PetStonePanel_Label8:Label;
        public var _PetStonePanel_Label9:Label;
        private var _982857296speSkillCbx:RadioButton;
        private var _1952778762resolveSlot:PetStoneSlot;
        private var _2090889326subSlot0:PetStoneSlot;
        private var _1322604301eTitle:BasicTitleCanvas;
        private var _2090889324subSlot2:PetStoneSlot;
        public var _PetStonePanel_BasicGlowButton2:BasicGlowButton;
        public var _PetStonePanel_BasicGlowButton3:BasicGlowButton;
        public var _PetStonePanel_BasicGlowButton4:BasicGlowButton;
        private var _2067262411showBag:BasicGlowButton;
        private var _2090889322subSlot4:PetStoneSlot;
        private var _803559802pageTab:HButtonTab;
        private var _573030417needEnergyStoneLbl:Label;
        private var _2142426113skillDes:Label;
        private var _1715996377selectImg:Image;
        private var _1999908673canGetEnergyStoneLbl:Label;
        private var _503230304preStoneSlot:PetStoneSlot;
        private var _1991070036skillProp:Label;
        private var _1599579654resolveNum:NumericStepper;
        private var _2131902710changeType:RadioButtonGroup;
        private var _1802392031skillDesNew:TextArea;
        private var _599377882compoNum:NumericStepper;
        private var _cid:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":544,
                    "height":325,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"eTitle"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":36,
                                "selectedIndex":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewStack",
                        "events":{"change":"__viewStack_change"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":11,
                                "y":60,
                                "width":352,
                                "height":250,
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
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"_PetStonePanel_IntroText1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":340,
                                                        "height":70,
                                                        "x":7,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"nextStoneSlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":false,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":131,
                                                        "x":225
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"preStoneSlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":131,
                                                        "x":76
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":209,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":61,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":57,
                                                        "y":196
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"compoNum",
                                                "events":{"change":"__compoNum_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":108,
                                                        "y":194,
                                                        "minimum":1,
                                                        "maximum":999
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "events":{"click":"___PetStonePanel_BasicGlowButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdGreen",
                                                        "label":"Hợp",
                                                        "x":173,
                                                        "y":194
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":216,
                                                        "y":195
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"needSilLbl",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"0",
                                                        "x":272,
                                                        "y":195
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
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"_PetStonePanel_IntroText2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":340,
                                                        "height":70,
                                                        "x":7,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"subSlot0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":130,
                                                        "x":158
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"subSlot1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":108,
                                                        "x":77
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"subSlot2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":108,
                                                        "x":243
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"subSlot3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":160,
                                                        "x":77
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"subSlot4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":160,
                                                        "x":243
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":155.5,
                                                        "y":102
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":241,
                                                        "y":83
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":83
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_PetStonePanel_BasicGlowButton2",
                                                "events":{"click":"___PetStonePanel_BasicGlowButton2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdGreen",
                                                        "x":159,
                                                        "y":195
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
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"_PetStonePanel_IntroText3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":340,
                                                        "height":70,
                                                        "x":7,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"equSlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":true,
                                                        "width":34,
                                                        "height":34,
                                                        "y":136,
                                                        "x":41
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"selectImg",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":127,
                                                        "y":83,
                                                        "mouseEnabled":false,
                                                        "visible":true,
                                                        "mouseChildren":false,
                                                        "maintainAspectRatio":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"setSlot1",
                                                "events":{"click":"__setSlot1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":108,
                                                        "x":122
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"setSlot2",
                                                "events":{"click":"__setSlot2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":108,
                                                        "x":182
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"setSlot3",
                                                "events":{"click":"__setSlot3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":108,
                                                        "x":247
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"setSlot4",
                                                "events":{"click":"__setSlot4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":163,
                                                        "x":122
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"setSlot5",
                                                "events":{"click":"__setSlot5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":163,
                                                        "x":182
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"setSlot6",
                                                "events":{"click":"__setSlot6_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":163,
                                                        "x":247
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32,
                                                        "y":108
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
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"_PetStonePanel_IntroText4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":340,
                                                        "height":70,
                                                        "x":7,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_PetStonePanel_LinkButton1",
                                                "events":{"click":"___PetStonePanel_LinkButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textDecoration = "underline";
                                                    this.fontSize = 11;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":-1,
                                                        "y":77
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"energySlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":126,
                                                        "x":85
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":94
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label11",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":233.5,
                                                        "y":94
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label12",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38.5,
                                                        "y":168
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"skillProp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "x":186,
                                                        "y":114
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"skillName",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "x":186,
                                                        "y":140
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"skillDes",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":true,
                                                        "x":186,
                                                        "y":165
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"skillDesNew",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":243,
                                                        "y":166,
                                                        "width":99,
                                                        "height":73,
                                                        "alpha":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"needEnergyStoneLbl",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"1000",
                                                        "x":174.5,
                                                        "y":168
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"speSkillCbx",
                                                "events":{"click":"__speSkillCbx_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 11;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":203,
                                                        "groupName":"changeType",
                                                        "selected":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"norSkillCbx",
                                                "events":{"click":"__norSkillCbx_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 11;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":219,
                                                        "groupName":"changeType"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_PetStonePanel_BasicGlowButton3",
                                                "events":{"click":"___PetStonePanel_BasicGlowButton3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdGreen",
                                                        "x":152,
                                                        "y":213
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
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"_PetStonePanel_IntroText5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":340,
                                                        "height":70,
                                                        "x":7,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PetStoneSlot,
                                                "id":"resolveSlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "acceptable":true,
                                                        "movable":false,
                                                        "width":34,
                                                        "height":34,
                                                        "y":115,
                                                        "x":159
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label17",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":143.5,
                                                        "y":89
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetStonePanel_Label18",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":128,
                                                        "y":157
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"canGetEnergyStoneLbl",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"0",
                                                        "x":202,
                                                        "y":157
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"resolveNum",
                                                "events":{"change":"__resolveNum_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":108,
                                                        "y":194,
                                                        "minimum":1,
                                                        "maximum":9999
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_PetStonePanel_BasicGlowButton4",
                                                "events":{"click":"___PetStonePanel_BasicGlowButton4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdGreen",
                                                        "x":190,
                                                        "y":194
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PetStonePanel_Label20",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":403,
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PetStonePanel_Label21",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 0xFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":477,
                                "y":39
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PetStoneBag,
                        "id":"petStoneBag",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":67,
                                "x":371
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"showBag",
                        "events":{"click":"__showBag_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":530,
                                "y":110,
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
        private var _bagData:Array = [];
        public var equipBag:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetStonePanel()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 544;
            this.height = 325;
            _PetStonePanel_RadioButtonGroup1_i();
            this.addEventListener("creationComplete", ___PetStonePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetStonePanel._watcherSetupUtil = _arg_1;
        }


        public function set resolveNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1599579654resolveNum;
            if (_local_2 !== _arg_1)
            {
                this._1599579654resolveNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolveNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skillDes():Label
        {
            return (this._2142426113skillDes);
        }

        public function __compoNum_change(_arg_1:NumericStepperEvent):void
        {
            updateNeedSilLbl();
        }

        [Bindable(event="propertyChange")]
        public function get resolveSlot():PetStoneSlot
        {
            return (this._1952778762resolveSlot);
        }

        public function updatePetStoneSetSlot():void
        {
            _core.remote.call("getPetStoneByEid", new Responder(onUpdatePetStoneSetSlot), (this["equSlot"] as PetStoneSlot).giid);
        }

        public function set changeType(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._2131902710changeType;
            if (_local_2 !== _arg_1)
            {
                this._2131902710changeType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeType", _local_2, _arg_1));
            };
        }

        public function set skillDes(_arg_1:Label):void
        {
            var _local_2:Object = this._2142426113skillDes;
            if (_local_2 !== _arg_1)
            {
                this._2142426113skillDes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillDes", _local_2, _arg_1));
            };
        }

        public function updatePetStoneResolveSlot(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = GameData.d[GamePredef.TBL_PET_STONE][_arg_1.giid];
            if (Number((_local_2["energyFlag"] == 1)))
            {
                Alert.show(Language.PET_STONE_PANEL[14]);
            };
            var _local_3:PetStoneSlot = (this["resolveSlot"] as PetStoneSlot);
            _local_3.type = GamePredef.TBL_PET_STONE;
            _local_3.quality = _arg_1.quality;
            _local_3.giid = _arg_1.giid;
            _local_3.slotData = _arg_1.slotData;
            _local_3.stackNum = _arg_1.stackNum;
            _local_3.skillId = _arg_1.skillId;
            (this["resolveNum"] as NumericStepper).maximum = _local_3.stackNum;
            _local_3.sid = _arg_1.sid;
            updateCanGetEnergyStoneLbl();
        }

        public function updatePetStoneSetEquipSlot(_arg_1:Object):void
        {
            var _local_2:PetStoneSlot = (this["equSlot"] as PetStoneSlot);
            _local_2.type = GamePredef.TBL_EQUIPT_INSTANCE;
            _local_2.quality = _arg_1.quality;
            _local_2.giid = _arg_1.giid;
            _local_2.slotData = _arg_1.slotData;
            _local_2.stackNum = _arg_1.stackNum;
            updatePetStoneSetSlot();
        }

        public function set resolveSlot(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1952778762resolveSlot;
            if (_local_2 !== _arg_1)
            {
                this._1952778762resolveSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolveSlot", _local_2, _arg_1));
            };
        }

        public function __setSlot4_click(_arg_1:MouseEvent):void
        {
            dispatchPetStoneEvt(4);
        }

        [Bindable(event="propertyChange")]
        public function get compoNum():NumericStepper
        {
            return (this._599377882compoNum);
        }

        public function __showBag_click(_arg_1:MouseEvent):void
        {
            changeBagVis();
        }

        public function clearSlotData():void
        {
            var _local_1:int;
            var _local_2:PetStoneSlot;
            (this["preStoneSlot"] as Slot).clean();
            (this["nextStoneSlot"] as Slot).clean();
            (this["needSilLbl"] as Label).text = "0";
            (this["canGetEnergyStoneLbl"] as Label).text = "0";
            (this["resolveSlot"] as PetStoneSlot).clean();
            _local_1 = 0;
            while (_local_1 < 5)
            {
                _local_2 = (this[("subSlot" + _local_1)] as PetStoneSlot);
                _local_2.clean();
                _local_1++;
            };
            (this["equSlot"] as PetStoneSlot).clean();
            _local_1 = 1;
            while (_local_1 <= 6)
            {
                _local_2 = (this[("setSlot" + _local_1)] as PetStoneSlot);
                _local_2.clean();
                _local_1++;
            };
            energySlot.clean();
            skillProp.text = Language.PET_STONE_PANEL[5];
            skillProp.visible = false;
            skillDesNew.text = "";
            skillDesNew.visible = false;
            skillDes.visible = false;
            skillName.text = Language.PET_STONE_PANEL[6];
            skillName.visible = false;
        }

        private function composePetStone():void
        {
            var _local_1:PetStoneSlot = (this["preStoneSlot"] as PetStoneSlot);
            if (_local_1.giid < 1)
            {
                Alert.show(Language.PET_STONE_PANEL[7]);
                return;
            };
            var _local_2:int = (this["compoNum"] as NumericStepper).value;
            _core.remote.call("composePetStone", new Responder(updatePetStoneBagData), _local_1.sid, _local_2, _core.cid);
            (this["preStoneSlot"] as Slot).clean();
            (this["nextStoneSlot"] as Slot).clean();
            (this["needSilLbl"] as Label).text = "0";
        }

        public function ___PetStonePanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            absorbPetStone();
        }

        private function skillInfoShow():void
        {
            Alert.show(Language.PET_STONE_PANEL[44]);
        }

        public function set compoNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._599377882compoNum;
            if (_local_2 !== _arg_1)
            {
                this._599377882compoNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "compoNum", _local_2, _arg_1));
            };
        }

        public function set selectImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1715996377selectImg;
            if (_local_2 !== _arg_1)
            {
                this._1715996377selectImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectImg", _local_2, _arg_1));
            };
        }

        public function __speSkillCbx_click(_arg_1:MouseEvent):void
        {
            changeSkillType();
        }

        public function __setSlot1_click(_arg_1:MouseEvent):void
        {
            dispatchPetStoneEvt(1);
        }

        [Bindable(event="propertyChange")]
        public function get nextStoneSlot():PetStoneSlot
        {
            return (this._682241456nextStoneSlot);
        }

        public function updatePetStoneBagData(_arg_1:Array):void
        {
            _bagData = _arg_1;
            if (_arg_1)
            {
                (this["petStoneBag"] as PetStoneBag).updatePage(_arg_1);
            };
        }

        public function __viewStack_change(_arg_1:IndexChangedEvent):void
        {
            changeSelectedIndex();
        }

        public function set needSilLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._1343200970needSilLbl;
            if (_local_2 !== _arg_1)
            {
                this._1343200970needSilLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needSilLbl", _local_2, _arg_1));
            };
        }

        public function updatePetStoneEnergySlot(_arg_1:PetStoneSlot, _arg_2:PetStoneSlot):void
        {
            var _local_6:PetStoneSlot;
            var _local_7:int;
            var _local_3:Object = GameData.d[GamePredef.TBL_PET_STONE][_arg_1.giid];
            if (Number(_local_3["level"]) < 5)
            {
                Alert.show(Language.PET_STONE_PANEL[9]);
                return;
            };
            if (Number((_local_3["energyFlag"] == 1)))
            {
                Alert.show(Language.PET_STONE_PANEL[10]);
                return;
            };
            var _local_4:int;
            var _local_5:int;
            while (_local_5 < 5)
            {
                _local_6 = (this[("subSlot" + _local_5)] as PetStoneSlot);
                _local_7 = _local_6.giid;
                if (_local_7 == _arg_1.giid)
                {
                    _local_4++;
                };
                _local_5++;
            };
            if (_local_4 >= _bagData[_arg_1.sid][1])
            {
                Alert.show(Language.PET_STONE_PANEL[11]);
                return;
            };
            _arg_2.type = GamePredef.TBL_PET_STONE;
            _arg_2.quality = _arg_1.quality;
            _arg_2.giid = _arg_1.giid;
            _arg_2.slotData = _arg_1.slotData;
            _arg_2.sid = _arg_1.sid;
        }

        [Bindable(event="propertyChange")]
        public function get skillName():Label
        {
            return (this._1990994044skillName);
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        private function changePetStoneEnergy():void
        {
            var t:Number;
            var skill:Object;
            if (energySlot.giid < 1)
            {
                Alert.show(Language.PET_STONE_PANEL[15]);
                return;
            };
            if (speSkillCbx.selected)
            {
                t = 2;
            }
            else
            {
                t = 1;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("changePetStoneEnergy", new Responder(onChangePetStoneEnergy), energySlot.sid, _cid, t);
                };
            };
            if ((((energySlot) && (energySlot.giid > 0)) && (energySlot.skillId > 0)))
            {
                skill = GameData.d[GamePredef.TBL_SKILL][energySlot.skillId];
                if (skill.exStoneSid > 0)
                {
                    if (t == 1)
                    {
                        Alert.show(Language.PET_STONE_PANEL[46], "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        _core.remote.call("changePetStoneEnergy", new Responder(onChangePetStoneEnergy), energySlot.sid, _cid, t);
                    };
                }
                else
                {
                    if (t == 2)
                    {
                        Alert.show(Language.PET_STONE_PANEL[45], "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        _core.remote.call("changePetStoneEnergy", new Responder(onChangePetStoneEnergy), energySlot.sid, _cid, t);
                    };
                };
            }
            else
            {
                if (((energySlot) && (energySlot.giid > 0)))
                {
                    _core.remote.call("changePetStoneEnergy", new Responder(onChangePetStoneEnergy), energySlot.sid, _cid, t);
                };
            };
        }

        private function resolvePetStone():void
        {
            var gfunc:Function;
            if (!_core.delPass)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            var resolveSlot:PetStoneSlot = (this["resolveSlot"] as PetStoneSlot);
            if (resolveSlot.giid < 1)
            {
                Alert.show(Language.PET_STONE_PANEL[15]);
                return;
            };
            var resolveNum:int = (this["resolveNum"] as NumericStepper).value;
            _core.remote.call("resolvePetStone", new Responder(updatePetStoneBagData), resolveSlot.sid, resolveNum, _cid);
            (this["canGetEnergyStoneLbl"] as Label).text = "0";
            resolveSlot.clean();
        }

        public function onPetStoneSet(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:PetStoneSlot;
            var _local_8:Object;
            if (_arg_1)
            {
                _local_2 = _arg_1["bagData"];
                _local_3 = Number(_arg_1["slotId"]);
                _local_4 = Number(_arg_1["newId"]);
                _local_5 = Number(_arg_1["skillId"]);
                _local_6 = _arg_1["equData"];
                _core.data.updateData(GamePredef.TBL_EQUIPT_INSTANCE, _local_6);
                updatePetStoneBagData(_local_2);
                _local_7 = (this[("setSlot" + _local_3)] as PetStoneSlot);
                _local_7.clean();
                if (_local_4)
                {
                    _local_8 = GameData.d[GamePredef.TBL_PET_STONE][_local_4];
                    _local_7.type = GamePredef.TBL_PET_STONE;
                    _local_7.quality = (_local_8.level - 1);
                    _local_7.slotData = _local_8;
                    _local_7.stackNum = 1;
                    _local_7.giid = _local_4;
                    _local_7.skillId = _local_5;
                };
            };
        }

        public function __setSlot6_click(_arg_1:MouseEvent):void
        {
            dispatchPetStoneEvt(6);
        }

        public function set nextStoneSlot(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._682241456nextStoneSlot;
            if (_local_2 !== _arg_1)
            {
                this._682241456nextStoneSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextStoneSlot", _local_2, _arg_1));
            };
        }

        private function dispatchPetStoneEvt(_arg_1:int):void
        {
            var _local_2:PetStoneSlot = (this[("setSlot" + _arg_1)] as PetStoneSlot);
            var _local_3:* = equSlot.giid;
            var _local_4:* = new GameEvent(GameEvent.PET_STONE_SET);
            _local_4.data = _local_3;
            _local_2.dispatchEvent(_local_4);
        }

        [Bindable(event="propertyChange")]
        public function get energySlot():PetStoneSlot
        {
            return (this._1464994982energySlot);
        }

        [Bindable(event="propertyChange")]
        public function get preStoneSlot():PetStoneSlot
        {
            return (this._503230304preStoneSlot);
        }

        public function set skillProp(_arg_1:Label):void
        {
            var _local_2:Object = this._1991070036skillProp;
            if (_local_2 !== _arg_1)
            {
                this._1991070036skillProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillProp", _local_2, _arg_1));
            };
        }

        public function ___PetStonePanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            resolvePetStone();
        }

        [Bindable(event="propertyChange")]
        public function get setSlot1():PetStoneSlot
        {
            return (this._1404245681setSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get setSlot2():PetStoneSlot
        {
            return (this._1404245682setSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get setSlot6():PetStoneSlot
        {
            return (this._1404245686setSlot6);
        }

        [Bindable(event="propertyChange")]
        public function get setSlot5():PetStoneSlot
        {
            return (this._1404245685setSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get canGetEnergyStoneLbl():Label
        {
            return (this._1999908673canGetEnergyStoneLbl);
        }

        [Bindable(event="propertyChange")]
        public function get setSlot3():PetStoneSlot
        {
            return (this._1404245683setSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get setSlot4():PetStoneSlot
        {
            return (this._1404245684setSlot4);
        }

        private function changeBagVis():void
        {
            if (!equipBagAdded)
            {
                equipBag = null;
                equipBag = new PetStoneEquipBag();
                equipBag.x = 544;
                equipBag.y = 58;
                width = 710;
                addChild((equipBag as PetStoneEquipBag));
                equipBagAdded = true;
                showBag.styleName = "EquipBagLeft";
            }
            else
            {
                if (equipBag.visible)
                {
                    equipBag.visible = false;
                    showBag.styleName = "EquipBagRight";
                    width = 544;
                }
                else
                {
                    equipBag.visible = true;
                    width = 710;
                    showBag.styleName = "EquipBagLeft";
                };
            };
            eTitle.text = eTitle.text;
        }

        public function updatePetStonePanel(_arg_1:Array):void
        {
            _bagData = _arg_1;
            changeBagVis();
            updatePetStoneBagData(_arg_1);
        }

        private function absorbPetStone():void
        {
            var _local_4:int;
            var _local_5:PetStoneSlot;
            var _local_1:Array = [];
            var _local_2:int;
            while (_local_2 < 5)
            {
                if ((this[("subSlot" + _local_2)] as PetStoneSlot).giid < 1)
                {
                    Alert.show(Language.PET_STONE_PANEL[12]);
                    return;
                };
                _local_4 = (this[("subSlot" + _local_2)] as PetStoneSlot).sid;
                _local_1.push(_local_4);
                _local_2++;
            };
            if (_local_1.length < 5)
            {
                Alert.show(Language.PET_STONE_PANEL[13]);
                return;
            };
            _core.remote.call("absorbPetStone", new Responder(updatePetStoneBagData), _local_1, _cid);
            var _local_3:int;
            while (_local_3 < 5)
            {
                _local_5 = (this[("subSlot" + _local_3)] as PetStoneSlot);
                _local_5.clean();
                _local_3++;
            };
        }

        private function updateNeedSilLbl():void
        {
            var _local_1:PetStoneSlot = (this["preStoneSlot"] as PetStoneSlot);
            var _local_2:Object = GameData.d[GamePredef.TBL_PET_STONE][_local_1.giid];
            (this["needSilLbl"] as Label).text = String((Number(_local_2["costSil"]) * (this["compoNum"] as NumericStepper).value));
        }

        private function _PetStonePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_STONE_PANEL[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[1];
            _local_1 = pageTab.selectedIndex;
            _local_1 = Language.PET_STONE_PANEL[38];
            _local_1 = Slot.SLOT_PET_STONE_COMPO;
            _local_1 = Language.PET_STONE_PANEL[19];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[20];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[21];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[22];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[39];
            _local_1 = Slot.SLOT_PET_STONE_NORMAL;
            _local_1 = Slot.SLOT_PET_STONE_NORMAL;
            _local_1 = Slot.SLOT_PET_STONE_NORMAL;
            _local_1 = Slot.SLOT_PET_STONE_NORMAL;
            _local_1 = Slot.SLOT_PET_STONE_NORMAL;
            _local_1 = Language.PET_STONE_PANEL[23];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[24];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[24];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[25];
            _local_1 = Language.PET_STONE_PANEL[40];
            _local_1 = Slot.SLOT_PET_STONE_EQUIPT;
            _local_1 = Assets.ENERGY_STAR;
            _local_1 = Slot.SLOT_PET_STONE_SET;
            _local_1 = Slot.SLOT_PET_STONE_SET;
            _local_1 = Slot.SLOT_PET_STONE_SET;
            _local_1 = Slot.SLOT_PET_STONE_SET;
            _local_1 = Slot.SLOT_PET_STONE_SET;
            _local_1 = Slot.SLOT_PET_STONE_SET;
            _local_1 = Language.PET_STONE_PANEL[26];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[41];
            _local_1 = Language.PET_STONE_PANEL[43];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Slot.SLOT_PET_STONE_CHANGE_SKILL;
            _local_1 = Language.PET_STONE_PANEL[27];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[28];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[29];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[5];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[6];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[30];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[31];
            _local_1 = Language.PET_STONE_PANEL[32];
            _local_1 = Language.PET_STONE_PANEL[33];
            _local_1 = Language.PET_STONE_PANEL[42];
            _local_1 = Slot.SLOT_PET_STONE_RESOLVE;
            _local_1 = Language.PET_STONE_PANEL[34];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[35];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PET_STONE_PANEL[36];
            _local_1 = Language.PET_STONE_PANEL[37];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = _core.player.energyStone;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function __setSlot3_click(_arg_1:MouseEvent):void
        {
            dispatchPetStoneEvt(3);
        }

        [Bindable(event="propertyChange")]
        public function get equSlot():PetStoneSlot
        {
            return (this._1505682713equSlot);
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        public function ___PetStonePanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            composePetStone();
        }

        [Bindable(event="propertyChange")]
        public function get eTitle():BasicTitleCanvas
        {
            return (this._1322604301eTitle);
        }

        private function onChangePetStoneEnergy(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Array;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Number;
            var _local_9:Object;
            if (_arg_1)
            {
                _local_2 = Number(_arg_1["sid"]);
                _local_3 = Number(_arg_1["skillId"]);
                _local_4 = _arg_1["bagData"];
                _local_5 = _arg_1["newSid"];
                _local_6 = GameData.d[GamePredef.TBL_PET_STONE][energySlot.giid];
                skillProp.text = (((Language.PET_STONE_PANEL[5] + Language.PET_STONE_PANEL[4][_local_6["propType"]]) + "+") + _local_6["propNum"]);
                skillProp.visible = true;
                energySlot.skillId = _local_3;
                energySlot.sid = _local_5;
                _local_7 = GameData.d[GamePredef.TBL_SKILL][energySlot.skillId];
                skillName.text = (Language.PET_STONE_PANEL[6] + _local_7["name"]);
                skillName.visible = true;
                skillDes.visible = true;
                _local_8 = Number(_local_7["exStoneSid"]);
                if (_local_8 > 0)
                {
                    _local_9 = GameData.d[GamePredef.TBL_SKILL][_local_8];
                    skillDesNew.text = _local_9["description"];
                }
                else
                {
                    skillDesNew.text = _local_7["description"];
                };
                skillDesNew.visible = true;
                _bagData = _local_4;
                updatePetStoneBagData(_local_4);
            };
        }

        public function set skillName(_arg_1:Label):void
        {
            var _local_2:Object = this._1990994044skillName;
            if (_local_2 !== _arg_1)
            {
                this._1990994044skillName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillName", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            this.show();
            if (!initialized)
            {
                callLater(showPanel);
                return;
            };
            if (!ToolKit.isEqual(_cid, _core.cid))
            {
                _cid = _core.cid;
                _core.remote.call("initPetStonePanel", new Responder(updatePetStonePanel), _cid);
                clearSlotData();
                refreshPetEquiptBag();
            }
            else
            {
                show();
            };
        }

        public function setPetStone(_arg_1:PetStoneSlot, _arg_2:PetStoneSlot):void
        {
            if ((!(equSlot.giid)) > 0)
            {
                Alert.show(Language.PET_STONE_PANEL[16]);
                return;
            };
            if (_arg_2.id.indexOf("1") > -1)
            {
                if (Number(_arg_1.slotData["energyFlag"]) != 1)
                {
                    Alert.show(Language.PET_STONE_PANEL[17]);
                    return;
                };
            };
            var _local_3:Number = Number(_arg_2.id.charAt(7));
            var _local_4:Number = Number((this["equSlot"] as PetStoneSlot).giid);
            _core.remote.call("petStoneSet", new Responder(onPetStoneSet), _local_4, _local_3, _arg_1.sid, _core.cid);
        }

        public function ___PetStonePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function init():void
        {
            var _local_2:PetStoneSlot;
            var _local_1:int = 1;
            while (_local_1 <= 6)
            {
                _local_2 = (this[("setSlot" + _local_1)] as PetStoneSlot);
                _local_2.addEventListener(GameEvent.PET_STONE_SET, removePetStone);
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get changeType():RadioButtonGroup
        {
            return (this._2131902710changeType);
        }

        private function updateCanGetEnergyStoneLbl():void
        {
            var _local_1:PetStoneSlot = (this["resolveSlot"] as PetStoneSlot);
            var _local_2:Object = GameData.d[GamePredef.TBL_PET_STONE][_local_1.giid];
            (this["canGetEnergyStoneLbl"] as Label).text = String((Number(_local_2["resolveNum"]) * (this["resolveNum"] as NumericStepper).value));
        }

        private function removePetStone(_arg_1:Event):void
        {
            var _local_2:PetStoneSlot;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:*;
            if (_arg_1.target == _arg_1.currentTarget)
            {
                _local_2 = (_arg_1.target as PetStoneSlot);
                _local_3 = Number(_local_2.id.charAt(7));
                _local_4 = Number((this["equSlot"] as PetStoneSlot).giid);
                _local_5 = int(GameEvent(_arg_1).data);
                _core.remote.call("removePetStone", new Responder(onPetStoneSet), _local_4, _local_3, _core.cid, _local_5);
                _arg_1.stopImmediatePropagation();
            };
        }

        public function set subSlot1(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._2090889325subSlot1;
            if (_local_2 !== _arg_1)
            {
                this._2090889325subSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "subSlot1", _local_2, _arg_1));
            };
        }

        public function set subSlot2(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._2090889324subSlot2;
            if (_local_2 !== _arg_1)
            {
                this._2090889324subSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "subSlot2", _local_2, _arg_1));
            };
        }

        public function set subSlot3(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._2090889323subSlot3;
            if (_local_2 !== _arg_1)
            {
                this._2090889323subSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "subSlot3", _local_2, _arg_1));
            };
        }

        private function changeSelectedIndex():void
        {
            clearSlotData();
        }

        public function set pageTab(_arg_1:HButtonTab):void
        {
            var _local_2:Object = this._803559802pageTab;
            if (_local_2 !== _arg_1)
            {
                this._803559802pageTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needSilLbl():Label
        {
            return (this._1343200970needSilLbl);
        }

        [Bindable(event="propertyChange")]
        public function get selectImg():Image
        {
            return (this._1715996377selectImg);
        }

        private function refreshPetEquiptBag():void
        {
            if (((equipBagAdded) && (equipBag)))
            {
                equipBag.getPetEquiptData();
            };
        }

        public function set petStoneBag(_arg_1:PetStoneBag):void
        {
            var _local_2:Object = this._503675810petStoneBag;
            if (_local_2 !== _arg_1)
            {
                this._503675810petStoneBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStoneBag", _local_2, _arg_1));
            };
        }

        public function set energySlot(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1464994982energySlot;
            if (_local_2 !== _arg_1)
            {
                this._1464994982energySlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "energySlot", _local_2, _arg_1));
            };
        }

        private function _PetStonePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[0];
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
                pageTab.filters = _arg_1;
            }, "pageTab.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.PET_STONE_PANEL[1]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStack.selectedIndex = _arg_1;
            }, "viewStack.selectedIndex");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_IntroText1.htmlText = _arg_1;
            }, "_PetStonePanel_IntroText1.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_COMPO);
            }, function (_arg_1:int):void
            {
                preStoneSlot.slotType = _arg_1;
            }, "preStoneSlot.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label1.text = _arg_1;
            }, "_PetStonePanel_Label1.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label1.filters = _arg_1;
            }, "_PetStonePanel_Label1.filters");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label2.text = _arg_1;
            }, "_PetStonePanel_Label2.text");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label2.filters = _arg_1;
            }, "_PetStonePanel_Label2.filters");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label3.text = _arg_1;
            }, "_PetStonePanel_Label3.text");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label3.filters = _arg_1;
            }, "_PetStonePanel_Label3.filters");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label4.text = _arg_1;
            }, "_PetStonePanel_Label4.text");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label4.filters = _arg_1;
            }, "_PetStonePanel_Label4.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                needSilLbl.filters = _arg_1;
            }, "needSilLbl.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_IntroText2.htmlText = _arg_1;
            }, "_PetStonePanel_IntroText2.htmlText");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_NORMAL);
            }, function (_arg_1:int):void
            {
                subSlot0.slotType = _arg_1;
            }, "subSlot0.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_NORMAL);
            }, function (_arg_1:int):void
            {
                subSlot1.slotType = _arg_1;
            }, "subSlot1.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_NORMAL);
            }, function (_arg_1:int):void
            {
                subSlot2.slotType = _arg_1;
            }, "subSlot2.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_NORMAL);
            }, function (_arg_1:int):void
            {
                subSlot3.slotType = _arg_1;
            }, "subSlot3.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_NORMAL);
            }, function (_arg_1:int):void
            {
                subSlot4.slotType = _arg_1;
            }, "subSlot4.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label6.text = _arg_1;
            }, "_PetStonePanel_Label6.text");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label6.filters = _arg_1;
            }, "_PetStonePanel_Label6.filters");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label7.text = _arg_1;
            }, "_PetStonePanel_Label7.text");
            result[23] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label7.filters = _arg_1;
            }, "_PetStonePanel_Label7.filters");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label8.text = _arg_1;
            }, "_PetStonePanel_Label8.text");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label8.filters = _arg_1;
            }, "_PetStonePanel_Label8.filters");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_BasicGlowButton2.label = _arg_1;
            }, "_PetStonePanel_BasicGlowButton2.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_IntroText3.htmlText = _arg_1;
            }, "_PetStonePanel_IntroText3.htmlText");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_EQUIPT);
            }, function (_arg_1:int):void
            {
                equSlot.slotType = _arg_1;
            }, "equSlot.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.ENERGY_STAR);
            }, function (_arg_1:Object):void
            {
                selectImg.source = _arg_1;
            }, "selectImg.source");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_SET);
            }, function (_arg_1:int):void
            {
                setSlot1.slotType = _arg_1;
            }, "setSlot1.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_SET);
            }, function (_arg_1:int):void
            {
                setSlot2.slotType = _arg_1;
            }, "setSlot2.slotType");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_SET);
            }, function (_arg_1:int):void
            {
                setSlot3.slotType = _arg_1;
            }, "setSlot3.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_SET);
            }, function (_arg_1:int):void
            {
                setSlot4.slotType = _arg_1;
            }, "setSlot4.slotType");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_SET);
            }, function (_arg_1:int):void
            {
                setSlot5.slotType = _arg_1;
            }, "setSlot5.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_SET);
            }, function (_arg_1:int):void
            {
                setSlot6.slotType = _arg_1;
            }, "setSlot6.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label9.text = _arg_1;
            }, "_PetStonePanel_Label9.text");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label9.filters = _arg_1;
            }, "_PetStonePanel_Label9.filters");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_IntroText4.htmlText = _arg_1;
            }, "_PetStonePanel_IntroText4.htmlText");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_LinkButton1.label = _arg_1;
            }, "_PetStonePanel_LinkButton1.label");
            result[40] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_LinkButton1.filters = _arg_1;
            }, "_PetStonePanel_LinkButton1.filters");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_CHANGE_SKILL);
            }, function (_arg_1:int):void
            {
                energySlot.slotType = _arg_1;
            }, "energySlot.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label10.text = _arg_1;
            }, "_PetStonePanel_Label10.text");
            result[43] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label10.filters = _arg_1;
            }, "_PetStonePanel_Label10.filters");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label11.text = _arg_1;
            }, "_PetStonePanel_Label11.text");
            result[45] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label11.filters = _arg_1;
            }, "_PetStonePanel_Label11.filters");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label12.text = _arg_1;
            }, "_PetStonePanel_Label12.text");
            result[47] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label12.filters = _arg_1;
            }, "_PetStonePanel_Label12.filters");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                skillProp.text = _arg_1;
            }, "skillProp.text");
            result[49] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                skillProp.filters = _arg_1;
            }, "skillProp.filters");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                skillName.text = _arg_1;
            }, "skillName.text");
            result[51] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                skillName.filters = _arg_1;
            }, "skillName.filters");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                skillDes.text = _arg_1;
            }, "skillDes.text");
            result[53] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                skillDes.filters = _arg_1;
            }, "skillDes.filters");
            result[54] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                needEnergyStoneLbl.filters = _arg_1;
            }, "needEnergyStoneLbl.filters");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                speSkillCbx.label = _arg_1;
            }, "speSkillCbx.label");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                norSkillCbx.label = _arg_1;
            }, "norSkillCbx.label");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_BasicGlowButton3.label = _arg_1;
            }, "_PetStonePanel_BasicGlowButton3.label");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_IntroText5.htmlText = _arg_1;
            }, "_PetStonePanel_IntroText5.htmlText");
            result[59] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_PET_STONE_RESOLVE);
            }, function (_arg_1:int):void
            {
                resolveSlot.slotType = _arg_1;
            }, "resolveSlot.slotType");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label17.text = _arg_1;
            }, "_PetStonePanel_Label17.text");
            result[61] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label17.filters = _arg_1;
            }, "_PetStonePanel_Label17.filters");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label18.text = _arg_1;
            }, "_PetStonePanel_Label18.text");
            result[63] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label18.filters = _arg_1;
            }, "_PetStonePanel_Label18.filters");
            result[64] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                canGetEnergyStoneLbl.filters = _arg_1;
            }, "canGetEnergyStoneLbl.filters");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_BasicGlowButton4.label = _arg_1;
            }, "_PetStonePanel_BasicGlowButton4.label");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_STONE_PANEL[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label20.text = _arg_1;
            }, "_PetStonePanel_Label20.text");
            result[67] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label20.filters = _arg_1;
            }, "_PetStonePanel_Label20.filters");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.energyStone;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetStonePanel_Label21.text = _arg_1;
            }, "_PetStonePanel_Label21.text");
            result[69] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetStonePanel_Label21.filters = _arg_1;
            }, "_PetStonePanel_Label21.filters");
            result[70] = binding;
            return (result);
        }

        public function ___PetStonePanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            skillInfoShow();
        }

        [Bindable(event="propertyChange")]
        public function get skillProp():Label
        {
            return (this._1991070036skillProp);
        }

        public function set preStoneSlot(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._503230304preStoneSlot;
            if (_local_2 !== _arg_1)
            {
                this._503230304preStoneSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "preStoneSlot", _local_2, _arg_1));
            };
        }

        public function set subSlot4(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._2090889322subSlot4;
            if (_local_2 !== _arg_1)
            {
                this._2090889322subSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "subSlot4", _local_2, _arg_1));
            };
        }

        private function changeSkillType():void
        {
            if (speSkillCbx.selected == true)
            {
                needEnergyStoneLbl.text = "1000";
            }
            else
            {
                if (norSkillCbx.selected == true)
                {
                    needEnergyStoneLbl.text = "500";
                };
            };
        }

        public function set subSlot0(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._2090889326subSlot0;
            if (_local_2 !== _arg_1)
            {
                this._2090889326subSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "subSlot0", _local_2, _arg_1));
            };
        }

        public function __setSlot5_click(_arg_1:MouseEvent):void
        {
            dispatchPetStoneEvt(5);
        }

        public function set speSkillCbx(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._982857296speSkillCbx;
            if (_local_2 !== _arg_1)
            {
                this._982857296speSkillCbx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "speSkillCbx", _local_2, _arg_1));
            };
        }

        public function set setSlot1(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1404245681setSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1404245681setSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "setSlot1", _local_2, _arg_1));
            };
        }

        public function set setSlot2(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1404245682setSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1404245682setSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "setSlot2", _local_2, _arg_1));
            };
        }

        public function set setSlot6(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1404245686setSlot6;
            if (_local_2 !== _arg_1)
            {
                this._1404245686setSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "setSlot6", _local_2, _arg_1));
            };
        }

        public function set setSlot3(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1404245683setSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1404245683setSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "setSlot3", _local_2, _arg_1));
            };
        }

        public function ___PetStonePanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            changePetStoneEnergy();
        }

        public function set setSlot5(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1404245685setSlot5;
            if (_local_2 !== _arg_1)
            {
                this._1404245685setSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "setSlot5", _local_2, _arg_1));
            };
        }

        private function onUpdatePetStoneSetSlot(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_4:PetStoneSlot;
            var _local_5:Object;
            var _local_6:Array;
            var _local_7:Number;
            var _local_8:Object;
            if (Number(_arg_1) == -1)
            {
                (this["equSlot"] as PetStoneSlot).clean();
                _local_3 = 1;
                while (_local_3 <= 6)
                {
                    _local_4 = (this[("setSlot" + _local_3)] as PetStoneSlot);
                    _local_4.clean();
                    _local_3++;
                };
                return;
            };
            var _local_2:int = 1;
            while (_local_2 <= 6)
            {
                _local_4 = (this[("setSlot" + _local_2)] as PetStoneSlot);
                _local_4.clean();
                _local_2++;
            };
            if (_arg_1)
            {
                for (_local_5 in _arg_1)
                {
                    _local_6 = _arg_1[_local_5];
                    _local_7 = Number(_local_6[0]);
                    _local_4 = (this[("setSlot" + _local_5)] as PetStoneSlot);
                    _local_8 = GameData.d[GamePredef.TBL_PET_STONE][_local_7];
                    _local_4.type = GamePredef.TBL_PET_STONE;
                    _local_4.quality = (Number(_local_8["level"]) - 1);
                    _local_4.giid = _local_7;
                    _local_4.slotData = _local_8;
                    if (Number(_local_5) == 1)
                    {
                        if (Number(_local_6[2]))
                        {
                            _local_4.skillId = Number(_local_6[2]);
                        };
                    };
                };
            };
        }

        public function set setSlot4(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1404245684setSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1404245684setSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "setSlot4", _local_2, _arg_1));
            };
        }

        public function set canGetEnergyStoneLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._1999908673canGetEnergyStoneLbl;
            if (_local_2 !== _arg_1)
            {
                this._1999908673canGetEnergyStoneLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canGetEnergyStoneLbl", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:PetStonePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetStonePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetStonePanelWatcherSetupUtil");
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
        public function get subSlot0():PetStoneSlot
        {
            return (this._2090889326subSlot0);
        }

        [Bindable(event="propertyChange")]
        public function get subSlot1():PetStoneSlot
        {
            return (this._2090889325subSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get subSlot2():PetStoneSlot
        {
            return (this._2090889324subSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get subSlot3():PetStoneSlot
        {
            return (this._2090889323subSlot3);
        }

        public function __setSlot2_click(_arg_1:MouseEvent):void
        {
            dispatchPetStoneEvt(2);
        }

        public function set showBag(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2067262411showBag;
            if (_local_2 !== _arg_1)
            {
                this._2067262411showBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBag", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petStoneBag():PetStoneBag
        {
            return (this._503675810petStoneBag);
        }

        [Bindable(event="propertyChange")]
        public function get subSlot4():PetStoneSlot
        {
            return (this._2090889322subSlot4);
        }

        public function updatePetStoneCompoSlot(_arg_1:PetStoneSlot):void
        {
            var _local_2:PetStoneSlot = (this["preStoneSlot"] as PetStoneSlot);
            var _local_3:Object = GameData.d[GamePredef.TBL_PET_STONE][_arg_1.giid];
            if (((Number(_local_3["level"]) >= 5) || (Number((_local_3["energyFlag"] == 1)))))
            {
                Alert.show(Language.PET_STONE_PANEL[8]);
                return;
            };
            _local_2.type = GamePredef.TBL_PET_STONE;
            _local_2.quality = _arg_1.quality;
            _local_2.giid = _arg_1.giid;
            _local_2.slotData = _arg_1.slotData;
            _local_2.stackNum = _arg_1.stackNum;
            _local_2.sid = _arg_1.sid;
            var _local_4:Number = Number(_local_3["nextId"]);
            var _local_5:PetStoneSlot = (this["nextStoneSlot"] as PetStoneSlot);
            _local_5.type = GamePredef.TBL_PET_STONE;
            _local_5.slotData = GameData.d[GamePredef.TBL_PET_STONE][_local_4];
            _local_5.quality = (_arg_1.quality + 1);
            _local_5.giid = _local_4;
            updateNeedSilLbl();
        }

        [Bindable(event="propertyChange")]
        public function get speSkillCbx():RadioButton
        {
            return (this._982857296speSkillCbx);
        }

        public function set norSkillCbx(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._1881374169norSkillCbx;
            if (_local_2 !== _arg_1)
            {
                this._1881374169norSkillCbx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "norSkillCbx", _local_2, _arg_1));
            };
        }

        public function __resolveNum_change(_arg_1:NumericStepperEvent):void
        {
            updateCanGetEnergyStoneLbl();
        }

        public function set skillDesNew(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1802392031skillDesNew;
            if (_local_2 !== _arg_1)
            {
                this._1802392031skillDesNew = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillDesNew", _local_2, _arg_1));
            };
        }

        public function __norSkillCbx_click(_arg_1:MouseEvent):void
        {
            changeSkillType();
        }

        public function set viewStack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1584105757viewStack;
            if (_local_2 !== _arg_1)
            {
                this._1584105757viewStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStack", _local_2, _arg_1));
            };
        }

        private function _PetStonePanel_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            changeType = _local_1;
            _local_1.initialized(this, "changeType");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get showBag():BasicGlowButton
        {
            return (this._2067262411showBag);
        }

        public function set equSlot(_arg_1:PetStoneSlot):void
        {
            var _local_2:Object = this._1505682713equSlot;
            if (_local_2 !== _arg_1)
            {
                this._1505682713equSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equSlot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get norSkillCbx():RadioButton
        {
            return (this._1881374169norSkillCbx);
        }

        public function set needEnergyStoneLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._573030417needEnergyStoneLbl;
            if (_local_2 !== _arg_1)
            {
                this._573030417needEnergyStoneLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needEnergyStoneLbl", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skillDesNew():TextArea
        {
            return (this._1802392031skillDesNew);
        }

        public function set eTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1322604301eTitle;
            if (_local_2 !== _arg_1)
            {
                this._1322604301eTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needEnergyStoneLbl():Label
        {
            return (this._573030417needEnergyStoneLbl);
        }

        public function updateChangeSkill(_arg_1:PetStoneSlot):void
        {
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:Object;
            var _local_2:Object = GameData.d[GamePredef.TBL_PET_STONE][_arg_1.giid];
            if (!Number(_local_2["energyFlag"]))
            {
                Alert.show(Language.PET_STONE_PANEL[18]);
                return;
            };
            var _local_3:PetStoneSlot = (this["energySlot"] as PetStoneSlot);
            _local_3.type = GamePredef.TBL_PET_STONE;
            _local_3.quality = _arg_1.quality;
            _local_3.giid = _arg_1.giid;
            _local_3.slotData = _arg_1.slotData;
            _local_3.sid = _arg_1.sid;
            _local_3.stackNum = 1;
            _local_3.skillId = _arg_1.skillId;
            skillProp.text = (((Language.PET_STONE_PANEL[5] + Language.PET_STONE_PANEL[4][_local_2["propType"]]) + "+") + _local_2["propNum"]);
            skillProp.visible = true;
            if (_local_3.skillId > 0)
            {
                _local_4 = GameData.d[GamePredef.TBL_SKILL][_local_3.skillId];
                skillName.text = (Language.PET_STONE_PANEL[6] + _local_4["name"]);
                skillName.visible = true;
                skillDes.visible = true;
                skillDesNew.visible = true;
                _local_5 = Number(_local_4["exStoneSid"]);
                if (_local_5 > 0)
                {
                    _local_6 = GameData.d[GamePredef.TBL_SKILL][_local_5];
                    skillDesNew.text = _local_6["description"];
                }
                else
                {
                    skillDesNew.text = _local_4["description"];
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get resolveNum():NumericStepper
        {
            return (this._1599579654resolveNum);
        }


    }
}//package com.qeedoo.ui.view.compDragable

