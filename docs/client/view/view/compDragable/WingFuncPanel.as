// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WingFuncPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.ItemSlotEquFunc;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.ViewStack;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import mx.controls.List;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.controls.Image;
    import mx.controls.CheckBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import com.qeedoo.ui.event.GameEvent;
    import flash.events.MouseEvent;
    import mx.events.CloseEvent;
    import mx.controls.Alert;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.ListEvent;
    import mx.events.DragEvent;
    import mx.core.DragSource;
    import com.qeedoo.game.ui.ISlot;
    import mx.core.IUITextField;
    import mx.events.NumericStepperEvent;
    import com.adobe.crypto.MD5;
    import com.qeedoo.ui.view.comp.FuncBag;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.data.GameData;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class WingFuncPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _WingFuncPanel_BasicTxtButton25:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton26:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton28:BasicTxtButton;
        private var _1478570939bindItemNumTip:Label;
        public var _WingFuncPanel_BasicTxtButton27:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton22:BasicTxtButton;
        private var _262477064holeItemNumTip:Label;
        public var _WingFuncPanel_BasicTxtButton21:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton24:BasicTxtButton;
        private var _515043687holeMain:ItemSlotEquFunc;
        public var _WingFuncPanel_BasicTxtButton30:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton31:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton32:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton33:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton34:BasicTxtButton;
        private var _589175008prefixItemRequire:ItemSlot;
        private var curRescode:Number = 0;
        public var _WingFuncPanel_BasicTxtButton46:BasicTxtButton;
        private var _1394559310prefixMoney:Label;
        private var _1651487246holeItemRequire:ItemSlot;
        private var _1246703002introText3:IntroText;
        private var _1386354456featherSetMain:ItemSlotEquFunc;
        public var _WingFuncPanel_Label10:Label;
        public var _WingFuncPanel_Label11:Label;
        public var _WingFuncPanel_Label12:Label;
        public var _WingFuncPanel_Label13:Label;
        public var _WingFuncPanel_Label14:Label;
        public var _WingFuncPanel_Label15:Label;
        private var _27520924prefixButton:BasicGlowButton;
        private var _60395880wingPreview5:ItemSlotEquFunc;
        private var _114581tab:ViewStack;
        private var _1954302177mixLuckyItem:ItemSlot;
        private var _1334416454curFeatherProp:TextArea;
        private var _291058703feather4:ItemSlot;
        private var _2058846118isFirst:String = "|";
        public var _WingFuncPanel_Label4:Label;
        public var _WingFuncPanel_Label7:Label;
        private var _2133274960itemInBag:ItemSlot;
        private var _1246703005introText6:IntroText;
        private var _550657233featherSetButton:BasicGlowButton;
        private var _899727221curPrefixProp:TextArea;
        private var _2085845920curBindProp:TextArea;
        private var _483423936reqMixItem1:ItemSlot;
        private var _1349152991curPhy:BasicTxtButton;
        private var _432885246feather10:ItemSlot;
        private var _1379459640funcBtn0:BasicGlowButton;
        private var _1268261610reqmixFormular:ItemSlot;
        private var _2127138652itemByBuy:ItemSlot;
        private var _1900875002starOneButton:BasicGlowButton;
        private var _112177344previewCanvas:CharactorShowCanvas;
        private var _5143378mixButton:BasicGlowButton;
        private var curWingId:int = 0;
        private var _501797251joinWing2:ItemSlotEquFunc;
        private var _1701830995wingFuncList:List;
        private var _541105997curMagic:BasicTxtButton;
        private var _165104137featherMixLuckItemNum:NumericStepper;
        private var _1424161935nextLife:BasicTxtButton;
        private var _1315536005starItem:ItemSlot;
        private var _1710239761featherUpButtonAll:BasicGlowButton;
        private var _474659641featherMixRate:BasicTxtButton;
        public var _WingFuncPanel_BasicGlowButton2:BasicGlowButton;
        private var _60395882wingPreview3:ItemSlotEquFunc;
        private var _774447364featherUpLuckItemNum:NumericStepper;
        private var _934857288mixFormular:ItemSlot;
        private var _807279583wTitle:BasicTitleCanvas;
        private var _1847059854nextPhy:BasicTxtButton;
        private var _291058706feather1:ItemSlot;
        private var _291058702feather5:ItemSlot;
        private var _1967315247featherUpItem:ItemSlot;
        private var _1199243345nextLevel:BasicTxtButton;
        private var _1246703001introText2:IntroText;
        private var _380498984mixedFeather:ItemSlot;
        private var _1327811494prefixItemNumTip:Label;
        private var _341865658starNumBasic:NumericStepper;
        private var _1967214217featherUpMain:ItemSlot;
        private var _1401966077joinMain:ItemSlotEquFunc;
        private var _1037480286MixItem1:ItemSlot;
        private var _1206019348nextSpeed:BasicTxtButton;
        private var _1246703004introText5:IntroText;
        private var _291058699feather8:ItemSlot;
        private var _1710253270featherUpButtonOne:BasicGlowButton;
        private var _1323287868maxBindProp:TextArea;
        private var _501797252joinWing1:ItemSlotEquFunc;
        private var _1125811548curLife:BasicTxtButton;
        private var _1213936608holeMoney:Label;
        private var _1246703007introText8:IntroText;
        private var _1340501141prefixMain:ItemSlotEquFunc;
        private var _360588801starAllButton:BasicGlowButton;
        public var _WingFuncPanel_Canvas1:Canvas;
        private var _1696059025advanceJoinEnable:Boolean = true;
        private var _1315637035starMain:ItemSlotEquFunc;
        private var _1331857390holeButton:BasicGlowButton;
        private var _60395884wingPreview1:ItemSlotEquFunc;
        private var _405165519bindButton:BasicGlowButton;
        private var autoMatchSlots:Array;
        private var _291058705feather2:ItemSlot;
        private var _506858505growBtn2:BasicGlowButton;
        private var _291058701feather6:ItemSlot;
        private var _771118837featherMixAutoPutBtn:BasicGlowButton;
        private var _210599509bindItemRequire:ItemSlot;
        private var _starNum:int;
        private var _1349542418wingExp:BoxLabel;
        private var _1037480285MixItem2:ItemSlot;
        private var _1246703000introText1:IntroText;
        public var _WingFuncPanel_BasicTxtButton1:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton2:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton3:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton4:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton5:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton6:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton7:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton8:BasicTxtButton;
        private var _1782203801maxPrefixProp:TextArea;
        private var currentIndex:int = 0;
        private var _291058698feather9:ItemSlot;
        public var _WingFuncPanel_BasicTxtButton9:BasicTxtButton;
        private var _939175152bindItem:ItemSlot;
        private var _60395881wingPreview4:ItemSlotEquFunc;
        private var selectedIndex:int;
        public var _WingFuncPanel_Image1:Image;
        private var _1315530272starInfo:BasicTxtButton;
        private var wingBagAdded:Boolean = false;
        private var _1402072840joinInfo:Label;
        private var _547091943curSpeed:BasicTxtButton;
        private var _1615024608starRateInfo:BasicTxtButton;
        private var _524842218changeViewBox:CheckBox;
        private var _1340602171prefixItem:ItemSlot;
        private var _631614868featherUpRateInfo:BasicTxtButton;
        private var _1246703003introText4:IntroText;
        private var _501797249joinWing4:ItemSlotEquFunc;
        private var _164090455wingLabel:Label;
        private var _1034217724joinButton:BasicGlowButton;
        private var _946787709bindMoney:Label;
        private var _2067262411showBag:BasicGlowButton;
        private var _483423935reqMixItem2:ItemSlot;
        private var _1377586698buyBtn:BasicGlowButton;
        private var _515144717holeItem:ItemSlot;
        private var _1656453898selectCrit:CheckBox;
        private var _1897222734starMax:NumericStepper;
        private var _912391750featherDelButton:BasicGlowButton;
        private var _506858504growBtn1:BasicGlowButton;
        private var _291058704feather3:ItemSlot;
        private var level:int = 0;
        private var _291058700feather7:ItemSlot;
        private var _871500217introText:IntroText;
        private var _1379459641funcBtn1:BasicGlowButton;
        private var _501797250joinWing3:ItemSlotEquFunc;
        private var _540315940curLevel:BasicTxtButton;
        private var _12860042formularList:List;
        private var _1200033402nextMagic:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton10:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton12:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton13:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton15:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton16:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton17:BasicTxtButton;
        public var _WingFuncPanel_BasicTxtButton11:BasicTxtButton;
        private var _939276182bindMain:ItemSlotEquFunc;
        public var _WingFuncPanel_BasicTxtButton14:BasicTxtButton;
        private var _60395883wingPreview2:ItemSlotEquFunc;
        public var _WingFuncPanel_BasicTxtButton20:BasicTxtButton;
        private var wingBag:Object;
        public var _WingFuncPanel_BasicTxtButton23:BasicTxtButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":350,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"wTitle",
                        "events":{"creationComplete":"__wTitle_creationComplete"}
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"_WingFuncPanel_Canvas1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":40,
                                "width":472,
                                "height":325,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_WingFuncPanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":155,
                                            "y":70,
                                            "width":285,
                                            "height":220
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"tab",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":75,
                                            "width":397,
                                            "y":0,
                                            "height":315,
                                            "creationPolicy":"all",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introText",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":95,
                                                                    "y":7,
                                                                    "width":377,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"joinMain",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":135,
                                                                    "movable":false,
                                                                    "x":173.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"joinButton",
                                                            "events":{"click":"__joinButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":195,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":168,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"joinInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "-5";
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":175,
                                                                    "width":108
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"joinWing1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":135,
                                                                    "movable":false,
                                                                    "x":84.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"joinWing2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":175,
                                                                    "movable":false,
                                                                    "x":84.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"joinWing3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":135,
                                                                    "movable":false,
                                                                    "x":260
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"joinWing4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":175,
                                                                    "movable":false,
                                                                    "x":260
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0101,
                                                                    "y":110,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":167.5,
                                                                    "y":110,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":78,
                                                                    "y":110,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 18;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":56,
                                                                    "y":228,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_WingFuncPanel_BasicTxtButton4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 1;
                                                                            this.paddingRight = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_WingFuncPanel_BasicTxtButton5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 1;
                                                                            this.paddingRight = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_WingFuncPanel_BasicTxtButton6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 1;
                                                                            this.paddingRight = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_WingFuncPanel_BasicTxtButton7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 1;
                                                                            this.paddingRight = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_WingFuncPanel_BasicTxtButton8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 1;
                                                                            this.paddingRight = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 24;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":59,
                                                                    "y":245,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"wingPreview1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"wingPreview2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"wingPreview3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"wingPreview4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"wingPreview5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"movable":false});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_WingFuncPanel_BasicGlowButton2",
                                                            "events":{"click":"___WingFuncPanel_BasicGlowButton2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "x":325,
                                                                    "y":187,
                                                                    "width":62
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
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introText1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":95,
                                                                    "y":7,
                                                                    "width":377,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"curPrefixProp",
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
                                                                    "y":110,
                                                                    "height":152,
                                                                    "width":110,
                                                                    "x":10,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":111,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":123,
                                                                    "y":179,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":212,
                                                                    "y":179,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prefixItemNumTip",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                                this.color = 0xFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":202,
                                                                    "y":242,
                                                                    "width":100,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prefixMoney",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":243,
                                                                    "width":43
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WingFuncPanel_Label4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":243,
                                                                    "width":70,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"prefixMain",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":137,
                                                                    "movable":false,
                                                                    "x":181.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"prefixItemRequire",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":200,
                                                                    "x":137,
                                                                    "movable":false,
                                                                    "acceptable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"prefixItem",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":200,
                                                                    "movable":false,
                                                                    "x":226
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"maxPrefixProp",
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
                                                                    "y":110,
                                                                    "height":150,
                                                                    "width":109,
                                                                    "x":278,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"prefixButton",
                                                            "events":{"click":"__prefixButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":265,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":221,
                                                                    "width":51
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
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introText2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":95,
                                                                    "y":7,
                                                                    "width":377,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"curBindProp",
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
                                                                    "height":97,
                                                                    "width":110,
                                                                    "x":10,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":111,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":123,
                                                                    "y":179,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":212,
                                                                    "y":179,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"bindItemNumTip",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                                this.color = 0xFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":202,
                                                                    "y":242,
                                                                    "width":100,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"bindMoney",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":243,
                                                                    "width":43
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WingFuncPanel_Label7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":243,
                                                                    "width":70,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"bindMain",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":137,
                                                                    "movable":false,
                                                                    "x":181.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"bindItemRequire",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":200,
                                                                    "x":137,
                                                                    "movable":false,
                                                                    "acceptable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"bindItem",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":200,
                                                                    "movable":false,
                                                                    "x":226
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"maxBindProp",
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
                                                                    "height":97,
                                                                    "width":109,
                                                                    "x":278,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"bindButton",
                                                            "events":{"click":"__bindButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":265,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":221,
                                                                    "width":51,
                                                                    "enabled":true
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
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introText3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":95,
                                                                    "y":7,
                                                                    "width":377,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton15",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":72,
                                                                    "y":137,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton16",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168.5,
                                                                    "y":137,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton17",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":264,
                                                                    "y":137,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"holeItemNumTip",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                                this.color = 0xFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":253,
                                                                    "y":205,
                                                                    "width":100,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"holeMoney",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":89,
                                                                    "y":239,
                                                                    "width":43
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WingFuncPanel_Label10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":239,
                                                                    "width":70,
                                                                    "x":19
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"holeMain",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":163,
                                                                    "movable":false,
                                                                    "x":89
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"holeItemRequire",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":181.5,
                                                                    "y":163,
                                                                    "movable":false,
                                                                    "acceptable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"holeItem",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":277,
                                                                    "y":163,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"holeButton",
                                                            "events":{"click":"__holeButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":238,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":173,
                                                                    "width":51
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
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introText4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":95,
                                                                    "y":7,
                                                                    "width":377,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"starMain",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":136,
                                                                    "movable":false,
                                                                    "x":81
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"starItem",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":136,
                                                                    "movable":false,
                                                                    "x":254
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"starInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":178,
                                                                    "label":"10",
                                                                    "x":139,
                                                                    "width":27
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"starRateInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":178,
                                                                    "label":"100%",
                                                                    "x":306,
                                                                    "width":40,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":NumericStepper,
                                                            "id":"starNumBasic",
                                                            "events":{"change":"__starNumBasic_change"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":81,
                                                                    "y":231,
                                                                    "value":5,
                                                                    "minimum":1,
                                                                    "maximum":5,
                                                                    "width":50,
                                                                    "height":21
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":NumericStepper,
                                                            "id":"starMax",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":254,
                                                                    "y":231,
                                                                    "minimum":1,
                                                                    "maximum":10,
                                                                    "width":50,
                                                                    "height":21
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"starAllButton",
                                                            "events":{"click":"__starAllButton_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":158.5,
                                                                    "y":204,
                                                                    "styleName":"BtnStdGreen",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"starOneButton",
                                                            "events":{"click":"__starOneButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":173.5,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":50,
                                                                    "y":253
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton20",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":66,
                                                                    "y":110,
                                                                    "width":76,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton21",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":239,
                                                                    "y":110,
                                                                    "width":76,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton22",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":66,
                                                                    "y":178,
                                                                    "width":65,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton23",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":239,
                                                                    "y":178,
                                                                    "width":65,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton24",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":66,
                                                                    "y":205,
                                                                    "width":65,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton25",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":254,
                                                                    "y":205,
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
                                                        "percentWidth":100,
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introText5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":95,
                                                                    "y":7,
                                                                    "width":377,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"curFeatherProp",
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
                                                                    "y":110,
                                                                    "height":100,
                                                                    "width":42,
                                                                    "x":10,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton26",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":144,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton27",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":180,
                                                                    "y":144,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton28",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":205,
                                                                    "y":218,
                                                                    "width":65,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"featherUpRateInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":218,
                                                                    "label":"100%",
                                                                    "x":278,
                                                                    "width":40,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":NumericStepper,
                                                            "id":"featherUpLuckItemNum",
                                                            "events":{"change":"__featherUpLuckItemNum_change"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":247,
                                                                    "y":183,
                                                                    "value":5,
                                                                    "minimum":1,
                                                                    "width":50,
                                                                    "height":21
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"featherUpMain",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":170,
                                                                    "movable":false,
                                                                    "x":89
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"featherUpItem",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":170,
                                                                    "movable":false,
                                                                    "x":194
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"featherUpButtonOne",
                                                            "events":{"click":"__featherUpButtonOne_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":265,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":0x0101,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"featherUpButtonAll",
                                                            "events":{"click":"__featherUpButtonAll_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":265,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":151,
                                                                    "width":80
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
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introText6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":95,
                                                                    "y":7,
                                                                    "width":377,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton30",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168,
                                                                    "y":110,
                                                                    "width":60,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"featherSetMain",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":136,
                                                                    "movable":false,
                                                                    "x":182
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton31",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":40,
                                                                    "y":185,
                                                                    "width":19,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton32",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":333,
                                                                    "y":185,
                                                                    "width":19,
                                                                    "height":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton33",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":333,
                                                                    "y":225,
                                                                    "width":19,
                                                                    "height":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather1",
                                                            "events":{"doubleClick":"__feather1_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":70,
                                                                    "y":177,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather3",
                                                            "events":{"doubleClick":"__feather3_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":126,
                                                                    "y":177,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather5",
                                                            "events":{"doubleClick":"__feather5_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":182,
                                                                    "y":177,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather7",
                                                            "events":{"doubleClick":"__feather7_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":238,
                                                                    "y":177,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather9",
                                                            "events":{"doubleClick":"__feather9_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":294,
                                                                    "y":177,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather2",
                                                            "events":{"doubleClick":"__feather2_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":70,
                                                                    "y":220,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather4",
                                                            "events":{"doubleClick":"__feather4_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":126,
                                                                    "y":220,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather6",
                                                            "events":{"doubleClick":"__feather6_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":182,
                                                                    "y":220,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather8",
                                                            "events":{"doubleClick":"__feather8_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":238,
                                                                    "y":220,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"feather10",
                                                            "events":{"doubleClick":"__feather10_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":294,
                                                                    "y":220,
                                                                    "movable":false,
                                                                    "showStackNum":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"featherSetButton",
                                                            "events":{"click":"__featherSetButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":265,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":336,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"featherDelButton",
                                                            "events":{"click":"__featherDelButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":280,
                                                                    "y":265,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":51
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "events":{"creationComplete":"___WingFuncPanel_Canvas9_creationComplete"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":List,
                                                            "id":"formularList",
                                                            "events":{"itemClick":"__formularList_itemClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "7";
                                                                this.top = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":115,
                                                                    "styleName":"CSSBorder",
                                                                    "height":280
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"mixedFeather",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":233,
                                                                    "y":10,
                                                                    "acceptable":false,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "130";
                                                                this.top = "52";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":250,
                                                                    "height":233,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"reqmixFormular",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":30,
                                                                                "y":28,
                                                                                "acceptable":false,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"mixFormular",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":30,
                                                                                "y":96,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_WingFuncPanel_Label11",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":138
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"mixLuckyItem",
                                                                        "events":{
                                                                            "dragDrop":"__mixLuckyItem_dragDrop",
                                                                            "click":"__mixLuckyItem_click"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":70,
                                                                                "y":164,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"featherMixLuckItemNum",
                                                                        "events":{"change":"__featherMixLuckItemNum_change"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":12,
                                                                                "y":164,
                                                                                "value":1,
                                                                                "minimum":1,
                                                                                "width":50,
                                                                                "height":21
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"featherMixAutoPutBtn",
                                                                        "events":{"click":"__featherMixAutoPutBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "styleName":"BtnNormalRed",
                                                                                "y":164,
                                                                                "width":99,
                                                                                "enabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_WingFuncPanel_Label12",
                                                                        "stylesFactory":function ():void
                                                                        {
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
                                                                        "id":"reqMixItem1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":28,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"reqMixItem2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":190,
                                                                                "y":28,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_WingFuncPanel_Label13",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":70
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"MixItem1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":96,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"MixItem2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":190,
                                                                                "y":96,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_WingFuncPanel_BasicTxtButton34",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":205,
                                                                                "width":65,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"featherMixRate",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":205,
                                                                                "label":"100%",
                                                                                "x":75,
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"mixButton",
                                                                        "events":{"click":"__mixButton_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":173,
                                                                                "y":203,
                                                                                "styleName":"BtnStdRed",
                                                                                "width":51
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
                                                        "height":295,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introText8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":62,
                                                                    "y":7,
                                                                    "width":377,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":SimpleCanvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":5,
                                                                    "y":78,
                                                                    "height":150,
                                                                    "width":200,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_WingFuncPanel_Label14",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 14;
                                                                            this.fontWeight = "bold";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":10,
                                                                                "width":80
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_WingFuncPanel_Label15",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 14;
                                                                            this.fontWeight = "bold";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":125,
                                                                                "y":10,
                                                                                "width":80
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"curLevel",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":40,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"curSpeed",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":57,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"curLife",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":74,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"curPhy",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":91,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"curMagic",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":108,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"nextLevel",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":117,
                                                                                "y":40,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"nextSpeed",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":117,
                                                                                "y":57,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"nextLife",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":117,
                                                                                "y":74,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"nextPhy",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":117,
                                                                                "y":91,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"nextMagic",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":117,
                                                                                "y":108,
                                                                                "text":""
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
                                                                    "x":227,
                                                                    "y":74,
                                                                    "height":146,
                                                                    "width":158,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":CharactorShowCanvas,
                                                                        "id":"previewCanvas",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":81,
                                                                                "y":135
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CheckBox,
                                                                        "id":"changeViewBox",
                                                                        "events":{"change":"__changeViewBox_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "6";
                                                                            this.top = "3";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"funcBtn0",
                                                                        "events":{"click":"__funcBtn0_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":13,
                                                                                "y":120,
                                                                                "height":20,
                                                                                "styleName":"CrystalYellowButton",
                                                                                "enabled":true
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"funcBtn1",
                                                                        "events":{"click":"__funcBtn1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "13";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":120,
                                                                                "height":20,
                                                                                "styleName":"CrystalYellowButton",
                                                                                "enabled":true
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"wingLabel",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":40,
                                                                                "width":90,
                                                                                "height":15,
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_WingFuncPanel_BasicTxtButton46",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":20,
                                                                    "y":226,
                                                                    "width":45,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"wingExp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":55,
                                                                    "y":224,
                                                                    "width":315,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"itemInBag",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":40,
                                                                    "y":250,
                                                                    "movable":false,
                                                                    "acceptable":false,
                                                                    "giid":3627
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"itemByBuy",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":109,
                                                                    "y":250,
                                                                    "movable":false,
                                                                    "acceptable":false,
                                                                    "giid":3628
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"selectCrit",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":149,
                                                                    "y":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"buyBtn",
                                                            "events":{"click":"__buyBtn_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":149,
                                                                    "y":267,
                                                                    "width":51,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"growBtn1",
                                                            "events":{"click":"__growBtn1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "91";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":267,
                                                                    "width":71,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"growBtn2",
                                                            "events":{"click":"__growBtn2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":267,
                                                                    "width":71,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":List,
                                    "id":"wingFuncList",
                                    "events":{
                                        "change":"__wingFuncList_change",
                                        "creationComplete":"__wingFuncList_creationComplete"
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
                                            "x":5,
                                            "y":8
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
        private var listArr:Array = [Language.WING_PANEL_U[1], Language.WING_PANEL_U[35], Language.WING_PANEL_U[43], Language.WING_PANEL_U[57], Language.WING_PANEL_U[59], Language.WING_PANEL_U[62], Language.WING_PANEL_U[69], Language.WING_PANEL_U[91], Language.WING_PANEL_U[133]];
        private var canPutPropOfFeathers:Object = {};
        private var newWingRescode:Object = {
            "blue":2070390009003,
            "white":2070390007003,
            "evil":2070390006003,
            "angle":2070390008003
        };
        private var rescodeArray:Array = [];
        private var rescodeLabel:Array = [Language.WING_PANEL_U[144], Language.WING_PANEL_U[138], Language.WING_PANEL_U[139]];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WingFuncPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 350;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WingFuncPanel._watcherSetupUtil = _arg_1;
        }


        private function onWingStar(_arg_1:Object):void
        {
            var _local_2:* = "";
            if (_arg_1)
            {
                if (((ToolKit.isEqual(_arg_1.equSlotId, starMain.slotData.id)) && (ToolKit.isEqual(_arg_1.itemSlotId, starItem.slotData.id))))
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        starItem.stackNum = _arg_1.num;
                    }
                    else
                    {
                        starItem.clean();
                    };
                };
                _starNum = _arg_1.upgradeNum;
                setStarInfo();
                if (_arg_1.flag)
                {
                    _local_2 = Language.EQUIPTFUNCPANEL_S[4];
                    _local_2 = _local_2.replace("{starNum}", _starNum);
                    _core.sysMidNote(_local_2);
                }
                else
                {
                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[6]);
                };
            };
        }

        private function onFeatherSet(_arg_1:int):void
        {
            var _local_2:String;
            if (_arg_1)
            {
                featherSetEquChange(null);
                _local_2 = Language.WING_PANEL_U[73];
                _local_2 = _local_2.replace("{successNum}", _arg_1.toString());
                _core.sysMidNote(_local_2);
            };
        }

        public function set feather4(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058703feather4;
            if (_local_2 !== _arg_1)
            {
                this._291058703feather4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get feather6():ItemSlot
        {
            return (this._291058701feather6);
        }

        [Bindable(event="propertyChange")]
        public function get feather9():ItemSlot
        {
            return (this._291058698feather9);
        }

        [Bindable(event="propertyChange")]
        public function get feather5():ItemSlot
        {
            return (this._291058702feather5);
        }

        [Bindable(event="propertyChange")]
        public function get featherUpButtonAll():BasicGlowButton
        {
            return (this._1710239761featherUpButtonAll);
        }

        [Bindable(event="propertyChange")]
        public function get feather7():ItemSlot
        {
            return (this._291058700feather7);
        }

        public function set feather8(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058699feather8;
            if (_local_2 !== _arg_1)
            {
                this._291058699feather8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather8", _local_2, _arg_1));
            };
        }

        public function set holeButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1331857390holeButton;
            if (_local_2 !== _arg_1)
            {
                this._1331857390holeButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeButton", _local_2, _arg_1));
            };
        }

        private function wingBagRefresh():void
        {
            var _local_1:Object = {
                "up":{},
                "down":{}
            };
            switch (tab.selectedIndex)
            {
                case 0:
                    _local_1.up = {
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":{"13":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.down = {"nth":true};
                    _local_1.npcShop = 87;
                    break;
                case 1:
                    _local_1.up = {
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":{"13":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":{"2937":true}
                    };
                    _local_1.npcShop = 87;
                    break;
                case 2:
                    _local_1.up = {
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":{"13":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":{"2843":true}
                    };
                    _local_1.npcShop = 87;
                    break;
                case 3:
                    _local_1.up = {
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":{"13":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":{"2907":true}
                    };
                    _local_1.npcShop = 87;
                    break;
                case 4:
                    _local_1.up = {
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":{"13":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":{"2906":true}
                    };
                    _local_1.npcShop = 87;
                    break;
                case 5:
                    _local_1.up = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "kind":{"14":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":{"3021":true}
                    };
                    _local_1.npcShop = 87;
                    break;
                case 6:
                    _local_1.up = {
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":{"13":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "kind":{"14":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.npcShop = 87;
                    break;
                case 7:
                    _local_1.up = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "kind":{"14":true},
                        "sortField":"color",
                        "sortParam":(Array.DESCENDING | Array.NUMERIC)
                    };
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":{"3017":true}
                    };
                    _local_1.npcShop = 87;
                    break;
            };
            wingBag.condition = _local_1;
        }

        private function starEquChange(e:GameEvent):void
        {
            var wingIns:Object;
            var wingTemp:Object;
            var onGetStarNum:Function;
            if (starMain.slotData)
            {
                wingIns = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][starMain.slotData.itemId];
                wingTemp = _core.getTemplateData(starMain.slotData.type, starMain.slotData.itemId, false);
                onGetStarNum = function (_arg_1:int):void
                {
                    _starNum = _arg_1;
                    setStarInfo();
                };
                if (((wingTemp) && (wingIns)))
                {
                    _core.remote.call("getStarNum", new Responder(onGetStarNum), starMain.slotData.id);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get feather2():ItemSlot
        {
            return (this._291058705feather2);
        }

        public function set featherUpButtonAll(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1710239761featherUpButtonAll;
            if (_local_2 !== _arg_1)
            {
                this._1710239761featherUpButtonAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherUpButtonAll", _local_2, _arg_1));
            };
        }

        public function set feather5(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058702feather5;
            if (_local_2 !== _arg_1)
            {
                this._291058702feather5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get growBtn2():BasicGlowButton
        {
            return (this._506858505growBtn2);
        }

        public function set feather6(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058701feather6;
            if (_local_2 !== _arg_1)
            {
                this._291058701feather6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather6", _local_2, _arg_1));
            };
        }

        public function set feather7(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058700feather7;
            if (_local_2 !== _arg_1)
            {
                this._291058700feather7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mixedFeather():ItemSlot
        {
            return (this._380498984mixedFeather);
        }

        [Bindable(event="propertyChange")]
        public function get wTitle():BasicTitleCanvas
        {
            return (this._807279583wTitle);
        }

        public function set feather10(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._432885246feather10;
            if (_local_2 !== _arg_1)
            {
                this._432885246feather10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get growBtn1():BasicGlowButton
        {
            return (this._506858504growBtn1);
        }

        public function __showBag_click(_arg_1:MouseEvent):void
        {
            changeBagVis();
        }

        private function prefixViewClear():void
        {
            prefixMain.clean();
            prefixItemRequire.clean();
            prefixItem.clean();
            curPrefixProp.htmlText = "";
            maxPrefixProp.htmlText = "";
            prefixItemNumTip.text = "";
            prefixMoney.text = "";
        }

        private function subFeatherUp(starOnce:Boolean=true):void
        {
            var featherIns:Object;
            var featherTemp:Object;
            var luckSid:Number;
            var luckBasic:Number;
            var needsAlert:Boolean;
            var func:Function;
            var luckIns:Object;
            var luckTemp:Object;
            var e:CloseEvent;
            if (featherUpMain.slotData)
            {
                if (featherUpMain.tempBagFlag)
                {
                    featherIns = {"binded":featherUpMain.slotData.b};
                    featherTemp = _core.getTemplateData(featherUpMain.slotData.ti, featherUpMain.slotData.ii, false);
                }
                else
                {
                    featherIns = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][featherUpMain.slotData.itemId];
                    featherTemp = _core.getTemplateData(featherUpMain.slotData.type, featherUpMain.slotData.itemId, false);
                };
                if (((featherIns) && (featherTemp)))
                {
                    luckSid = -1;
                    luckBasic = -1;
                    needsAlert = false;
                    if (((featherUpLuckItemNum.value > 0) && (featherUpItem.slotData)))
                    {
                        luckIns = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][featherUpItem.slotData.itemId];
                        luckTemp = _core.getTemplateData(featherUpItem.slotData.type, featherUpItem.slotData.itemId, false);
                        if ((((luckIns) && (luckTemp)) && (ToolKit.isEqual(luckTemp.id, GamePredef.FEATHER_LUCKY_ID))))
                        {
                            if ((((!(needsAlert)) && (ToolKit.isEqual(featherIns.binded, 0))) && (ToolKit.isEqual(luckIns.binded, 1))))
                            {
                                needsAlert = true;
                            };
                            luckSid = featherUpItem.slotData.id;
                            luckBasic = featherUpLuckItemNum.value;
                        };
                    };
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("featherUpdate", new Responder(onFeatherUp), featherUpMain.slotData.id, luckSid, luckBasic, starOnce, featherUpMain.tempBagFlag);
                        };
                    };
                    if (needsAlert)
                    {
                        Alert.show(Language.WING_PANEL_U[86], "", (Alert.YES | Alert.NO), null, func);
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

        [Bindable(event="propertyChange")]
        public function get feather1():ItemSlot
        {
            return (this._291058706feather1);
        }

        [Bindable(event="propertyChange")]
        public function get bindItemNumTip():Label
        {
            return (this._1478570939bindItemNumTip);
        }

        [Bindable(event="propertyChange")]
        public function get curFeatherProp():TextArea
        {
            return (this._1334416454curFeatherProp);
        }

        [Bindable(event="propertyChange")]
        public function get feather8():ItemSlot
        {
            return (this._291058699feather8);
        }

        public function set featherMixLuckItemNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._165104137featherMixLuckItemNum;
            if (_local_2 !== _arg_1)
            {
                this._165104137featherMixLuckItemNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherMixLuckItemNum", _local_2, _arg_1));
            };
        }

        public function __feather7_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(7);
        }

        private function joinEquChange(_arg_1:Event):void
        {
            var _local_3:Object;
            var _local_2:Object = {};
            _local_2.main = joinMain.slotData;
            _local_2.wing1 = joinWing1.slotData;
            _local_2.wing2 = joinWing2.slotData;
            _local_2.wing3 = joinWing3.slotData;
            _local_2.wing4 = joinWing4.slotData;
            if (!checkWingData(_local_2))
            {
                return;
            };
            if (joinMain.slotData)
            {
                _local_3 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][joinMain.slotData.itemId];
                if (_local_3)
                {
                    if (ToolKit.isBigOrEqual(_local_3.color, GamePredef.WING_MAX_COLOR_LEVEL))
                    {
                        joinInfo.htmlText = Language.WING_PANEL_U[17];
                    };
                };
                if (((((joinWing1.slotData) && (joinWing2.slotData)) && (joinWing3.slotData)) && (joinWing4.slotData)))
                {
                    joinButton.enabled = true;
                    setNextWingsPreview(_local_2);
                    return;
                };
            };
            joinButton.enabled = false;
        }

        public function set mixedFeather(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._380498984mixedFeather;
            if (_local_2 !== _arg_1)
            {
                this._380498984mixedFeather = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mixedFeather", _local_2, _arg_1));
            };
        }

        public function set feather3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058704feather3;
            if (_local_2 !== _arg_1)
            {
                this._291058704feather3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather3", _local_2, _arg_1));
            };
        }

        public function set growBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._506858504growBtn1;
            if (_local_2 !== _arg_1)
            {
                this._506858504growBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "growBtn1", _local_2, _arg_1));
            };
        }

        public function __mixLuckyItem_click(_arg_1:MouseEvent):void
        {
            mixLuckyItem.clean();
            setMixRate();
        }

        public function set growBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._506858505growBtn2;
            if (_local_2 !== _arg_1)
            {
                this._506858505growBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "growBtn2", _local_2, _arg_1));
            };
        }

        public function set holeItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._515144717holeItem;
            if (_local_2 !== _arg_1)
            {
                this._515144717holeItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeItem", _local_2, _arg_1));
            };
        }

        public function set wingExp(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1349542418wingExp;
            if (_local_2 !== _arg_1)
            {
                this._1349542418wingExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingExp", _local_2, _arg_1));
            };
        }

        public function set feather9(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058698feather9;
            if (_local_2 !== _arg_1)
            {
                this._291058698feather9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather9", _local_2, _arg_1));
            };
        }

        public function set starInfo(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1315530272starInfo;
            if (_local_2 !== _arg_1)
            {
                this._1315530272starInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get holeMoney():Label
        {
            return (this._1213936608holeMoney);
        }

        [Bindable(event="propertyChange")]
        public function get holeButton():BasicGlowButton
        {
            return (this._1331857390holeButton);
        }

        public function set holeItemRequire(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1651487246holeItemRequire;
            if (_local_2 !== _arg_1)
            {
                this._1651487246holeItemRequire = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeItemRequire", _local_2, _arg_1));
            };
        }

        private function featherSetEquChange(_arg_1:GameEvent):void
        {
            var _local_2:Object;
            if (featherSetMain.slotData)
            {
                _local_2 = _core.getTemplateData(featherSetMain.slotData.type, featherSetMain.slotData.itemId, false);
                if (_local_2)
                {
                    if (ToolKit.isEqual(_local_2.kind, GamePredef.ITEM_KIND_WING))
                    {
                        _core.remote.call("getFeatherData", new Responder(onFeatherData), featherSetMain.slotData.id);
                        return;
                    };
                };
            };
            featherSetMain.clean();
        }

        [Bindable(event="propertyChange")]
        public function get nextLevel():BasicTxtButton
        {
            return (this._1199243345nextLevel);
        }

        public function __joinButton_click(_arg_1:MouseEvent):void
        {
            subWingJoin();
        }

        public function set starAllButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._360588801starAllButton;
            if (_local_2 !== _arg_1)
            {
                this._360588801starAllButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starAllButton", _local_2, _arg_1));
            };
        }

        private function starViewClear():void
        {
            starMain.clean();
            starItem.clean();
            starInfo.label = "";
            starRateInfo.label = "";
            _starNum = NaN;
        }

        public function set funcBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1379459640funcBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1379459640funcBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funcBtn0", _local_2, _arg_1));
            };
        }

        public function __featherSetButton_click(_arg_1:MouseEvent):void
        {
            subFeatherSet();
        }

        public function set wTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._807279583wTitle;
            if (_local_2 !== _arg_1)
            {
                this._807279583wTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wTitle", _local_2, _arg_1));
            };
        }

        public function ___WingFuncPanel_Canvas9_creationComplete(_arg_1:FlexEvent):void
        {
            initMixFormularList();
        }

        [Bindable(event="propertyChange")]
        public function get prefixButton():BasicGlowButton
        {
            return (this._27520924prefixButton);
        }

        [Bindable(event="propertyChange")]
        public function get prefixItemNumTip():Label
        {
            return (this._1327811494prefixItemNumTip);
        }

        public function set bindItemNumTip(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1478570939bindItemNumTip;
            if (_local_2 !== _arg_1)
            {
                this._1478570939bindItemNumTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bindItemNumTip", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextLife():BasicTxtButton
        {
            return (this._1424161935nextLife);
        }

        public function set curFeatherProp(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1334416454curFeatherProp;
            if (_local_2 !== _arg_1)
            {
                this._1334416454curFeatherProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curFeatherProp", _local_2, _arg_1));
            };
        }

        public function set mixFormular(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._934857288mixFormular;
            if (_local_2 !== _arg_1)
            {
                this._934857288mixFormular = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mixFormular", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get starItem():ItemSlot
        {
            return (this._1315536005starItem);
        }

        private function joinViewClear():void
        {
            joinMain.clean();
            wingPreview5.clean();
            var _local_1:int = 1;
            while (_local_1 <= 4)
            {
                this[("joinWing" + _local_1)].clean();
                this[("wingPreview" + _local_1)].clean();
                _local_1++;
            };
            joinInfo.htmlText = "";
        }

        public function set funcBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1379459641funcBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1379459641funcBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funcBtn1", _local_2, _arg_1));
            };
        }

        public function __funcBtn0_click(_arg_1:MouseEvent):void
        {
            changePreView(-1);
        }

        public function set starRateInfo(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1615024608starRateInfo;
            if (_local_2 !== _arg_1)
            {
                this._1615024608starRateInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starRateInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mixButton():BasicGlowButton
        {
            return (this._5143378mixButton);
        }

        private function featherSetViewClear():void
        {
            featherSetMain.clean();
            var _local_1:int = 1;
            while (_local_1 <= 10)
            {
                this[("feather" + _local_1)].clean();
                this[("feather" + _local_1)].enabled = false;
                _local_1++;
            };
        }

        public function setStarInfo():void
        {
            var _local_1:int;
            var _local_2:Object;
            var _local_3:Object;
            if (((!(isNaN(_starNum))) && (starMain.slotData)))
            {
                if (ToolKit.isBigOrEqual(_starNum, GamePredef.EQUIPT_STAR_MAX))
                {
                    starInfo.label = Language.EQUIPTFUNCPANEL_S[3];
                    starOneButton.enabled = false;
                    starAllButton.enabled = false;
                }
                else
                {
                    _local_1 = int(int(((GamePredef.EQUIPT_STAR_SUCCESS[ToolKit.add(_starNum, 1)] * starNumBasic.value) / 5)));
                    if (_core.MC_BIRTH_FLAG[8])
                    {
                        _local_1 = int(int(((GamePredef.MC_BIRTH_CONFIG[8][ToolKit.add(_starNum, 1)] * starNumBasic.value) / 5)));
                    };
                    _local_2 = _core.view.getUI(ViewManager.MAIN_LONGBUFF);
                    if (((_local_2) && (_local_2.isBuffOn(3263))))
                    {
                        _local_1 = int(int(((GamePredef.EQUIPT_STAR_SUCCESS_BUFF[ToolKit.add(_starNum, 1)] * starNumBasic.value) / 5)));
                    };
                    starInfo.label = _starNum.toString();
                    starRateInfo.label = (_local_1.toString() + "%");
                    starOneButton.enabled = false;
                    starAllButton.enabled = false;
                    if (starItem.slotData)
                    {
                        _local_3 = _core.getTemplateData(starItem.slotData.type, starItem.slotData.itemId, false);
                        if ((((_local_3) && (ToolKit.isEqual(_local_3.id, GamePredef.WING_STAR_ITEM_ID))) && (ToolKit.isBigOrEqual(starItem.slotData.stackNum, starNumBasic.value))))
                        {
                            starOneButton.enabled = true;
                            starAllButton.enabled = true;
                        };
                    };
                };
            };
        }

        public function __wingFuncList_creationComplete(_arg_1:FlexEvent):void
        {
            wingFuncList.selectedIndex = 0;
        }

        public function set nextLevel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1199243345nextLevel;
            if (_local_2 !== _arg_1)
            {
                this._1199243345nextLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevel", _local_2, _arg_1));
            };
        }

        public function __featherUpButtonOne_click(_arg_1:MouseEvent):void
        {
            subFeatherUp(true);
        }

        [Bindable(event="propertyChange")]
        public function get starNumBasic():NumericStepper
        {
            return (this._341865658starNumBasic);
        }

        [Bindable(event="propertyChange")]
        public function get holeItem():ItemSlot
        {
            return (this._515144717holeItem);
        }

        public function set prefixButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._27520924prefixButton;
            if (_local_2 !== _arg_1)
            {
                this._27520924prefixButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prefixButton", _local_2, _arg_1));
            };
        }

        public function __feather4_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(4);
        }

        public function set bindItemRequire(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._210599509bindItemRequire;
            if (_local_2 !== _arg_1)
            {
                this._210599509bindItemRequire = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bindItemRequire", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherSetButton():BasicGlowButton
        {
            return (this._550657233featherSetButton);
        }

        public function __changeViewBox_change(_arg_1:Event):void
        {
            changeWingView();
        }

        private function subWingPrefix():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Number;
            if (((prefixMain.slotData) && (prefixItem.slotData)))
            {
                _local_1 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][prefixMain.slotData.itemId];
                _local_2 = _core.getTemplateData(prefixMain.slotData.type, prefixMain.slotData.itemId, false);
                _local_3 = _core.getTemplateData(prefixItem.slotData.type, prefixItem.slotData.itemId, false);
                if ((((_local_1) && (_local_2)) && (_local_3)))
                {
                    if (ToolKit.isEqual(_local_1.binded, 1))
                    {
                        _local_4 = GamePredef.WING_PREFIX_ITEM_NUM[_local_1.color];
                        if ((((ToolKit.isEqual(_local_3.id, GamePredef.WING_PREFIX_ITEM_ID)) && (_local_4)) && (ToolKit.isBigOrEqual(prefixItem.slotData.stackNum, _local_4))))
                        {
                            if (_core.player.enoughMoneyAuto(1, Number(prefixMoney.text)))
                            {
                                prefixButton.enabled = false;
                                _core.remote.call("changeWingPrefix", new Responder(onWingPrefix), {
                                    "e":prefixMain.slotData.id,
                                    "i":prefixItem.slotData.id
                                });
                            }
                            else
                            {
                                _core.sysMidNote(Language.WING_PANEL_U[30]);
                            };
                        };
                    }
                    else
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[39]);
                    };
                };
            };
        }

        public function onChangeWingView(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!_arg_1.flag)
            {
                return;
            };
            if (_arg_1.newResCode)
            {
                curRescode = _arg_1.newResCode;
                previewCanvas.wingResCode = _arg_1.newResCode;
            };
        }

        public function set prefixItemNumTip(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1327811494prefixItemNumTip;
            if (_local_2 !== _arg_1)
            {
                this._1327811494prefixItemNumTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prefixItemNumTip", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherUpButtonOne():BasicGlowButton
        {
            return (this._1710253270featherUpButtonOne);
        }

        public function set featherUpRateInfo(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._631614868featherUpRateInfo;
            if (_local_2 !== _arg_1)
            {
                this._631614868featherUpRateInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherUpRateInfo", _local_2, _arg_1));
            };
        }

        public function set joinMain(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1401966077joinMain;
            if (_local_2 !== _arg_1)
            {
                this._1401966077joinMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinMain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prefixItemRequire():ItemSlot
        {
            return (this._589175008prefixItemRequire);
        }

        [Bindable(event="propertyChange")]
        public function get bindItem():ItemSlot
        {
            return (this._939175152bindItem);
        }

        private function switchVS(_arg_1:Number):void
        {
            deActiveView(tab.selectedIndex);
            tab.selectedIndex = _arg_1;
            selectedIndex = _arg_1;
            tabPageUpdate();
        }

        [Bindable(event="propertyChange")]
        public function get prefixItem():ItemSlot
        {
            return (this._1340602171prefixItem);
        }

        public function set nextMagic(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1200033402nextMagic;
            if (_local_2 !== _arg_1)
            {
                this._1200033402nextMagic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextMagic", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selectCrit():CheckBox
        {
            return (this._1656453898selectCrit);
        }

        public function set joinWing2(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._501797251joinWing2;
            if (_local_2 !== _arg_1)
            {
                this._501797251joinWing2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinWing2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get joinInfo():Label
        {
            return (this._1402072840joinInfo);
        }

        private function onSureChangeWingPrefix(_arg_1:Object):void
        {
            prefixButton.enabled = true;
            if (_arg_1)
            {
                if (_arg_1.f == "sure")
                {
                    _core.sysMidNote(Language.WING_PANEL_U[36]);
                    _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.i] = _arg_1.n;
                    if (ToolKit.isEqual(prefixMain.slotData.id, _arg_1.e))
                    {
                        prefixMain.giid = _arg_1.i;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get joinButton():BasicGlowButton
        {
            return (this._1034217724joinButton);
        }

        public function set joinWing4(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._501797249joinWing4;
            if (_local_2 !== _arg_1)
            {
                this._501797249joinWing4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinWing4", _local_2, _arg_1));
            };
        }

        public function set joinWing1(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._501797252joinWing1;
            if (_local_2 !== _arg_1)
            {
                this._501797252joinWing1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinWing1", _local_2, _arg_1));
            };
        }

        public function set starItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1315536005starItem;
            if (_local_2 !== _arg_1)
            {
                this._1315536005starItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherUpLuckItemNum():NumericStepper
        {
            return (this._774447364featherUpLuckItemNum);
        }

        [Bindable(event="propertyChange")]
        public function get holeItemNumTip():Label
        {
            return (this._262477064holeItemNumTip);
        }

        public function set formularList(_arg_1:List):void
        {
            var _local_2:Object;
            _local_2 = this._12860042formularList;
            if (_local_2 !== _arg_1)
            {
                this._12860042formularList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "formularList", _local_2, _arg_1));
            };
        }

        private function init():void
        {
        }

        private function subFeatherMix():void
        {
            var formularIns:Object;
            var formularTemp:Object;
            var needsAlert:Boolean;
            var needsAlert1:Boolean;
            var featherSids:Object;
            var i:int;
            var luckySid:Number;
            var luckyItemId:Number;
            var luckyItemIns:* = undefined;
            var luckyBinded:int;
            var func1:Function;
            var func:Function;
            var putItemIns:Object;
            var putItemTemp:Object;
            var e:CloseEvent;
            if (mixFormular.slotData)
            {
                if (mixFormular.tempBagFlag)
                {
                    formularIns = {"binded":mixFormular.slotData.b};
                    formularTemp = _core.getTemplateData(mixFormular.slotData.ti, mixFormular.slotData.ii, false);
                }
                else
                {
                    formularIns = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][mixFormular.slotData.itemId];
                    formularTemp = _core.getTemplateData(mixFormular.slotData.type, mixFormular.slotData.itemId, false);
                };
                if (((formularIns) && (formularTemp)))
                {
                    needsAlert = false;
                    needsAlert1 = true;
                    featherSids = {};
                    if (Number(formularIns.binded))
                    {
                        needsAlert1 = false;
                    };
                    i = 1;
                    for (;i <= 2;(i = (i + 1)))
                    {
                        if (ToolKit.isBigThan(formularTemp[("i" + i)], 0))
                        {
                            if (this[("MixItem" + i)].slotData)
                            {
                                if (this[("MixItem" + i)].tempBagFlag)
                                {
                                    putItemIns = {"binded":this[("MixItem" + i)].slotData.b};
                                    putItemTemp = _core.getTemplateData(this[("MixItem" + i)].slotData.ti, this[("MixItem" + i)].slotData.ii, false);
                                }
                                else
                                {
                                    putItemIns = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][this[("MixItem" + i)].slotData.itemId];
                                    putItemTemp = _core.getTemplateData(this[("MixItem" + i)].slotData.type, this[("MixItem" + i)].slotData.itemId, false);
                                };
                                if ((((putItemIns) && (putItemTemp)) && (ToolKit.isEqual(putItemTemp.id, formularTemp[("i" + i)]))))
                                {
                                    if (((!(needsAlert)) && (ToolKit.add(formularIns.binded, putItemIns.binded) == 1)))
                                    {
                                        needsAlert = true;
                                    };
                                    if (Number(putItemIns.binded))
                                    {
                                        needsAlert1 = false;
                                    };
                                    featherSids[i] = {
                                        "idx":this[("MixItem" + i)].slotData.id,
                                        "flag":this[("MixItem" + i)].tempBagFlag
                                    };
                                    continue;
                                };
                            };
                            return;
                        };
                    };
                    luckySid = -1;
                    luckyItemId = -1;
                    if (mixLuckyItem.slotData)
                    {
                        luckySid = mixLuckyItem.slotData.id;
                        luckyItemId = mixLuckyItem.slotData.itemId;
                    };
                    luckyItemIns = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][luckyItemId];
                    luckyBinded = 0;
                    if (((luckyItemIns) && (Number(luckyItemIns.binded))))
                    {
                        luckyBinded = 1;
                    };
                    func1 = function (_arg_1:CloseEvent):void
                    {
                        var _local_2:Object;
                        if (_arg_1.detail == Alert.YES)
                        {
                            _local_2 = {
                                "idx":mixFormular.slotData.id,
                                "flag":mixFormular.tempBagFlag
                            };
                            _core.remote.call("featherMix", new Responder(onFeatherMix), _local_2, featherSids, luckySid, featherMixLuckItemNum.value, luckyBinded);
                        };
                    };
                    func = function (_arg_1:CloseEvent):void
                    {
                        var _local_2:Object;
                        if (_arg_1.detail == Alert.YES)
                        {
                            _local_2 = {
                                "idx":mixFormular.slotData.id,
                                "flag":mixFormular.tempBagFlag
                            };
                            _core.remote.call("featherMix", new Responder(onFeatherMix), _local_2, featherSids, luckySid, featherMixLuckItemNum.value, luckyBinded);
                        };
                    };
                    if (needsAlert)
                    {
                        Alert.show(Language.WING_PANEL_U[93], "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        if ((((luckyItemIns) && (Number(luckyItemIns.binded))) && (needsAlert1)))
                        {
                            Alert.show(Language.WING_PANEL_U[145], "", (Alert.YES | Alert.NO), null, func1);
                        }
                        else
                        {
                            e = new CloseEvent("");
                            e.detail = Alert.YES;
                            (func(e));
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextSpeed():BasicTxtButton
        {
            return (this._1206019348nextSpeed);
        }

        private function formularListClick():void
        {
            var _local_2:Object;
            var _local_3:int;
            featherMixViewClear();
            var _local_1:Object = formularList.selectedItem;
            if (_local_1)
            {
                _local_2 = _local_1.data;
                reqmixFormular.type = GamePredef.TBL_ITEM_TEMPLATE;
                reqmixFormular.giid = _local_2.id;
                mixedFeather.type = GamePredef.TBL_ITEM_TEMPLATE;
                mixedFeather.giid = _local_2.nextJewelTid;
                _local_3 = 1;
                while (_local_3 <= 2)
                {
                    if (ToolKit.isBigThan(_local_2[("i" + _local_3)], 0))
                    {
                        this[("reqMixItem" + _local_3)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("reqMixItem" + _local_3)].giid = _local_2[("i" + _local_3)];
                        this[("reqMixItem" + _local_3)].stackNum = _local_2[("n" + _local_3)];
                    };
                    _local_3++;
                };
                setMixRate();
                featherMixAutoPutBtn.enabled = true;
            };
        }

        public function changeWingView():void
        {
            if (changeViewBox.selected)
            {
                _core.remote.call("changeWingRes", new Responder(onChangeWingView), currentIndex);
            };
        }

        [Bindable(event="propertyChange")]
        public function get curLevel():BasicTxtButton
        {
            return (this._540315940curLevel);
        }

        public function set nextLife(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1424161935nextLife;
            if (_local_2 !== _arg_1)
            {
                this._1424161935nextLife = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLife", _local_2, _arg_1));
            };
        }

        public function set bindMoney(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._946787709bindMoney;
            if (_local_2 !== _arg_1)
            {
                this._946787709bindMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bindMoney", _local_2, _arg_1));
            };
        }

        public function set joinWing3(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._501797250joinWing3;
            if (_local_2 !== _arg_1)
            {
                this._501797250joinWing3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinWing3", _local_2, _arg_1));
            };
        }

        public function set wingPreview3(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._60395882wingPreview3;
            if (_local_2 !== _arg_1)
            {
                this._60395882wingPreview3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingPreview3", _local_2, _arg_1));
            };
        }

        public function set wingPreview4(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._60395881wingPreview4;
            if (_local_2 !== _arg_1)
            {
                this._60395881wingPreview4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingPreview4", _local_2, _arg_1));
            };
        }

        public function set wingPreview1(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._60395884wingPreview1;
            if (_local_2 !== _arg_1)
            {
                this._60395884wingPreview1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingPreview1", _local_2, _arg_1));
            };
        }

        public function set wingPreview5(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._60395880wingPreview5;
            if (_local_2 !== _arg_1)
            {
                this._60395880wingPreview5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingPreview5", _local_2, _arg_1));
            };
        }

        public function set wingPreview2(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._60395883wingPreview2;
            if (_local_2 !== _arg_1)
            {
                this._60395883wingPreview2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingPreview2", _local_2, _arg_1));
            };
        }

        public function set holeMain(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._515043687holeMain;
            if (_local_2 !== _arg_1)
            {
                this._515043687holeMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeMain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get reqMixItem1():ItemSlot
        {
            return (this._483423936reqMixItem1);
        }

        [Bindable(event="propertyChange")]
        public function get reqMixItem2():ItemSlot
        {
            return (this._483423935reqMixItem2);
        }

        public function set MixItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1037480286MixItem1;
            if (_local_2 !== _arg_1)
            {
                this._1037480286MixItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MixItem1", _local_2, _arg_1));
            };
        }

        public function __feather1_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(1);
        }

        private function subWingBind():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Number;
            if (((bindMain.slotData) && (bindItem.slotData)))
            {
                _local_1 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][bindMain.slotData.itemId];
                _local_2 = _core.getTemplateData(bindMain.slotData.type, bindMain.slotData.itemId, false);
                _local_3 = _core.getTemplateData(bindItem.slotData.type, bindItem.slotData.itemId, false);
                if ((((_local_1) && (_local_2)) && (_local_3)))
                {
                    if (ToolKit.isEqual(_local_1.binded, 1))
                    {
                        _local_4 = GamePredef.WING_BIND_ITEM_NUM;
                        if ((((ToolKit.isEqual(_local_3.id, GamePredef.WING_BIND_ITEM_ID)) && (_local_4)) && (ToolKit.isBigOrEqual(bindItem.slotData.stackNum, _local_4))))
                        {
                            if (_core.player.enoughMoneyAuto(1, Number(bindMoney.text)))
                            {
                                bindButton.enabled = false;
                                _core.remote.call("changeWingBind", new Responder(onWingBind), bindMain.slotData.id, bindItem.slotData.id);
                            }
                            else
                            {
                                _core.sysMidNote(Language.WING_PANEL_U[30]);
                            };
                        };
                    }
                    else
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[39]);
                    };
                };
            };
        }

        public function set MixItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1037480285MixItem2;
            if (_local_2 !== _arg_1)
            {
                this._1037480285MixItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MixItem2", _local_2, _arg_1));
            };
        }

        public function __feather9_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(9);
        }

        [Bindable(event="propertyChange")]
        public function get itemInBag():ItemSlot
        {
            return (this._2133274960itemInBag);
        }

        public function set wingFuncList(_arg_1:List):void
        {
            var _local_2:Object;
            _local_2 = this._1701830995wingFuncList;
            if (_local_2 !== _arg_1)
            {
                this._1701830995wingFuncList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingFuncList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get curLife():BasicTxtButton
        {
            return (this._1125811548curLife);
        }

        [Bindable(event="propertyChange")]
        public function get prefixMoney():Label
        {
            return (this._1394559310prefixMoney);
        }

        public function set mixButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._5143378mixButton;
            if (_local_2 !== _arg_1)
            {
                this._5143378mixButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mixButton", _local_2, _arg_1));
            };
        }

        public function sureBuyCritItem(_arg_1:Boolean):void
        {
            var _local_3:NumPanel;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            if (_local_2.goldLockFlag)
            {
                _local_2.goldLockFlag = false;
            };
            _local_3 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
            _local_3.parent = this;
            _local_3.showSelected(itemByBuy, null, 0, onBuyItem);
            _local_3.closeWith(this);
        }

        public function funcBagClickHandler(_arg_1:GameEvent):void
        {
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:String;
            var _local_6:Object;
            var _local_7:ItemSlot;
            var _local_2:Object = _arg_1.currentTarget.slotData;
            if (_local_2)
            {
                if (ToolKit.isEqual(_arg_1.currentTarget.type, GamePredef.TBL_PET))
                {
                    _local_3 = _core.getTemplateData(GamePredef.TBL_CREATURE, _local_2.tid);
                }
                else
                {
                    _local_4 = Number(_local_2.sid);
                    _local_3 = _core.getTemplateData(_local_2.type, _local_2.itemId);
                };
                if (_local_3)
                {
                    for (_local_5 in autoMatchSlots)
                    {
                        _local_6 = autoMatchSlots[_local_5];
                        _local_7 = _local_6.slot;
                        if (((tab.selectedIndex == 0) || (tab.selectedIndex == 6)))
                        {
                            if (_local_7.giid > 0) continue;
                        };
                        if (!((_local_6.id) && (!(ToolKit.isEqual(_local_3.id, _local_6.id)))))
                        {
                            if (!((_local_6.itemType) && (!(ToolKit.isEqual(_local_6.itemType, _local_2.type)))))
                            {
                                if (!((_local_6.kind) && (!(ToolKit.isEqual(_local_6.kind, _local_3.kind)))))
                                {
                                    if (!((_local_6.type) && (!(ToolKit.isEqual(_local_6.type, _local_3.type)))))
                                    {
                                        updatePanelSlot(_local_7, _arg_1.currentTarget);
                                        return;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get advanceJoinEnable():Boolean
        {
            return (this._1696059025advanceJoinEnable);
        }

        public function set starNumBasic(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._341865658starNumBasic;
            if (_local_2 !== _arg_1)
            {
                this._341865658starNumBasic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starNumBasic", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherUpMain():ItemSlot
        {
            return (this._1967214217featherUpMain);
        }

        private function holeEquChange(_arg_1:GameEvent):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:Number;
            var _local_9:Object;
            var _local_10:Object;
            if (holeMain.slotData)
            {
                _local_2 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][holeMain.slotData.itemId];
                _local_3 = _core.getTemplateData(holeMain.slotData.type, holeMain.slotData.itemId, false);
                if (((_local_3) && (_local_2)))
                {
                    _local_4 = GamePredef.WING_HOLE_COLOR_HOLE_MAP[_local_2.color];
                    if (((!(_local_4)) || (ToolKit.isBigOrEqual(_local_2.holeNum, _local_4))))
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[52]);
                        holeButton.enabled = false;
                        return;
                    };
                    _local_5 = int(((int(int((_local_2.holeNum / 10)))) || (0)));
                    _local_6 = ((int((_local_2.holeNum % 10))) || (0));
                    _local_7 = true;
                    _local_8 = GamePredef.WING_HOLE_ITEM_NUM[_local_5];
                    if (_local_5 > _local_6)
                    {
                        _local_7 = false;
                        _local_8 = GamePredef.WING_HOLE_ITEM_NUM[_local_6];
                    };
                    if (_local_8)
                    {
                        holeItemNumTip.htmlText = Language.WING_PANEL_U[40].replace("{num}", _local_8);
                        holeItemRequire.type = GamePredef.TBL_ITEM_TEMPLATE;
                        holeItemRequire.giid = GamePredef.WING_HOLE_ITEM_ID;
                        holeItemRequire.stackNum = _local_8;
                        holeMoney.text = GamePredef.MONEY_EQUFUNC_ACTIVE.toString();
                        if (((holeItem.slotData) && (holeItem.slotData.type == GamePredef.TBL_ITEM_INSTANCE)))
                        {
                            _local_9 = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][holeItem.slotData.itemId];
                            _local_10 = _core.getTemplateData(holeItem.slotData.type, holeItem.slotData.itemId, false);
                            if (((_local_9) && (_local_10)))
                            {
                                if (((ToolKit.isEqual(_local_10.id, GamePredef.WING_HOLE_ITEM_ID)) && (ToolKit.isBigOrEqual(holeItem.slotData.stackNum, _local_8))))
                                {
                                    holeButton.enabled = true;
                                    return;
                                };
                            };
                        };
                    };
                };
            };
            holeButton.enabled = false;
        }

        [Bindable(event="propertyChange")]
        public function get nextPhy():BasicTxtButton
        {
            return (this._1847059854nextPhy);
        }

        public function set prefixItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1340602171prefixItem;
            if (_local_2 !== _arg_1)
            {
                this._1340602171prefixItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prefixItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get introText1():IntroText
        {
            return (this._1246703000introText1);
        }

        [Bindable(event="propertyChange")]
        public function get introText2():IntroText
        {
            return (this._1246703001introText2);
        }

        public function __feather10_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(10);
        }

        [Bindable(event="propertyChange")]
        public function get introText4():IntroText
        {
            return (this._1246703003introText4);
        }

        [Bindable(event="propertyChange")]
        public function get introText5():IntroText
        {
            return (this._1246703004introText5);
        }

        [Bindable(event="propertyChange")]
        public function get introText8():IntroText
        {
            return (this._1246703007introText8);
        }

        [Bindable(event="propertyChange")]
        public function get introText3():IntroText
        {
            return (this._1246703002introText3);
        }

        public function __wingFuncList_change(_arg_1:ListEvent):void
        {
            switchVS(wingFuncList.selectedIndex);
        }

        [Bindable(event="propertyChange")]
        public function get introText6():IntroText
        {
            return (this._1246703005introText6);
        }

        public function set featherSetButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._550657233featherSetButton;
            if (_local_2 !== _arg_1)
            {
                this._550657233featherSetButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherSetButton", _local_2, _arg_1));
            };
        }

        private function featherUpViewClear():void
        {
            featherUpMain.clean();
            featherUpItem.clean();
            curFeatherProp.text = "";
        }

        private function featherSetDropAlert(_arg_1:DragEvent):void
        {
            var _local_2:ItemSlot;
            if (((_arg_1.dragSource.hasFormat("slot")) && (featherSetMain.slotData)))
            {
                _arg_1.stopImmediatePropagation();
                _local_2 = ItemSlot(_arg_1.currentTarget);
                if (ToolKit.isBigThan(_local_2.giid, 0))
                {
                    _core.sysBlueMsg(Language.WING_PANEL_U[101]);
                    return;
                };
                _local_2.dragDropHandler(_arg_1);
            };
        }

        private function autoPutFeatherMix():void
        {
            var slotArr:Array;
            var i:String;
            var luckItemObj:Object;
            var func:Function;
            var itemObj:Object;
            var event:DragEvent;
            var ds:DragSource;
            var iSlot:ISlot;
            if (formularList.selectedItem)
            {
                slotArr = ["mixFormular", "MixItem1", "MixItem2"];
                for each (i in slotArr)
                {
                    if (this[("req" + i)].giid > 0)
                    {
                        itemObj = _core.getItemNumNew(GamePredef.TBL_ITEM_TEMPLATE, this[("req" + i)].giid);
                        if (itemObj.num > 0)
                        {
                            event = new DragEvent(DragEvent.DRAG_DROP);
                            ds = new DragSource();
                            iSlot = _core.view.getSlot(itemObj.slot.sid);
                            if (iSlot)
                            {
                                ds.addData(iSlot, "slot");
                                event.dragSource = ds;
                                this[i].dispatchEvent(event);
                            };
                        };
                    };
                };
                luckItemObj = _core.getItemNumNew(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.FEATHER_LUCKY_ID2);
                func = function (_arg_1:CloseEvent):void
                {
                    var _local_2:DragEvent;
                    var _local_3:DragSource;
                    var _local_4:ISlot;
                    if (_arg_1.detail == Alert.YES)
                    {
                        _local_2 = new DragEvent(DragEvent.DRAG_DROP);
                        _local_3 = new DragSource();
                        _local_4 = _core.view.getSlot(luckItemObj.slot.sid);
                        if (_local_4)
                        {
                            _local_3.addData(_local_4, "slot");
                            _local_2.dragSource = _local_3;
                            mixLuckyItem.dispatchEvent(_local_2);
                        };
                    };
                };
                if (luckItemObj.num > 0)
                {
                    Alert.show("Bạn có muốn tự động đặt Lông Vũ Chúc Phúc Cao Cấp không?", null, (Alert.YES | Alert.NO), null, func);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherDelButton():BasicGlowButton
        {
            return (this._912391750featherDelButton);
        }

        private function onWingPrefix(data:Object):void
        {
            var slot:ISlot;
            var oldequData:Object;
            var yesAlert:String;
            var noAlert:String;
            var func:Function;
            var title:String;
            var contentMsg:String;
            var rate:* = undefined;
            var newequData:Object;
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (data)
            {
                if (data.f)
                {
                    slot = _core.view.getSlot(data.sid);
                    if (slot)
                    {
                        slot.giid = data.i;
                    };
                    if (!data.saveType)
                    {
                        if (((ToolKit.isEqual(prefixItem.slotData.id, data.ii)) && (data.inum > 0)))
                        {
                            prefixItem.stackNum = data.inum;
                        }
                        else
                        {
                            prefixItem.clean();
                        };
                    };
                    oldequData = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][data.i];
                    yesAlert = Alert.yesLabel;
                    noAlert = Alert.noLabel;
                    func = function (_arg_1:CloseEvent):void
                    {
                        Alert.yesLabel = yesAlert;
                        Alert.noLabel = noAlert;
                        if (_arg_1.detail == Alert.YES)
                        {
                            if (!data.saveType)
                            {
                                _core.remote.nc.call("sureChangeWingPrefix", new Responder(onSureChangeWingPrefix), 1);
                            }
                            else
                            {
                                _core.remote.nc.call("sureChangeWingPrefix", null, 1);
                            };
                        }
                        else
                        {
                            if (!data.saveType)
                            {
                                _core.remote.nc.call("sureChangeWingPrefix", new Responder(onSureChangeWingPrefix), -1);
                            }
                            else
                            {
                                _core.remote.nc.call("sureChangeWingPrefix", null, -1);
                            };
                        };
                    };
                    title = Language.WING_PANEL_U[113];
                    contentMsg = ((("<b>" + Language.WING_PANEL_U[113]) + "</b>") + "    \n");
                    rate = GamePredef.EQUIPT_STAR_NUM[oldequData.upgradeNum];
                    newequData = data.n;
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
                        contentMsg = ((((contentMsg + "\n") + "<font color='#FF11CC'>") + Language.BASICTOOLTIP_S[0]) + "</font>");
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
                }
                else
                {
                    prefixButton.enabled = true;
                    _core.sysMidNote(Language.WING_PANEL_U[37]);
                    prefixEquChange(null);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get introText():IntroText
        {
            return (this._871500217introText);
        }

        public function showWingChangeAlert(_arg_1:Object):void
        {
            switch (_arg_1.saveType)
            {
                case 2:
                    onWingBind(_arg_1);
                    break;
                case 5:
                    onWingPrefix(_arg_1);
                    break;
            };
            this.hide();
        }

        private function tabPageUpdate():void
        {
            var _local_1:int;
            var _local_2:int;
            if (selectedIndex)
            {
                _local_1 = selectedIndex;
            }
            else
            {
                _local_1 = 0;
            };
            autoMatchSlots = new Array();
            switch (_local_1)
            {
                case 0:
                    joinMain.addEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    joinViewClear();
                    joinWing1.addEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    joinWing2.addEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    joinWing3.addEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    joinWing4.addEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    autoMatchSlots.push({
                        "slot":joinMain,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    autoMatchSlots.push({
                        "slot":joinWing1,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    autoMatchSlots.push({
                        "slot":joinWing2,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    autoMatchSlots.push({
                        "slot":joinWing3,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    autoMatchSlots.push({
                        "slot":joinWing4,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    break;
                case 1:
                    prefixViewClear();
                    prefixMain.addEventListener(GameEvent.SLOT_GIID_CHANGE, prefixEquChange);
                    prefixItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, prefixEquChange);
                    autoMatchSlots.push({
                        "slot":prefixMain,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    autoMatchSlots.push({
                        "slot":prefixItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":GamePredef.WING_PREFIX_ITEM_ID
                    });
                    break;
                case 2:
                    bindViewClear();
                    bindMain.addEventListener(GameEvent.SLOT_GIID_CHANGE, bindEquChange);
                    bindItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, bindEquChange);
                    autoMatchSlots.push({
                        "slot":bindMain,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    autoMatchSlots.push({
                        "slot":bindItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":GamePredef.WING_BIND_ITEM_ID
                    });
                    break;
                case 3:
                    holeViewClear();
                    holeMain.addEventListener(GameEvent.SLOT_GIID_CHANGE, holeEquChange);
                    holeItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, holeEquChange);
                    autoMatchSlots.push({
                        "slot":holeMain,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    autoMatchSlots.push({
                        "slot":holeItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":GamePredef.WING_HOLE_ITEM_ID
                    });
                    break;
                case 4:
                    starViewClear();
                    starMain.addEventListener(GameEvent.SLOT_GIID_CHANGE, starEquChange);
                    starItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, starEquChange);
                    autoMatchSlots.push({
                        "slot":starMain,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    autoMatchSlots.push({
                        "slot":starItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":GamePredef.WING_STAR_ITEM_ID
                    });
                    break;
                case 5:
                    featherUpMain.addEventListener(GameEvent.SLOT_GIID_CHANGE, featherUpChange);
                    featherUpItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, featherUpChange);
                    featherUpViewClear();
                    autoMatchSlots.push({
                        "slot":featherUpMain,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_FEATHER
                    });
                    autoMatchSlots.push({
                        "slot":featherUpItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":GamePredef.FEATHER_LUCKY_ID
                    });
                    break;
                case 6:
                    featherSetMain.addEventListener(GameEvent.SLOT_GIID_CHANGE, featherSetEquChange);
                    autoMatchSlots.push({
                        "slot":featherSetMain,
                        "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_WING
                    });
                    _local_2 = 1;
                    while (_local_2 <= 10)
                    {
                        this[("feather" + _local_2)].addEventListener(GameEvent.SLOT_GIID_CHANGE, featherSetItemChange);
                        this[("feather" + _local_2)].addEventListener(DragEvent.DRAG_DROP, featherSetDropAlert, false, 1000);
                        autoMatchSlots.push({
                            "slot":this[("feather" + _local_2)],
                            "itemType":GamePredef.TBL_ITEM_INSTANCE,
                            "kind":GamePredef.ITEM_KIND_FEATHER
                        });
                        _local_2++;
                    };
                    featherSetViewClear();
                    break;
                case 7:
                    featherMixViewClear();
                    mixFormular.addEventListener(GameEvent.SLOT_GIID_CHANGE, featherMixChange);
                    mixLuckyItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, mixLuckyItemChange);
                    _local_2 = 1;
                    while (_local_2 <= 2)
                    {
                        this[("MixItem" + _local_2)].addEventListener(GameEvent.SLOT_GIID_CHANGE, featherMixChange);
                        autoMatchSlots.push({
                            "slot":this[("MixItem" + _local_2)],
                            "itemType":GamePredef.TBL_ITEM_INSTANCE,
                            "kind":GamePredef.ITEM_KIND_FEATHER
                        });
                        _local_2++;
                    };
                    autoMatchSlots.push({
                        "slot":mixFormular,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "kind":GamePredef.ITEM_KIND_FEATHER,
                        "type":GamePredef.ITEM_TYPE_FEATHER_MIX
                    });
                    autoMatchSlots.push({
                        "slot":mixLuckyItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "id":GamePredef.FEATHER_LUCKY_ID2
                    });
                    break;
                case 8:
                    initWingLevelUp();
                    break;
            };
            if (((wingBag) && (wingBag.visible)))
            {
                wingBagRefresh();
            };
        }

        public function set prefixItemRequire(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._589175008prefixItemRequire;
            if (_local_2 !== _arg_1)
            {
                this._589175008prefixItemRequire = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prefixItemRequire", _local_2, _arg_1));
            };
        }

        public function __growBtn2_click(_arg_1:MouseEvent):void
        {
            growWingExp(2);
        }

        private function subWingHole():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Boolean;
            var _local_7:Number;
            if (((holeMain.slotData) && (holeItem.slotData)))
            {
                _local_1 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][holeMain.slotData.itemId];
                _local_2 = _core.getTemplateData(holeMain.slotData.type, holeMain.slotData.itemId, false);
                _local_3 = _core.getTemplateData(holeItem.slotData.type, holeItem.slotData.itemId, false);
                if ((((_local_1) && (_local_2)) && (_local_3)))
                {
                    if (ToolKit.isEqual(_local_1.binded, 1))
                    {
                        _local_4 = int(((int(int((_local_1.holeNum / 10)))) || (0)));
                        _local_5 = ((int((_local_1.holeNum % 10))) || (0));
                        if (_local_4 > _local_5)
                        {
                            _local_6 = false;
                            _local_7 = GamePredef.WING_HOLE_ITEM_NUM[_local_5];
                        }
                        else
                        {
                            _local_6 = true;
                            _local_7 = GamePredef.WING_HOLE_ITEM_NUM[_local_4];
                        };
                        if ((((ToolKit.isEqual(_local_3.id, GamePredef.WING_HOLE_ITEM_ID)) && (_local_7)) && (ToolKit.isBigOrEqual(holeItem.slotData.stackNum, _local_7))))
                        {
                            if (_core.player.enoughMoneyAuto(1, Number(holeMoney.text)))
                            {
                                _core.remote.call("addWingHole", new Responder(onWingHole), holeMain.slotData.id, holeItem.slotData.id);
                            }
                            else
                            {
                                _core.sysMidNote(Language.WING_PANEL_U[30]);
                            };
                        };
                    }
                    else
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[39]);
                    };
                };
            };
        }

        public function __wTitle_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __feather6_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(6);
        }

        public function __prefixButton_click(_arg_1:MouseEvent):void
        {
            subWingPrefix();
        }

        [Bindable(event="propertyChange")]
        public function get bindButton():BasicGlowButton
        {
            return (this._405165519bindButton);
        }

        private function holeViewClear():void
        {
            holeMain.clean();
            holeItem.clean();
            holeItemRequire.clean();
            holeMoney.text = "";
            holeItemNumTip.text = "";
        }

        public function set featherUpButtonOne(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1710253270featherUpButtonOne;
            if (_local_2 !== _arg_1)
            {
                this._1710253270featherUpButtonOne = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherUpButtonOne", _local_2, _arg_1));
            };
        }

        public function set featherUpItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1967315247featherUpItem;
            if (_local_2 !== _arg_1)
            {
                this._1967315247featherUpItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherUpItem", _local_2, _arg_1));
            };
        }

        public function set maxBindProp(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1323287868maxBindProp;
            if (_local_2 !== _arg_1)
            {
                this._1323287868maxBindProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxBindProp", _local_2, _arg_1));
            };
        }

        public function __buyBtn_click(_arg_1:MouseEvent):void
        {
            buyItem();
        }

        public function set bindItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._939175152bindItem;
            if (_local_2 !== _arg_1)
            {
                this._939175152bindItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bindItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wingLabel():Label
        {
            return (this._164090455wingLabel);
        }

        private function onWingBind(data:Object):void
        {
            var wingTemp:Object;
            var showAlert:Boolean;
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
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (data)
            {
                if (data.f)
                {
                    showAlert = false;
                    if (!data.saveType)
                    {
                        if (((ToolKit.isEqual(bindItem.slotData.id, data.ii)) && (data.n > 0)))
                        {
                            bindItem.stackNum = data.n;
                        }
                        else
                        {
                            bindItem.clean();
                        };
                        if (bindMain.slotData)
                        {
                            showAlert = true;
                        };
                        wingTemp = _core.getTemplateData(bindMain.slotData.type, bindMain.slotData.itemId, false);
                    }
                    else
                    {
                        wingTemp = new Object();
                        wingTemp.mainProp1 = data.mainProp1;
                        wingTemp.mainProp2 = data.mainProp1;
                        showAlert = true;
                    };
                    if (showAlert)
                    {
                        yesAlert = Alert.yesLabel;
                        noAlert = Alert.noLabel;
                        func = function (_arg_1:CloseEvent):void
                        {
                            Alert.yesLabel = yesAlert;
                            Alert.noLabel = noAlert;
                            if (_arg_1.detail == Alert.YES)
                            {
                                if (!data.saveType)
                                {
                                    _core.remote.nc.call("sureChangeWingBind", new Responder(onSureChangeWingBind), 1);
                                }
                                else
                                {
                                    _core.remote.nc.call("sureChangeWingBind", null, 1);
                                };
                            }
                            else
                            {
                                if (!data.saveType)
                                {
                                    _core.remote.nc.call("sureChangeWingBind", new Responder(onSureChangeWingBind), -1);
                                }
                                else
                                {
                                    _core.remote.nc.call("sureChangeWingBind", null, -1);
                                };
                            };
                        };
                        title = Language.WING_PANEL_U[112];
                        contentMsg = ((("<b>" + Language.WING_PANEL_U[112]) + "</b>") + "    \n");
                        suffix1 = "";
                        suffix2 = "";
                        if (((Number(data.b1) < Number(data.b11)) && (ToolKit.isBigThan(Number(data.b11), 0))))
                        {
                            title = ("\n" + GamePredef.EQUIPT_PROP_NAME[wingTemp.mainProp1]);
                            color = "<font color='#00ff00'>";
                            suffix1 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[106]) + "</font>");
                        }
                        else
                        {
                            if (((Number(data.b1) > Number(data.b11)) && (ToolKit.isBigThan(Number(data.b11), 0))))
                            {
                                title = ("\n" + GamePredef.EQUIPT_PROP_NAME[wingTemp.mainProp1]);
                                color = "<font color='#ff0000'>";
                                suffix1 = (("<font color='#ff0000'>" + Language.EQUIPTFUNCPANEL_S[107]) + "</font>");
                            }
                            else
                            {
                                if (((Number(data.b1) == Number(data.b11)) && (ToolKit.isBigThan(Number(data.b11), 0))))
                                {
                                    title = ("\n" + GamePredef.EQUIPT_PROP_NAME[wingTemp.mainProp1]);
                                    color = "<font color='#00ff00'>";
                                    suffix1 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[108]) + "</font>");
                                };
                            };
                        };
                        if (((Number(data.b2) < Number(data.b12)) && (ToolKit.isBigThan(Number(data.b12), 0))))
                        {
                            title1 = ("\n" + GamePredef.EQUIPT_PROP_NAME[wingTemp.mainProp2]);
                            color1 = "<font color='#00ff00'>";
                            suffix2 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[106]) + "</font>");
                        }
                        else
                        {
                            if (((Number(data.b2) > Number(data.b12)) && (ToolKit.isBigThan(Number(data.b12), 0))))
                            {
                                title1 = ("\n" + GamePredef.EQUIPT_PROP_NAME[wingTemp.mainProp2]);
                                color1 = "<font color='#ff0000'>";
                                suffix2 = (("<font color='#ff0000'>" + Language.EQUIPTFUNCPANEL_S[107]) + "</font>");
                            }
                            else
                            {
                                if (((Number(data.b2) == Number(data.b12)) && (ToolKit.isBigThan(Number(data.b12), 0))))
                                {
                                    title1 = ("\n" + GamePredef.EQUIPT_PROP_NAME[wingTemp.mainProp2]);
                                    color1 = "<font color='#00ff00'>";
                                    suffix2 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[108]) + "</font>");
                                };
                            };
                        };
                        if (ToolKit.isBigThan(Number(data.b11), 0))
                        {
                            contentMsg = (contentMsg + ((((((((title + ": ") + data.b1) + "%") + Language.EQUIPTFUNCPANEL_S[129]) + color) + data.b11) + "%</font>") + suffix1));
                        }
                        else
                        {
                            if (((ToolKit.isEqual(Number(data.b11), 0)) && (ToolKit.isBigThan(Number(data.b1), 0))))
                            {
                                contentMsg = (contentMsg + (((((((((((("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[wingTemp.mainProp1]) + ": ") + data.b1) + "%") + Language.EQUIPTFUNCPANEL_S[129]) + "<font color='#00ff00'>") + data.b1) + "%</font>") + "<font color='#00ff00'>") + Language.EQUIPTFUNCPANEL_S[106]) + "</font>"));
                            };
                        };
                        if (ToolKit.isBigThan(Number(data.b12), 0))
                        {
                            contentMsg = (((((((((contentMsg + title1) + ": ") + data.b2) + "%") + Language.EQUIPTFUNCPANEL_S[129]) + color1) + data.b12) + "%</font>") + suffix2);
                        }
                        else
                        {
                            if (((ToolKit.isEqual(Number(data.b12), 0)) && (ToolKit.isBigThan(Number(data.b2), 0))))
                            {
                                contentMsg = (contentMsg + (((((((((((("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[wingTemp.mainProp2]) + ": ") + data.b2) + "%") + Language.EQUIPTFUNCPANEL_S[129]) + "<font color='#00ff00'>") + data.b2) + "%</font>") + "<font color='#00ff00'>") + Language.EQUIPTFUNCPANEL_S[106]) + "</font>"));
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
                    };
                }
                else
                {
                    bindButton.enabled = true;
                    _core.sysMidNote(Language.WING_PANEL_U[42]);
                    bindEquChange(null);
                };
            };
        }

        public function __starAllButton_click(_arg_1:MouseEvent):void
        {
            subWingStar(false);
        }

        [Bindable(event="propertyChange")]
        public function get starMax():NumericStepper
        {
            return (this._1897222734starMax);
        }

        public function set reqmixFormular(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1268261610reqmixFormular;
            if (_local_2 !== _arg_1)
            {
                this._1268261610reqmixFormular = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqmixFormular", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get maxPrefixProp():TextArea
        {
            return (this._1782203801maxPrefixProp);
        }

        public function set joinInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1402072840joinInfo;
            if (_local_2 !== _arg_1)
            {
                this._1402072840joinInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinInfo", _local_2, _arg_1));
            };
        }

        public function set featherMixAutoPutBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._771118837featherMixAutoPutBtn;
            if (_local_2 !== _arg_1)
            {
                this._771118837featherMixAutoPutBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherMixAutoPutBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get holeItemRequire():ItemSlot
        {
            return (this._1651487246holeItemRequire);
        }

        public function set selectCrit(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._1656453898selectCrit;
            if (_local_2 !== _arg_1)
            {
                this._1656453898selectCrit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectCrit", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get buyBtn():BasicGlowButton
        {
            return (this._1377586698buyBtn);
        }

        private function onFeatherMix(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:Object;
            if (_arg_1)
            {
                if ((((_arg_1.fid) && (mixFormular.slotData)) && (ToolKit.isEqual(_arg_1.fid, mixFormular.slotData.id))))
                {
                    if (_arg_1.fnum > 0)
                    {
                        mixFormular.stackNum = _arg_1.fnum;
                    }
                    else
                    {
                        mixFormular.clean();
                    };
                };
                if (_arg_1.i)
                {
                    for (_local_2 in _arg_1.i)
                    {
                        _local_3 = _arg_1.i[_local_2];
                        if (((this[("MixItem" + _local_2)].slotData) && (ToolKit.isEqual(this[("MixItem" + _local_2)].slotData.id, _local_3.id))))
                        {
                            if (_local_3.num > 0)
                            {
                                this[("MixItem" + _local_2)].stackNum = _local_3.num;
                            }
                            else
                            {
                                this[("MixItem" + _local_2)].clean();
                            };
                        };
                    };
                };
                if ((((_arg_1.lid) && (mixLuckyItem.slotData)) && (ToolKit.isEqual(_arg_1.lid, mixLuckyItem.slotData.id))))
                {
                    if (_arg_1.lnum > 0)
                    {
                        mixLuckyItem.stackNum = _arg_1.lnum;
                    }
                    else
                    {
                        mixLuckyItem.clean();
                    };
                };
                if (_arg_1.f)
                {
                    _core.sysMidNote(Language.WING_PANEL_U[95]);
                }
                else
                {
                    if (ToolKit.isEqual(_arg_1.fid, -1))
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[96]);
                    }
                    else
                    {
                        if (ToolKit.isEqual(_arg_1.fid, -2))
                        {
                            _core.sysMidNote(Language.WING_PANEL_U[103]);
                        }
                        else
                        {
                            _core.sysMidNote(Language.WING_PANEL_U[94]);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get curSpeed():BasicTxtButton
        {
            return (this._547091943curSpeed);
        }

        [Bindable(event="propertyChange")]
        public function get starAllButton():BasicGlowButton
        {
            return (this._360588801starAllButton);
        }

        [Bindable(event="propertyChange")]
        public function get feather10():ItemSlot
        {
            return (this._432885246feather10);
        }

        [Bindable(event="propertyChange")]
        public function get joinMain():ItemSlotEquFunc
        {
            return (this._1401966077joinMain);
        }

        public function set joinButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1034217724joinButton;
            if (_local_2 !== _arg_1)
            {
                this._1034217724joinButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinButton", _local_2, _arg_1));
            };
        }

        public function set featherUpLuckItemNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._774447364featherUpLuckItemNum;
            if (_local_2 !== _arg_1)
            {
                this._774447364featherUpLuckItemNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherUpLuckItemNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherMixLuckItemNum():NumericStepper
        {
            return (this._165104137featherMixLuckItemNum);
        }

        public function set starOneButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1900875002starOneButton;
            if (_local_2 !== _arg_1)
            {
                this._1900875002starOneButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starOneButton", _local_2, _arg_1));
            };
        }

        public function set holeItemNumTip(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._262477064holeItemNumTip;
            if (_local_2 !== _arg_1)
            {
                this._262477064holeItemNumTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeItemNumTip", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wingExp():BoxLabel
        {
            return (this._1349542418wingExp);
        }

        public function changePreView(_arg_1:int):void
        {
            var _local_2:Object = _core.data.getGameData(GamePredef.TBL_EQUIPT_INSTANCE, curWingId);
            if (!_local_2)
            {
                return;
            };
            if (_local_2.color == 3)
            {
                return;
            };
            var _local_3:Number = 0;
            var _local_4:int;
            var _local_5:* = 0;
            while (_local_5 < rescodeArray.length)
            {
                if (rescodeArray[_local_5] == curRescode)
                {
                    _local_4 = _local_5;
                    currentIndex = _local_5;
                    break;
                };
                _local_5++;
            };
            currentIndex = (((_local_4 + _arg_1) + 3) % 3);
            _local_3 = rescodeArray[currentIndex];
            curRescode = _local_3;
            changeViewBox.selected = false;
            previewCanvas.wingResCode = _local_3;
            wingLabel.text = rescodeLabel[currentIndex];
        }

        private function isWingBind(_arg_1:Object):Boolean
        {
            var _local_4:Object;
            var _local_2:Object = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.main.itemId];
            if (ToolKit.isEqual(_local_2.binded, 1))
            {
                return (true);
            };
            var _local_3:int = 1;
            while (_local_3 <= 4)
            {
                if (_arg_1[("wing" + _local_3)])
                {
                    _local_4 = _arg_1[("wing" + _local_3)];
                    _local_2 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_local_4.itemId];
                    if (ToolKit.isEqual(_local_2.binded, 1))
                    {
                        return (true);
                    };
                };
                _local_3++;
            };
            return (false);
        }

        private function subWingJoin():void
        {
            var wings:Object;
            var func:Function;
            if ((((((joinMain.slotData) && (joinWing1.slotData)) && (joinWing2.slotData)) && (joinWing3.slotData)) && (joinWing4.slotData)))
            {
                wings = {};
                wings.main = joinMain.slotData;
                wings.wing1 = joinWing1.slotData;
                wings.wing2 = joinWing2.slotData;
                wings.wing3 = joinWing3.slotData;
                wings.wing4 = joinWing4.slotData;
                if (checkWingData(wings))
                {
                    if (isWingBind(wings))
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("wingJoin", new Responder(onJoin), joinMain.slotData.id, {
                                    "w1":joinWing1.slotData.id,
                                    "w2":joinWing2.slotData.id,
                                    "w3":joinWing3.slotData.id,
                                    "w4":joinWing4.slotData.id
                                });
                            };
                        };
                        Alert.show(Language.WING_PANEL_U[9], "", (Alert.YES | Alert.NO), this, func);
                    }
                    else
                    {
                        _core.remote.call("wingJoin", new Responder(onJoin), joinMain.slotData.id, {
                            "w1":joinWing1.slotData.id,
                            "w2":joinWing2.slotData.id,
                            "w3":joinWing3.slotData.id,
                            "w4":joinWing4.slotData.id
                        });
                    };
                };
            };
        }

        public function set featherSetMain(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1386354456featherSetMain;
            if (_local_2 !== _arg_1)
            {
                this._1386354456featherSetMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherSetMain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get funcBtn0():BasicGlowButton
        {
            return (this._1379459640funcBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get funcBtn1():BasicGlowButton
        {
            return (this._1379459641funcBtn1);
        }

        private function deActiveView(_arg_1:int=-1):void
        {
            var _local_2:int;
            if (_arg_1 < 0)
            {
                _arg_1 = tab.selectedIndex;
            };
            switch (_arg_1)
            {
                case 0:
                    joinMain.removeEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    joinWing1.removeEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    joinWing2.removeEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    joinWing3.removeEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    joinWing4.removeEventListener(GameEvent.SLOT_GIID_CHANGE, joinEquChange);
                    return;
                case 1:
                    prefixMain.removeEventListener(GameEvent.SLOT_GIID_CHANGE, prefixEquChange);
                    prefixItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, prefixEquChange);
                    return;
                case 2:
                    bindMain.removeEventListener(GameEvent.SLOT_GIID_CHANGE, bindEquChange);
                    bindItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, bindEquChange);
                    return;
                case 3:
                    holeMain.removeEventListener(GameEvent.SLOT_GIID_CHANGE, holeEquChange);
                    holeItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, holeEquChange);
                    return;
                case 4:
                    starMain.removeEventListener(GameEvent.SLOT_GIID_CHANGE, starEquChange);
                    starItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, starEquChange);
                    return;
                case 5:
                    featherUpMain.removeEventListener(GameEvent.SLOT_GIID_CHANGE, featherUpChange);
                    featherUpItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, featherUpChange);
                    return;
                case 6:
                    featherSetMain.removeEventListener(GameEvent.SLOT_GIID_CHANGE, featherSetEquChange);
                    _local_2 = 1;
                    while (_local_2 <= 10)
                    {
                        this[("feather" + _local_2)].removeEventListener(GameEvent.SLOT_GIID_CHANGE, featherSetItemChange);
                        this[("feather" + _local_2)].removeEventListener(DragEvent.DRAG_DROP, featherSetDropAlert);
                        _local_2++;
                    };
                    return;
                case 7:
                    mixFormular.removeEventListener(GameEvent.SLOT_GIID_CHANGE, featherMixChange);
                    mixLuckyItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, mixLuckyItemChange);
                    _local_2 = 1;
                    while (_local_2 <= 2)
                    {
                        this[("MixItem" + _local_2)].removeEventListener(GameEvent.SLOT_GIID_CHANGE, featherMixChange);
                        _local_2++;
                    };
            };
        }

        public function set nextSpeed(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1206019348nextSpeed;
            if (_local_2 !== _arg_1)
            {
                this._1206019348nextSpeed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextSpeed", _local_2, _arg_1));
            };
        }

        public function set changeViewBox(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._524842218changeViewBox;
            if (_local_2 !== _arg_1)
            {
                this._524842218changeViewBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeViewBox", _local_2, _arg_1));
            };
        }

        public function set mixLuckyItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1954302177mixLuckyItem;
            if (_local_2 !== _arg_1)
            {
                this._1954302177mixLuckyItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mixLuckyItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get starInfo():BasicTxtButton
        {
            return (this._1315530272starInfo);
        }

        public function __feather3_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(3);
        }

        public function set curPhy(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1349152991curPhy;
            if (_local_2 !== _arg_1)
            {
                this._1349152991curPhy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPhy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bindItemRequire():ItemSlot
        {
            return (this._210599509bindItemRequire);
        }

        public function set starMain(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1315637035starMain;
            if (_local_2 !== _arg_1)
            {
                this._1315637035starMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starMain", _local_2, _arg_1));
            };
        }

        public function set curLevel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._540315940curLevel;
            if (_local_2 !== _arg_1)
            {
                this._540315940curLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get starRateInfo():BasicTxtButton
        {
            return (this._1615024608starRateInfo);
        }

        [Bindable(event="propertyChange")]
        public function get mixFormular():ItemSlot
        {
            return (this._934857288mixFormular);
        }

        private function onWingHole(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                if (_arg_1.f)
                {
                    _core.sysMidNote(Language.WING_PANEL_U[50]);
                    if (_core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.i])
                    {
                        _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.i].holeNum = _arg_1.h;
                    };
                    if (((ToolKit.isEqual(holeItem.slotData.id, _arg_1.ii)) && (_arg_1.n > 0)))
                    {
                        holeItem.stackNum = _arg_1.n;
                    }
                    else
                    {
                        holeItem.clean();
                    };
                    if (holeMain.slotData)
                    {
                        _local_2 = _core.getTemplateData(holeMain.slotData.type, holeMain.slotData.itemId, false);
                    };
                }
                else
                {
                    _core.sysMidNote(Language.WING_PANEL_U[51]);
                };
                holeEquChange(null);
            };
        }

        private function onSureChangeWingBind(_arg_1:Object):void
        {
            var _local_2:Object;
            bindButton.enabled = true;
            if (_arg_1)
            {
                if (_arg_1.f == "sure")
                {
                    _core.sysMidNote(Language.WING_PANEL_U[41]);
                    _local_2 = _core.getTemplateData(bindMain.slotData.type, bindMain.slotData.itemId, false);
                    _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][bindMain.slotData.itemId].bindMainPropNum1 = _arg_1.b1;
                    _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][bindMain.slotData.itemId].bindMainPropNum2 = _arg_1.b2;
                    curBindProp.htmlText = ((((((((((((Language.WING_PANEL_U[53] + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + _arg_1.b1) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + _arg_1.b2) + "%");
                };
            };
        }

        public function __growBtn1_click(_arg_1:MouseEvent):void
        {
            growWingExp(1);
        }

        [Bindable(event="propertyChange")]
        public function get featherUpRateInfo():BasicTxtButton
        {
            return (this._631614868featherUpRateInfo);
        }

        public function set featherMixRate(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._474659641featherMixRate;
            if (_local_2 !== _arg_1)
            {
                this._474659641featherMixRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherMixRate", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get joinWing1():ItemSlotEquFunc
        {
            return (this._501797252joinWing1);
        }

        [Bindable(event="propertyChange")]
        public function get joinWing2():ItemSlotEquFunc
        {
            return (this._501797251joinWing2);
        }

        [Bindable(event="propertyChange")]
        public function get joinWing3():ItemSlotEquFunc
        {
            return (this._501797250joinWing3);
        }

        public function set previewCanvas(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._112177344previewCanvas;
            if (_local_2 !== _arg_1)
            {
                this._112177344previewCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "previewCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextMagic():BasicTxtButton
        {
            return (this._1200033402nextMagic);
        }

        public function set reqMixItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._483423935reqMixItem2;
            if (_local_2 !== _arg_1)
            {
                this._483423935reqMixItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqMixItem2", _local_2, _arg_1));
            };
        }

        public function growWingExp(_arg_1:int):void
        {
            _core.remote.call("newWingAdvanced", null, selectCrit.selected, _arg_1);
        }

        public function set reqMixItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._483423936reqMixItem1;
            if (_local_2 !== _arg_1)
            {
                this._483423936reqMixItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqMixItem1", _local_2, _arg_1));
            };
        }

        public function __featherMixLuckItemNum_change(_arg_1:NumericStepperEvent):void
        {
            setMixRate();
        }

        [Bindable(event="propertyChange")]
        public function get formularList():List
        {
            return (this._12860042formularList);
        }

        public function updateNewWingPro(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (_arg_1.num1 > 0)
                {
                    itemInBag.stackNum = _arg_1.num1;
                };
                if (_arg_1.num2 > 0)
                {
                    itemByBuy.stackNum = _arg_1.num2;
                };
                if (_arg_1.level == 10)
                {
                    wingExp.text = _arg_1.curExp;
                }
                else
                {
                    wingExp.text = ((_arg_1.curExp + "/") + _arg_1.nextExp);
                };
                showNewWingPro(_arg_1.level, _arg_1.curAdd, _arg_1.nextAdd, _arg_1.basicPro);
                rescodeArray = _arg_1.arr;
                curRescode = _arg_1.curRescode;
                level = _arg_1.level;
                curWingId = _arg_1.eid;
                showNextLevelWing(curRescode);
            };
        }

        [Bindable(event="propertyChange")]
        public function get wingPreview1():ItemSlotEquFunc
        {
            return (this._60395884wingPreview1);
        }

        [Bindable(event="propertyChange")]
        public function get joinWing4():ItemSlotEquFunc
        {
            return (this._501797249joinWing4);
        }

        [Bindable(event="propertyChange")]
        public function get wingPreview5():ItemSlotEquFunc
        {
            return (this._60395880wingPreview5);
        }

        [Bindable(event="propertyChange")]
        public function get holeMain():ItemSlotEquFunc
        {
            return (this._515043687holeMain);
        }

        [Bindable(event="propertyChange")]
        public function get bindMoney():Label
        {
            return (this._946787709bindMoney);
        }

        private function bindEquChange(_arg_1:GameEvent):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:Object;
            if (bindMain.slotData)
            {
                _local_2 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][bindMain.slotData.itemId];
                _local_3 = _core.getTemplateData(bindMain.slotData.type, bindMain.slotData.itemId, false);
                if (((_local_3) && (_local_2)))
                {
                    if (ToolKit.isBigOrEqual(_local_2.color, 2))
                    {
                        _local_4 = ((GamePredef.WING_BIND_ITEM_NUM) || (10));
                        bindItemNumTip.htmlText = Language.WING_PANEL_U[40].replace("{num}", _local_4);
                        bindItemRequire.type = GamePredef.TBL_ITEM_TEMPLATE;
                        bindItemRequire.giid = GamePredef.WING_BIND_ITEM_ID;
                        bindItemRequire.stackNum = _local_4;
                        bindMoney.text = GamePredef.MONEY_EQUFUNC_ELEMENT.toString();
                        curBindProp.htmlText = ((((((((((((Language.WING_PANEL_U[53] + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + _local_2.bindMainPropNum1) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + _local_2.bindMainPropNum2) + "%");
                        if (GamePredef.EQUIPT_QUALITY[20])
                        {
                            _local_5 = GamePredef.EQUIPT_QUALITY[20];
                            maxBindProp.htmlText = ((((((((((((Language.WING_PANEL_U[54] + Language.WING_PANEL_U[55]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + Math.round((_local_3.bindPropNum * _local_5))) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + Math.round((_local_3.bindPropNum * _local_5))) + "%");
                        };
                        if (((bindItem.slotData) && (bindItem.slotData.type == GamePredef.TBL_ITEM_INSTANCE)))
                        {
                            _local_6 = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][bindItem.slotData.itemId];
                            _local_7 = _core.getTemplateData(bindItem.slotData.type, bindItem.slotData.itemId, false);
                            if (((_local_6) && (_local_7)))
                            {
                                if (((ToolKit.isEqual(_local_7.id, GamePredef.WING_BIND_ITEM_ID)) && (ToolKit.isBigOrEqual(bindItem.slotData.stackNum, _local_4))))
                                {
                                    bindButton.enabled = true;
                                    return;
                                };
                            };
                        };
                    }
                    else
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[58]);
                        bindViewClear();
                    };
                };
            };
            bindButton.enabled = false;
        }

        [Bindable(event="propertyChange")]
        public function get wingPreview3():ItemSlotEquFunc
        {
            return (this._60395882wingPreview3);
        }

        public function __formularList_itemClick(_arg_1:ListEvent):void
        {
            formularListClick();
        }

        private function setMixRate():void
        {
            var _local_3:Number;
            var _local_6:Number;
            var _local_7:String;
            var _local_8:Object;
            var _local_9:Object;
            if (!formularList.selectedItem)
            {
                return;
            };
            var _local_1:Object = formularList.selectedItem.data;
            var _local_2:Object = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1.nextJewelTid];
            if (!_local_2)
            {
                return;
            };
            var _local_4:int;
            var _local_5:int = 1;
            while (_local_5 <= 3)
            {
                if (ToolKit.isBigThan(_local_2[("i" + _local_5)], 0))
                {
                    _local_4 = (_local_4 + 1);
                };
                _local_5++;
            };
            _local_3 = GamePredef.FEATHER_MIX_RATE[_local_4];
            if (_core.MC_BIRTH_FLAG[12])
            {
                _local_3 = GamePredef.MC_BIRTH_CONFIG[12][_local_4];
            };
            if (_local_3)
            {
                _local_6 = Math.ceil(((100 - _local_3) / GamePredef.FEATHER_UPDATE_RATE_ADDPER_2));
                featherMixLuckItemNum.minimum = 0;
                featherMixLuckItemNum.maximum = _local_6;
                if (mixLuckyItem.slotData)
                {
                    featherMixLuckItemNum.value = Math.min(_local_6, featherMixLuckItemNum.value, mixLuckyItem.slotData.stackNum);
                    _local_8 = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][mixLuckyItem.slotData.itemId];
                    _local_9 = _core.getTemplateData(mixLuckyItem.slotData.type, mixLuckyItem.slotData.itemId, false);
                    if ((((_local_8) && (_local_9)) && (ToolKit.isEqual(_local_9.id, GamePredef.FEATHER_LUCKY_ID2))))
                    {
                        _local_3 = (_local_3 + (featherMixLuckItemNum.value * GamePredef.FEATHER_UPDATE_RATE_ADDPER_2));
                    };
                };
                _local_7 = ((_local_3 > 100) ? "100" : String(_local_3));
                featherMixRate.text = (_local_7 + "%");
                mixButton.enabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get MixItem1():ItemSlot
        {
            return (this._1037480286MixItem1);
        }

        public function __featherDelButton_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, GamePredef.ACTION_FEATHER_DEL);
        }

        [Bindable(event="propertyChange")]
        public function get wingPreview4():ItemSlotEquFunc
        {
            return (this._60395881wingPreview4);
        }

        public function set itemInBag(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._2133274960itemInBag;
            if (_local_2 !== _arg_1)
            {
                this._2133274960itemInBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemInBag", _local_2, _arg_1));
            };
        }

        public function set curMagic(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._541105997curMagic;
            if (_local_2 !== _arg_1)
            {
                this._541105997curMagic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curMagic", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get MixItem2():ItemSlot
        {
            return (this._1037480285MixItem2);
        }

        public function set prefixMoney(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1394559310prefixMoney;
            if (_local_2 !== _arg_1)
            {
                this._1394559310prefixMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prefixMoney", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wingFuncList():List
        {
            return (this._1701830995wingFuncList);
        }

        [Bindable(event="propertyChange")]
        public function get wingPreview2():ItemSlotEquFunc
        {
            return (this._60395883wingPreview2);
        }

        public function set curLife(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1125811548curLife;
            if (_local_2 !== _arg_1)
            {
                this._1125811548curLife = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curLife", _local_2, _arg_1));
            };
        }

        public function set itemByBuy(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._2127138652itemByBuy;
            if (_local_2 !== _arg_1)
            {
                this._2127138652itemByBuy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemByBuy", _local_2, _arg_1));
            };
        }

        private function featherSetItemChange(_arg_1:GameEvent):void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:int;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.slotData)
            {
                _local_3 = _core.getTemplateData(_local_2.slotData.type, _local_2.slotData.itemId, false);
                _local_4 = Number(String(_arg_1.currentTarget.id).substr(7));
                if (_local_3)
                {
                    if (ToolKit.isSmallOrEqual(canPutPropOfFeathers[(_local_4 % 2)][("p" + _local_3.type)], 0))
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[90]);
                        _local_2.clean();
                        return;
                    };
                    if (((canPutPropOfFeathers.color >= 0) && (ToolKit.isBigThan(_local_3.color, canPutPropOfFeathers.color))))
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[84]);
                        _local_2.clean();
                        return;
                    };
                    _local_5 = 1;
                    while (_local_5 <= 3)
                    {
                        if (canPutPropOfFeathers[(_local_4 % 2)][_local_3[("i" + _local_5)]])
                        {
                            _core.sysMidNote(Language.WING_PANEL_U[74]);
                            _local_2.clean();
                            return;
                        };
                        _local_5++;
                    };
                };
                return;
            };
        }

        public function onUpdateItemNum(_arg_1:int, _arg_2:int):void
        {
            itemInBag.stackNum = _arg_1;
            itemByBuy.stackNum = _arg_2;
        }

        public function __feather8_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(8);
        }

        public function buyItem():void
        {
            var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            if (!bagPanel.radioGold.selected)
            {
                Alert.show(Language.SHOPPANEL_S[8], null, Alert.YES, null, null);
                return;
            };
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(sureBuyCritItem), MD5.hash(_arg_1));
            };
            if (bagPanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.NUMPANEL_U[1], func);
            }
            else
            {
                sureBuyCritItem(true);
            };
        }

        [Bindable(event="propertyChange")]
        public function get maxBindProp():TextArea
        {
            return (this._1323287868maxBindProp);
        }

        public function __mixButton_click(_arg_1:MouseEvent):void
        {
            subFeatherMix();
        }

        public function set prefixMain(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1340501141prefixMain;
            if (_local_2 !== _arg_1)
            {
                this._1340501141prefixMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prefixMain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherUpItem():ItemSlot
        {
            return (this._1967315247featherUpItem);
        }

        public function set advanceJoinEnable(_arg_1:Boolean):void
        {
            var _local_2:Object;
            _local_2 = this._1696059025advanceJoinEnable;
            if (_local_2 !== _arg_1)
            {
                this._1696059025advanceJoinEnable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "advanceJoinEnable", _local_2, _arg_1));
            };
        }

        public function set featherUpMain(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1967214217featherUpMain;
            if (_local_2 !== _arg_1)
            {
                this._1967214217featherUpMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherUpMain", _local_2, _arg_1));
            };
        }

        public function set curPrefixProp(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._899727221curPrefixProp;
            if (_local_2 !== _arg_1)
            {
                this._899727221curPrefixProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPrefixProp", _local_2, _arg_1));
            };
        }

        private function changeBagVis():void
        {
            if (!wingBagAdded)
            {
                wingBag = null;
                wingBag = new FuncBag();
                wingBag.x = 498;
                wingBag.y = 33;
                width = 743;
                wingBag.rows = 2;
                wingBag.cols = 6;
                wingBag.upTabButtons = {
                    "l":[Language.WING_PANEL_U[106], Language.WING_PANEL_U[107], Language.WING_PANEL_U[108], Language.WING_PANEL_U[109], Language.WING_PANEL_U[110], Language.WING_PANEL_U[111]],
                    "p":"color",
                    "v":[-1, 4, 3, 2, 1, 0]
                };
                addChild((wingBag as FuncBag));
                wingBag.pFuncPanel = this;
                wingBag.DClickCallBack = funcBagClickHandler;
                this.addEventListener(Slot.EVENT_SLOT_DCLICK, funcBagClickHandler);
                wingBagAdded = true;
                showBag.styleName = "EquipBagLeft";
            }
            else
            {
                if (wingBag.visible)
                {
                    wingBag.visible = false;
                    width = 500;
                    showBag.styleName = "EquipBagRight";
                }
                else
                {
                    wingBag.visible = true;
                    width = 743;
                    showBag.styleName = "EquipBagLeft";
                };
            };
            if (wingBag.visible)
            {
                wingBagRefresh();
            };
            wTitle.text = wTitle.text;
        }

        [Bindable(event="propertyChange")]
        public function get reqmixFormular():ItemSlot
        {
            return (this._1268261610reqmixFormular);
        }

        public function __holeButton_click(_arg_1:MouseEvent):void
        {
            subWingHole();
        }

        public function __starNumBasic_change(_arg_1:NumericStepperEvent):void
        {
            setStarInfo();
        }

        override public function show():void
        {
            super.show();
            switchVS(((tab) ? tab.selectedIndex : 0));
        }

        private function subFeatherDel(index:int):void
        {
            var feather:Object;
            var price:Number;
            var func:Function;
            var showString:String;
            if (ToolKit.isEqual(this[("feather" + index)].type, GamePredef.TBL_ITEM_TEMPLATE))
            {
                if (((this[("feather" + index)].giid) && (this[("feather" + index)].giid > 0)))
                {
                    feather = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][this[("feather" + index)].giid];
                    if (feather)
                    {
                        price = GamePredef.FEATHER_DEL_MONEY[feather.color];
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                if (_core.player.enoughMoneyAuto(1, price))
                                {
                                    _core.remote.call("featherDel", new Responder(onFeatherDel), featherSetMain.slotData.id, index);
                                }
                                else
                                {
                                    _core.sysBlueMsg(Language.WING_PANEL_U[30]);
                                };
                            };
                        };
                        showString = Language.WING_PANEL_U[75].toString();
                        showString = showString.replace("{silver}", Math.round(price));
                        showString = showString.replace("{name}", feather.name);
                        Alert.show(showString, "", 3, this, func);
                    };
                };
            }
            else
            {
                this[("feather" + index)].clean();
            };
        }

        public function __bindButton_click(_arg_1:MouseEvent):void
        {
            subWingBind();
        }

        [Bindable(event="propertyChange")]
        public function get featherMixAutoPutBtn():BasicGlowButton
        {
            return (this._771118837featherMixAutoPutBtn);
        }

        private function bindViewClear():void
        {
            bindMain.clean();
            bindItemRequire.clean();
            bindItem.clean();
            curBindProp.htmlText = "";
            maxBindProp.htmlText = "";
            bindItemNumTip.htmlText = "";
            bindMoney.text = "";
        }

        private function subFeatherSet(starOnce:Boolean=true):void
        {
            var wingIns:Object;
            var wingTemp:Object;
            var featherSets:Object;
            var needsAlert:Boolean;
            var i:int;
            var itemIns:Object;
            var itemTemp:Object;
            var func:Function;
            var e:CloseEvent;
            if (featherSetMain.slotData)
            {
                wingIns = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][featherSetMain.slotData.itemId];
                wingTemp = _core.getTemplateData(featherSetMain.slotData.type, featherSetMain.slotData.itemId, false);
                if (((wingIns) && (wingTemp)))
                {
                    if (ToolKit.isEqual(wingTemp.kind, GamePredef.ITEM_KIND_WING))
                    {
                        featherSets = {};
                        needsAlert = false;
                        i = 1;
                        while (i <= 10)
                        {
                            if (this[("feather" + i)].slotData)
                            {
                                if (this[("feather" + i)].tempBagFlag)
                                {
                                    itemIns = {"binded":this[("feather" + i)].slotData.b};
                                    itemTemp = _core.getTemplateData(this[("feather" + i)].slotData.ti, this[("feather" + i)].slotData.ii, false);
                                }
                                else
                                {
                                    itemIns = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][this[("feather" + i)].slotData.itemId];
                                    itemTemp = _core.getTemplateData(this[("feather" + i)].slotData.type, this[("feather" + i)].slotData.itemId, false);
                                };
                                if (((itemIns) && (itemTemp)))
                                {
                                    if (ToolKit.isEqual(itemTemp.kind, GamePredef.ITEM_KIND_FEATHER))
                                    {
                                        if ((((!(needsAlert)) && (ToolKit.isEqual(wingIns.binded, 0))) && (ToolKit.isEqual(itemIns.binded, 1))))
                                        {
                                            needsAlert = true;
                                        };
                                        featherSets[i] = {
                                            "idx":this[("feather" + i)].slotData.id,
                                            "flag":this[("feather" + i)].tempBagFlag
                                        };
                                    };
                                };
                            };
                            i = (i + 1);
                        };
                        if (featherSets)
                        {
                            func = function (_arg_1:CloseEvent):void
                            {
                                if (_arg_1.detail == Alert.YES)
                                {
                                    _core.remote.call("addWingFeather", new Responder(onFeatherSet), featherSetMain.slotData.id, featherSets);
                                };
                            };
                            if (needsAlert)
                            {
                                Alert.show(Language.WING_PANEL_U[85], "", (Alert.YES | Alert.NO), null, func);
                            }
                            else
                            {
                                e = new CloseEvent("");
                                e.detail = Alert.YES;
                                (func(e));
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get curPhy():BasicTxtButton
        {
            return (this._1349152991curPhy);
        }

        public function set nextPhy(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1847059854nextPhy;
            if (_local_2 !== _arg_1)
            {
                this._1847059854nextPhy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextPhy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherSetMain():ItemSlotEquFunc
        {
            return (this._1386354456featherSetMain);
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

        [Bindable(event="propertyChange")]
        public function get starMain():ItemSlotEquFunc
        {
            return (this._1315637035starMain);
        }

        public function __starOneButton_click(_arg_1:MouseEvent):void
        {
            subWingStar(true);
        }

        public function set introText1(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._1246703000introText1;
            if (_local_2 !== _arg_1)
            {
                this._1246703000introText1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText1", _local_2, _arg_1));
            };
        }

        public function set introText2(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._1246703001introText2;
            if (_local_2 !== _arg_1)
            {
                this._1246703001introText2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText2", _local_2, _arg_1));
            };
        }

        public function set introText3(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._1246703002introText3;
            if (_local_2 !== _arg_1)
            {
                this._1246703002introText3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText3", _local_2, _arg_1));
            };
        }

        public function set introText4(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._1246703003introText4;
            if (_local_2 !== _arg_1)
            {
                this._1246703003introText4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mixLuckyItem():ItemSlot
        {
            return (this._1954302177mixLuckyItem);
        }

        [Bindable(event="propertyChange")]
        public function get changeViewBox():CheckBox
        {
            return (this._524842218changeViewBox);
        }

        [Bindable(event="propertyChange")]
        public function get featherMixRate():BasicTxtButton
        {
            return (this._474659641featherMixRate);
        }

        public function set introText6(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._1246703005introText6;
            if (_local_2 !== _arg_1)
            {
                this._1246703005introText6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText6", _local_2, _arg_1));
            };
        }

        private function mouseAction(_arg_1:MouseEvent, _arg_2:uint):void
        {
            _arg_1.stopImmediatePropagation();
            if (_core.state == GamePredef.ST_BATTLE)
            {
                return;
            };
            _core.view.showMouse(ResManager.MOUSE_ACTION_IMG[GamePredef.ACTION_BIND]);
            _core.view.mouseState = _arg_2;
            _core.view.mouseTargetType = GamePredef.MOUSE_TARGET_CHA;
        }

        public function set introText8(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._1246703007introText8;
            if (_local_2 !== _arg_1)
            {
                this._1246703007introText8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText8", _local_2, _arg_1));
            };
        }

        public function set introText5(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._1246703004introText5;
            if (_local_2 !== _arg_1)
            {
                this._1246703004introText5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText5", _local_2, _arg_1));
            };
        }

        public function set curBindProp(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._2085845920curBindProp;
            if (_local_2 !== _arg_1)
            {
                this._2085845920curBindProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curBindProp", _local_2, _arg_1));
            };
        }

        public function set maxPrefixProp(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1782203801maxPrefixProp;
            if (_local_2 !== _arg_1)
            {
                this._1782203801maxPrefixProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxPrefixProp", _local_2, _arg_1));
            };
        }

        public function __feather5_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(5);
        }

        [Bindable(event="propertyChange")]
        public function get starOneButton():BasicGlowButton
        {
            return (this._1900875002starOneButton);
        }

        [Bindable(event="propertyChange")]
        public function get curMagic():BasicTxtButton
        {
            return (this._541105997curMagic);
        }

        public function set bindMain(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._939276182bindMain;
            if (_local_2 !== _arg_1)
            {
                this._939276182bindMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bindMain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get previewCanvas():CharactorShowCanvas
        {
            return (this._112177344previewCanvas);
        }

        public function set wingLabel(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._164090455wingLabel;
            if (_local_2 !== _arg_1)
            {
                this._164090455wingLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wingLabel", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        public function get itemByBuy():ItemSlot
        {
            return (this._2127138652itemByBuy);
        }

        private function subWingStar(starOnce:Boolean=true):void
        {
            var wingTemp:Object;
            var wingIns:Object;
            var itemIns:Object;
            var itemTemp:Object;
            var upToNum:int;
            var func:Function;
            var e:CloseEvent;
            if (((starMain.slotData) && (starItem.slotData)))
            {
                wingTemp = _core.getTemplateData(starMain.slotData.type, starMain.slotData.itemId, false);
                wingIns = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][starMain.slotData.itemId];
                itemIns = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][starItem.slotData.itemId];
                itemTemp = _core.getTemplateData(starItem.slotData.type, starItem.slotData.itemId, false);
                if (((((wingIns) && (wingTemp)) && (itemIns)) && (itemTemp)))
                {
                    if (((ToolKit.isEqual(itemTemp.id, GamePredef.WING_STAR_ITEM_ID)) && (ToolKit.isBigOrEqual(starItem.slotData.stackNum, starNumBasic.value))))
                    {
                        upToNum = ((starOnce) ? 0 : starMax.value);
                        func = function (_arg_1:CloseEvent):*
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("addWingStar", new Responder(onWingStar), starNumBasic.value, starMain.slotData.id, starItem.slotData.id, upToNum);
                            };
                        };
                        if (((ToolKit.isEqual(wingIns.binded, 0)) && (ToolKit.isEqual(itemIns.binded, 1))))
                        {
                            Alert.show(Language.WING_PANEL_U[87], "", (Alert.YES | Alert.NO), null, func);
                        }
                        else
                        {
                            e = new CloseEvent("");
                            e.detail = Alert.YES;
                            (func(e));
                        };
                    };
                };
            };
        }

        public function set starMax(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._1897222734starMax;
            if (_local_2 !== _arg_1)
            {
                this._1897222734starMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starMax", _local_2, _arg_1));
            };
        }

        public function __featherUpLuckItemNum_change(_arg_1:NumericStepperEvent):void
        {
            featherUpChange(null);
        }

        private function updatePanelSlot(_arg_1:ItemSlot, _arg_2:Object=null):void
        {
            var _local_3:Object;
            var _local_4:DragEvent;
            var _local_5:DragSource;
            if (_arg_2 != null)
            {
                _local_3 = _arg_2.slotData;
                _local_4 = new DragEvent(DragEvent.DRAG_DROP);
                _local_5 = new DragSource();
                _local_5.addData(_arg_2, "slot");
                _local_4.dragSource = _local_5;
                _arg_1.dispatchEvent(_local_4);
            }
            else
            {
                _arg_1.clean();
            };
        }

        public function set introText(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._871500217introText;
            if (_local_2 !== _arg_1)
            {
                this._871500217introText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introText", _local_2, _arg_1));
            };
        }

        public function set featherDelButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._912391750featherDelButton;
            if (_local_2 !== _arg_1)
            {
                this._912391750featherDelButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherDelButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get curPrefixProp():TextArea
        {
            return (this._899727221curPrefixProp);
        }

        private function checkWingData(_arg_1:Object):Boolean
        {
            var _local_2:String;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:int;
            var _local_9:Object;
            var _local_10:Array;
            var _local_11:Object;
            var _local_12:*;
            var _local_13:Number;
            if (_arg_1)
            {
                for (_local_2 in _arg_1)
                {
                    for (_local_4 in _arg_1)
                    {
                        if (((((_arg_1[_local_2]) && (_arg_1[_local_4])) && (!(_local_2 == _local_4))) && (_arg_1[_local_2].id == _arg_1[_local_4].id)))
                        {
                            _core.sysMidNote(Language.WING_PANEL_U[5]);
                            return (false);
                        };
                    };
                };
                if (!_arg_1.main)
                {
                    _core.sysMidNote(Language.WING_PANEL_U[6]);
                    return (false);
                };
                _local_3 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.main.itemId];
                if (_local_3)
                {
                    _local_5 = _local_3.color;
                    if (ToolKit.isBigOrEqual(_local_5, GamePredef.WING_MAX_COLOR_LEVEL))
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[17]);
                        return (false);
                    };
                    _local_6 = GamePredef.WING_JOIN_SUCCESS[_local_5];
                    if (_core.MC_BIRTH_FLAG[15])
                    {
                        _local_6 = GamePredef.MC_BIRTH_CONFIG[15][_local_5];
                    };
                    _local_7 = 0;
                    _local_8 = 1;
                    while (_local_8 <= 4)
                    {
                        if (_arg_1[("wing" + _local_8)])
                        {
                            _local_9 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1[("wing" + _local_8)].itemId];
                            _local_7 = _local_9.color;
                            if (((!(_local_9)) || (!(ToolKit.isEqual(_local_5, _local_9.color)))))
                            {
                                _core.sysMidNote(Language.WING_PANEL_U[7]);
                                return (false);
                            };
                            if (!ToolKit.isEqual(_local_3.tid, _local_9.tid))
                            {
                                _local_6 = (_local_6 - GamePredef.WING_REDUCE_RATE);
                            };
                        };
                        _local_8++;
                    };
                    joinInfo.htmlText = ((Language.WING_PANEL_U[18] + _local_6) + "%");
                    if (((((_local_7) && (ToolKit.isEqual(_local_7, 3))) && (_core.player.pmLevel)) && (Number(_core.player.pmLevel) > 0)))
                    {
                        _local_10 = GameData.d[GamePredef.TBL_PM_RIGHT];
                        _local_11 = null;
                        for (_local_12 in _local_10)
                        {
                            if (((_local_10[_local_12]) && (Number(_local_10[_local_12].id) == 9)))
                            {
                                _local_11 = _local_10[_local_12];
                                break;
                            };
                        };
                        if (((_local_11) && (_local_11[("value" + _core.player.pmLevel)])))
                        {
                            _local_13 = (Number(_local_6) + Number(_local_11[("value" + _core.player.pmLevel)]));
                            joinInfo.htmlText = ((Language.WING_PANEL_U[18] + _local_13) + "%");
                        };
                    };
                    return (true);
                };
            };
            return (false);
        }

        private function onFeatherUp(_arg_1:Object):void
        {
            var _local_2:String;
            if (_arg_1)
            {
                if (ToolKit.isEqual(_arg_1.slotId, featherUpMain.slotData.id))
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        featherUpMain.stackNum = _arg_1.num;
                    }
                    else
                    {
                        featherUpMain.clean();
                    };
                };
                if (((featherUpItem.slotData) && (ToolKit.isEqual(_arg_1.lSid, featherUpItem.slotData.id))))
                {
                    if (ToolKit.isBigThan(_arg_1.lnum, 0))
                    {
                        featherUpItem.stackNum = _arg_1.lnum;
                    }
                    else
                    {
                        featherUpItem.clean();
                    };
                };
                if (((_arg_1.flag) && (_arg_1.finalNum)))
                {
                    _local_2 = Language.WING_PANEL_U[63];
                    _core.sysMidNote(_local_2.replace("{finalNum}", _arg_1.finalNum));
                }
                else
                {
                    _core.sysMidNote(Language.WING_PANEL_U[64]);
                };
            };
        }

        private function _WingFuncPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WING_PANEL_U[0];
            _local_1 = Language.WING_PANEL_U[0];
            _local_1 = ResManager.TOTEM_MAGIC_WEAPON;
            _local_1 = Language.WING_PANEL_U[20];
            _local_1 = {"kinds":{"13":true}};
            _local_1 = Language.WING_PANEL_U[15];
            _local_1 = {"kinds":{"13":true}};
            _local_1 = {"kinds":{"13":true}};
            _local_1 = {"kinds":{"13":true}};
            _local_1 = {"kinds":{"13":true}};
            _local_1 = Language.WING_PANEL_U[4];
            _local_1 = Language.WING_PANEL_U[3];
            _local_1 = Language.WING_PANEL_U[4];
            _local_1 = (Language.WING_PANEL_U[16] + 1);
            _local_1 = (Language.WING_PANEL_U[16] + 2);
            _local_1 = (Language.WING_PANEL_U[16] + 3);
            _local_1 = (Language.WING_PANEL_U[16] + 4);
            _local_1 = (Language.WING_PANEL_U[16] + 5);
            _local_1 = {"kinds":{"13":true}};
            _local_1 = {"kinds":{"13":true}};
            _local_1 = {"kinds":{"13":true}};
            _local_1 = {"kinds":{"13":true}};
            _local_1 = {"kinds":{"13":true}};
            _local_1 = advanceJoinEnable;
            _local_1 = Language.WING_PANEL_U[31];
            _local_1 = Language.WING_PANEL_U[45];
            _local_1 = Language.WING_PANEL_U[32];
            _local_1 = Language.WING_PANEL_U[33];
            _local_1 = Language.WING_PANEL_U[34];
            _local_1 = Language.WING_PANEL_U[38];
            _local_1 = {"kinds":{"13":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.WING_PANEL_U[14];
            _local_1 = Language.WING_PANEL_U[46];
            _local_1 = Language.WING_PANEL_U[32];
            _local_1 = Language.WING_PANEL_U[33];
            _local_1 = Language.WING_PANEL_U[34];
            _local_1 = Language.WING_PANEL_U[38];
            _local_1 = {"kinds":{"13":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.WING_PANEL_U[14];
            _local_1 = Language.WING_PANEL_U[47];
            _local_1 = Language.WING_PANEL_U[32];
            _local_1 = Language.WING_PANEL_U[33];
            _local_1 = Language.WING_PANEL_U[34];
            _local_1 = Language.WING_PANEL_U[38];
            _local_1 = {"kinds":{"13":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.WING_PANEL_U[44];
            _local_1 = Language.WING_PANEL_U[82];
            _local_1 = {"kinds":{"13":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.EQUIPTFUNCPANEL_U[2];
            _local_1 = Language.EQUIPTFUNCPANEL_U[3];
            _local_1 = Language.WING_PANEL_U[60];
            _local_1 = Language.WING_PANEL_U[61];
            _local_1 = Language.EQUIPTFUNCPANEL_U[35];
            _local_1 = Language.EQUIPTFUNCPANEL_U[36];
            _local_1 = Language.EQUIPTFUNCPANEL_U[37];
            _local_1 = Language.EQUIPTFUNCPANEL_U[38];
            _local_1 = Language.WING_PANEL_U[80];
            _local_1 = Language.WING_PANEL_U[65];
            _local_1 = Language.WING_PANEL_U[66];
            _local_1 = Language.EQUIPTFUNCPANEL_U[36];
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"types":{"518":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.WING_PANEL_U[67];
            _local_1 = Language.WING_PANEL_U[68];
            _local_1 = Language.WING_PANEL_U[81];
            _local_1 = Language.WING_PANEL_U[70];
            _local_1 = {"kinds":{"13":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.WING_PANEL_U[71];
            _local_1 = Language.WING_PANEL_U[97];
            _local_1 = Language.WING_PANEL_U[98];
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.WING_PANEL_U[72];
            _local_1 = Language.WING_PANEL_U[78];
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {
                "kinds":{"14":true},
                "types":{"1400":true}
            };
            _local_1 = Language.WING_PANEL_U[103];
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {
                "types":{"518":true},
                "ids":{"3017":true}
            };
            _local_1 = Language.WING_PANEL_U[102];
            _local_1 = Language.WING_PANEL_U[104];
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Language.WING_PANEL_U[105];
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = {"kinds":{"14":true}};
            _local_1 = Language.EQUIPTFUNCPANEL_U[36];
            _local_1 = Language.WING_PANEL_U[79];
            _local_1 = Language.WING_PANEL_U[130];
            _local_1 = Language.WING_PANEL_U[123];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.WING_PANEL_U[124];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.WING_PANEL_U[135];
            _local_1 = Language.WING_PANEL_U[131];
            _local_1 = Language.WING_PANEL_U[132];
            _local_1 = Language.WING_PANEL_U[137];
            _local_1 = Language.WING_PANEL_U[126];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = Language.WING_PANEL_U[128];
            _local_1 = Language.WING_PANEL_U[127];
            _local_1 = Language.WING_PANEL_U[129];
            _local_1 = Language.WING_PANEL_U[142];
            _local_1 = listArr;
            _local_1 = Language.EQUIPTFUNCPANEL_S[97];
        }

        public function initWingLevelUp():void
        {
            if (itemByBuy.slotData == null)
            {
                itemByBuy.slotData = {};
                itemByBuy.slotData.id = 3628;
            };
            _core.remote.showNewWingPro();
        }

        [Bindable(event="propertyChange")]
        public function get prefixMain():ItemSlotEquFunc
        {
            return (this._1340501141prefixMain);
        }

        private function onFeatherData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Number;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:int;
            if (_arg_1)
            {
                _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.id] = _arg_1;
                _local_2 = {
                    "0":{
                        "p1401":1,
                        "p1402":1,
                        "p1403":1,
                        "p1404":2
                    },
                    "1":{
                        "p1401":1,
                        "p1402":1,
                        "p1403":1,
                        "p1404":2
                    },
                    "color":-1
                };
                _local_2.color = _arg_1.color;
                _local_3 = GamePredef.WING_HOLE_COLOR_HOLE_MAP[_arg_1.color];
                if (((!(_local_3)) || (ToolKit.isBigThan(_arg_1.holeNum, _local_3))))
                {
                    featherSetButton.enabled = false;
                    return;
                };
                _local_4 = int(((int(int((_arg_1.holeNum / 10)))) || (0)));
                _local_5 = ((int((_arg_1.holeNum % 10))) || (0));
                if (((_local_4 < _local_5) || ((_local_4 - _local_5) > 1)))
                {
                    return;
                };
                _local_6 = 1;
                while (_local_6 <= 10)
                {
                    this[("feather" + _local_6)].clean();
                    if (_local_6 <= (_local_4 + _local_5))
                    {
                        this[("feather" + _local_6)].enabled = true;
                        this[("feather" + _local_6)].selected = false;
                        if (ToolKit.isBigThan(_arg_1[("t" + _local_6)], 0))
                        {
                            _local_7 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_arg_1[("t" + _local_6)]];
                            if (_local_7)
                            {
                                _local_2[(_local_6 % 2)][("p" + _local_7.type)]--;
                                this[("feather" + _local_6)].type = GamePredef.TBL_ITEM_TEMPLATE;
                                this[("feather" + _local_6)].giid = _arg_1[("t" + _local_6)];
                                _local_8 = 1;
                                while (_local_8 <= 3)
                                {
                                    if (_local_7[("i" + _local_8)] > 0)
                                    {
                                        _local_2[(_local_6 % 2)][_local_7[("i" + _local_8)]] = true;
                                    };
                                    _local_8++;
                                };
                            };
                        };
                    }
                    else
                    {
                        this[("feather" + _local_6)].clean();
                        this[("feather" + _local_6)].enabled = false;
                    };
                    _local_6++;
                };
                canPutPropOfFeathers = _local_2;
            };
        }

        public function __mixLuckyItem_dragDrop(_arg_1:DragEvent):void
        {
            setMixRate();
        }

        [Bindable(event="propertyChange")]
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        override public function initialize():void
        {
            var target:WingFuncPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WingFuncPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WingFuncPanelWatcherSetupUtil");
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
        public function get bindMain():ItemSlotEquFunc
        {
            return (this._939276182bindMain);
        }

        [Bindable(event="propertyChange")]
        public function get curBindProp():TextArea
        {
            return (this._2085845920curBindProp);
        }

        public function ___WingFuncPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            openAdvancedJoin();
        }

        private function onFeatherDel(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                featherSetEquChange(null);
                _core.sysBlueMsg(Language.WING_PANEL_U[76]);
            }
            else
            {
                _core.sysBlueMsg(Language.WING_PANEL_U[77]);
            };
        }

        public function onJoin(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:ISlot;
            if (_arg_1)
            {
                if (_arg_1.f)
                {
                    _local_2 = 1;
                    while (_local_2 <= 4)
                    {
                        this[("joinWing" + _local_2)].clean();
                        this[("wingPreview" + _local_2)].clean();
                        _local_2++;
                    };
                    wingPreview5.clean();
                    _core.sysMidNote(Language.WING_PANEL_U[19]);
                    _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.i] = _arg_1.n;
                    if (ToolKit.isEqual(joinMain.slotData.id, _arg_1.e))
                    {
                        joinMain.giid = _arg_1.i;
                    };
                    _local_3 = _core.view.getSlot(_arg_1.sid);
                    if (_local_3)
                    {
                        _local_3.giid = _arg_1.i;
                    };
                }
                else
                {
                    _core.sysMidNote(Language.WING_PANEL_U[10]);
                    joinViewClear();
                    joinButton.enabled = true;
                };
            };
        }

        public function __featherMixAutoPutBtn_click(_arg_1:MouseEvent):void
        {
            autoPutFeatherMix();
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

        private function mixLuckyItemChange(_arg_1:GameEvent):void
        {
            if (mixLuckyItem.slotData)
            {
            };
        }

        [Bindable(event="propertyChange")]
        public function get isFirst():String
        {
            return (this._2058846118isFirst);
        }

        public function set bindButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._405165519bindButton;
            if (_local_2 !== _arg_1)
            {
                this._405165519bindButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bindButton", _local_2, _arg_1));
            };
        }

        public function showNewWingPro(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:Object):void
        {
            curLevel.htmlText = (((Language.WING_PANEL_U[125] + " <font color='#00ff00'>") + _arg_1) + "</font>");
            curSpeed.htmlText = (((Language.WING_PANEL_U[119] + " <font color='#00ff00'>") + _arg_4.mainPropNum1) + ((_arg_2.mainPropNum1) ? (("+" + _arg_2.mainPropNum1) + "%</font>") : "</font>"));
            curLife.htmlText = (((Language.WING_PANEL_U[120] + " <font color='#00ff00'>") + _arg_4.mainPropNum2) + ((_arg_2.mainPropNum2) ? (("+" + _arg_2.mainPropNum2) + "%</font>") : "</font>"));
            curPhy.htmlText = (((Language.WING_PANEL_U[121] + " <font color='#00ff00'>") + _arg_4.propNum1) + ((_arg_2.propNum1) ? (("+" + _arg_2.propNum1) + "%</font>") : "</font>"));
            curMagic.htmlText = (((Language.WING_PANEL_U[122] + " <font color='#00ff00'>") + _arg_4.propNum2) + ((_arg_2.propNum2) ? (("+" + _arg_2.propNum2) + "%</font>") : "</font>"));
            if (_arg_1 == 10)
            {
                nextLevel.htmlText = "";
                nextSpeed.htmlText = "";
                nextLife.htmlText = ("  " + Language.WING_PANEL_U[141]);
                nextPhy.htmlText = "";
                nextMagic.htmlText = "";
            }
            else
            {
                nextLevel.htmlText = (((Language.WING_PANEL_U[125] + " <font color='#00ff00'>") + (_arg_1 + 1)) + "</font>");
                nextSpeed.htmlText = (((Language.WING_PANEL_U[119] + " <font color='#00ff00'>") + _arg_4.mainPropNum1) + ((_arg_3.mainPropNum1) ? (("+" + _arg_3.mainPropNum1) + "%</font>") : "</font>"));
                nextLife.htmlText = (((Language.WING_PANEL_U[120] + " <font color='#00ff00'>") + _arg_4.mainPropNum2) + ((_arg_3.mainPropNum2) ? (("+" + _arg_3.mainPropNum2) + "%</font>") : "</font>"));
                nextPhy.htmlText = (((Language.WING_PANEL_U[121] + " <font color='#00ff00'>") + _arg_4.propNum1) + ((_arg_3.propNum1) ? (("+" + _arg_3.propNum1) + "%</font>") : "</font>"));
                nextMagic.htmlText = (((Language.WING_PANEL_U[122] + " <font color='#00ff00'>") + _arg_4.propNum2) + ((_arg_3.propNum2) ? (("+" + _arg_3.propNum2) + "%</font>") : "</font>"));
            };
        }

        public function __featherUpButtonAll_click(_arg_1:MouseEvent):void
        {
            subFeatherUp(false);
        }

        private function featherMixChange(_arg_1:GameEvent):void
        {
            var _local_3:Object;
            var _local_4:ItemSlot;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:Object;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.slotData)
            {
                if (_local_2.tempBagFlag)
                {
                    _local_3 = _core.getTemplateData(_local_2.slotData.ti, _local_2.slotData.ii, false);
                }
                else
                {
                    _local_3 = _core.getTemplateData(_local_2.slotData.type, _local_2.slotData.itemId, false);
                };
                _local_4 = this[("req" + _local_2.id)];
                if ((((_local_3) && (_local_4)) && (ToolKit.isEqual(_local_4.giid, _local_3.id))))
                {
                    if (mixFormular.slotData)
                    {
                        if (mixFormular.tempBagFlag)
                        {
                            _local_5 = _core.getTemplateData(mixFormular.slotData.ti, mixFormular.slotData.ii, false);
                        }
                        else
                        {
                            _local_5 = _core.getTemplateData(mixFormular.slotData.type, mixFormular.slotData.itemId, false);
                        };
                        if (_local_5)
                        {
                            if (ToolKit.isEqual(_local_5.type, GamePredef.ITEM_TYPE_FEATHER_MIX))
                            {
                                _local_6 = 1;
                                for (;_local_6 <= 2;_local_6++)
                                {
                                    if (this[("reqMixItem" + _local_6)].giid > 0)
                                    {
                                        if (this[("MixItem" + _local_6)].slotData)
                                        {
                                            if (this[("MixItem" + _local_6)].tempBagFlag)
                                            {
                                                _local_8 = _core.getTemplateData(this[("MixItem" + _local_6)].slotData.ti, this[("MixItem" + _local_6)].slotData.ii, false);
                                            }
                                            else
                                            {
                                                _local_8 = _core.getTemplateData(this[("MixItem" + _local_6)].slotData.type, this[("MixItem" + _local_6)].slotData.itemId, false);
                                            };
                                            if (((_local_8) && (ToolKit.isEqual(_local_8.id, this[("reqMixItem" + _local_6)].giid)))) continue;
                                        };
                                        mixButton.enabled = false;
                                        return;
                                    };
                                };
                                _local_7 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_5.nextJewelTid];
                                if (_local_7)
                                {
                                    setMixRate();
                                };
                            }
                            else
                            {
                                mixFormular.clean();
                            };
                        };
                    };
                }
                else
                {
                    _core.sysMidNote(Language.WING_PANEL_U[92]);
                    _local_2.clean();
                    return;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get showBag():BasicGlowButton
        {
            return (this._2067262411showBag);
        }

        public function __feather2_doubleClick(_arg_1:MouseEvent):void
        {
            subFeatherDel(2);
        }

        private function initMixFormularList():void
        {
            var obj:Object;
            var sortFunc:Function;
            var formularTempData:Object = _core.data.gameDataIndex3[GamePredef.TBL_ITEM_TEMPLATE][GamePredef.ITEM_TYPE_FEATHER_MIX];
            var formularArr:Array = [];
            for each (obj in formularTempData)
            {
                formularArr.push({
                    "label":obj.name.substr(0, (String(obj.name).length - 2)),
                    "data":obj
                });
            };
            sortFunc = function (_arg_1:Object, _arg_2:Object):int
            {
                return (Number(_arg_1.data.id) - Number(_arg_2.data.id));
            };
            formularArr = formularArr.sort(sortFunc);
            formularList.dataProvider = formularArr;
        }

        public function set holeMoney(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1213936608holeMoney;
            if (_local_2 !== _arg_1)
            {
                this._1213936608holeMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeMoney", _local_2, _arg_1));
            };
        }

        public function onBuyItem(_arg_1:*):void
        {
            _core.remote.call("buyCritItem", null, Number(_arg_1));
        }

        private function openAdvancedJoin():void
        {
            _core.view.getUI(ViewManager.PANEL_WING_ADVANCED).show();
        }

        public function set feather2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058705feather2;
            if (_local_2 !== _arg_1)
            {
                this._291058705feather2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather2", _local_2, _arg_1));
            };
        }

        public function set curSpeed(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._547091943curSpeed;
            if (_local_2 !== _arg_1)
            {
                this._547091943curSpeed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curSpeed", _local_2, _arg_1));
            };
        }

        private function prefixEquChange(_arg_1:GameEvent):void
        {
            var _local_2:Object;
            var _local_3:*;
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:int;
            var _local_9:String;
            var _local_10:Array;
            var _local_11:Array;
            var _local_12:String;
            var _local_13:Object;
            var _local_14:Object;
            var _local_15:Object;
            if (prefixMain.slotData)
            {
                _local_2 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][prefixMain.slotData.itemId];
                _local_3 = GamePredef.EQUIPT_STAR_NUM[_local_2.upgradeNum];
                _local_4 = _core.getTemplateData(prefixMain.slotData.type, prefixMain.slotData.itemId, false);
                if (((_local_4) && (_local_2)))
                {
                    _local_5 = GamePredef.WING_PREFIX_ITEM_NUM[_local_2.color];
                    if (!_local_5)
                    {
                        _core.sysMidNote(Language.WING_PANEL_U[48]);
                        prefixViewClear();
                        return;
                    };
                    prefixItemNumTip.htmlText = String(Language.WING_PANEL_U[40]).replace("{num}", _local_5);
                    prefixItemRequire.type = GamePredef.TBL_ITEM_TEMPLATE;
                    prefixItemRequire.giid = GamePredef.WING_PREFIX_ITEM_ID;
                    prefixItemRequire.stackNum = _local_5;
                    prefixMoney.text = GamePredef.MONEY_EQUFUNC_ACTIVE.toString();
                    curPrefixProp.htmlText = (((((((((((((((((((((((((((((((Language.WING_PANEL_U[53] + Language.WING_PANEL_U[56]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ":") + int((_local_2.mainPropNum1 * _local_3))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ":") + int((_local_2.mainPropNum2 * _local_3))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop1]) + ":") + _local_2.propNum1) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop2]) + ":") + _local_2.propNum2) + "<br>") + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + _local_2.bindMainPropNum1) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + _local_2.bindMainPropNum2) + "%");
                    _local_6 = (_local_2.color * 5);
                    _local_8 = 0;
                    if (((_local_2.flag) && (_local_2.flag.indexOf("level") >= 0)))
                    {
                        _local_9 = _local_2.flag;
                        _local_9 = _local_9.substring(_local_9.indexOf("level"));
                        _local_10 = _local_9.split(",");
                        _local_11 = _local_10[0].split(":");
                        _local_12 = _local_11[1].split('"').join("");
                        _local_8 = int(_local_12);
                    };
                    if (GamePredef.EQUIPT_QUALITY[_local_6])
                    {
                        _local_7 = GamePredef.EQUIPT_QUALITY[_local_6];
                        if (_local_8)
                        {
                            _local_13 = GamePredef.WING_PRO_TOTAL_ADD[(_local_8 - 1)];
                            maxPrefixProp.htmlText = (((((((((((((((((((((((((((((((Language.WING_PANEL_U[55] + Language.WING_PANEL_U[56]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ":") + int((Math.round(((_local_4.mainPropNum1 * _local_7) * _local_13.mainPropNum1)) * _local_3))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ":") + int((Math.round(((_local_4.mainPropNum2 * _local_7) * _local_13.mainPropNum2)) * _local_3))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop1]) + ":") + Math.round(((_local_4.propNum1 * _local_7) * _local_13.propNum1))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop2]) + ":") + Math.round(((_local_4.propNum2 * _local_7) * _local_13.propNum2))) + "<br>") + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + Math.round((_local_4.bindPropNum * _local_7))) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + Math.round((_local_4.bindPropNum * _local_7))) + "%");
                        }
                        else
                        {
                            maxPrefixProp.htmlText = (((((((((((((((((((((((((((((((Language.WING_PANEL_U[55] + Language.WING_PANEL_U[56]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ":") + int(Math.round(((_local_4.mainPropNum1 * _local_7) * _local_3)))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ":") + int(Math.round(((_local_4.mainPropNum2 * _local_7) * _local_3)))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop1]) + ":") + Math.round((_local_4.propNum1 * _local_7))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop2]) + ":") + Math.round((_local_4.propNum2 * _local_7))) + "<br>") + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + Math.round((_local_4.bindPropNum * _local_7))) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + Math.round((_local_4.bindPropNum * _local_7))) + "%");
                        };
                    };
                    if (((prefixItem.slotData) && (prefixItem.slotData.type == GamePredef.TBL_ITEM_INSTANCE)))
                    {
                        _local_14 = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][prefixItem.slotData.itemId];
                        _local_15 = _core.getTemplateData(prefixItem.slotData.type, prefixItem.slotData.itemId, false);
                        if (((_local_14) && (_local_15)))
                        {
                            if (((ToolKit.isEqual(_local_15.id, GamePredef.WING_PREFIX_ITEM_ID)) && (ToolKit.isBigOrEqual(prefixItem.slotData.stackNum, _local_5))))
                            {
                                prefixButton.enabled = true;
                                return;
                            };
                        };
                    };
                };
            };
            prefixButton.enabled = false;
        }

        private function _WingFuncPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wTitle.text = _arg_1;
            }, "wTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Canvas1.label = _arg_1;
            }, "_WingFuncPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_MAGIC_WEAPON);
            }, function (_arg_1:Object):void
            {
                _WingFuncPanel_Image1.source = _arg_1;
            }, "_WingFuncPanel_Image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introText.htmlText = _arg_1;
            }, "introText.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                joinMain.acceptObj = _arg_1;
            }, "joinMain.acceptObj");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                joinButton.label = _arg_1;
            }, "joinButton.label");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                joinWing1.acceptObj = _arg_1;
            }, "joinWing1.acceptObj");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                joinWing2.acceptObj = _arg_1;
            }, "joinWing2.acceptObj");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                joinWing3.acceptObj = _arg_1;
            }, "joinWing3.acceptObj");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                joinWing4.acceptObj = _arg_1;
            }, "joinWing4.acceptObj");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton1.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton1.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton2.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton2.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton3.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton3.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.WING_PANEL_U[16] + 1);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton4.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton4.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.WING_PANEL_U[16] + 2);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton5.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton5.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.WING_PANEL_U[16] + 3);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton6.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton6.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.WING_PANEL_U[16] + 4);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton7.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton7.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.WING_PANEL_U[16] + 5);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton8.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton8.label");
            result[17] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                wingPreview1.acceptObj = _arg_1;
            }, "wingPreview1.acceptObj");
            result[18] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                wingPreview2.acceptObj = _arg_1;
            }, "wingPreview2.acceptObj");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                wingPreview3.acceptObj = _arg_1;
            }, "wingPreview3.acceptObj");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                wingPreview4.acceptObj = _arg_1;
            }, "wingPreview4.acceptObj");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                wingPreview5.acceptObj = _arg_1;
            }, "wingPreview5.acceptObj");
            result[22] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (advanceJoinEnable);
            }, function (_arg_1:Boolean):void
            {
                _WingFuncPanel_BasicGlowButton2.visible = _arg_1;
            }, "_WingFuncPanel_BasicGlowButton2.visible");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicGlowButton2.label = _arg_1;
            }, "_WingFuncPanel_BasicGlowButton2.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introText1.htmlText = _arg_1;
            }, "introText1.htmlText");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton9.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton9.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton10.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton10.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton11.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton11.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Label4.text = _arg_1;
            }, "_WingFuncPanel_Label4.text");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                prefixMain.acceptObj = _arg_1;
            }, "prefixMain.acceptObj");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                prefixItem.slotType = _arg_1;
            }, "prefixItem.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prefixButton.label = _arg_1;
            }, "prefixButton.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introText2.htmlText = _arg_1;
            }, "introText2.htmlText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton12.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton12.label");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton13.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton13.label");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WING_PANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton14.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton14.label");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Label7.text = _arg_1;
            }, "_WingFuncPanel_Label7.text");
            result[37] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                bindMain.acceptObj = _arg_1;
            }, "bindMain.acceptObj");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                bindItem.slotType = _arg_1;
            }, "bindItem.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bindButton.label = _arg_1;
            }, "bindButton.label");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introText3.htmlText = _arg_1;
            }, "introText3.htmlText");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton15.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton15.label");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton16.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton16.label");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton17.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton17.label");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Label10.text = _arg_1;
            }, "_WingFuncPanel_Label10.text");
            result[45] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                holeMain.acceptObj = _arg_1;
            }, "holeMain.acceptObj");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                holeItem.slotType = _arg_1;
            }, "holeItem.slotType");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                holeButton.label = _arg_1;
            }, "holeButton.label");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[82];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introText4.htmlText = _arg_1;
            }, "introText4.htmlText");
            result[49] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                starMain.acceptObj = _arg_1;
            }, "starMain.acceptObj");
            result[50] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                starItem.slotType = _arg_1;
            }, "starItem.slotType");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                starAllButton.label = _arg_1;
            }, "starAllButton.label");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                starOneButton.label = _arg_1;
            }, "starOneButton.label");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[60];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton20.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton20.label");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton21.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton21.label");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton22.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton22.label");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton23.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton23.label");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton24.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton24.label");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton25.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton25.label");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[80];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introText5.htmlText = _arg_1;
            }, "introText5.htmlText");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[65];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton26.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton26.label");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[66];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton27.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton27.label");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton28.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton28.label");
            result[63] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                featherUpMain.acceptObj = _arg_1;
            }, "featherUpMain.acceptObj");
            result[64] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                featherUpMain.slotType = _arg_1;
            }, "featherUpMain.slotType");
            result[65] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"types":{"518":true}});
            }, function (_arg_1:Object):void
            {
                featherUpItem.acceptObj = _arg_1;
            }, "featherUpItem.acceptObj");
            result[66] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                featherUpItem.slotType = _arg_1;
            }, "featherUpItem.slotType");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[67];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                featherUpButtonOne.label = _arg_1;
            }, "featherUpButtonOne.label");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                featherUpButtonAll.label = _arg_1;
            }, "featherUpButtonAll.label");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[81];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introText6.htmlText = _arg_1;
            }, "introText6.htmlText");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton30.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton30.label");
            result[71] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"13":true}});
            }, function (_arg_1:Object):void
            {
                featherSetMain.acceptObj = _arg_1;
            }, "featherSetMain.acceptObj");
            result[72] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                featherSetMain.slotType = _arg_1;
            }, "featherSetMain.slotType");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton31.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton31.label");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton32.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton32.label");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[98];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton33.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton33.label");
            result[76] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather1.acceptObj = _arg_1;
            }, "feather1.acceptObj");
            result[77] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather1.slotType = _arg_1;
            }, "feather1.slotType");
            result[78] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather3.acceptObj = _arg_1;
            }, "feather3.acceptObj");
            result[79] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather3.slotType = _arg_1;
            }, "feather3.slotType");
            result[80] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather5.acceptObj = _arg_1;
            }, "feather5.acceptObj");
            result[81] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather5.slotType = _arg_1;
            }, "feather5.slotType");
            result[82] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather7.acceptObj = _arg_1;
            }, "feather7.acceptObj");
            result[83] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather7.slotType = _arg_1;
            }, "feather7.slotType");
            result[84] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather9.acceptObj = _arg_1;
            }, "feather9.acceptObj");
            result[85] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather9.slotType = _arg_1;
            }, "feather9.slotType");
            result[86] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather2.acceptObj = _arg_1;
            }, "feather2.acceptObj");
            result[87] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather2.slotType = _arg_1;
            }, "feather2.slotType");
            result[88] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather4.acceptObj = _arg_1;
            }, "feather4.acceptObj");
            result[89] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather4.slotType = _arg_1;
            }, "feather4.slotType");
            result[90] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather6.acceptObj = _arg_1;
            }, "feather6.acceptObj");
            result[91] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather6.slotType = _arg_1;
            }, "feather6.slotType");
            result[92] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather8.acceptObj = _arg_1;
            }, "feather8.acceptObj");
            result[93] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather8.slotType = _arg_1;
            }, "feather8.slotType");
            result[94] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                feather10.acceptObj = _arg_1;
            }, "feather10.acceptObj");
            result[95] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                feather10.slotType = _arg_1;
            }, "feather10.slotType");
            result[96] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                featherSetButton.label = _arg_1;
            }, "featherSetButton.label");
            result[97] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[78];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                featherDelButton.label = _arg_1;
            }, "featherDelButton.label");
            result[98] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                mixedFeather.slotType = _arg_1;
            }, "mixedFeather.slotType");
            result[99] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                reqmixFormular.slotType = _arg_1;
            }, "reqmixFormular.slotType");
            result[100] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                mixFormular.slotType = _arg_1;
            }, "mixFormular.slotType");
            result[101] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({
                    "kinds":{"14":true},
                    "types":{"1400":true}
                });
            }, function (_arg_1:Object):void
            {
                mixFormular.acceptObj = _arg_1;
            }, "mixFormular.acceptObj");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[103];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Label11.text = _arg_1;
            }, "_WingFuncPanel_Label11.text");
            result[103] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                mixLuckyItem.slotType = _arg_1;
            }, "mixLuckyItem.slotType");
            result[104] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({
                    "types":{"518":true},
                    "ids":{"3017":true}
                });
            }, function (_arg_1:Object):void
            {
                mixLuckyItem.acceptObj = _arg_1;
            }, "mixLuckyItem.acceptObj");
            result[105] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[102];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                featherMixAutoPutBtn.label = _arg_1;
            }, "featherMixAutoPutBtn.label");
            result[106] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[104];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Label12.text = _arg_1;
            }, "_WingFuncPanel_Label12.text");
            result[107] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                reqMixItem1.slotType = _arg_1;
            }, "reqMixItem1.slotType");
            result[108] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                reqMixItem1.acceptObj = _arg_1;
            }, "reqMixItem1.acceptObj");
            result[109] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                reqMixItem2.slotType = _arg_1;
            }, "reqMixItem2.slotType");
            result[110] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                reqMixItem2.acceptObj = _arg_1;
            }, "reqMixItem2.acceptObj");
            result[111] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[105];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Label13.text = _arg_1;
            }, "_WingFuncPanel_Label13.text");
            result[112] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                MixItem1.slotType = _arg_1;
            }, "MixItem1.slotType");
            result[113] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                MixItem1.acceptObj = _arg_1;
            }, "MixItem1.acceptObj");
            result[114] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                MixItem2.slotType = _arg_1;
            }, "MixItem2.slotType");
            result[115] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"kinds":{"14":true}});
            }, function (_arg_1:Object):void
            {
                MixItem2.acceptObj = _arg_1;
            }, "MixItem2.acceptObj");
            result[116] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton34.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton34.label");
            result[117] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[79];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mixButton.label = _arg_1;
            }, "mixButton.label");
            result[118] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[130];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introText8.htmlText = _arg_1;
            }, "introText8.htmlText");
            result[119] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[123];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Label14.text = _arg_1;
            }, "_WingFuncPanel_Label14.text");
            result[120] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _WingFuncPanel_Label14.filters = _arg_1;
            }, "_WingFuncPanel_Label14.filters");
            result[121] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[124];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_Label15.text = _arg_1;
            }, "_WingFuncPanel_Label15.text");
            result[122] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _WingFuncPanel_Label15.filters = _arg_1;
            }, "_WingFuncPanel_Label15.filters");
            result[123] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[135];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changeViewBox.toolTip = _arg_1;
            }, "changeViewBox.toolTip");
            result[124] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[131];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                funcBtn0.label = _arg_1;
            }, "funcBtn0.label");
            result[125] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[132];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                funcBtn1.label = _arg_1;
            }, "funcBtn1.label");
            result[126] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[137];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wingLabel.text = _arg_1;
            }, "wingLabel.text");
            result[127] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[126];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WingFuncPanel_BasicTxtButton46.label = _arg_1;
            }, "_WingFuncPanel_BasicTxtButton46.label");
            result[128] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                itemInBag.type = _arg_1;
            }, "itemInBag.type");
            result[129] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                itemByBuy.type = _arg_1;
            }, "itemByBuy.type");
            result[130] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[128];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selectCrit.label = _arg_1;
            }, "selectCrit.label");
            result[131] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[127];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buyBtn.label = _arg_1;
            }, "buyBtn.label");
            result[132] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[129];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                growBtn1.label = _arg_1;
            }, "growBtn1.label");
            result[133] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.WING_PANEL_U[142];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                growBtn2.label = _arg_1;
            }, "growBtn2.label");
            result[134] = binding;
            binding = new Binding(this, function ():Object
            {
                return (listArr);
            }, function (_arg_1:Object):void
            {
                wingFuncList.dataProvider = _arg_1;
            }, "wingFuncList.dataProvider");
            result[135] = binding;
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
            result[136] = binding;
            return (result);
        }

        public function __funcBtn1_click(_arg_1:MouseEvent):void
        {
            changePreView(1);
        }

        private function featherUpChange(_arg_1:GameEvent):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:Object;
            if (featherUpMain.slotData)
            {
                _local_2 = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][featherUpMain.slotData.itemId];
                _local_3 = _core.getTemplateData(featherUpMain.slotData.type, featherUpMain.slotData.itemId, false);
                if (((_local_2) && (_local_3)))
                {
                    if (ToolKit.isEqual(_local_3.kind, GamePredef.ITEM_KIND_FEATHER))
                    {
                        if (((ToolKit.isBigThan(_local_3.nextJewelTid, 0)) && (GamePredef.FEATHER_UPDATE_RATE[_local_3.color])))
                        {
                            if (ToolKit.isBigOrEqual(featherUpMain.slotData.stackNum, 5))
                            {
                                featherUpLuckItemNum.minimum = 0;
                                featherUpLuckItemNum.maximum = Math.ceil(((100 - GamePredef.FEATHER_UPDATE_RATE[_local_3.color]) / GamePredef.FEATHER_UPDATE_RATE_ADDPER));
                                if (_core.MC_BIRTH_FLAG[4])
                                {
                                    featherUpLuckItemNum.maximum = Math.ceil(((100 - GamePredef.MC_BIRTH_CONFIG[4][_local_3.color]) / GamePredef.FEATHER_UPDATE_RATE_ADDPER));
                                };
                                _local_4 = GamePredef.FEATHER_UPDATE_RATE[_local_3.color];
                                if (_core.MC_BIRTH_FLAG[4])
                                {
                                    _local_4 = GamePredef.MC_BIRTH_CONFIG[4][_local_3.color];
                                };
                                featherUpButtonOne.enabled = true;
                                featherUpButtonAll.enabled = true;
                                if (featherUpItem.slotData)
                                {
                                    _local_5 = _core.data.gameData[GamePredef.TBL_ITEM_INSTANCE][featherUpItem.slotData.itemId];
                                    _local_6 = _core.getTemplateData(featherUpItem.slotData.type, featherUpItem.slotData.itemId, false);
                                    if (((_local_5) && (_local_6)))
                                    {
                                        featherUpLuckItemNum.value = Math.min(featherUpLuckItemNum.maximum, featherUpLuckItemNum.value, featherUpItem.slotData.stackNum);
                                        if (((ToolKit.isEqual(_local_3.kind, GamePredef.ITEM_KIND_FEATHER)) && (ToolKit.isEqual(_local_6.id, GamePredef.FEATHER_LUCKY_ID))))
                                        {
                                            _local_4 = ToolKit.add(_local_4, (featherUpLuckItemNum.value * GamePredef.FEATHER_UPDATE_RATE_ADDPER));
                                        };
                                    };
                                };
                                featherUpRateInfo.text = (("" + _local_4) + "%");
                            };
                        }
                        else
                        {
                            _core.sysMidNote(Language.WING_PANEL_U[89]);
                            featherUpMain.clean();
                        };
                    };
                };
            };
        }

        private function featherMixViewClear():void
        {
            mixedFeather.clean();
            mixFormular.clean();
            reqmixFormular.clean();
            mixLuckyItem.clean();
            var _local_1:int = 1;
            while (_local_1 <= 2)
            {
                this[("reqMixItem" + _local_1)].clean();
                this[("MixItem" + _local_1)].clean();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get feather4():ItemSlot
        {
            return (this._291058703feather4);
        }

        public function set buyBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1377586698buyBtn;
            if (_local_2 !== _arg_1)
            {
                this._1377586698buyBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buyBtn", _local_2, _arg_1));
            };
        }

        public function set feather1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._291058706feather1;
            if (_local_2 !== _arg_1)
            {
                this._291058706feather1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feather1", _local_2, _arg_1));
            };
        }

        private function setNextWingsPreview(_arg_1:Object):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:Number;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:ItemSlotEquFunc;
            var _local_11:Number;
            var _local_2:Array = [];
            var _local_3:Object = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.main.itemId];
            if (_local_3)
            {
                _local_2[0] = _local_3.tid;
                _local_4 = 1;
                while (_local_4 <= 4)
                {
                    _local_7 = _arg_1[("wing" + _local_4)].itemId;
                    _local_8 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_local_7];
                    if (((_local_8) && (_local_2.indexOf(_local_8.tid) < 0)))
                    {
                        _local_2.push(_local_8.tid);
                    };
                    this[("wingPreview" + _local_4)].clean();
                    _local_4++;
                };
                _local_5 = 1;
                for (_local_6 in _local_2)
                {
                    _local_9 = _core.getTemplateData(GamePredef.TBL_EQUIPT_TEMPLATE, _local_2[_local_6], false);
                    if (_local_9)
                    {
                        _local_10 = this[("wingPreview" + _local_5)];
                        _local_10.type = GamePredef.TBL_EQUIPT_TEMPLATE;
                        _local_10.giid = _local_9.id;
                        _local_11 = (Number(_local_3.color) + 1);
                        _local_10.slotData = {
                            "wingTemp":true,
                            "q":(_local_11 * 5),
                            "b":((isWingBind(_arg_1)) ? 1 : 0),
                            "color":_local_11
                        };
                        _local_10.stackNum = 1;
                        _local_5 = (_local_5 + 1);
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get feather3():ItemSlot
        {
            return (this._291058704feather3);
        }

        public function showNextLevelWing(_arg_1:Number):void
        {
            var _local_2:String = ResManager.getResUrl(_core.player.resCode);
            if (previewCanvas.url != _local_2)
            {
                previewCanvas.url = _local_2;
            };
            previewCanvas.color = _core.player.colorCode;
            previewCanvas.charResCode = _core.player.resCode;
            if (previewCanvas._wingResCode != _arg_1)
            {
                previewCanvas.wingResCode = _arg_1;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

