// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AutoExpPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.containers.HBox;
    import mx.containers.Canvas;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.RoundTextArea;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.RadioButtonGroup;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.CheckBox;
    import mx.core.UIComponentDescriptor;
    import mx.controls.RadioButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import mx.events.NumericStepperEvent;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.controls.Alert;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
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

    public class AutoExpPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _859639028txtDay:BoxLabel;
        private var _881418178tabBar:HBox;
        private var _1197187413txtExpType2:BoxLabel;
        public var _AutoExpPanel_Canvas1:Canvas;
        public var _AutoExpPanel_Canvas2:Canvas;
        private var _1232154057txtPetExpType1:BoxLabel;
        private var _878903568txtGold:BoxLabel;
        private var _1318918763timeToConvert:NumericStepper;
        private var _878873484txtHour:BoxLabel;
        private var _1961966104txtPetTotalExp:BoxLabel;
        private var _playerTimeToConvert:Number = 0;
        private var _typePet:uint = 0;
        private var _typePlayer:uint = 0;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _2063191259timeToConvert0:NumericStepper;
        private var _1232154058txtPetExpType2:BoxLabel;
        private var _timeToConvert:Number = 0;
        public var _AutoExpPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2117350799txtPetGold:BoxLabel;
        private var _1197187412txtExpType3:BoxLabel;
        private var _406818293getExpBtn:BasicGlowButton;
        private var _779864377autoExpTab:ViewStack;
        private var _1197187415txtExpType0:BoxLabel;
        private var _1470663632txtMoney:BoxLabel;
        private var _1092797764closeBtn:BasicGlowButton;
        private var _313836229closeBtnPet:BasicGlowButton;
        public var _AutoExpPanel_RoundTextArea1:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea2:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea3:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea4:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea5:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea6:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea7:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea8:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea9:RoundTextArea;
        private var _1648541860txtMinute:BoxLabel;
        private var _96340279txtTotalExp:BoxLabel;
        private var _1197187414txtExpType1:BoxLabel;
        public var _AutoExpPanel_RoundTextArea10:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea11:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea12:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea13:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea14:RoundTextArea;
        public var _AutoExpPanel_IntroText1:IntroText;
        public var _AutoExpPanel_IntroText2:IntroText;
        public var _AutoExpPanel_RoundTextArea17:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea18:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea19:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea15:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea16:RoundTextArea;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _2117380883txtPetHour:BoxLabel;
        public var _AutoExpPanel_RoundTextArea20:RoundTextArea;
        public var _AutoExpPanel_RoundTextArea21:RoundTextArea;
        private var _470276325radiogroupPet:RadioButtonGroup;
        private var _1309992520getPetExpBtn:BasicGlowButton;
        private var _164873549radiogroup1:RadioButtonGroup;
        private var _874067069txtPetMinute:BoxLabel;
        public var _AutoExpPanel_BasicTxtButton1:BasicTxtButton;
        public var _AutoExpPanel_BasicTxtButton2:BasicTxtButton;
        public var _AutoExpPanel_BasicTxtButton3:BasicTxtButton;
        public var _AutoExpPanel_BasicTxtButton4:BasicTxtButton;
        public var _AutoExpPanel_BasicTxtButton5:BasicTxtButton;
        private var _offlineMinute:uint = 0;
        public var _AutoExpPanel_BasicTxtButton7:BasicTxtButton;
        public var _AutoExpPanel_BasicTxtButton8:BasicTxtButton;
        public var _AutoExpPanel_BasicTxtButton6:BasicTxtButton;
        private var _1232154056txtPetExpType0:BoxLabel;
        private var _1730866317txtPetDay:BoxLabel;
        private var _1367696142cbPart:CheckBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":540,
                    "height":430,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AutoExpPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"autoExpTab",
                        "events":{"mouseMove":"__autoExpTab_mouseMove"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":510,
                                "height":355,
                                "creationPolicy":"all",
                                "x":15,
                                "y":60,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_AutoExpPanel_Canvas1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"getExpBtn",
                                                "events":{"click":"__getExpBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "25";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":165,
                                                        "styleName":"BtnStdGreen",
                                                        "width":68
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"closeBtn",
                                                "events":{"click":"__closeBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "25";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":275,
                                                        "styleName":"BtnStdRed",
                                                        "width":68
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtExpType0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":111,
                                                        "y":168,
                                                        "width":130,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtExpType1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":111,
                                                        "y":194,
                                                        "width":130,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtExpType2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":111,
                                                        "y":220,
                                                        "width":130,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtExpType3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":111,
                                                        "y":246,
                                                        "width":130,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":22,
                                                        "y":170,
                                                        "groupName":"radiogroup1",
                                                        "value":0,
                                                        "selected":true,
                                                        "width":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":22,
                                                        "y":196,
                                                        "groupName":"radiogroup1",
                                                        "value":1,
                                                        "width":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":22,
                                                        "y":222,
                                                        "groupName":"radiogroup1",
                                                        "value":2,
                                                        "width":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":22,
                                                        "y":248,
                                                        "groupName":"radiogroup1",
                                                        "value":3,
                                                        "width":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"_AutoExpPanel_IntroText1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "height":130,
                                                        "width":490
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_AutoExpPanel_BasicTxtButton1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":169,
                                                        "width":70,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_AutoExpPanel_BasicTxtButton2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":195,
                                                        "width":70,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_AutoExpPanel_BasicTxtButton3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":221,
                                                        "width":70,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_AutoExpPanel_BasicTxtButton4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":247,
                                                        "width":70,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":110,
                                                        "y":148,
                                                        "height":21,
                                                        "width":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":357,
                                                        "y":167,
                                                        "height":21,
                                                        "width":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":415,
                                                        "y":167,
                                                        "height":21,
                                                        "width":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":473,
                                                        "y":167,
                                                        "height":21,
                                                        "width":28
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtHour",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":383,
                                                        "y":167,
                                                        "width":32,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":260,
                                                        "y":221,
                                                        "height":21,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":260,
                                                        "y":167,
                                                        "height":21,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":450,
                                                        "y":247,
                                                        "height":21,
                                                        "width":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":450,
                                                        "y":275,
                                                        "height":21,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":260,
                                                        "y":247,
                                                        "height":21,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtTotalExp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":327.8,
                                                        "y":220,
                                                        "width":153.2,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtDay",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":327,
                                                        "y":167,
                                                        "width":30,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtMinute",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":439,
                                                        "y":167,
                                                        "width":32,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtMoney",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":328,
                                                        "y":246,
                                                        "width":120,
                                                        "height":20,
                                                        "text":"0"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtGold",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":328,
                                                        "y":272,
                                                        "width":120,
                                                        "height":20,
                                                        "text":"0"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":329,
                                                        "y":194,
                                                        "height":21,
                                                        "width":68
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"timeToConvert0",
                                                "events":{"change":"__timeToConvert0_change"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":394,
                                                        "y":193,
                                                        "minimum":0,
                                                        "maximum":240,
                                                        "value":0,
                                                        "stepSize":1,
                                                        "width":84,
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":478,
                                                        "y":193,
                                                        "height":21,
                                                        "width":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"cbPart",
                                                "events":{"change":"__cbPart_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":248,
                                                        "y":196,
                                                        "width":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_AutoExpPanel_BasicTxtButton5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":263,
                                                        "y":196,
                                                        "height":18,
                                                        "width":60
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_AutoExpPanel_Canvas2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"getPetExpBtn",
                                                "events":{"click":"__getPetExpBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "25";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":153,
                                                        "styleName":"BtnStdGreen",
                                                        "width":68
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"closeBtnPet",
                                                "events":{"click":"__closeBtnPet_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "25";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":263,
                                                        "styleName":"BtnStdRed",
                                                        "width":68
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtPetExpType0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":111,
                                                        "y":168,
                                                        "width":130,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtPetExpType1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":111,
                                                        "y":194,
                                                        "width":130,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtPetExpType2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":111,
                                                        "y":220,
                                                        "width":130,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":22,
                                                        "y":170,
                                                        "groupName":"radiogroupPet",
                                                        "value":0,
                                                        "selected":true,
                                                        "width":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":22,
                                                        "y":196,
                                                        "groupName":"radiogroupPet",
                                                        "value":1,
                                                        "width":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":22,
                                                        "y":222,
                                                        "groupName":"radiogroupPet",
                                                        "value":2,
                                                        "width":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"_AutoExpPanel_IntroText2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "height":130,
                                                        "width":490
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_AutoExpPanel_BasicTxtButton6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":169,
                                                        "width":70,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_AutoExpPanel_BasicTxtButton7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":195,
                                                        "width":70,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_AutoExpPanel_BasicTxtButton8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":38,
                                                        "y":221,
                                                        "width":70,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea12",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":110,
                                                        "y":150,
                                                        "height":21,
                                                        "width":130
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":357,
                                                        "y":167,
                                                        "height":21,
                                                        "width":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":411,
                                                        "y":167,
                                                        "height":21,
                                                        "width":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":461,
                                                        "y":168,
                                                        "height":21,
                                                        "width":16
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtPetHour",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":379,
                                                        "y":167,
                                                        "width":32,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea16",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":260,
                                                        "y":168,
                                                        "height":21,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtPetDay",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":327,
                                                        "y":167,
                                                        "width":30,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtPetMinute",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":431,
                                                        "y":167,
                                                        "width":32,
                                                        "height":19
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea17",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":260,
                                                        "y":193,
                                                        "height":21,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"timeToConvert",
                                                "events":{"change":"__timeToConvert_change"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":327,
                                                        "y":189,
                                                        "minimum":0,
                                                        "value":0,
                                                        "stepSize":1,
                                                        "width":102.05
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":431,
                                                        "y":190,
                                                        "height":21,
                                                        "width":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea19",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":260,
                                                        "y":219,
                                                        "height":21,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtPetTotalExp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":327,
                                                        "y":219,
                                                        "width":153.2,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea20",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":445,
                                                        "y":246,
                                                        "height":21,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundTextArea,
                                                "id":"_AutoExpPanel_RoundTextArea21",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":260,
                                                        "y":246,
                                                        "height":21,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"txtPetGold",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":327,
                                                        "y":246,
                                                        "width":120,
                                                        "height":20,
                                                        "text":"0"
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
                        "id":"tabBar",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":90
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AutoExpPanel()
        {
            mx_internal::_document = this;
            this.width = 540;
            this.height = 430;
            this.x = 250;
            this.y = 100;
            this.styleName = "StandardContent";
            _AutoExpPanel_RadioButtonGroup1_i();
            _AutoExpPanel_RadioButtonGroup2_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AutoExpPanel._watcherSetupUtil = _arg_1;
        }


        private function getPetOfflineExp():void
        {
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doGetPetOfflineExp), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.AUTOEXPPANEL_U[22], func);
            }
            else
            {
                doGetPetOfflineExp(true);
            };
        }

        public function set txtDay(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._859639028txtDay;
            if (_local_2 !== _arg_1)
            {
                this._859639028txtDay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtDay", _local_2, _arg_1));
            };
        }

        public function set txtPetHour(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._2117380883txtPetHour;
            if (_local_2 !== _arg_1)
            {
                this._2117380883txtPetHour = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPetHour", _local_2, _arg_1));
            };
        }

        public function __timeToConvert0_change(_arg_1:NumericStepperEvent):void
        {
            selectExpType();
        }

        public function set radiogroupPet(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._470276325radiogroupPet;
            if (_local_2 !== _arg_1)
            {
                this._470276325radiogroupPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroupPet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtMoney():BoxLabel
        {
            return (this._1470663632txtMoney);
        }

        private function _AutoExpPanel_RadioButtonGroup2_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroupPet = _local_1;
            _local_1.addEventListener("change", __radiogroupPet_change);
            _local_1.initialized(this, "radiogroupPet");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get getPetExpBtn():BasicGlowButton
        {
            return (this._1309992520getPetExpBtn);
        }

        public function set timeToConvert0(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._2063191259timeToConvert0;
            if (_local_2 !== _arg_1)
            {
                this._2063191259timeToConvert0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeToConvert0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBar():HBox
        {
            return (this._881418178tabBar);
        }

        public function selectExpType():void
        {
            if (this.visible)
            {
                _typePlayer = uint(radiogroup1.selectedValue);
                _typePet = uint(radiogroupPet.selectedValue);
                calcExpPerHour();
                calcMoneyNeeded();
            };
        }

        public function set txtMoney(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1470663632txtMoney;
            if (_local_2 !== _arg_1)
            {
                this._1470663632txtMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtMoney", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get timeToConvert():NumericStepper
        {
            return (this._1318918763timeToConvert);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        private function doGetOfflineExp(_arg_1:Boolean):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((_typePlayer > 1) && (_local_2.goldSelected)))
                {
                    _local_2.goldLockFlag = false;
                }
                else
                {
                    if (((_typePlayer == 1) && (_local_2.silverSelected)))
                    {
                        _local_2.silverLockFlag = false;
                    };
                };
                _core.remote.call("getOfflineExp", new Responder(onGetOfflineExp), _typePlayer, _playerTimeToConvert);
            };
        }

        public function set closeBtnPet(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._313836229closeBtnPet;
            if (_local_2 !== _arg_1)
            {
                this._313836229closeBtnPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeBtnPet", _local_2, _arg_1));
            };
        }

        private function _AutoExpPanel_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup1 = _local_1;
            _local_1.addEventListener("change", __radiogroup1_change);
            _local_1.initialized(this, "radiogroup1");
            return (_local_1);
        }

        public function set tabBar(_arg_1:HBox):void
        {
            var _local_2:Object = this._881418178tabBar;
            if (_local_2 !== _arg_1)
            {
                this._881418178tabBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBar", _local_2, _arg_1));
            };
        }

        public function set closeBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1092797764closeBtn;
            if (_local_2 !== _arg_1)
            {
                this._1092797764closeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeBtn", _local_2, _arg_1));
            };
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

        public function __autoExpTab_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        public function set getPetExpBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1309992520getPetExpBtn;
            if (_local_2 !== _arg_1)
            {
                this._1309992520getPetExpBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getPetExpBtn", _local_2, _arg_1));
            };
        }

        private function _AutoExpPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AutoExpPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_Canvas1.label = _arg_1;
            }, "_AutoExpPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getExpBtn.label = _arg_1;
            }, "getExpBtn.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                closeBtn.label = _arg_1;
            }, "closeBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_IntroText1.text = _arg_1;
            }, "_AutoExpPanel_IntroText1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTxtButton1.label = _arg_1;
            }, "_AutoExpPanel_BasicTxtButton1.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTxtButton2.label = _arg_1;
            }, "_AutoExpPanel_BasicTxtButton2.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTxtButton3.label = _arg_1;
            }, "_AutoExpPanel_BasicTxtButton3.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTxtButton4.label = _arg_1;
            }, "_AutoExpPanel_BasicTxtButton4.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea1.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea1.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea2.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea2.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea3.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea3.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea4.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea4.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea5.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea5.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea6.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea6.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea7.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea7.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea8.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea8.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea9.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea9.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea10.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea10.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea11.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea11.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTxtButton5.text = _arg_1;
            }, "_AutoExpPanel_BasicTxtButton5.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_Canvas2.label = _arg_1;
            }, "_AutoExpPanel_Canvas2.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getPetExpBtn.label = _arg_1;
            }, "getPetExpBtn.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                closeBtnPet.label = _arg_1;
            }, "closeBtnPet.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_IntroText2.text = _arg_1;
            }, "_AutoExpPanel_IntroText2.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTxtButton6.label = _arg_1;
            }, "_AutoExpPanel_BasicTxtButton6.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTxtButton7.label = _arg_1;
            }, "_AutoExpPanel_BasicTxtButton7.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_BasicTxtButton8.label = _arg_1;
            }, "_AutoExpPanel_BasicTxtButton8.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea12.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea12.text");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea13.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea13.text");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea14.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea14.text");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea15.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea15.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea16.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea16.text");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea17.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea17.text");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea18.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea18.text");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea19.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea19.text");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea20.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea20.text");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoExpPanel_RoundTextArea21.text = _arg_1;
            }, "_AutoExpPanel_RoundTextArea21.text");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOEXPPANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[39] = binding;
            return (result);
        }

        public function set radiogroup1(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._164873549radiogroup1;
            if (_local_2 !== _arg_1)
            {
                this._164873549radiogroup1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtHour():BoxLabel
        {
            return (this._878873484txtHour);
        }

        [Bindable(event="propertyChange")]
        public function get txtMinute():BoxLabel
        {
            return (this._1648541860txtMinute);
        }

        [Bindable(event="propertyChange")]
        public function get txtPetDay():BoxLabel
        {
            return (this._1730866317txtPetDay);
        }

        [Bindable(event="propertyChange")]
        public function get txtExpType0():BoxLabel
        {
            return (this._1197187415txtExpType0);
        }

        [Bindable(event="propertyChange")]
        public function get txtExpType2():BoxLabel
        {
            return (this._1197187413txtExpType2);
        }

        [Bindable(event="propertyChange")]
        public function get txtExpType3():BoxLabel
        {
            return (this._1197187412txtExpType3);
        }

        private function doGetPetOfflineExp(_arg_1:Boolean):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (_local_2.goldSelected)
                {
                    _local_2.goldLockFlag = false;
                };
                _timeToConvert = Number(timeToConvert.value);
                if (ToolKit.isEqual(_timeToConvert, 0))
                {
                    Alert.show(Language.AUTOEXPPANEL_S[9]);
                    return;
                };
                _core.remote.call("getPetOfflineExp", new Responder(onGetOfflineExp), _typePet, _timeToConvert);
            };
        }

        public function __getPetExpBtn_click(_arg_1:MouseEvent):void
        {
            getPetOfflineExp();
        }

        public function __closeBtn_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get txtExpType1():BoxLabel
        {
            return (this._1197187414txtExpType1);
        }

        private function onPartChange():void
        {
            timeToConvert0.enabled = cbPart.selected;
            selectExpType();
        }

        [Bindable(event="propertyChange")]
        public function get autoExpTab():ViewStack
        {
            return (this._779864377autoExpTab);
        }

        public function __radiogroup1_change(_arg_1:Event):void
        {
            selectExpType();
        }

        [Bindable(event="propertyChange")]
        public function get txtTotalExp():BoxLabel
        {
            return (this._96340279txtTotalExp);
        }

        public function set timeToConvert(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1318918763timeToConvert;
            if (_local_2 !== _arg_1)
            {
                this._1318918763timeToConvert = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeToConvert", _local_2, _arg_1));
            };
        }

        public function __getExpBtn_click(_arg_1:MouseEvent):void
        {
            getOfflineExp();
        }

        private function _AutoExpPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.AUTOEXPPANEL_U[0];
            _local_1 = Language.AUTOEXPPANEL_U[23];
            _local_1 = Language.AUTOEXPPANEL_U[14];
            _local_1 = Language.AUTOEXPPANEL_U[15];
            _local_1 = Language.AUTOEXPPANEL_U[1];
            _local_1 = Language.AUTOEXPPANEL_U[2];
            _local_1 = Language.AUTOEXPPANEL_U[3];
            _local_1 = Language.AUTOEXPPANEL_U[19];
            _local_1 = Language.AUTOEXPPANEL_U[20];
            _local_1 = Language.AUTOEXPPANEL_U[5];
            _local_1 = Language.AUTOEXPPANEL_U[7];
            _local_1 = Language.AUTOEXPPANEL_U[8];
            _local_1 = Language.AUTOEXPPANEL_U[9];
            _local_1 = Language.AUTOEXPPANEL_U[11];
            _local_1 = Language.AUTOEXPPANEL_U[6];
            _local_1 = Language.AUTOEXPPANEL_U[12];
            _local_1 = Language.AUTOEXPPANEL_U[13];
            _local_1 = Language.AUTOEXPPANEL_U[10];
            _local_1 = Language.AUTOEXPPANEL_U[18];
            _local_1 = Language.AUTOEXPPANEL_U[8];
            _local_1 = Language.AUTOEXPPANEL_U[25];
            _local_1 = Language.AUTOEXPPANEL_U[24];
            _local_1 = Language.AUTOEXPPANEL_U[14];
            _local_1 = Language.AUTOEXPPANEL_U[15];
            _local_1 = Language.AUTOEXPPANEL_U[4];
            _local_1 = Language.AUTOEXPPANEL_U[19];
            _local_1 = Language.AUTOEXPPANEL_U[20];
            _local_1 = Language.AUTOEXPPANEL_U[21];
            _local_1 = Language.AUTOEXPPANEL_U[5];
            _local_1 = Language.AUTOEXPPANEL_U[7];
            _local_1 = Language.AUTOEXPPANEL_U[8];
            _local_1 = Language.AUTOEXPPANEL_U[9];
            _local_1 = Language.AUTOEXPPANEL_U[6];
            _local_1 = Language.AUTOEXPPANEL_U[18];
            _local_1 = Language.AUTOEXPPANEL_U[8];
            _local_1 = Language.AUTOEXPPANEL_U[11];
            _local_1 = Language.AUTOEXPPANEL_U[13];
            _local_1 = Language.AUTOEXPPANEL_U[10];
            _local_1 = Language.AUTOEXPPANEL_U[16];
            _local_1 = Language.AUTOEXPPANEL_U[17];
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                _offlineMinute = Math.round((_core.player.offlineTime / 60));
                calcExpPerHour();
                radiogroup1.selectedValue = 0;
                radiogroupPet.selectedValue = 0;
                timeToConvert.value = 0;
                tabBtn0.selected = true;
                tabBtn1.selected = false;
                tabBtn1.visible = ((!(_core.battlePet == null)) && (ToolKit.isEqual(_core.battlePet.binded, 1)));
                autoExpTab.selectedIndex = 0;
                updateView();
            };
        }

        public function set txtHour(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._878873484txtHour;
            if (_local_2 !== _arg_1)
            {
                this._878873484txtHour = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtHour", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtGold():BoxLabel
        {
            return (this._878903568txtGold);
        }

        [Bindable(event="propertyChange")]
        public function get cbPart():CheckBox
        {
            return (this._1367696142cbPart);
        }

        private function tabClick(_arg_1:uint):void
        {
            tabBtn0.selected = false;
            tabBtn1.selected = false;
            this[("tabBtn" + _arg_1)].selected = true;
            autoExpTab.selectedIndex = _arg_1;
        }

        private function calcMoneyNeeded():void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_1:Number = (_offlineMinute / 60);
            if (cbPart.selected)
            {
                _local_2 = timeToConvert0.value;
                if (_local_2 > _local_1)
                {
                    _local_2 = _local_1;
                };
            }
            else
            {
                _local_2 = _local_1;
            };
            _playerTimeToConvert = _local_2;
            txtTotalExp.text = Math.round((_local_2 * Number(this[("txtExpType" + _typePlayer)].text))).toString();
            switch (_typePlayer)
            {
                case 0:
                    txtGold.text = "0";
                    txtMoney.text = "0";
                    break;
                case 1:
                    txtGold.text = "0";
                    txtMoney.text = Math.ceil(((GamePredef.BASIC_GET_MONEY[_core.player.level] * 0.2) * _local_2)).toString();
                    break;
                case 2:
                    txtMoney.text = "0";
                    txtGold.text = Math.ceil((10 * _local_2)).toString();
                    break;
                case 3:
                    txtMoney.text = "0";
                    txtGold.text = Math.ceil((20 * _local_2)).toString();
                    break;
            };
            if (((!(_core.battlePet == null)) && (ToolKit.isEqual(_core.battlePet.binded, 1))))
            {
                _local_3 = timeToConvert.value;
                if (_local_3 > _local_1)
                {
                    _local_3 = _local_1;
                };
                txtPetTotalExp.text = Math.round((_local_3 * Number(this[("txtPetExpType" + _typePet)].text))).toString();
                switch (_typePet)
                {
                    case 0:
                        txtPetGold.text = Math.ceil((10 * _local_3)).toString();
                        return;
                    case 1:
                        txtPetGold.text = Math.ceil((20 * _local_3)).toString();
                        return;
                    case 2:
                        txtPetGold.text = Math.ceil((40 * _local_3)).toString();
                        return;
                };
            };
        }

        private function updateView():void
        {
            if (((_offlineMinute <= 0) || (_core.player.level < 30)))
            {
                getExpBtn.enabled = false;
                getPetExpBtn.enabled = false;
            }
            else
            {
                getExpBtn.enabled = true;
                getPetExpBtn.enabled = true;
            };
            calcOfflineTime();
            selectExpType();
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set txtPetDay(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1730866317txtPetDay;
            if (_local_2 !== _arg_1)
            {
                this._1730866317txtPetDay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPetDay", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get radiogroupPet():RadioButtonGroup
        {
            return (this._470276325radiogroupPet);
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtDay():BoxLabel
        {
            return (this._859639028txtDay);
        }

        [Bindable(event="propertyChange")]
        public function get timeToConvert0():NumericStepper
        {
            return (this._2063191259timeToConvert0);
        }

        [Bindable(event="propertyChange")]
        public function get txtPetHour():BoxLabel
        {
            return (this._2117380883txtPetHour);
        }

        public function set txtPetGold(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._2117350799txtPetGold;
            if (_local_2 !== _arg_1)
            {
                this._2117350799txtPetGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPetGold", _local_2, _arg_1));
            };
        }

        private function getOfflineExp():void
        {
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doGetOfflineExp), MD5.hash(_arg_1));
            };
            if ((((_typePlayer == 1) && (bagpanel.silverDisable())) || ((_typePlayer > 1) && (bagpanel.goldDisable()))))
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doGetOfflineExp(true);
            };
        }

        public function set txtPetMinute(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._874067069txtPetMinute;
            if (_local_2 !== _arg_1)
            {
                this._874067069txtPetMinute = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPetMinute", _local_2, _arg_1));
            };
        }

        public function __radiogroupPet_change(_arg_1:Event):void
        {
            selectExpType();
        }

        [Bindable(event="propertyChange")]
        public function get closeBtnPet():BasicGlowButton
        {
            return (this._313836229closeBtnPet);
        }

        [Bindable(event="propertyChange")]
        public function get closeBtn():BasicGlowButton
        {
            return (this._1092797764closeBtn);
        }

        public function set txtMinute(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1648541860txtMinute;
            if (_local_2 !== _arg_1)
            {
                this._1648541860txtMinute = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtMinute", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup1():RadioButtonGroup
        {
            return (this._164873549radiogroup1);
        }

        public function set txtExpType0(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1197187415txtExpType0;
            if (_local_2 !== _arg_1)
            {
                this._1197187415txtExpType0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtExpType0", _local_2, _arg_1));
            };
        }

        public function set txtExpType2(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1197187413txtExpType2;
            if (_local_2 !== _arg_1)
            {
                this._1197187413txtExpType2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtExpType2", _local_2, _arg_1));
            };
        }

        public function set txtExpType3(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1197187412txtExpType3;
            if (_local_2 !== _arg_1)
            {
                this._1197187412txtExpType3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtExpType3", _local_2, _arg_1));
            };
        }

        public function set txtExpType1(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1197187414txtExpType1;
            if (_local_2 !== _arg_1)
            {
                this._1197187414txtExpType1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtExpType1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtPetGold():BoxLabel
        {
            return (this._2117350799txtPetGold);
        }

        override public function initialize():void
        {
            var target:AutoExpPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AutoExpPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AutoExpPanelWatcherSetupUtil");
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

        private function onGetOfflineExp(_arg_1:Number):void
        {
            switch (Number(_arg_1))
            {
                case 1:
                    if (((cbPart.selected) && (_core.player.offlineTime > (_playerTimeToConvert * 3600))))
                    {
                        _core.player.offlineTime = (_core.player.offlineTime - (_playerTimeToConvert * 3600));
                        _offlineMinute = ((_offlineMinute > (_playerTimeToConvert * 60)) ? (_offlineMinute - (_playerTimeToConvert * 60)) : 0);
                    }
                    else
                    {
                        _core.player.offlineTime = 0;
                        _offlineMinute = 0;
                    };
                    updateView();
                    return;
                case 2:
                    _core.player.offlineTime = (_core.player.offlineTime - (_timeToConvert * 3600));
                    _offlineMinute = (_offlineMinute - (_timeToConvert * 60));
                    updateView();
                    return;
                case -2:
                    Alert.show(Language.AUTOEXPPANEL_S[0]);
                    return;
                case -3:
                    Alert.show(Language.AUTOEXPPANEL_S[1]);
                    return;
                case -4:
                    Alert.show(Language.AUTOEXPPANEL_S[2]);
                    return;
                case -5:
                    Alert.show(Language.AUTOEXPPANEL_S[4]);
                    return;
                case -6:
                    Alert.show(Language.AUTOEXPPANEL_S[5]);
                    return;
                case -7:
                    Alert.show(Language.AUTOEXPPANEL_S[6]);
                    return;
                case -8:
                    Alert.show(Language.AUTOEXPPANEL_S[7]);
                    return;
                case -9:
                    Alert.show(Language.AUTOEXPPANEL_S[8]);
                    return;
                case -1:
                default:
                    Alert.show(Language.AUTOEXPPANEL_S[3]);
            };
        }

        public function set txtPetExpType1(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1232154057txtPetExpType1;
            if (_local_2 !== _arg_1)
            {
                this._1232154057txtPetExpType1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPetExpType1", _local_2, _arg_1));
            };
        }

        public function set txtPetExpType2(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1232154058txtPetExpType2;
            if (_local_2 !== _arg_1)
            {
                this._1232154058txtPetExpType2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPetExpType2", _local_2, _arg_1));
            };
        }

        public function set autoExpTab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._779864377autoExpTab;
            if (_local_2 !== _arg_1)
            {
                this._779864377autoExpTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoExpTab", _local_2, _arg_1));
            };
        }

        public function set txtTotalExp(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._96340279txtTotalExp;
            if (_local_2 !== _arg_1)
            {
                this._96340279txtTotalExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtTotalExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtPetMinute():BoxLabel
        {
            return (this._874067069txtPetMinute);
        }

        public function set txtPetExpType0(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1232154056txtPetExpType0;
            if (_local_2 !== _arg_1)
            {
                this._1232154056txtPetExpType0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPetExpType0", _local_2, _arg_1));
            };
        }

        public function __closeBtnPet_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        public function __cbPart_change(_arg_1:Event):void
        {
            onPartChange();
        }

        private function calcOfflineTime():void
        {
            var _local_1:int = _offlineMinute;
            var _local_2:int = (_local_1 % 60);
            txtMinute.text = _local_2.toString();
            txtPetMinute.text = _local_2.toString();
            _local_1 = int((_local_1 / 60));
            var _local_3:int = (_local_1 % 24);
            txtHour.text = _local_3.toString();
            txtPetHour.text = _local_3.toString();
            timeToConvert.maximum = _local_1;
            _local_1 = int((_local_1 / 24));
            txtDay.text = _local_1.toString();
            txtPetDay.text = _local_1.toString();
        }

        [Bindable(event="propertyChange")]
        public function get txtPetExpType0():BoxLabel
        {
            return (this._1232154056txtPetExpType0);
        }

        [Bindable(event="propertyChange")]
        public function get txtPetExpType1():BoxLabel
        {
            return (this._1232154057txtPetExpType1);
        }

        [Bindable(event="propertyChange")]
        public function get txtPetExpType2():BoxLabel
        {
            return (this._1232154058txtPetExpType2);
        }

        public function __timeToConvert_change(_arg_1:NumericStepperEvent):void
        {
            selectExpType();
        }

        public function set txtGold(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._878903568txtGold;
            if (_local_2 !== _arg_1)
            {
                this._878903568txtGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtGold", _local_2, _arg_1));
            };
        }

        public function set cbPart(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1367696142cbPart;
            if (_local_2 !== _arg_1)
            {
                this._1367696142cbPart = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbPart", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtPetTotalExp():BoxLabel
        {
            return (this._1961966104txtPetTotalExp);
        }

        public function set getExpBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._406818293getExpBtn;
            if (_local_2 !== _arg_1)
            {
                this._406818293getExpBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getExpBtn", _local_2, _arg_1));
            };
        }

        public function set txtPetTotalExp(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1961966104txtPetTotalExp;
            if (_local_2 !== _arg_1)
            {
                this._1961966104txtPetTotalExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPetTotalExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get getExpBtn():BasicGlowButton
        {
            return (this._406818293getExpBtn);
        }

        private function calcExpPerHour():void
        {
            var _local_2:*;
            var _local_1:* = GamePredef.BASIC_GET_EXP[_core.player.level];
            txtExpType0.text = Math.round((_local_1 * 0.3)).toString();
            txtExpType1.text = Math.round(_local_1).toString();
            txtExpType2.text = Math.round((_local_1 * 2)).toString();
            txtExpType3.text = Math.round((_local_1 * 3)).toString();
            if (((!(_core.battlePet == null)) && (ToolKit.isEqual(_core.battlePet.binded, 1))))
            {
                _local_2 = GamePredef.BASIC_GET_EXP[_core.battlePet.level];
                txtPetExpType0.text = Math.round((_local_2 * 2)).toString();
                txtPetExpType1.text = Math.round((_local_2 * 3)).toString();
                txtPetExpType2.text = Math.round((_local_2 * 5)).toString();
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

