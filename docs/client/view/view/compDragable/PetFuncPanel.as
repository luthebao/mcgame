// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetFuncPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ItemSlotPet;
    import com.qeedoo.ui.view.comp.FilterButton;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.ItemSlotPetFunc;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.RoundedButton;
    import mx.controls.NumericStepper;
    import mx.controls.ComboBox;
    import com.qeedoo.ui.view.comp.ItemSlotCreBook;
    import com.qeedoo.ui.view.comp.DescriptionLabel;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import mx.core.IUITextField;
    import com.qeedoo.ui.utils.LanguageUtil;
    import flash.net.Responder;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.Event;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.data.GameData;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.event.GameEvent;
    import mx.events.NumericStepperEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.HtmlComboItemRenderer;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.logic.PetLogic;
    import com.qeedoo.ui.resource.ResManager;
    import mx.utils.StringUtil;
    import com.qeedoo.ui.view.comp.FuncBag;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.events.DragEvent;
    import mx.core.DragSource;
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

    public class PetFuncPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1781400170xsdText:TextArea;
        private var _1185484712xsdMaxText:TextArea;
        private var _629176687pzxsdButton:BasicGlowButton;
        private var petBagAdded:Boolean = false;
        private var _1401872577joinPet4:ItemSlotPet;
        private var _1401872580joinPet1:ItemSlotPet;
        private var _113881747xdPet:ItemSlotPet;
        private var _956127762costPet:ItemSlotPet;
        private var _1554141552tabBtn7:FilterButton;
        public var _PetFuncPanel_BasicTxtButton1:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton2:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton3:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton4:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton5:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton6:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton7:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton8:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton9:BasicTxtButton;
        private var _1781714052xsdItem:ItemSlotPetFunc;
        private var _114581tab:ViewStack;
        private var _764513735xdText:TextArea;
        private var _831007910mainPet:ItemSlotPet;
        private var _1822648700seniorPetJoinEnable:Boolean = false;
        private var _1554141557tabBtn2:FilterButton;
        private var _1738198546eatCostText:TextArea;
        private var _298431510bookButton1:BasicGlowButton;
        public var _PetFuncPanel_RoundedButton1:RoundedButton;
        private var _2072290848pzxsdPet:ItemSlotPet;
        private var _1995978421joinButton1:BasicGlowButton;
        private var _510455317luckNum:NumericStepper;
        private var _575911215elementBox:ComboBox;
        private var _1554141553tabBtn6:FilterButton;
        public var _PetFuncPanel_BasicGlowButton9:BasicGlowButton;
        private var _2004323740bookItem:ItemSlotCreBook;
        private var _1315536005starItem:ItemSlotPetFunc;
        private var _750205034xsdPet:ItemSlotPet;
        public var _PetFuncPanel_DescriptionLabel1:DescriptionLabel;
        public var _PetFuncPanel_DescriptionLabel2:DescriptionLabel;
        public var _PetFuncPanel_DescriptionLabel3:DescriptionLabel;
        public var _PetFuncPanel_DescriptionLabel4:DescriptionLabel;
        private var _1554141558tabBtn1:FilterButton;
        public var _PetFuncPanel_Canvas11:Canvas;
        public var _PetFuncPanel_Canvas12:Canvas;
        public var _PetFuncPanel_Canvas1:Canvas;
        public var _PetFuncPanel_Canvas3:Canvas;
        public var _PetFuncPanel_Canvas5:Canvas;
        public var _PetFuncPanel_Canvas7:Canvas;
        public var _PetFuncPanel_Canvas9:Canvas;
        private var _1355904412luckItem:ItemSlotPetFunc;
        private var _1554141554tabBtn5:FilterButton;
        private var _1310692388starButton:BasicGlowButton;
        public var _PetFuncPanel_IntroText1:IntroText;
        public var _PetFuncPanel_IntroText2:IntroText;
        public var _PetFuncPanel_IntroText3:IntroText;
        public var _PetFuncPanel_IntroText4:IntroText;
        public var _PetFuncPanel_IntroText5:IntroText;
        public var _PetFuncPanel_IntroText6:IntroText;
        public var _PetFuncPanel_IntroText7:IntroText;
        public var _PetFuncPanel_IntroText8:IntroText;
        private var _1401872579joinPet2:ItemSlotPet;
        private var _64661878bookPet:ItemSlotPet;
        public var _PetFuncPanel_Image1:Image;
        public var _PetFuncPanel_Image2:Image;
        public var _PetFuncPanel_Image3:Image;
        public var _PetFuncPanel_Image4:Image;
        public var _PetFuncPanel_Image5:Image;
        public var _PetFuncPanel_Image6:Image;
        public var _PetFuncPanel_Image7:Image;
        private var _790240513aptType:ComboBox;
        private var _1554141559tabBtn0:FilterButton;
        private var petList:Object;
        private var _1897219731starPet:ItemSlotPet;
        private var _1265723739xsdButton:BasicGlowButton;
        public var autoMatchSlots:Array;
        private var firstTimeFlag:int = 0;
        private var _1007683640pTitle:BasicTitleCanvas;
        private var _758955714xdButton:BasicGlowButton;
        private var _1791424045starClearButton:BasicGlowButton;
        private var _1554141555tabBtn4:FilterButton;
        private var _183687630pzxsdItem:ItemSlotPetFunc;
        private var _1709333476joinMainPet:ItemSlotPet;
        private var _1315530272starInfo:Label;
        private var _1402072840joinInfo:Label;
        private var _2140516866eatMainText:TextArea;
        private var _1401872578joinPet3:ItemSlotPet;
        private var _764833350xdInfo:Label;
        private var _1034217724joinButton:BasicGlowButton;
        private var _2067262411showBag:BasicGlowButton;
        private var _1781719785xsdInfo:Label;
        private var _673408233elementCost:Label;
        private var _575924355elementPet:ItemSlotPet;
        public var _PetFuncPanel_BasicTxtButton10:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton11:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton12:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton13:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton14:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton15:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton16:BasicTxtButton;
        public var _PetFuncPanel_BasicTxtButton17:BasicTxtButton;
        private var _1710110426eatRateInfo:Label;
        private var _764827617xdItem:ItemSlotPetFunc;
        private var _183693363pzxsdInfo:Label;
        private var _273016654starSafeItem:ItemSlotPetFunc;
        private var _1810742139bookButton:DelayButton;
        private var _183373748pzxsdText:TextArea;
        public var _PetFuncPanel_Label7:Label;
        public var _PetFuncPanel_Label8:Label;
        private var _1554141556tabBtn3:FilterButton;
        private var starNum:int;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":459,
                    "height":343,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pTitle"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tab",
                        "events":{"mouseDown":"__tab_mouseDown"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "tabEnabled":false,
                                "creationPolicy":"all",
                                "x":0,
                                "y":60,
                                "height":283,
                                "width":454,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_PetFuncPanel_Canvas1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetFuncPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":127,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "width":432,
                                                        "height":266,
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_PetFuncPanel_IntroText1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":102,
                                                                    "y":7,
                                                                    "width":412,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"starPet",
                                                            "events":{"click":"__starPet_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":155,
                                                                    "movable":false,
                                                                    "x":93.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"starButton",
                                                            "events":{"click":"__starButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":226.2,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":141,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"starClearButton",
                                                            "events":{"click":"__starClearButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":226.2,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":202,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPetFunc,
                                                            "id":"starItem",
                                                            "events":{"click":"__starItem_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":155,
                                                                    "movable":false,
                                                                    "x":267.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPetFunc,
                                                            "id":"starSafeItem",
                                                            "events":{"click":"__starSafeItem_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":155,
                                                                    "movable":false,
                                                                    "x":180
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"starInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":194.5,
                                                                    "text":"",
                                                                    "x":128
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":163,
                                                                    "y":123,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":123,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":252,
                                                                    "y":123,
                                                                    "width":66,
                                                                    "height":18
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
                                    "id":"_PetFuncPanel_Canvas3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetFuncPanel_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":138,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":432,
                                                        "height":266,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_PetFuncPanel_IntroText2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":108,
                                                                    "y":7,
                                                                    "width":412,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"joinMainPet",
                                                            "events":{"click":"__joinMainPet_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":161.5,
                                                                    "movable":false,
                                                                    "x":191.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"joinButton",
                                                            "events":{"click":"__joinButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":231,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":181,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"joinButton1",
                                                            "events":{"click":"__joinButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":231,
                                                                    "styleName":"CrystalYellowButton",
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"joinInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-4";
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":205.7});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"joinPet1",
                                                            "events":{"click":"__joinPet1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":146.5,
                                                                    "movable":false,
                                                                    "x":102.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"joinPet2",
                                                            "events":{"click":"__joinPet2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":186.5,
                                                                    "movable":false,
                                                                    "x":102.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"joinPet3",
                                                            "events":{"click":"__joinPet3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":146.5,
                                                                    "movable":false,
                                                                    "x":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"joinPet4",
                                                            "events":{"click":"__joinPet4_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":186.5,
                                                                    "movable":false,
                                                                    "x":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":103,
                                                                    "y":123,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":188,
                                                                    "y":123,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":275,
                                                                    "y":123,
                                                                    "width":38,
                                                                    "height":18
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
                                    "id":"_PetFuncPanel_Canvas5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetFuncPanel_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":146,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":432,
                                                        "height":266,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_PetFuncPanel_IntroText3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":97,
                                                                    "y":7,
                                                                    "width":412,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"xsdPet",
                                                            "events":{"click":"__xsdPet_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":159,
                                                                    "movable":false,
                                                                    "x":112
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"xsdButton",
                                                            "events":{"click":"__xsdButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":226.5,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":189,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPetFunc,
                                                            "id":"xsdItem",
                                                            "events":{"click":"__xsdItem_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":159,
                                                                    "movable":false,
                                                                    "x":286
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"xsdInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":203,
                                                                    "x":189
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"xsdText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.backgroundAlpha = 0;
                                                                this.color = 1961723;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":115,
                                                                    "height":90,
                                                                    "width":105,
                                                                    "x":162,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"xsdMaxText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.backgroundAlpha = 0;
                                                                this.color = 0xFF0000;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":115,
                                                                    "height":90,
                                                                    "width":105,
                                                                    "x":10,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":112,
                                                                    "y":127,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":278,
                                                                    "y":127,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DescriptionLabel,
                                                            "id":"_PetFuncPanel_DescriptionLabel1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":89,
                                                                    "y":201
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
                                    "id":"_PetFuncPanel_Canvas7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetFuncPanel_Image4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":146,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":432,
                                                        "height":266,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_PetFuncPanel_IntroText4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":104,
                                                                    "y":7,
                                                                    "width":412,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"pzxsdPet",
                                                            "events":{"click":"__pzxsdPet_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":161,
                                                                    "movable":false,
                                                                    "x":115
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"pzxsdButton",
                                                            "events":{"click":"__pzxsdButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":228.5,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":192,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPetFunc,
                                                            "id":"pzxsdItem",
                                                            "events":{"click":"__pzxsdItem_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":161,
                                                                    "movable":false,
                                                                    "x":289
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"pzxsdInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":205,
                                                                    "x":192
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"pzxsdText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.backgroundAlpha = 0;
                                                                this.color = 1961723;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":117,
                                                                    "height":90,
                                                                    "width":105,
                                                                    "editable":false,
                                                                    "x":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":115,
                                                                    "y":129,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":283,
                                                                    "y":129,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DescriptionLabel,
                                                            "id":"_PetFuncPanel_DescriptionLabel2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":92,
                                                                    "y":203
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
                                    "id":"_PetFuncPanel_Canvas9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetFuncPanel_Image5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":432,
                                                        "height":266,
                                                        "styleName":"CanvasBorder",
                                                        "x":12,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_PetFuncPanel_IntroText5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":102,
                                                                    "y":7,
                                                                    "width":412,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"xdPet",
                                                            "events":{"click":"__xdPet_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":164,
                                                                    "movable":false,
                                                                    "x":114
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"xdButton",
                                                            "events":{"click":"__xdButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":231.5,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":191,
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedButton,
                                                            "id":"_PetFuncPanel_RoundedButton1",
                                                            "events":{"click":"___PetFuncPanel_RoundedButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "0";
                                                                this.bottom = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnRed",
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPetFunc,
                                                            "id":"xdItem",
                                                            "events":{"click":"__xdItem_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":164,
                                                                    "movable":false,
                                                                    "x":288
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"xdInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 14026246;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":208,
                                                                    "x":191
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"xdText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.backgroundAlpha = 0;
                                                                this.color = 1961723;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":120,
                                                                    "height":90,
                                                                    "width":105,
                                                                    "editable":false,
                                                                    "x":164
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":114,
                                                                    "y":132,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":283,
                                                                    "y":132,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DescriptionLabel,
                                                            "id":"_PetFuncPanel_DescriptionLabel3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":91,
                                                                    "y":206
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
                                    "id":"_PetFuncPanel_Canvas11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetFuncPanel_Image6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SimpleCanvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "width":432,
                                                        "height":266,
                                                        "x":12,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_PetFuncPanel_IntroText6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":110,
                                                                    "y":7,
                                                                    "width":412,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"bookPet",
                                                            "events":{"click":"__bookPet_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":161
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotCreBook,
                                                            "id":"bookItem",
                                                            "events":{"click":"__bookItem_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "movable":false,
                                                                    "x":287,
                                                                    "y":161
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"bookButton",
                                                            "events":{"click":"__bookButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":228.5,
                                                                    "enabled":false,
                                                                    "styleName":"BtnStdRed",
                                                                    "x":189,
                                                                    "width":51,
                                                                    "clickDelay":2000
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":128,
                                                                    "width":66,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":278,
                                                                    "y":128,
                                                                    "width":66,
                                                                    "height":18
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
                                    "id":"_PetFuncPanel_Canvas12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetFuncPanel_Image7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":148,
                                                        "y":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SimpleCanvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "width":432,
                                                        "height":266,
                                                        "x":12,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_PetFuncPanel_IntroText7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":108,
                                                                    "y":7,
                                                                    "width":412,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"mainPet",
                                                            "events":{"click":"__mainPet_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":144,
                                                                    "y":159,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"costPet",
                                                            "events":{"click":"__costPet_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":258,
                                                                    "y":159,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPetFunc,
                                                            "id":"luckItem",
                                                            "events":{"click":"__luckItem_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":159,
                                                                    "movable":false,
                                                                    "x":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":NumericStepper,
                                                            "id":"luckNum",
                                                            "events":{"change":"__luckNum_change"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":195,
                                                                    "minimum":0,
                                                                    "maximum":5,
                                                                    "width":40,
                                                                    "x":198,
                                                                    "value":5,
                                                                    "visible":false,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton15",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":138,
                                                                    "y":127,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton16",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":258,
                                                                    "y":127,
                                                                    "width":38,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_PetFuncPanel_BasicTxtButton17",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":190.5,
                                                                    "y":127,
                                                                    "width":50,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"eatRateInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":249,
                                                                    "y":232.5,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"eatMainText",
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
                                                                    "y":116,
                                                                    "height":90,
                                                                    "width":110,
                                                                    "x":41,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"eatCostText",
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
                                                                    "y":116,
                                                                    "height":90,
                                                                    "width":95,
                                                                    "x":298,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DescriptionLabel,
                                                            "id":"_PetFuncPanel_DescriptionLabel4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":109,
                                                                    "y":201
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"bookButton1",
                                                            "events":{"click":"__bookButton1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":190,
                                                                    "y":226.5,
                                                                    "enabled":true,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ComboBox,
                                                            "id":"aptType",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":68,
                                                                    "y":226.5,
                                                                    "width":120,
                                                                    "rowCount":6
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
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":13,
                                                        "width":430,
                                                        "height":265,
                                                        "styleName":"CanvasBorder",
                                                        "mouseEnabled":false,
                                                        "clipContent":false,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_PetFuncPanel_IntroText8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":410,
                                                                    "height":100,
                                                                    "x":10,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_PetFuncPanel_Label7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":115});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotPet,
                                                            "id":"elementPet",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":137,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 0;
                                                                this.verticalAlign = "middle";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":180,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_PetFuncPanel_Label8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ComboBox,
                                                                        "id":"elementBox",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":95,
                                                                                "rowCount":4,
                                                                                "itemRenderer":_PetFuncPanel_ClassFactory1_c()
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"elementCost",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":205});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_PetFuncPanel_BasicGlowButton9",
                                                            "events":{"click":"___PetFuncPanel_BasicGlowButton9_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":50,
                                                                    "height":23,
                                                                    "y":227
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
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":41,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50,
                                            "height":20,
                                            "selected":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"tabBtn4",
                                    "events":{"click":"__tabBtn4_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"tabBtn5",
                                    "events":{"click":"__tabBtn5_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"tabBtn6",
                                    "events":{"click":"__tabBtn6_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"tabBtn7",
                                    "events":{"click":"__tabBtn7_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":50,
                                            "height":20
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
                                "x":444,
                                "y":100,
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
        public var petBag:Object = {};
        private var _itemList:Object = {
            "val":new Number(-1),
            "type":new Number(-1),
            "idList":new Array()
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetFuncPanel()
        {
            mx_internal::_document = this;
            this.width = 459;
            this.height = 343;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetFuncPanel._watcherSetupUtil = _arg_1;
        }


        private function petStar():void
        {
            var func:Function;
            if (!starPet.slotData)
            {
                return;
            };
            var pet:Object = petList[starPet.slotData.id];
            if (((!(starSafeItem.slotData)) && (pet.upgradeNum >= 8)))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        surePetStar();
                    };
                };
                Alert.show(Language.PETFUNCPANEL_S[55], "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                surePetStar();
            };
        }

        [Bindable(event="propertyChange")]
        public function get bookButton1():BasicGlowButton
        {
            return (this._298431510bookButton1);
        }

        [Bindable(event="propertyChange")]
        public function get xdItem():ItemSlotPetFunc
        {
            return (this._764827617xdItem);
        }

        [Bindable(event="propertyChange")]
        public function get joinMainPet():ItemSlotPet
        {
            return (this._1709333476joinMainPet);
        }

        public function set luckNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._510455317luckNum;
            if (_local_2 !== _arg_1)
            {
                this._510455317luckNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "luckNum", _local_2, _arg_1));
            };
        }

        public function set costPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._956127762costPet;
            if (_local_2 !== _arg_1)
            {
                this._956127762costPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "costPet", _local_2, _arg_1));
            };
        }

        public function set bookButton1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._298431510bookButton1;
            if (_local_2 !== _arg_1)
            {
                this._298431510bookButton1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bookButton1", _local_2, _arg_1));
            };
        }

        public function __showBag_click(_arg_1:MouseEvent):void
        {
            changeBagVis();
        }

        public function set xdItem(_arg_1:ItemSlotPetFunc):void
        {
            var _local_2:Object = this._764827617xdItem;
            if (_local_2 !== _arg_1)
            {
                this._764827617xdItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xdItem", _local_2, _arg_1));
            };
        }

        public function __bookButton1_click(_arg_1:MouseEvent):void
        {
            petEat();
        }

        public function set pzxsdPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._2072290848pzxsdPet;
            if (_local_2 !== _arg_1)
            {
                this._2072290848pzxsdPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pzxsdPet", _local_2, _arg_1));
            };
        }

        public function set eatCostText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1738198546eatCostText;
            if (_local_2 !== _arg_1)
            {
                this._1738198546eatCostText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eatCostText", _local_2, _arg_1));
            };
        }

        public function set joinMainPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._1709333476joinMainPet;
            if (_local_2 !== _arg_1)
            {
                this._1709333476joinMainPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinMainPet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pzxsdText():TextArea
        {
            return (this._183373748pzxsdText);
        }

        private function dataLoaded(_arg_1:GameDataEvent):void
        {
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), dataLoaded);
            _core.view.getUI(ViewManager.PANEL_PETMANAGER).updateView(_arg_1.data.index);
            _core.view.getUI(ViewManager.PANEL_BAG).petInit();
            joinMainPet.setStyleName(_core.basic.colorByGrowRate(_core.data.getGameData(GamePredef.TBL_PET, _arg_1.data.index).growRate));
        }

        public function set starButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1310692388starButton;
            if (_local_2 !== _arg_1)
            {
                this._1310692388starButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starButton", _local_2, _arg_1));
            };
        }

        public function set starInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1315530272starInfo;
            if (_local_2 !== _arg_1)
            {
                this._1315530272starInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starInfo", _local_2, _arg_1));
            };
        }

        public function set starClearButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1791424045starClearButton;
            if (_local_2 !== _arg_1)
            {
                this._1791424045starClearButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starClearButton", _local_2, _arg_1));
            };
        }

        public function __starPet_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(starPet);
        }

        public function __joinPet4_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(joinPet4);
        }

        private function onPetEat(result:Object=null):void
        {
            var petData:Object;
            var aptType:int;
            var propName:String;
            var prop:String;
            var propEx:String;
            var newValue:Number;
            var oldValue:Number;
            var color:String;
            var popStr:String;
            var yesAlert:String;
            var noAlert:String;
            var ensureFunc:Function;
            var alert:Alert;
            var tf:IUITextField;
            if (!result)
            {
                return;
            };
            eatRateInfo.htmlText = result.msg;
            aptType.selectedIndex = 0;
            if (result.costItem)
            {
                luckItem.stackNum = (luckItem.stackNum - result.costItem);
                if (luckItem.stackNum <= 0)
                {
                    luckItem.clean();
                    luckNum.visible = false;
                };
            };
            if (result.costPet)
            {
                costPet.clean();
                eatCostText.htmlText = "";
            };
            if (result.succ)
            {
                if (mainPet.slotData)
                {
                    mainPet.slotData[result.propName] = result.value;
                    _refreshMainPetText();
                };
            };
            if (((result.hasOwnProperty("isHint")) && (result.isHint)))
            {
                if (((mainPet.slotData) && (mainPet.slotData.id == result.petId)))
                {
                    petData = mainPet.slotData;
                    aptType = result.aptType;
                    propName = Language.PETFUNCPANEL_S[62][aptType];
                    prop = Language.PETFUNCPANEL_S[61][aptType];
                    propEx = (prop + Language.PETFUNCPANEL_S[63]);
                    newValue = result.value;
                    oldValue = petData[propEx];
                    color = ((newValue >= oldValue) ? "#00FF00" : "#FF0000");
                    popStr = (("<b>" + Language.PETFUNCPANEL_S[60]) + "</b>\n\n");
                    popStr = (popStr + LanguageUtil.replace(Language.PETFUNCPANEL_S[64], {
                        "propName":propName,
                        "prop":petData[prop],
                        "oldValue":oldValue,
                        "color":color,
                        "newValue":newValue
                    }));
                    yesAlert = Alert.yesLabel;
                    noAlert = Alert.noLabel;
                    ensureFunc = function (_arg_1:CloseEvent):void
                    {
                        Alert.yesLabel = yesAlert;
                        Alert.noLabel = noAlert;
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("ensurePetEat", new Responder(onPetEat), petData.id);
                        };
                    };
                    Alert.yesLabel = Language.PETFUNCPANEL_S[65];
                    Alert.noLabel = Language.PETFUNCPANEL_S[66];
                    alert = Alert.show(LanguageUtil.html2PlainText(popStr), Language.PETFUNCPANEL_S[60], 3, null, ensureFunc);
                    tf = alert.mx_internal::alertForm.mx_internal::textField;
                    tf.filters = GamePredef.FILTER_TEXT1;
                    tf.htmlText = popStr;
                };
            };
        }

        private function petXd():void
        {
            if (((xdPet.slotData) && (xdItem.slotData)))
            {
                _core.remote.call("petXd", new Responder(onXd), xdPet.slotData.id, xdItem.slotData.id);
                xdButton.enabled = false;
            };
        }

        private function starViewClear():void
        {
            starPet.clean();
            starItem.clean();
            starSafeItem.clean();
            starInfo.htmlText = "";
        }

        private function petPzXsd():void
        {
            if (((pzxsdPet.slotData) && (pzxsdItem.slotData)))
            {
                _core.remote.call("petPzXsd", new Responder(onPzXsd), pzxsdPet.slotData.id, pzxsdItem.slotData.id);
                pzxsdButton.enabled = false;
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get elementPet():ItemSlotPet
        {
            return (this._575924355elementPet);
        }

        [Bindable(event="propertyChange")]
        public function get starItem():ItemSlotPetFunc
        {
            return (this._1315536005starItem);
        }

        public function set pzxsdItem(_arg_1:ItemSlotPetFunc):void
        {
            var _local_2:Object = this._183687630pzxsdItem;
            if (_local_2 !== _arg_1)
            {
                this._183687630pzxsdItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pzxsdItem", _local_2, _arg_1));
            };
        }

        public function __joinButton_click(_arg_1:MouseEvent):void
        {
            petJoin();
        }

        private function _showAlertMsg(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String):String
        {
            var _local_7:String;
            var _local_5:* = (("<b  >" + _arg_1) + "</b>");
            var _local_6:* = "";
            if (Number(_arg_4) > Number(_arg_3))
            {
                _local_7 = "<font color='#00ff00'>";
                _local_6 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[106]) + "</font>");
            }
            else
            {
                if (Number(_arg_4) < Number(_arg_3))
                {
                    _local_7 = "<font color='#ff0000'>";
                    _local_6 = (("<font color='#ff0000'>" + Language.EQUIPTFUNCPANEL_S[107]) + "</font>");
                }
                else
                {
                    _local_7 = "<font color='#00ff00'>";
                    _local_6 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[108]) + "</font>");
                };
            };
            _local_5 = (_local_5 + (((((_arg_2 + _arg_3) + Language.EQUIPTFUNCPANEL_S[129]) + _local_7) + _arg_4) + "</font>"));
            _local_5 = (_local_5 + _local_6);
            return (_local_5);
        }

        public function ___PetFuncPanel_RoundedButton1_click(_arg_1:MouseEvent):void
        {
            buyItem(GamePredef.SHOP_TAB_PET);
        }

        public function set xdText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._764513735xdText;
            if (_local_2 !== _arg_1)
            {
                this._764513735xdText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xdText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get starButton():BasicGlowButton
        {
            return (this._1310692388starButton);
        }

        public function set pzxsdText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._183373748pzxsdText;
            if (_local_2 !== _arg_1)
            {
                this._183373748pzxsdText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pzxsdText", _local_2, _arg_1));
            };
        }

        private function joinViewClear():void
        {
            joinMainPet.clean();
            var _local_1:int = 1;
            while (_local_1 <= 4)
            {
                this[("joinPet" + _local_1)].clean();
                _local_1++;
            };
            joinInfo.htmlText = "";
        }

        private function setStarInfo(_arg_1:Event):void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            var _local_2:* = "";
            if (starPet.slotData)
            {
                _local_3 = petList[starPet.slotData.id];
                if (_local_3)
                {
                    if (ToolKit.isBigOrEqual(_local_3.upgradeNum, GamePredef.PET_STAR_MAX))
                    {
                        _local_2 = Language.PETFUNCPANEL_S[0];
                        starInfo.htmlText = _local_2.replace("{upgradeNum}", _local_3.upgradeNum);
                        starButton.enabled = false;
                    }
                    else
                    {
                        _local_4 = int(GamePredef.PET_STAR_SUCCESS[ToolKit.add(_local_3.upgradeNum, 1)]);
                        if (_core.MC_BIRTH_FLAG[3])
                        {
                            _local_4 = int(GamePredef.MC_BIRTH_CONFIG[3][ToolKit.add(_local_3.upgradeNum, 1)]);
                        };
                        _local_5 = _core.view.getUI(ViewManager.MAIN_LONGBUFF);
                        if (((_local_5) && (_local_5.isBuffOn(3262))))
                        {
                            _local_4 = int(GamePredef.PET_STAR_SUCCESS_BUFF[ToolKit.add(_local_3.upgradeNum, 1)]);
                        };
                        _local_2 = Language.PETFUNCPANEL_S[2];
                        _local_2 = _local_2.replace("{upgradeNum}", _local_3.upgradeNum);
                        starInfo.htmlText = _local_2.replace("{per}", _local_4);
                        if ((((starItem.slotData) && (ToolKit.isBigOrEqual(starItem.stackNum, 1))) && (_core.getTemplateData(starItem.type, starItem.giid).propType == GamePredef.ITEM_TYPE_PETFUNC_TYPE[3])))
                        {
                            starButton.enabled = true;
                        }
                        else
                        {
                            starButton.enabled = false;
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get mainPet():ItemSlotPet
        {
            return (this._831007910mainPet);
        }

        private function petBook():void
        {
            if (((bookPet.slotData) && (bookItem.slotData)))
            {
                _core.remote.call("petBook", new Responder(onBook), bookPet.slotData.id, bookItem.slotData.id);
                return;
            };
        }

        private function elementHandler(event:Event):*
        {
            event.stopImmediatePropagation();
            if (((!(elementPet)) || (!(elementPet.slotData))))
            {
                _core.sysMidNote(Language.PETFUNCPANEL_S[58]);
                return;
            };
            var selectItem:Object = ((elementBox) ? elementBox.selectedItem : null);
            if (((!(selectItem)) || (selectItem.element < 0)))
            {
                _core.sysMidNote(Language.PETFUNCPANEL_S[59]);
                return;
            };
            var onElementPet:Function = function (_arg_1:Object=null):void
            {
                if (!_arg_1)
                {
                    return;
                };
                updatePet(_arg_1.petId, "element", _arg_1.element);
                ((_arg_1.petId == elementPet.slotData.id) && (elementPetChange()));
            };
            _core.remote.call("elementPet", new Responder(onElementPet), elementPet.slotData.id, selectItem.element);
        }

        private function elementClear():void
        {
            ((elementPet) && (elementPet.clean()));
            elementBox.dataProvider = new ArrayCollection(Language.PETFUNCPANEL_U[46]);
            elementCost.text = Language.PETFUNCPANEL_U[44];
        }

        [Bindable(event="propertyChange")]
        public function get starSafeItem():ItemSlotPetFunc
        {
            return (this._273016654starSafeItem);
        }

        public function __tabBtn5_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(5);
        }

        private function petStarClear():void
        {
            var onStarClear:Function = function (_arg_1:Object):void
            {
                if (((_arg_1) && (_arg_1.msg)))
                {
                    _core.sysMidNote(_arg_1.msg);
                };
                if (((_arg_1) && (_arg_1.flag)))
                {
                    updatePet(_arg_1.petId, "upgradeNum", _arg_1.starNum);
                    updatePet(_arg_1.petId, "growRateAdd", _arg_1.growRateAdd);
                    if (((ToolKit.isEqual(_arg_1.petId, starPet.slotData.id)) && (ToolKit.isEqual(_arg_1.starSlotId, starItem.slotData.id))))
                    {
                        if (ToolKit.isBigThan(_arg_1.num, 0))
                        {
                            starItem.stackNum = _arg_1.num;
                        }
                        else
                        {
                            starItem.clean();
                        };
                        setStarInfo(null);
                    };
                };
            };
            if (((starPet.slotData) && (starItem.slotData)))
            {
                _core.remote.call("petStarClear", new Responder(onStarClear), starPet.slotData.id, starItem.slotData.id);
            };
        }

        private function resetItemList():void
        {
            _itemList.val = -1;
            _itemList.type = -1;
            _itemList.idList = [];
        }

        private function setXdInfo(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:uint;
            var _local_4:String;
            if (xdPet.slotData)
            {
                _local_2 = petList[xdPet.slotData.id];
                if (_local_2)
                {
                    if (GameData.d[GamePredef.TBL_CREATURE][_local_2["tid"]])
                    {
                        _local_3 = GameData.d[GamePredef.TBL_CREATURE][_local_2["tid"]].classIds;
                        if (_local_3 != 10)
                        {
                            _core.sysMidNote(Language.PETFUNCPANEL_S[35]);
                            xdPet.clean();
                        }
                        else
                        {
                            _local_4 = Language.PETFUNCPANEL_S[36].toString();
                            _local_4 = _local_4.replace("{finalStrength}", _local_2.property.finalStrength.toString());
                            _local_4 = _local_4.replace("{finalAgility}", _local_2.property.finalAgility.toString());
                            _local_4 = _local_4.replace("{finalStamina}", _local_2.property.finalStamina.toString());
                            _local_4 = _local_4.replace("{finalIntelligence}", _local_2.property.finalIntelligence.toString());
                            _local_4 = _local_4.replace("{finalEnergy}", _local_2.property.finalEnergy.toString());
                            _local_4 = _local_4.replace("{lastPoint}", _local_2.property.lastPoint.toString());
                            xdText.htmlText = _local_4;
                        };
                    };
                    if (((xdItem.slotData) && (ToolKit.isBigOrEqual(xdItem.stackNum, 1))))
                    {
                        xdButton.enabled = true;
                    }
                    else
                    {
                        xdButton.enabled = false;
                    };
                };
            };
        }

        public function __mainPet_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(mainPet);
        }

        override public function update():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, updateLater);
                return;
            };
            pzxsdItem.petFuncType = [GamePredef.ITEM_TYPE_PETFUNC_TYPE[4]];
            starItem.petFuncType = [GamePredef.ITEM_TYPE_PETFUNC_TYPE[3], GamePredef.ITEM_TYPE_PETFUNC_TYPE[5]];
            xsdItem.petFuncType = [GamePredef.ITEM_TYPE_PETFUNC_TYPE[2]];
            xdItem.petFuncType = [GamePredef.ITEM_TYPE_PETFUNC_TYPE[1]];
            starSafeItem.petFuncType = [GamePredef.ITEM_TYPE_PETFUNC_TYPE[6]];
            luckItem.petFuncType = [GamePredef.ITEM_TYPE_PETFUNC_TYPE[7]];
            if (visible)
            {
                starPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, setStarInfo);
                starItem.addEventListener(GameEvent.SLOT_NUM_CHANGE, setStarInfo);
                joinMainPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinPet1.addEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinPet2.addEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinPet3.addEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinPet4.addEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                bookPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, setBookInfo);
                bookItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, setBookInfo);
                xsdPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, setXsdInfo);
                xsdItem.addEventListener(GameEvent.SLOT_NUM_CHANGE, setXsdInfo);
                pzxsdPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, setPzXsdInfo);
                pzxsdItem.addEventListener(GameEvent.SLOT_NUM_CHANGE, setPzXsdInfo);
                xdPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, setXdInfo);
                xdItem.addEventListener(GameEvent.SLOT_NUM_CHANGE, setXdInfo);
                mainPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, setEatInfo);
                costPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, setEatInfo);
                luckItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, setEatInfo);
                luckItem.addEventListener(GameEvent.SLOT_NUM_CHANGE, setEatInfo);
                elementPet.addEventListener(GameEvent.SLOT_GIID_CHANGE, elementPetChange);
                upPetRefresh();
            }
            else
            {
                starPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setStarInfo);
                starItem.removeEventListener(GameEvent.SLOT_NUM_CHANGE, setStarInfo);
                starViewClear();
                joinMainPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinPet1.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinPet2.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinPet3.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinPet4.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setJoinInfo);
                joinViewClear();
                bookPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setBookInfo);
                bookItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setBookInfo);
                bookViewClear();
                xsdPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setXsdInfo);
                xsdItem.removeEventListener(GameEvent.SLOT_NUM_CHANGE, setXsdInfo);
                xsdViewClear();
                pzxsdPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setPzXsdInfo);
                pzxsdItem.removeEventListener(GameEvent.SLOT_NUM_CHANGE, setPzXsdInfo);
                pzXsdViewClear();
                xdPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setXdInfo);
                xdItem.removeEventListener(GameEvent.SLOT_NUM_CHANGE, setXdInfo);
                xdViewClear();
                mainPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setEatInfo);
                costPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setEatInfo);
                luckItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, setEatInfo);
                luckItem.removeEventListener(GameEvent.SLOT_NUM_CHANGE, setEatInfo);
                eatViewClear();
                elementPet.removeEventListener(GameEvent.SLOT_GIID_CHANGE, elementPetChange);
                elementClear();
            };
        }

        public function set luckItem(_arg_1:ItemSlotPetFunc):void
        {
            var _local_2:Object = this._1355904412luckItem;
            if (_local_2 !== _arg_1)
            {
                this._1355904412luckItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "luckItem", _local_2, _arg_1));
            };
        }

        public function onStar(_arg_1:Object):void
        {
            starButton.enabled = true;
            var _local_2:* = "";
            if (_arg_1)
            {
                updatePet(_arg_1.petId, "upgradeNum", _arg_1.starNum);
                updatePet(_arg_1.petId, "growRateAdd", _arg_1.growRateAdd);
                if (((ToolKit.isEqual(_arg_1.petId, starPet.slotData.id)) && (ToolKit.isEqual(_arg_1.starSlotId, starItem.slotData.id))))
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        starItem.stackNum = _arg_1.num;
                    }
                    else
                    {
                        starItem.clean();
                    };
                    if (((_arg_1.starSafeNum) && (ToolKit.isBigThan(_arg_1.starSafeNum, 0))))
                    {
                        starSafeItem.stackNum = _arg_1.starSafeNum;
                    }
                    else
                    {
                        starSafeItem.clean();
                    };
                    setStarInfo(null);
                };
                if (_arg_1.flag)
                {
                    _local_2 = Language.PETFUNCPANEL_S[4];
                    _local_2 = _local_2.replace("{starNum}", _arg_1.starNum);
                    _core.sysMidNote(_local_2);
                }
                else
                {
                    _core.sysMidNote(Language.PETFUNCPANEL_S[6]);
                };
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                if (firstTimeFlag == 0)
                {
                    initView();
                    firstTimeFlag = 1;
                    tabBtnClick(0);
                };
            };
            update();
        }

        [Bindable(event="propertyChange")]
        public function get elementCost():Label
        {
            return (this._673408233elementCost);
        }

        public function __luckNum_change(_arg_1:NumericStepperEvent):void
        {
            setEatInfo(null);
        }

        [Bindable(event="propertyChange")]
        public function get joinInfo():Label
        {
            return (this._1402072840joinInfo);
        }

        public function __xdPet_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(xdPet);
        }

        private function _PetFuncPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = HtmlComboItemRenderer;
            return (_local_1);
        }

        public function __bookItem_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(bookItem);
        }

        public function set elementPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._575924355elementPet;
            if (_local_2 !== _arg_1)
            {
                this._575924355elementPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elementPet", _local_2, _arg_1));
            };
        }

        public function set starItem(_arg_1:ItemSlotPetFunc):void
        {
            var _local_2:Object = this._1315536005starItem;
            if (_local_2 !== _arg_1)
            {
                this._1315536005starItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get joinButton():BasicGlowButton
        {
            return (this._1034217724joinButton);
        }

        public function set tabBtn0(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function __starClearButton_click(_arg_1:MouseEvent):void
        {
            petStarClear();
        }

        [Bindable(event="propertyChange")]
        public function get xsdInfo():Label
        {
            return (this._1781719785xsdInfo);
        }

        public function set tabBtn3(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        public function autoClick(_arg_1:String):void
        {
            var _local_2:int = Number((_arg_1.charAt(0) + _arg_1.charAt(1)));
            tabBtnClick((_local_2 - 1));
        }

        public function set tabBtn4(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function set tabBtn6(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141553tabBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1554141553tabBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn6", _local_2, _arg_1));
            };
        }

        private function xdViewClear():void
        {
            xdPet.clean();
            xdItem.clean();
            xdInfo.htmlText = "";
            xdText.htmlText = "";
        }

        [Bindable(event="propertyChange")]
        public function get eatRateInfo():Label
        {
            return (this._1710110426eatRateInfo);
        }

        public function __joinPet3_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(joinPet3);
        }

        public function set pzxsdButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._629176687pzxsdButton;
            if (_local_2 !== _arg_1)
            {
                this._629176687pzxsdButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pzxsdButton", _local_2, _arg_1));
            };
        }

        public function set xdPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._113881747xdPet;
            if (_local_2 !== _arg_1)
            {
                this._113881747xdPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xdPet", _local_2, _arg_1));
            };
        }

        public function __starItem_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(starItem);
        }

        [Bindable(event="propertyChange")]
        public function get elementBox():ComboBox
        {
            return (this._575911215elementBox);
        }

        public function set tabBtn5(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141554tabBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1554141554tabBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn5", _local_2, _arg_1));
            };
        }

        public function set tabBtn7(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141552tabBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1554141552tabBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn7", _local_2, _arg_1));
            };
        }

        public function onXd(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:String;
            xdButton.enabled = true;
            if (_arg_1)
            {
                if (((_arg_1.f) && (_arg_1.pet)))
                {
                    xdPet.clean();
                    xdItem.clean();
                    xdInfo.text = Language.PETFUNCPANEL_S[37];
                    _local_2 = _arg_1.pet;
                    _local_3 = Language.PETFUNCPANEL_S[36].toString();
                    _local_3 = _local_3.replace("{finalStrength}", _local_2.attStrength);
                    _local_3 = _local_3.replace("{finalAgility}", _local_2.attAgility);
                    _local_3 = _local_3.replace("{finalStamina}", _local_2.attStamina);
                    _local_3 = _local_3.replace("{finalIntelligence}", _local_2.attIntelligence);
                    _local_3 = _local_3.replace("{finalEnergy}", _local_2.attEnergy);
                    _local_3 = _local_3.replace("{lastPoint}", _local_2.attLastPoint);
                    xdText.htmlText = _local_3;
                }
                else
                {
                    xdInfo.text = Language.PETFUNCPANEL_S[24];
                };
            };
        }

        public function __costPet_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(costPet);
        }

        [Bindable(event="propertyChange")]
        public function get xdButton():BasicGlowButton
        {
            return (this._758955714xdButton);
        }

        public function __xdItem_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(xdItem);
        }

        public function set mainPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._831007910mainPet;
            if (_local_2 !== _arg_1)
            {
                this._831007910mainPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainPet", _local_2, _arg_1));
            };
        }

        public function reset():void
        {
            firstTimeFlag = 0;
        }

        public function ___PetFuncPanel_BasicGlowButton9_click(_arg_1:MouseEvent):void
        {
            elementHandler(_arg_1);
        }

        public function __pzxsdItem_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(pzxsdItem);
        }

        public function putPetAuto(_arg_1:ItemSlot):void
        {
            putPet(_arg_1, tab.selectedIndex);
        }

        [Bindable(event="propertyChange")]
        public function get xsdButton():BasicGlowButton
        {
            return (this._1265723739xsdButton);
        }

        private function setEatInfo(e:Event):void
        {
            var mainPetData:Object;
            var costPetData:Object;
            var mainColorLevel:Number;
            var costColorLevel:Number;
            var addRate:Number;
            var totalRate:Number;
            var resultRate:Number;
            var strengthFeather:int;
            var agilityFeather:int;
            var staminaFeather:int;
            var intelligenceFeather:int;
            var energyFeather:int;
            var getSingleRate:Function = function (_arg_1:*):Number
            {
                var _local_2:Number = Number((((_arg_1) && (_arg_1.creatureData)) && (_arg_1.creatureData.classIds)));
                var _local_3:Number = Number(((_arg_1) && (_core.basic.colorByGrowRate(_arg_1.growRate))));
                var _local_4:Number = ((_local_2 == 10) ? 1 : 2);
                var _local_5:Object = {
                    "301":0.15,
                    "302":0.1,
                    "401":0.3,
                    "402":0.15
                };
                if (_core.MC_BIRTH_FLAG[7])
                {
                    _local_5 = GamePredef.MC_BIRTH_CONFIG[7];
                };
                var _local_6:Number = ((_local_5[((_local_3 * 100) + _local_4)]) || (0));
                return (_local_6);
            };
            var getBaseRate:Function = function (_arg_1:*, _arg_2:*):Number
            {
                var _local_3:Number = (getSingleRate(_arg_1) + getSingleRate(_arg_2));
                if (_arg_1.creatureData.classId == _arg_2.creatureData.classId)
                {
                    _local_3 = (_local_3 + 0.2);
                }
                else
                {
                    _local_3 = (_local_3 / 2);
                };
                return (_local_3 * 100);
            };
            luckNum.visible = luckItem.slotData;
            if (((luckItem.slotData) && (luckNum.value > luckItem.slotData.stackNum)))
            {
                luckNum.value = luckItem.slotData.stackNum;
            };
            if (((mainPet.slotData) && (costPet.slotData)))
            {
                mainPetData = petList[mainPet.slotData.id];
                costPetData = petList[costPet.slotData.id];
                if (((mainPetData) && (costPetData)))
                {
                    mainColorLevel = Number(_core.basic.colorByGrowRate(mainPetData.growRate));
                    costColorLevel = Number(_core.basic.colorByGrowRate(costPetData.growRate));
                    if (((mainColorLevel >= 3) && (costColorLevel >= 3)))
                    {
                        addRate = (((luckNum.visible) || (0)) && (luckNum.value * 20));
                        totalRate = (addRate + getBaseRate(mainPetData, costPetData));
                        while (totalRate >= 120)
                        {
                            luckNum.value--;
                            totalRate = (totalRate - 20);
                        };
                        resultRate = ((totalRate > 100) ? 100 : (Math.round((totalRate * 10)) / 10));
                        eatRateInfo.htmlText = ((Language.PETFUNCPANEL_S[8] + resultRate) + "%");
                    }
                    else
                    {
                        eatRateInfo.htmlText = Language.PETFUNCPANEL_S[24];
                    };
                };
            };
            _refreshMainPetText();
            if (costPet.slotData)
            {
                strengthFeather = 0;
                agilityFeather = 0;
                staminaFeather = 0;
                intelligenceFeather = 0;
                energyFeather = 0;
                if (costPet.slotData.property)
                {
                    strengthFeather = costPet.slotData.property.aptStrengthEvolution;
                    agilityFeather = costPet.slotData.property.aptAgilityEvolution;
                    staminaFeather = costPet.slotData.property.aptStaminaEvolution;
                    intelligenceFeather = costPet.slotData.property.aptIntelligenceEvolution;
                    energyFeather = costPet.slotData.property.aptEnergyEvolution;
                };
                eatCostText.htmlText = (((((((((Language.PETFUNCPANEL_S[18] + (Number(costPet.slotData.aptStrength) + strengthFeather)) + Language.PETFUNCPANEL_S[19]) + (Number(costPet.slotData.aptAgility) + agilityFeather)) + Language.PETFUNCPANEL_S[20]) + (Number(costPet.slotData.aptStamina) + staminaFeather)) + Language.PETFUNCPANEL_S[21]) + (Number(costPet.slotData.aptIntelligence) + intelligenceFeather)) + Language.PETFUNCPANEL_S[22]) + (Number(costPet.slotData.aptEnergy) + energyFeather));
            };
        }

        public function funcBagClickHandler(_arg_1:Event):void
        {
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:String;
            var _local_6:Object;
            var _local_7:ItemSlot;
            var _local_2:Object = _arg_1.currentTarget.slotData;
            if (!_local_2)
            {
                return;
            };
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
                    if (((tab.selectedIndex == 1) || (tab.selectedIndex == 6)))
                    {
                        if (((_local_7.giid > 0) || (checkRepeatPets(autoMatchSlots, _arg_1.currentTarget.giid)))) continue;
                    };
                    if (!((_local_6.id) && (!(ToolKit.isEqual(_local_3.id, _local_6.id)))))
                    {
                        if (!((_local_6.itemType) && (!(ToolKit.isEqual(_local_6.itemType, ((_local_2.type) || (_arg_1.currentTarget.type)))))))
                        {
                            if (!((_local_6.propType) && (!(ToolKit.isEqual(_local_6.propType, _local_3.propType)))))
                            {
                                if (!((_local_6.type) && (!(ToolKit.isEqual(_local_6.type, _local_3.type)))))
                                {
                                    resetPetBagSlot(_local_7, _arg_1.currentTarget);
                                    return;
                                };
                            };
                        };
                    };
                };
            };
        }

        private function onBook(_arg_1:Object):void
        {
            if (_arg_1)
            {
                switch (_arg_1.f)
                {
                    case 1:
                        if (!_arg_1.rf)
                        {
                            _core.sysMsg(Language.PETFUNCPANEL_S[15]);
                        };
                        break;
                    case 2:
                        _core.sysMsg(Language.PETFUNCPANEL_S[16]);
                        break;
                    case 3:
                        _core.sysMsg(Language.PETFUNCPANEL_S[17]);
                        break;
                };
                if (ToolKit.isBigThan(_arg_1.n, 0))
                {
                    bookItem.stackNum = _arg_1.n;
                }
                else
                {
                    bookItem.clean();
                };
            };
        }

        public function set joinButton1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1995978421joinButton1;
            if (_local_2 !== _arg_1)
            {
                this._1995978421joinButton1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinButton1", _local_2, _arg_1));
            };
        }

        private function setPzXsdInfo(_arg_1:Event):void
        {
            var _local_2:Object;
            if (pzxsdPet.slotData)
            {
                _local_2 = petList[pzxsdPet.slotData.id];
                if (_local_2)
                {
                    pzxsdText.htmlText = Language.PETFUNCPANEL_S[43].toString().replace("{growRate}", _local_2.growRate);
                    if (((pzxsdItem.slotData) && (ToolKit.isBigOrEqual(pzxsdItem.stackNum, 1))))
                    {
                        pzxsdButton.enabled = true;
                    }
                    else
                    {
                        pzxsdButton.enabled = false;
                    };
                    if (((((_local_2.growRate == GamePredef.PET_GROWRATE_NUM[1]) || (_local_2.growRate == GamePredef.PET_GROWRATE_NUM[2])) || (_local_2.growRate == GamePredef.PET_GROWRATE_NUM[3])) || (_local_2.growRate == GamePredef.PET_GROWRATE_NUM[4])))
                    {
                        pzxsdButton.enabled = false;
                    }
                    else
                    {
                        pzxsdButton.enabled = true;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get starPet():ItemSlotPet
        {
            return (this._1897219731starPet);
        }

        public function set starSafeItem(_arg_1:ItemSlotPetFunc):void
        {
            var _local_2:Object = this._273016654starSafeItem;
            if (_local_2 !== _arg_1)
            {
                this._273016654starSafeItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starSafeItem", _local_2, _arg_1));
            };
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(4);
        }

        [Bindable(event="propertyChange")]
        public function get seniorPetJoinEnable():Boolean
        {
            return (this._1822648700seniorPetJoinEnable);
        }

        [Bindable(event="propertyChange")]
        public function get bookPet():ItemSlotPet
        {
            return (this._64661878bookPet);
        }

        public function __starButton_click(_arg_1:MouseEvent):void
        {
            petStar();
        }

        [Bindable(event="propertyChange")]
        public function get xsdText():TextArea
        {
            return (this._1781400170xsdText);
        }

        [Bindable(event="propertyChange")]
        public function get bookItem():ItemSlotCreBook
        {
            return (this._2004323740bookItem);
        }

        public function __bookPet_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(bookPet);
        }

        private function setBookInfo(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (((bookPet.slotData) && (bookItem.slotData)))
            {
                _local_2 = _core.getTemplateData(bookItem.type, bookItem.giid);
                _local_3 = _core.getTemplateData(bookPet.type, bookPet.giid);
                if (((_local_2) && (_local_3)))
                {
                    if (_local_2.reqClass.indexOf((("|" + _local_3.classId) + "|")) >= 0)
                    {
                        if (ToolKit.isBigOrEqual(_local_3.qLevel, _local_2.proplNum))
                        {
                            bookButton.enabled = true;
                            return;
                        };
                    };
                };
            };
            bookButton.enabled = false;
        }

        private function bookViewClear():void
        {
            bookButton.enabled = false;
            bookPet.clean();
            bookItem.clean();
        }

        [Bindable(event="propertyChange")]
        public function get xdInfo():Label
        {
            return (this._764833350xdInfo);
        }

        public function __xsdButton_click(_arg_1:MouseEvent):void
        {
            petXsd();
        }

        private function upPetRefresh():void
        {
            var _local_1:Object = {
                "up":{},
                "down":{}
            };
            switch (tab.selectedIndex)
            {
                case 0:
                    _local_1.up = {"pets":true};
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":{"507":true},
                        "propType":{
                            "3":true,
                            "5":true,
                            "6":true
                        }
                    };
                    _local_1.sysShop = true;
                    break;
                case 1:
                    _local_1.up = {"pets":true};
                    _local_1.down = {"nth":true};
                    break;
                case 2:
                    _local_1.up = {"pets":true};
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":{"507":true},
                        "propType":{"2":true}
                    };
                    _local_1.sysShop = true;
                    break;
                case 3:
                    _local_1.up = {"pets":true};
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":{"507":true},
                        "propType":{"4":true}
                    };
                    _local_1.sysShop = true;
                    break;
                case 4:
                    _local_1.up = {
                        "pets":true,
                        "classIds":{"10":true}
                    };
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":{"507":true},
                        "propType":{"1":true}
                    };
                    _local_1.sysShop = true;
                    break;
                case 5:
                    _local_1.up = {"pets":true};
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":{"506":true}
                    };
                    _local_1.sysShop = true;
                    break;
                case 6:
                    _local_1.up = {"pets":true};
                    _local_1.down = {
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":{"507":true},
                        "propType":{"7":true}
                    };
                    _local_1.sysShop = true;
                    break;
                case 7:
                    _local_1.up = {"pets":true};
                    break;
            };
            petBag.condition = _local_1;
        }

        private function petEat():void
        {
            var _petEat:Function;
            var func:Function;
            var petColor:Number;
            var popStr:String;
            var _alert:Alert;
            var tf:IUITextField;
            if ((((mainPet.slotData) && (costPet.slotData)) && (aptType.selectedItem.type > 0)))
            {
                _petEat = function (_arg_1:String):void
                {
                    var _local_2:String;
                    if (_arg_1)
                    {
                        _local_2 = MD5.hash(_arg_1);
                        _core.remote.call("petEat", new Responder(onPetEat), mainPet.slotData.id, costPet.slotData.id, ((luckItem.slotData) && (luckItem.slotData.id)), luckNum.value, aptType.selectedItem.type, _local_2);
                    };
                };
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail != Alert.YES)
                    {
                        return;
                    };
                    if (_core.delPass)
                    {
                        _core.remote.call("petEat", new Responder(onPetEat), mainPet.slotData.id, costPet.slotData.id, ((luckItem.slotData) && (luckItem.slotData.id)), luckNum.value, aptType.selectedItem.type, _core.delPass);
                    }
                    else
                    {
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.PETFUNCPANEL_U[26], _petEat);
                    };
                };
                petColor = GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(costPet.slotData.growRate)];
                popStr = LanguageUtil.replace(Language.PETFUNCPANEL_U[30], {
                    "petColor":petColor,
                    "petName":costPet.slotData.petName
                });
                _alert = Alert.show(LanguageUtil.html2PlainText(popStr), "", 3, this, func);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = popStr;
            }
            else
            {
                if (aptType.selectedItem.type == -1)
                {
                    aptType.open();
                };
            };
        }

        public function set elementCost(_arg_1:Label):void
        {
            var _local_2:Object = this._673408233elementCost;
            if (_local_2 !== _arg_1)
            {
                this._673408233elementCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elementCost", _local_2, _arg_1));
            };
        }

        public function __joinPet2_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(joinPet2);
        }

        public function set joinInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1402072840joinInfo;
            if (_local_2 !== _arg_1)
            {
                this._1402072840joinInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinInfo", _local_2, _arg_1));
            };
        }

        public function set joinButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1034217724joinButton;
            if (_local_2 !== _arg_1)
            {
                this._1034217724joinButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get eatMainText():TextArea
        {
            return (this._2140516866eatMainText);
        }

        public function set aptType(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._790240513aptType;
            if (_local_2 !== _arg_1)
            {
                this._790240513aptType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptType", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get costPet():ItemSlotPet
        {
            return (this._956127762costPet);
        }

        private function elementPetChange(_arg_1:Event=null):void
        {
            var _local_10:Object;
            if (((!(elementPet)) || (!(elementPet.slotData))))
            {
                return;
            };
            var _local_2:Object = petList[elementPet.slotData.id];
            if (!_local_2)
            {
                return;
            };
            var _local_3:int = ((_local_2.hasOwnProperty("element")) ? _local_2.element : 0);
            var _local_4:Array = [];
            var _local_5:Array = Language.EQUIPTFUNCPANEL_U[265];
            var _local_6:int = _local_5.length;
            var _local_7:int;
            while (_local_7 < _local_6)
            {
                _local_10 = _local_5[_local_7];
                if (((_local_3 == 0) || (!(_local_10.element == _local_3))))
                {
                    _local_4.push(_local_10);
                };
                _local_7++;
            };
            elementBox.dataProvider = new ArrayCollection(_local_4);
            var _local_8:int = PetLogic.expToLv(_local_2.exp);
            var _local_9:Number = Math.round((GamePredef.BASIC_GET_MONEY[_local_8] * 0.1));
            elementCost.text = (Language.PETFUNCPANEL_U[44] + _local_9);
        }

        [Bindable(event="propertyChange")]
        public function get luckNum():NumericStepper
        {
            return (this._510455317luckNum);
        }

        [Bindable(event="propertyChange")]
        public function get pzxsdPet():ItemSlotPet
        {
            return (this._2072290848pzxsdPet);
        }

        [Bindable(event="propertyChange")]
        public function get eatCostText():TextArea
        {
            return (this._1738198546eatCostText);
        }

        private function checkPetsData(_arg_1:Object):Boolean
        {
            var _local_2:String;
            var _local_3:int;
            var _local_4:String;
            var _local_5:int;
            var _local_6:*;
            if (_arg_1)
            {
                for (_local_2 in _arg_1)
                {
                    for (_local_4 in _arg_1)
                    {
                        if (((((_arg_1[_local_2]) && (_arg_1[_local_4])) && (!(_local_2 == _local_4))) && (_arg_1[_local_2].id == _arg_1[_local_4].id)))
                        {
                            _core.sysMidNote(Language.PETFUNCPANEL_S[9]);
                            return (false);
                        };
                    };
                };
                if (!_arg_1.main)
                {
                    _core.sysMidNote(Language.PETFUNCPANEL_S[10]);
                    return (false);
                };
                _local_3 = 1;
                while (_local_3 <= 4)
                {
                    if (_arg_1[("pet" + _local_3)])
                    {
                        _local_5 = 1;
                        while (_local_5 <= 8)
                        {
                            if (ToolKit.isBigThan(_arg_1[("pet" + _local_3)][("equ" + _local_5)], 0))
                            {
                                joinViewClear();
                                Alert.show(Language.PETFUNCPANEL_S[56], "", Alert.YES, null, null);
                                return (false);
                            };
                            _local_5++;
                        };
                        if (((_arg_1[("pet" + _local_3)]["soulInfo"]) && (_arg_1[("pet" + _local_3)]["soulInfo"]["data"])))
                        {
                            for (_local_6 in _arg_1[("pet" + _local_3)]["soulInfo"]["data"])
                            {
                                if (_arg_1[("pet" + _local_3)]["soulInfo"]["data"][_local_6])
                                {
                                    Alert.show(Language.PET_SOUL_S[51], "", Alert.YES, null, null);
                                    joinViewClear();
                                    return (false);
                                };
                            };
                        };
                        if (_core.basic.colorByGrowRate(_arg_1.main.growRate) != _core.basic.colorByGrowRate(_arg_1[("pet" + _local_3)].growRate))
                        {
                            _core.sysMidNote(Language.PETFUNCPANEL_S[11]);
                            return (false);
                        };
                        if (_arg_1.main.tid != _arg_1[("pet" + _local_3)].tid)
                        {
                            _core.sysMidNote(Language.PETFUNCPANEL_S[12]);
                            return (false);
                        };
                    };
                    _local_3++;
                };
                return (true);
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get starInfo():Label
        {
            return (this._1315530272starInfo);
        }

        [Bindable(event="propertyChange")]
        public function get starClearButton():BasicGlowButton
        {
            return (this._1791424045starClearButton);
        }

        public function set xsdInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1781719785xsdInfo;
            if (_local_2 !== _arg_1)
            {
                this._1781719785xsdInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xsdInfo", _local_2, _arg_1));
            };
        }

        private function tabBtnUpdate():void
        {
            var _local_1:int = ((tab) ? tab.selectedIndex : 0);
            resetItemList();
            autoMatchSlots = new Array();
            switch (_local_1)
            {
                case 0:
                    autoMatchSlots.push({
                        "slot":starPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":starItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_PETFUNC,
                        "propType":GamePredef.ITEM_TYPE_PETFUNC_TYPE[3]
                    });
                    autoMatchSlots.push({
                        "slot":starSafeItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_PETFUNC,
                        "propType":GamePredef.ITEM_TYPE_PETFUNC_TYPE[6]
                    });
                    return;
                case 1:
                    autoMatchSlots.push({
                        "slot":joinMainPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":joinPet1,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":joinPet2,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":joinPet3,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":joinPet4,
                        "itemType":GamePredef.TBL_PET
                    });
                    return;
                case 2:
                    autoMatchSlots.push({
                        "slot":xsdPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":xsdItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_PETFUNC,
                        "propType":GamePredef.ITEM_TYPE_PETFUNC_TYPE[2]
                    });
                    return;
                case 3:
                    autoMatchSlots.push({
                        "slot":pzxsdPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":pzxsdItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_PETFUNC,
                        "propType":GamePredef.ITEM_TYPE_PETFUNC_TYPE[4]
                    });
                    return;
                case 4:
                    autoMatchSlots.push({
                        "slot":xdPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":xdItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_PETFUNC,
                        "propType":GamePredef.ITEM_TYPE_PETFUNC_TYPE[1]
                    });
                    return;
                case 5:
                    autoMatchSlots.push({
                        "slot":bookPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":bookItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_CREBOOK
                    });
                    return;
                case 6:
                    autoMatchSlots.push({
                        "slot":mainPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":costPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    autoMatchSlots.push({
                        "slot":luckItem,
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_PETFUNC,
                        "propType":GamePredef.ITEM_TYPE_PETFUNC_TYPE[7]
                    });
                    return;
                case 7:
                    autoMatchSlots.push({
                        "slot":elementPet,
                        "itemType":GamePredef.TBL_PET
                    });
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get pzxsdItem():ItemSlotPetFunc
        {
            return (this._183687630pzxsdItem);
        }

        public function surePetStar():void
        {
            var _local_1:*;
            if (((starPet.slotData) && (starItem.slotData)))
            {
                _local_1 = ((starSafeItem.slotData) ? starSafeItem.slotData.id : null);
                _core.remote.call("petStar", new Responder(onStar), starPet.slotData.id, starItem.slotData.id, _local_1);
                starButton.enabled = false;
            };
        }

        private function _PetFuncPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PETFUNCPANEL_U[11];
            _local_1 = Language.PETFUNCPANEL_U[0];
            _local_1 = ResManager.TOTEM_PET_FUNC2;
            _local_1 = Language.PETFUNCPANEL_S[25];
            _local_1 = Language.PETFUNCPANEL_U[6];
            _local_1 = Language.PETFUNCPANEL_U[23];
            _local_1 = Language.PETFUNCPANEL_U[24];
            _local_1 = Language.PETFUNCPANEL_U[12];
            _local_1 = Language.PETFUNCPANEL_U[13];
            _local_1 = Language.PETFUNCPANEL_U[1];
            _local_1 = ResManager.TOTEM_PET_FUNC1;
            _local_1 = Language.PETFUNCPANEL_S[28];
            _local_1 = Language.PETFUNCPANEL_U[7];
            _local_1 = Language.PETFUNCPANEL_U[40];
            _local_1 = seniorPetJoinEnable;
            _local_1 = Language.PETFUNCPANEL_U[14];
            _local_1 = Language.PETFUNCPANEL_U[15];
            _local_1 = Language.PETFUNCPANEL_U[14];
            _local_1 = Language.PETFUNCPANEL_U[2];
            _local_1 = ResManager.TOTEM_PET_FUNC2;
            _local_1 = Language.PETFUNCPANEL_S[30];
            _local_1 = Language.PETFUNCPANEL_U[8];
            _local_1 = Language.PETFUNCPANEL_U[16];
            _local_1 = Language.PETFUNCPANEL_U[17];
            _local_1 = Language.PETFUNCPANEL_U[18];
            _local_1 = Language.PETFUNCPANEL_S[32];
            _local_1 = ResManager.TOTEM_PET_FUNC2;
            _local_1 = Language.PETFUNCPANEL_S[42];
            _local_1 = Language.PETFUNCPANEL_U[21];
            _local_1 = Language.PETFUNCPANEL_U[16];
            _local_1 = Language.PETFUNCPANEL_U[22];
            _local_1 = Language.PETFUNCPANEL_U[18];
            _local_1 = Language.PETFUNCPANEL_S[33];
            _local_1 = ResManager.TOTEM_PET_FUNC2;
            _local_1 = Language.PETFUNCPANEL_S[39];
            _local_1 = Language.PETFUNCPANEL_U[9];
            _local_1 = Language.PETFUNCPANEL_S[38];
            _local_1 = Language.PETFUNCPANEL_U[16];
            _local_1 = Language.PETFUNCPANEL_U[19];
            _local_1 = Language.PETFUNCPANEL_U[18];
            _local_1 = Language.PETFUNCPANEL_U[10];
            _local_1 = ResManager.TOTEM_PET_FUNC2;
            _local_1 = Language.PETFUNCPANEL_S[34];
            _local_1 = Language.PETFUNCPANEL_U[10];
            _local_1 = Language.PETFUNCPANEL_U[16];
            _local_1 = Language.PETFUNCPANEL_U[20];
            _local_1 = Language.PETFUNCPANEL_U[25];
            _local_1 = ResManager.TOTEM_PET_FUNC2;
            _local_1 = Language.PETFUNCPANEL_S[46];
            _local_1 = Language.PETFUNCPANEL_U[15];
            _local_1 = Language.PETFUNCPANEL_U[14];
            _local_1 = Language.PETFUNCPANEL_U[27];
            _local_1 = Language.PETFUNCPANEL_U[18];
            _local_1 = Language.PETFUNCPANEL_U[25];
            _local_1 = Language.PETFUNCPANEL_S[57];
            _local_1 = Language.PETFUNCPANEL_U[42];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[43];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = new ArrayCollection(Language.PETFUNCPANEL_U[46]);
            _local_1 = Language.PETFUNCPANEL_U[44];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[45];
            _local_1 = Language.PETFUNCPANEL_U[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[1];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[2];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[3];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[4];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[5];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[26];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PETFUNCPANEL_U[41];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.EQUIPTFUNCPANEL_S[97];
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get xdText():TextArea
        {
            return (this._764513735xdText);
        }

        private function eatViewClear():void
        {
            mainPet.clean();
            costPet.clean();
            luckItem.clean();
            eatRateInfo.htmlText = "";
            eatMainText.htmlText = "";
            eatCostText.htmlText = "";
            luckNum.visible = false;
            aptType.close();
            aptType.selectedIndex = 0;
        }

        public function set eatRateInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1710110426eatRateInfo;
            if (_local_2 !== _arg_1)
            {
                this._1710110426eatRateInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eatRateInfo", _local_2, _arg_1));
            };
        }

        private function setXsdInfo(_arg_1:Event):void
        {
            var _local_2:Object;
            if (xsdPet.slotData)
            {
                _local_2 = petList[xsdPet.slotData.id];
                if (_local_2)
                {
                    xsdText.htmlText = (((((((((Language.PETFUNCPANEL_S[18] + _local_2.aptStrength) + Language.PETFUNCPANEL_S[19]) + _local_2.aptAgility) + Language.PETFUNCPANEL_S[20]) + _local_2.aptStamina) + Language.PETFUNCPANEL_S[21]) + _local_2.aptIntelligence) + Language.PETFUNCPANEL_S[22]) + _local_2.aptEnergy);
                    getMaxAptitudes(_local_2);
                    if (((xsdItem.slotData) && (ToolKit.isBigOrEqual(xsdItem.stackNum, 1))))
                    {
                        xsdButton.enabled = true;
                    }
                    else
                    {
                        xsdButton.enabled = false;
                    };
                };
            };
        }

        public function set elementBox(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._575911215elementBox;
            if (_local_2 !== _arg_1)
            {
                this._575911215elementBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elementBox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get luckItem():ItemSlotPetFunc
        {
            return (this._1355904412luckItem);
        }

        public function onXsd(data:Object):void
        {
            var yesAlert:String;
            var func:Function;
            var title:String;
            var contentMsg:* = undefined;
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (data)
            {
                updatePet(data.p, data.t, data.num);
                if (ToolKit.isEqual(data.i, xsdItem.slotData.id))
                {
                    if (ToolKit.isBigThan(data.n, 0))
                    {
                        xsdItem.stackNum = data.n;
                    }
                    else
                    {
                        xsdItem.clean();
                    };
                };
                setXsdInfo(null);
                if (data.f)
                {
                    xsdButton.enabled = false;
                    if (data.aptHigh)
                    {
                        xsdInfo.text = Language.PETFUNCPANEL_S[23];
                        xsdButton.enabled = true;
                    }
                    else
                    {
                        yesAlert = Alert.yesLabel;
                        func = function (_arg_1:CloseEvent):void
                        {
                            Alert.yesLabel = yesAlert;
                            if (_arg_1.detail == Alert.YES)
                            {
                                if (data.before < data.after)
                                {
                                    xsdInfo.text = Language.PETFUNCPANEL_S[23];
                                }
                                else
                                {
                                    xsdInfo.text = "";
                                };
                                xsdButton.enabled = true;
                            };
                        };
                        title = "";
                        if (StringUtil.trim(data.type) == "aptStrength")
                        {
                            title = Language.PETFUNCPANEL_S[49];
                        }
                        else
                        {
                            if (StringUtil.trim(data.type) == "aptAgility")
                            {
                                title = Language.PETFUNCPANEL_S[19];
                            }
                            else
                            {
                                if (StringUtil.trim(data.type) == "aptStamina")
                                {
                                    title = Language.PETFUNCPANEL_S[20];
                                }
                                else
                                {
                                    if (StringUtil.trim(data.type) == "aptIntelligence")
                                    {
                                        title = Language.PETFUNCPANEL_S[21];
                                    }
                                    else
                                    {
                                        if (StringUtil.trim(data.type) == "aptEnergy")
                                        {
                                            title = Language.PETFUNCPANEL_S[22];
                                        };
                                    };
                                };
                            };
                        };
                        contentMsg = _showAlertMsg(Language.PETFUNCPANEL_S[52], title, data.before, data.after);
                        msg = contentMsg.replace(/<font(.*?)>/g, "");
                        msg = msg.replace(/<\/font>/g, "");
                        msg = msg.replace(/<b>/g, "");
                        msg = msg.replace(/<\/b>/g, "");
                        if (data.before < data.after)
                        {
                            Alert.yesLabel = Language.PETFUNCPANEL_S[50];
                        }
                        else
                        {
                            Alert.yesLabel = Language.PETFUNCPANEL_S[51];
                        };
                        _alert = Alert.show(msg, "", Alert.YES, null, func);
                        Alert.yesLabel = yesAlert;
                        tf = _alert.mx_internal::alertForm.mx_internal::textField;
                        tf.htmlText = contentMsg;
                        tf.filters = GamePredef.FILTER_TEXT1;
                    };
                }
                else
                {
                    xsdInfo.text = Language.PETFUNCPANEL_S[24];
                    xsdButton.enabled = true;
                };
            }
            else
            {
                xsdButton.enabled = true;
            };
        }

        public function __pzxsdButton_click(_arg_1:MouseEvent):void
        {
            petPzXsd();
        }

        public function set joinPet3(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._1401872578joinPet3;
            if (_local_2 !== _arg_1)
            {
                this._1401872578joinPet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinPet3", _local_2, _arg_1));
            };
        }

        public function set joinPet4(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._1401872577joinPet4;
            if (_local_2 !== _arg_1)
            {
                this._1401872577joinPet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinPet4", _local_2, _arg_1));
            };
        }

        public function set joinPet2(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._1401872579joinPet2;
            if (_local_2 !== _arg_1)
            {
                this._1401872579joinPet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinPet2", _local_2, _arg_1));
            };
        }

        public function set xdButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._758955714xdButton;
            if (_local_2 !== _arg_1)
            {
                this._758955714xdButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xdButton", _local_2, _arg_1));
            };
        }

        public function set joinPet1(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._1401872580joinPet1;
            if (_local_2 !== _arg_1)
            {
                this._1401872580joinPet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinPet1", _local_2, _arg_1));
            };
        }

        public function __pzxsdPet_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(pzxsdPet);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():FilterButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():FilterButton
        {
            return (this._1554141557tabBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():FilterButton
        {
            return (this._1554141556tabBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():FilterButton
        {
            return (this._1554141555tabBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn6():FilterButton
        {
            return (this._1554141553tabBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():FilterButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get pzxsdButton():BasicGlowButton
        {
            return (this._629176687pzxsdButton);
        }

        [Bindable(event="propertyChange")]
        public function get xdPet():ItemSlotPet
        {
            return (this._113881747xdPet);
        }

        private function checkRepeatPets(_arg_1:Object, _arg_2:int):Boolean
        {
            var _local_3:Object;
            for each (_local_3 in _arg_1)
            {
                if (((_local_3.slot) && (ToolKit.isEqual(_local_3.slot.giid, _arg_2))))
                {
                    return (true);
                };
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn5():FilterButton
        {
            return (this._1554141554tabBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn7():FilterButton
        {
            return (this._1554141552tabBtn7);
        }

        public function __joinPet1_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(joinPet1);
        }

        [Bindable(event="propertyChange")]
        public function get joinButton1():BasicGlowButton
        {
            return (this._1995978421joinButton1);
        }

        public function resetPetBagSlot(_arg_1:ItemSlot, _arg_2:Object=null):void
        {
            var _local_3:Object;
            if (_arg_2)
            {
                _local_3 = _arg_2.slotData;
                _arg_1.slotData = _local_3;
                _arg_1.type = ((_local_3.type) || (_arg_2.type));
                _arg_1.giid = ((_local_3.itemId) || (_arg_2.giid));
                _arg_1.stackNum = _local_3.stackNum;
            }
            else
            {
                _arg_1.clean();
            };
        }

        private function buyItem(_arg_1:String):void
        {
            var _local_2:SystemShopPanel = SystemShopPanel(_core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP));
            _local_2.show();
            _local_2.setPage(_arg_1);
        }

        public function set xsdButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1265723739xsdButton;
            if (_local_2 !== _arg_1)
            {
                this._1265723739xsdButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xsdButton", _local_2, _arg_1));
            };
        }

        private function changeBagVis():void
        {
            if (!petBagAdded)
            {
                petBag = null;
                petBag = new FuncBag();
                petBag.x = 457;
                petBag.y = 33;
                width = 702;
                petBag.rows = 2;
                petBag.cols = 6;
                petBag.upType = Slot.SLOT_PET;
                petBag.upTabButtons = {
                    "l":[Language.WING_PANEL_U[106], Language.WING_PANEL_U[107], Language.WING_PANEL_U[108], Language.WING_PANEL_U[109], Language.WING_PANEL_U[110], Language.WING_PANEL_U[111]],
                    "p":"color",
                    "v":[-1, 4, 3, 2, 1, 0]
                };
                addChild((petBag as FuncBag));
                petBag.pFuncPanel = this;
                petBag.DClickCallBack = funcBagClickHandler;
                this.addEventListener(Slot.EVENT_SLOT_DCLICK, funcBagClickHandler);
                petBagAdded = true;
                showBag.styleName = "EquipBagLeft";
            }
            else
            {
                if (petBag.visible)
                {
                    petBag.visible = false;
                    width = 459;
                    showBag.styleName = "EquipBagRight";
                }
                else
                {
                    petBag.visible = true;
                    width = 702;
                    showBag.styleName = "EquipBagLeft";
                };
            };
            if (petBag.visible)
            {
                upPetRefresh();
            };
            pTitle.text = pTitle.text;
        }

        public function set starPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._1897219731starPet;
            if (_local_2 !== _arg_1)
            {
                this._1897219731starPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starPet", _local_2, _arg_1));
            };
        }

        public function __tab_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function petJoin():void
        {
            var pets:Object;
            var func:Function;
            if ((((((joinMainPet.slotData) && (joinPet1.slotData)) && (joinPet2.slotData)) && (joinPet3.slotData)) && (joinPet4.slotData)))
            {
                pets = {};
                pets.main = joinMainPet.slotData;
                pets.pet1 = joinPet1.slotData;
                pets.pet2 = joinPet2.slotData;
                pets.pet3 = joinPet3.slotData;
                pets.pet4 = joinPet4.slotData;
                if (checkPetsData(pets))
                {
                    if (checkPetBind(pets))
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("petJoin", new Responder(onJoin), joinMainPet.slotData.id, joinPet1.slotData.id, joinPet2.slotData.id, joinPet3.slotData.id, joinPet4.slotData.id);
                                joinButton.enabled = false;
                            };
                        };
                        Alert.show(Language.PETFUNCPANEL_S[40], "", (Alert.YES | Alert.NO), this, func);
                    }
                    else
                    {
                        _core.remote.call("petJoin", new Responder(onJoin), joinMainPet.slotData.id, joinPet1.slotData.id, joinPet2.slotData.id, joinPet3.slotData.id, joinPet4.slotData.id);
                        joinButton.enabled = false;
                    };
                };
            };
        }

        public function set bookPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._64661878bookPet;
            if (_local_2 !== _arg_1)
            {
                this._64661878bookPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bookPet", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        public function set bookButton(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1810742139bookButton;
            if (_local_2 !== _arg_1)
            {
                this._1810742139bookButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bookButton", _local_2, _arg_1));
            };
        }

        private function getMaxAptitudes(_arg_1:Object):void
        {
            var _local_2:Object = _core.getTemplateData(GamePredef.TBL_CREATURE, _arg_1.tid, false);
            if (!_local_2)
            {
                return;
            };
            xsdMaxText.htmlText = (((((((((Language.PETFUNCPANEL_S[48] + Math.round((_local_2.aptStrength * 1.2))) + Language.PETFUNCPANEL_S[19]) + Math.round((_local_2.aptAgility * 1.2))) + Language.PETFUNCPANEL_S[20]) + Math.round((_local_2.aptStamina * 1.2))) + Language.PETFUNCPANEL_S[21]) + Math.round((_local_2.aptIntelligence * 1.2))) + Language.PETFUNCPANEL_S[22]) + Math.round((_local_2.aptEnergy * 1.2)));
        }

        public function set xsdItem(_arg_1:ItemSlotPetFunc):void
        {
            var _local_2:Object = this._1781714052xsdItem;
            if (_local_2 !== _arg_1)
            {
                this._1781714052xsdItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xsdItem", _local_2, _arg_1));
            };
        }

        private function pzXsdViewClear():void
        {
            pzxsdPet.clean();
            pzxsdItem.clean();
            pzxsdInfo.htmlText = "";
            pzxsdText.htmlText = "";
        }

        [Bindable(event="propertyChange")]
        public function get aptType():ComboBox
        {
            return (this._790240513aptType);
        }

        public function set seniorPetJoinEnable(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1822648700seniorPetJoinEnable;
            if (_local_2 !== _arg_1)
            {
                this._1822648700seniorPetJoinEnable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seniorPetJoinEnable", _local_2, _arg_1));
            };
        }

        public function __xsdItem_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(xsdItem);
        }

        public function __xdButton_click(_arg_1:MouseEvent):void
        {
            petXd();
        }

        private function petXsd():void
        {
            if (((xsdPet.slotData) && (xsdItem.slotData)))
            {
                _core.remote.call("petXsd", new Responder(onXsd), xsdPet.slotData.id, xsdItem.slotData.id);
                xsdButton.enabled = false;
            };
        }

        private function petNd():void
        {
            var func:Function;
            if (((starPet.slotData) && (starItem.slotData)))
            {
                if (starPet.slotData.binded == 0)
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.OK)
                        {
                            petStar();
                        };
                    };
                    Alert.show(Language.PETFUNCPANEL_S[42], "", (Alert.OK | Alert.CANCEL), this, func);
                }
                else
                {
                    petStar();
                };
            };
        }

        public function set bookItem(_arg_1:ItemSlotCreBook):void
        {
            var _local_2:Object = this._2004323740bookItem;
            if (_local_2 !== _arg_1)
            {
                this._2004323740bookItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bookItem", _local_2, _arg_1));
            };
        }

        public function __tabBtn7_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(7);
        }

        public function petAdvancedJoin():void
        {
            _core.view.getUI(ViewManager.PANEL_PETADVANCED).show();
        }

        public function set xsdPet(_arg_1:ItemSlotPet):void
        {
            var _local_2:Object = this._750205034xsdPet;
            if (_local_2 !== _arg_1)
            {
                this._750205034xsdPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xsdPet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get joinPet2():ItemSlotPet
        {
            return (this._1401872579joinPet2);
        }

        [Bindable(event="propertyChange")]
        public function get joinPet3():ItemSlotPet
        {
            return (this._1401872578joinPet3);
        }

        [Bindable(event="propertyChange")]
        public function get joinPet4():ItemSlotPet
        {
            return (this._1401872577joinPet4);
        }

        private function tabBtnClick(_arg_1:int):void
        {
            tab.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= (tab.numChildren - 1))
            {
                this[("tabBtn" + _local_2)].selected = (_local_2 == _arg_1);
                _local_2++;
            };
            (((petBag) && (petBag.initialized)) && (upPetRefresh()));
            tabBtnUpdate();
        }

        [Bindable(event="propertyChange")]
        public function get joinPet1():ItemSlotPet
        {
            return (this._1401872580joinPet1);
        }

        public function set tab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._114581tab;
            if (_local_2 !== _arg_1)
            {
                this._114581tab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab", _local_2, _arg_1));
            };
        }

        public function set xsdText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1781400170xsdText;
            if (_local_2 !== _arg_1)
            {
                this._1781400170xsdText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xsdText", _local_2, _arg_1));
            };
        }

        public function set xsdMaxText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1185484712xsdMaxText;
            if (_local_2 !== _arg_1)
            {
                this._1185484712xsdMaxText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xsdMaxText", _local_2, _arg_1));
            };
        }

        public function addItem(_arg_1:ItemSlot):void
        {
            var _local_2:DragEvent = new DragEvent(DragEvent.DRAG_DROP);
            var _local_3:DragSource = new DragSource();
            _local_3.addData(_arg_1, "slot");
            _local_2.dragSource = _local_3;
        }

        private function setJoinInfo(_arg_1:Event):void
        {
            var _local_3:ItemSlotPet;
            var _local_4:ItemSlotPet;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:Array;
            var _local_9:Object;
            var _local_10:*;
            var _local_11:Number;
            if (_arg_1)
            {
                _local_4 = ItemSlotPet(_arg_1.currentTarget);
                if (_local_4)
                {
                    _local_5 = 0;
                    while (_local_5 <= 4)
                    {
                        if (_local_5 == 0)
                        {
                            _local_3 = this.joinMainPet;
                        }
                        else
                        {
                            _local_3 = this[("joinPet" + _local_5)];
                        };
                        if ((((_local_3) && (!(_local_3 == _local_4))) && (_local_3.giid == _local_4.giid)))
                        {
                            _local_3.clean();
                        };
                        _local_5++;
                    };
                };
            };
            var _local_2:Object = {};
            _local_2.main = joinMainPet.slotData;
            _local_2.pet1 = joinPet1.slotData;
            _local_2.pet2 = joinPet2.slotData;
            _local_2.pet3 = joinPet3.slotData;
            _local_2.pet4 = joinPet4.slotData;
            if (!checkPetsData(_local_2))
            {
                return;
            };
            if (joinMainPet.slotData)
            {
                _local_6 = petList[joinMainPet.slotData.id];
                if (_local_6)
                {
                    if (ToolKit.isBigOrEqual(_core.basic.colorByGrowRate(_local_6.growRate), 4))
                    {
                        joinInfo.htmlText = Language.PETFUNCPANEL_S[7];
                    }
                    else
                    {
                        _local_7 = GamePredef.PET_JOIN_SUCCESS[_core.basic.colorByGrowRate(_local_6.growRate)];
                        if (_core.MC_BIRTH_FLAG[5])
                        {
                            _local_7 = GamePredef.MC_BIRTH_CONFIG[5][_core.basic.colorByGrowRate(_local_6.growRate)];
                        };
                        if ((((_core.basic.colorByGrowRate(_local_6.growRate) == 3) && (_core.pet_rate > 0)) && (_local_6.creatureData.classIds == 10)))
                        {
                            joinInfo.htmlText = ((Language.PETFUNCPANEL_S[8] + _core.pet_rate) + "%");
                            if (((_core.player.pmLevel) && (Number(_core.player.pmLevel) > 0)))
                            {
                                _local_8 = GameData.d[GamePredef.TBL_PM_RIGHT];
                                _local_9 = null;
                                for (_local_10 in _local_8)
                                {
                                    if (((_local_8[_local_10]) && (Number(_local_8[_local_10].id) == 6)))
                                    {
                                        _local_9 = _local_8[_local_10];
                                        break;
                                    };
                                };
                                if (((_local_9) && (_local_9[("value" + _core.player.pmLevel)])))
                                {
                                    _local_11 = (Number(_core.pet_rate) + Number(_local_9[("value" + _core.player.pmLevel)]));
                                    joinInfo.htmlText = ((Language.PETFUNCPANEL_S[8] + _local_11) + "%");
                                };
                            };
                        }
                        else
                        {
                            joinInfo.htmlText = ((Language.PETFUNCPANEL_S[8] + _local_7) + "%");
                            if ((((_core.basic.colorByGrowRate(_local_6.growRate) == 3) && (_core.player.pmLevel)) && (Number(_core.player.pmLevel) > 0)))
                            {
                                _local_8 = GameData.d[GamePredef.TBL_PM_RIGHT];
                                _local_9 = null;
                                for (_local_10 in _local_8)
                                {
                                    if (((_local_8[_local_10]) && (Number(_local_8[_local_10].id) == 6)))
                                    {
                                        _local_9 = _local_8[_local_10];
                                        break;
                                    };
                                };
                                if (((_local_9) && (_local_9[("value" + _core.player.pmLevel)])))
                                {
                                    _local_11 = (Number(_local_7) + Number(_local_9[("value" + _core.player.pmLevel)]));
                                    joinInfo.htmlText = ((Language.PETFUNCPANEL_S[8] + _local_11) + "%");
                                };
                            };
                        };
                    };
                };
                if (((((joinPet1.slotData) && (joinPet2.slotData)) && (joinPet3.slotData)) && (joinPet4.slotData)))
                {
                    joinButton.enabled = true;
                    return;
                };
            };
            joinButton.enabled = false;
        }

        [Bindable(event="propertyChange")]
        public function get bookButton():DelayButton
        {
            return (this._1810742139bookButton);
        }

        public function __xsdPet_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(xsdPet);
        }

        public function set xdInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._764833350xdInfo;
            if (_local_2 !== _arg_1)
            {
                this._764833350xdInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xdInfo", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:PetFuncPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetFuncPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetFuncPanelWatcherSetupUtil");
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

        private function updatePet(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            if (((petList) && (petList[_arg_1])))
            {
                petList[_arg_1][_arg_2] = _arg_3;
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + GamePredef.TBL_PET) + "_") + _arg_1), dataLoaded);
                _core.data.delData(GamePredef.TBL_PET, _arg_1);
                _core.data.getGameData(GamePredef.TBL_PET, _arg_1);
            };
        }

        public function __joinButton1_click(_arg_1:MouseEvent):void
        {
            petAdvancedJoin();
        }

        public function __bookButton_click(_arg_1:MouseEvent):void
        {
            petBook();
        }

        public function onJoin(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1)
            {
                if (_arg_1.flag)
                {
                    if (((petList) && (petList[_arg_1.pid])))
                    {
                        petList[_arg_1.pid]["growRate"] = _arg_1.grow;
                        _core.view.getUI(ViewManager.PANEL_PETMANAGER).updateView(_arg_1.pid);
                        _core.view.getUI(ViewManager.PANEL_BAG).petInit();
                        joinMainPet.setStyleName(_core.basic.colorByGrowRate(_arg_1.grow));
                    };
                    _core.sysMidNote(Language.PETFUNCPANEL_S[13]);
                    _local_2 = 1;
                    while (_local_2 <= 4)
                    {
                        this[("joinPet" + _local_2)].clean();
                        _local_2++;
                    };
                    joinButton.enabled = true;
                    setJoinInfo(null);
                }
                else
                {
                    _core.sysMidNote(Language.PETFUNCPANEL_S[14]);
                    joinViewClear();
                    joinButton.enabled = true;
                };
            };
        }

        public function __starSafeItem_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(starSafeItem);
        }

        [Bindable(event="propertyChange")]
        public function get tab():ViewStack
        {
            return (this._114581tab);
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
        public function get xsdMaxText():TextArea
        {
            return (this._1185484712xsdMaxText);
        }

        public function putPet(_arg_1:ItemSlot, _arg_2:int):void
        {
            var _local_3:DragEvent;
            var _local_4:DragSource;
            if (((_arg_1) && (_arg_2 >= 0)))
            {
                show();
                tabBtnClick(_arg_2);
                _local_3 = new DragEvent(DragEvent.DRAG_DROP);
                _local_4 = new DragSource();
                _local_4.addData(_arg_1, "slot");
                _local_3.dragSource = _local_4;
                switch (_arg_2)
                {
                    case 0:
                        starPet.dispatchEvent(_local_3);
                        return;
                    case 1:
                        joinMainPet.dispatchEvent(_local_3);
                        return;
                    case 2:
                        xsdPet.dispatchEvent(_local_3);
                        return;
                    case 3:
                        return;
                    case 4:
                        return;
                    case 5:
                        bookPet.dispatchEvent(_local_3);
                        return;
                    case 6:
                        mainPet.dispatchEvent(_local_3);
                        return;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get xsdItem():ItemSlotPetFunc
        {
            return (this._1781714052xsdItem);
        }

        private function _refreshMainPetText():void
        {
            var _local_1:*;
            if (mainPet.slotData)
            {
                _local_1 = mainPet.slotData;
                eatMainText.htmlText = ((((((((((((((Language.PETFUNCPANEL_S[45] + _local_1.aptStrength) + ((_local_1.aptStrengthEx >= 0) ? ("+" + _local_1.aptStrengthEx) : "")) + Language.PETFUNCPANEL_S[19]) + _local_1.aptAgility) + ((_local_1.aptAgilityEx >= 0) ? ("+" + _local_1.aptAgilityEx) : "")) + Language.PETFUNCPANEL_S[20]) + _local_1.aptStamina) + ((_local_1.aptStaminaEx >= 0) ? ("+" + _local_1.aptStaminaEx) : "")) + Language.PETFUNCPANEL_S[21]) + _local_1.aptIntelligence) + ((_local_1.aptIntelligenceEx >= 0) ? ("+" + _local_1.aptIntelligenceEx) : "")) + Language.PETFUNCPANEL_S[22]) + _local_1.aptEnergy) + ((_local_1.aptEnergyEx >= 0) ? ("+" + _local_1.aptEnergyEx) : ""));
            };
        }

        [Bindable(event="propertyChange")]
        public function get xsdPet():ItemSlotPet
        {
            return (this._750205034xsdPet);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        public function set pzxsdInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._183693363pzxsdInfo;
            if (_local_2 !== _arg_1)
            {
                this._183693363pzxsdInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pzxsdInfo", _local_2, _arg_1));
            };
        }

        public function set pTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1007683640pTitle;
            if (_local_2 !== _arg_1)
            {
                this._1007683640pTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pTitle", _local_2, _arg_1));
            };
        }

        public function onPzXsd(data:Object):void
        {
            var yesAlert:String;
            var func:Function;
            var title:String;
            var contentMsg:* = undefined;
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (data)
            {
                updatePet(data.p, data.t, data.num);
                if (ToolKit.isEqual(data.i, pzxsdItem.slotData.id))
                {
                    if (ToolKit.isBigThan(data.n, 0))
                    {
                        pzxsdItem.stackNum = data.n;
                    }
                    else
                    {
                        pzxsdItem.clean();
                    };
                };
                setPzXsdInfo(null);
                if (data.f)
                {
                    pzxsdButton.enabled = false;
                    yesAlert = Alert.yesLabel;
                    func = function (_arg_1:CloseEvent):void
                    {
                        Alert.yesLabel = yesAlert;
                        if (_arg_1.detail == Alert.YES)
                        {
                            if (data.before < data.after)
                            {
                                pzxsdInfo.text = Language.PETFUNCPANEL_S[47];
                            }
                            else
                            {
                                pzxsdInfo.text = "";
                            };
                            pzxsdButton.enabled = true;
                        };
                    };
                    title = Language.PETFUNCPANEL_S[54];
                    contentMsg = _showAlertMsg(Language.PETFUNCPANEL_S[53], title, data.before, data.after);
                    msg = contentMsg.replace(/<font(.*?)>/g, "");
                    msg = msg.replace(/<\/font>/g, "");
                    msg = msg.replace(/<b>/g, "");
                    msg = msg.replace(/<\/b>/g, "");
                    if (data.before < data.after)
                    {
                        Alert.yesLabel = Language.PETFUNCPANEL_S[50];
                    }
                    else
                    {
                        Alert.yesLabel = Language.PETFUNCPANEL_S[51];
                    };
                    _alert = Alert.show(msg, "", Alert.YES, null, func);
                    Alert.yesLabel = yesAlert;
                    tf = _alert.mx_internal::alertForm.mx_internal::textField;
                    tf.htmlText = contentMsg;
                    tf.filters = GamePredef.FILTER_TEXT1;
                }
                else
                {
                    pzxsdInfo.text = Language.PETFUNCPANEL_S[24];
                    pzxsdButton.enabled = true;
                };
            }
            else
            {
                pzxsdButton.enabled = true;
            };
        }

        public function __joinMainPet_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(joinMainPet);
        }

        [Bindable(event="propertyChange")]
        public function get pTitle():BasicTitleCanvas
        {
            return (this._1007683640pTitle);
        }

        [Bindable(event="propertyChange")]
        public function get showBag():BasicGlowButton
        {
            return (this._2067262411showBag);
        }

        public function __luckItem_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(luckItem);
        }

        private function _PetFuncPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pTitle.text = _arg_1;
            }, "pTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Canvas1.label = _arg_1;
            }, "_PetFuncPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC2);
            }, function (_arg_1:Object):void
            {
                _PetFuncPanel_Image1.source = _arg_1;
            }, "_PetFuncPanel_Image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_IntroText1.htmlText = _arg_1;
            }, "_PetFuncPanel_IntroText1.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                starButton.label = _arg_1;
            }, "starButton.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                starClearButton.label = _arg_1;
            }, "starClearButton.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton1.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton2.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton2.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton3.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton3.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Canvas3.label = _arg_1;
            }, "_PetFuncPanel_Canvas3.label");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC1);
            }, function (_arg_1:Object):void
            {
                _PetFuncPanel_Image2.source = _arg_1;
            }, "_PetFuncPanel_Image2.source");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_IntroText2.htmlText = _arg_1;
            }, "_PetFuncPanel_IntroText2.htmlText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                joinButton.label = _arg_1;
            }, "joinButton.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                joinButton1.label = _arg_1;
            }, "joinButton1.label");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (seniorPetJoinEnable);
            }, function (_arg_1:Boolean):void
            {
                joinButton1.visible = _arg_1;
            }, "joinButton1.visible");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton4.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton4.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton5.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton5.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton6.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton6.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Canvas5.label = _arg_1;
            }, "_PetFuncPanel_Canvas5.label");
            result[18] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC2);
            }, function (_arg_1:Object):void
            {
                _PetFuncPanel_Image3.source = _arg_1;
            }, "_PetFuncPanel_Image3.source");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_IntroText3.htmlText = _arg_1;
            }, "_PetFuncPanel_IntroText3.htmlText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                xsdButton.label = _arg_1;
            }, "xsdButton.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton7.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton7.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton8.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton8.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_DescriptionLabel1.text = _arg_1;
            }, "_PetFuncPanel_DescriptionLabel1.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Canvas7.label = _arg_1;
            }, "_PetFuncPanel_Canvas7.label");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC2);
            }, function (_arg_1:Object):void
            {
                _PetFuncPanel_Image4.source = _arg_1;
            }, "_PetFuncPanel_Image4.source");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_IntroText4.htmlText = _arg_1;
            }, "_PetFuncPanel_IntroText4.htmlText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pzxsdButton.label = _arg_1;
            }, "pzxsdButton.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton9.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton9.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton10.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton10.label");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_DescriptionLabel2.text = _arg_1;
            }, "_PetFuncPanel_DescriptionLabel2.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Canvas9.label = _arg_1;
            }, "_PetFuncPanel_Canvas9.label");
            result[32] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC2);
            }, function (_arg_1:Object):void
            {
                _PetFuncPanel_Image5.source = _arg_1;
            }, "_PetFuncPanel_Image5.source");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_IntroText5.htmlText = _arg_1;
            }, "_PetFuncPanel_IntroText5.htmlText");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                xdButton.label = _arg_1;
            }, "xdButton.label");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_RoundedButton1.label = _arg_1;
            }, "_PetFuncPanel_RoundedButton1.label");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton11.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton11.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton12.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton12.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_DescriptionLabel3.text = _arg_1;
            }, "_PetFuncPanel_DescriptionLabel3.text");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Canvas11.label = _arg_1;
            }, "_PetFuncPanel_Canvas11.label");
            result[40] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC2);
            }, function (_arg_1:Object):void
            {
                _PetFuncPanel_Image6.source = _arg_1;
            }, "_PetFuncPanel_Image6.source");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_IntroText6.htmlText = _arg_1;
            }, "_PetFuncPanel_IntroText6.htmlText");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bookButton.label = _arg_1;
            }, "bookButton.label");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton13.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton13.label");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton14.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton14.label");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Canvas12.label = _arg_1;
            }, "_PetFuncPanel_Canvas12.label");
            result[46] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_FUNC2);
            }, function (_arg_1:Object):void
            {
                _PetFuncPanel_Image7.source = _arg_1;
            }, "_PetFuncPanel_Image7.source");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_IntroText7.htmlText = _arg_1;
            }, "_PetFuncPanel_IntroText7.htmlText");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton15.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton15.label");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton16.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton16.label");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicTxtButton17.label = _arg_1;
            }, "_PetFuncPanel_BasicTxtButton17.label");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_DescriptionLabel4.text = _arg_1;
            }, "_PetFuncPanel_DescriptionLabel4.text");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bookButton1.label = _arg_1;
            }, "bookButton1.label");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_S[57];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_IntroText8.htmlText = _arg_1;
            }, "_PetFuncPanel_IntroText8.htmlText");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Label7.text = _arg_1;
            }, "_PetFuncPanel_Label7.text");
            result[55] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetFuncPanel_Label7.filters = _arg_1;
            }, "_PetFuncPanel_Label7.filters");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_Label8.text = _arg_1;
            }, "_PetFuncPanel_Label8.text");
            result[57] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _PetFuncPanel_Label8.filters = _arg_1;
            }, "_PetFuncPanel_Label8.filters");
            result[58] = binding;
            binding = new Binding(this, function ():Object
            {
                return (new ArrayCollection(Language.PETFUNCPANEL_U[46]));
            }, function (_arg_1:Object):void
            {
                elementBox.dataProvider = _arg_1;
            }, "elementBox.dataProvider");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                elementCost.text = _arg_1;
            }, "elementCost.text");
            result[60] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                elementCost.filters = _arg_1;
            }, "elementCost.filters");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetFuncPanel_BasicGlowButton9.label = _arg_1;
            }, "_PetFuncPanel_BasicGlowButton9.label");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[63] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn0.filters = _arg_1;
            }, "tabBtn0.filters");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[65] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn1.filters = _arg_1;
            }, "tabBtn1.filters");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[67] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn2.filters = _arg_1;
            }, "tabBtn2.filters");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[69] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn3.filters = _arg_1;
            }, "tabBtn3.filters");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[71] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn4.filters = _arg_1;
            }, "tabBtn4.filters");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn5.label = _arg_1;
            }, "tabBtn5.label");
            result[73] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn5.filters = _arg_1;
            }, "tabBtn5.filters");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn6.label = _arg_1;
            }, "tabBtn6.label");
            result[75] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn6.filters = _arg_1;
            }, "tabBtn6.filters");
            result[76] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETFUNCPANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn7.label = _arg_1;
            }, "tabBtn7.label");
            result[77] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn7.filters = _arg_1;
            }, "tabBtn7.filters");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_S[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showBag.toolTip = _arg_1;
            }, "showBag.toolTip");
            result[79] = binding;
            return (result);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            petList = _core.player.petList;
            var _local_1:ArrayCollection = new ArrayCollection();
            _local_1.addItem({
                "type":-1,
                "label":Language.PETFUNCPANEL_U[28]
            });
            _local_1.addItem({
                "type":1,
                "label":Language.PETPANEL_U[12]
            });
            _local_1.addItem({
                "type":2,
                "label":Language.PETPANEL_U[13]
            });
            _local_1.addItem({
                "type":3,
                "label":Language.PETPANEL_U[14]
            });
            _local_1.addItem({
                "type":4,
                "label":Language.PETPANEL_U[15]
            });
            _local_1.addItem({
                "type":5,
                "label":Language.PETPANEL_U[16]
            });
            aptType.dataProvider = _local_1;
        }

        private function checkPetBind(_arg_1:Object):Boolean
        {
            var _local_3:Object;
            if (_arg_1.main.binded == 1)
            {
                return (true);
            };
            var _local_2:int = 1;
            while (_local_2 <= 4)
            {
                if (_arg_1[("pet" + _local_2)])
                {
                    _local_3 = _arg_1[("pet" + _local_2)];
                    if (_local_3.binded == 1)
                    {
                        return (true);
                    };
                };
                _local_2++;
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get pzxsdInfo():Label
        {
            return (this._183693363pzxsdInfo);
        }

        private function xsdViewClear():void
        {
            xsdPet.clean();
            xsdItem.clean();
            xsdInfo.htmlText = "";
            xsdText.htmlText = "";
            xsdMaxText.htmlText = "";
        }

        public function __tabBtn6_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(6);
        }

        public function set eatMainText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._2140516866eatMainText;
            if (_local_2 !== _arg_1)
            {
                this._2140516866eatMainText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eatMainText", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

