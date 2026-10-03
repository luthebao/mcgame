// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetTalentFuncPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.TalentSlot;
    import mx.containers.ViewStack;
    import mx.controls.CheckBox;
    import mx.controls.Button;
    import mx.containers.Canvas;
    import mx.containers.Tile;
    import mx.controls.TextInput;
    import mx.controls.NumericStepper;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.net.Responder;
    import mx.events.NumericStepperEvent;
    import mx.binding.Binding;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.event.GameEvent;
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

    public class PetTalentFuncPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var itemLen:Number = 0;
        private var _802861224delSlot1:TalentSlot;
        private var _249806821upSlot4:TalentSlot;
        private var _109532659slot1:TalentSlot;
        private var _951264094rSlot2:TalentSlot;
        private var _899454782slot26:TalentSlot;
        private var maxPage:uint = 1;
        private var _3773vs:ViewStack;
        private var _109532667slot9:TalentSlot;
        private var _398266427checkItem:CheckBox;
        private var _899454813slot16:TalentSlot;
        private var _320271553btnLastPage:Button;
        public var _PetTalentFuncPanel_Canvas1:Canvas;
        private var _133022078firstTile:Tile;
        private var _109532664slot6:TalentSlot;
        private var _1229795408txtPageIndicator:TextInput;
        private var _899454787slot21:TalentSlot;
        private var _109532661slot3:TalentSlot;
        private var _899454810slot19:TalentSlot;
        private var _899454818slot11:TalentSlot;
        private var _click:Number = 0;
        private var _899454784slot24:TalentSlot;
        private var _899454815slot14:TalentSlot;
        private var _249806824upSlot1:TalentSlot;
        private var _1717904490talentMixNum:NumericStepper;
        private var _1540805694tbPoint:Label;
        private var _1468352367_point:Number = 0;
        private var _1863324756bangBtn0:BasicGlowButton;
        public var _PetTalentFuncPanel_Label3:Label;
        private var _3119c2:Canvas;
        private var _899454781slot27:TalentSlot;
        private var _109532665slot7:TalentSlot;
        private var _899454812slot17:TalentSlot;
        private var _249806822upSlot3:TalentSlot;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _109532662slot4:TalentSlot;
        private var _firstLoadCid:Number = 0;
        private var _3118c1:Canvas;
        private var _899454786slot22:TalentSlot;
        public var _PetTalentFuncPanel_IntroText1:IntroText;
        private var _899454817slot12:TalentSlot;
        private var _249806820upSlot5:TalentSlot;
        private var countPerPage:uint = 28;
        public var _PetTalentFuncPanel_Image1:Image;
        public var _PetTalentFuncPanel_Image3:Image;
        public var _PetTalentFuncPanel_Image2:Image;
        private var _951264095rSlot1:TalentSlot;
        private var _899454783slot25:TalentSlot;
        private var _899454814slot15:TalentSlot;
        private var _3120c3:Canvas;
        private var _changed:Boolean = false;
        private var _109532666slot8:TalentSlot;
        private var _899454780slot28:TalentSlot;
        private var _109532663slot5:TalentSlot;
        public var _PetTalentFuncPanel_BasicDelayButton1:BasicDelayButton;
        public var _PetTalentFuncPanel_BasicDelayButton2:BasicDelayButton;
        public var _PetTalentFuncPanel_BasicDelayButton3:BasicDelayButton;
        private var _899454819slot10:TalentSlot;
        private var _899454811slot18:TalentSlot;
        private var _1090881890btnNextPage:Button;
        private var _isLoadInfo:Boolean = false;
        private var _899454788slot20:TalentSlot;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var itemPageNo:uint = 1;
        private var _109532660slot2:TalentSlot;
        public var _PetTalentFuncPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1863324753bangBtn3:DelayButton;
        private var _256612071upLabel:Label;
        private var _899454785slot23:TalentSlot;
        private var _249806823upSlot2:TalentSlot;
        private var _899454816slot13:TalentSlot;
        private var max_slot:uint = 320;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":442,
                    "height":385,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetTalentFuncPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":253,
                                "y":60,
                                "width":175,
                                "height":315,
                                "styleName":"CanvasBorder",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_PetTalentFuncPanel_Canvas1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "3";
                                        this.bottom = "10";
                                        this.left = "4.5";
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"firstTile",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalGap = 4;
                                                    this.horizontalGap = 3;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":160.5,
                                                        "height":277,
                                                        "direction":"horizontal",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "styleName":"TileSlot",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot19",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot21",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot22",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot23",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot24",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot25",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot26",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot27",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TalentSlot,
                                                            "id":"slot28",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":true,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalAlign = "middle";
                                                    this.horizontalGap = 5;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":276,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"btnLastPage",
                                                            "events":{"click":"__btnLastPage_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"LastPage",
                                                                    "autoRepeat":true,
                                                                    "width":45,
                                                                    "useHandCursor":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextInput,
                                                            "id":"txtPageIndicator",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"PageNoIndicator",
                                                                    "width":50,
                                                                    "height":16,
                                                                    "text":"0",
                                                                    "y":2.5,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"btnNextPage",
                                                            "events":{"click":"__btnNextPage_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"NextPage",
                                                                    "autoRepeat":true,
                                                                    "width":45,
                                                                    "useHandCursor":true,
                                                                    "y":0
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
                            this.horizontalGap = 1;
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "width":339,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn0",
                                    "events":{"click":"__bangBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "labelPlacement":"bottom",
                                            "width":100
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
                                            "width":100
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
                                            "width":100
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vs",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":60,
                                "width":235,
                                "height":170,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"c1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "x":33,
                                            "y":2,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetTalentFuncPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":185,
                                                        "height":105,
                                                        "x":25,
                                                        "y":10
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TalentSlot,
                                                "id":"upSlot2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":34,
                                                        "height":34,
                                                        "sid":60002,
                                                        "movable":false,
                                                        "acceptable":true,
                                                        "showStackNum":false,
                                                        "x":35,
                                                        "y":41
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TalentSlot,
                                                "id":"upSlot1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":34,
                                                        "height":34,
                                                        "sid":60001,
                                                        "movable":false,
                                                        "acceptable":true,
                                                        "showStackNum":false,
                                                        "x":100.5,
                                                        "y":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TalentSlot,
                                                "id":"upSlot3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":34,
                                                        "height":34,
                                                        "sid":60003,
                                                        "movable":false,
                                                        "acceptable":true,
                                                        "showStackNum":false,
                                                        "x":137.5,
                                                        "y":83
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TalentSlot,
                                                "id":"upSlot4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":34,
                                                        "height":34,
                                                        "sid":60004,
                                                        "movable":false,
                                                        "acceptable":true,
                                                        "showStackNum":false,
                                                        "x":62,
                                                        "y":83
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TalentSlot,
                                                "id":"upSlot5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":34,
                                                        "height":34,
                                                        "sid":60005,
                                                        "movable":false,
                                                        "acceptable":true,
                                                        "showStackNum":false,
                                                        "x":166,
                                                        "y":41
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"checkItem",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":119,
                                                        "label":"Checkbox",
                                                        "width":200
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"upLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":142,
                                                        "text":"Label",
                                                        "width":96.2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_PetTalentFuncPanel_BasicDelayButton1",
                                                "events":{"click":"___PetTalentFuncPanel_BasicDelayButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":132,
                                                        "y":141
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"c2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "x":33,
                                            "y":2,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetTalentFuncPanel_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":185,
                                                        "height":105,
                                                        "x":25,
                                                        "y":10
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TalentSlot,
                                                "id":"rSlot1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":34,
                                                        "height":34,
                                                        "sid":70001,
                                                        "movable":false,
                                                        "acceptable":true,
                                                        "showStackNum":false,
                                                        "x":100.5,
                                                        "y":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TalentSlot,
                                                "id":"rSlot2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":34,
                                                        "height":34,
                                                        "sid":70002,
                                                        "movable":false,
                                                        "acceptable":true,
                                                        "showStackNum":false,
                                                        "x":100.5,
                                                        "y":82
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_PetTalentFuncPanel_BasicDelayButton2",
                                                "events":{"click":"___PetTalentFuncPanel_BasicDelayButton2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":142,
                                                        "y":138
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"c3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "x":33,
                                            "y":2,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetTalentFuncPanel_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":185,
                                                        "height":105,
                                                        "x":25,
                                                        "y":10
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TalentSlot,
                                                "id":"delSlot1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":34,
                                                        "height":34,
                                                        "sid":80001,
                                                        "movable":false,
                                                        "acceptable":true,
                                                        "x":100.5,
                                                        "y":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"talentMixNum",
                                                "events":{"change":"__talentMixNum_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":136,
                                                        "minimum":1,
                                                        "maximum":999,
                                                        "x":63,
                                                        "value":1
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_PetTalentFuncPanel_BasicDelayButton3",
                                                "events":{"click":"___PetTalentFuncPanel_BasicDelayButton3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":142,
                                                        "y":138
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"tbPoint",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":63,
                                                        "y":85,
                                                        "text":"Label",
                                                        "width":147
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetTalentFuncPanel_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":63,
                                                        "y":105,
                                                        "width":147
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_PetTalentFuncPanel_IntroText1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "width":233,
                                "height":135,
                                "x":15,
                                "y":238
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"bangBtn3",
                        "events":{"click":"__bangBtn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":5000,
                                "styleName":"HorizontalTab",
                                "x":356,
                                "y":40
                            });
                        }
                    })]
                });
            }
        });
        private var itemAC:Object = new Object();
        private var _core:Core = Core.getInstance();
        private var TAL_UP_PLAN_ITEM:Object = {
            "1":4181,
            "2":4181,
            "3":4181,
            "4":4181
        };
        private var TAL_UP_PLAN_ITEM_NUM:Object = {
            "1":1,
            "2":3,
            "3":15,
            "4":50
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetTalentFuncPanel()
        {
            mx_internal::_document = this;
            this.width = 442;
            this.height = 385;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetTalentFuncPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot7():TalentSlot
        {
            return (this._109532665slot7);
        }

        public function set slot7(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        public function set slot8(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        public function set slot9(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot8():TalentSlot
        {
            return (this._109532666slot8);
        }

        [Bindable(event="propertyChange")]
        public function get upSlot1():TalentSlot
        {
            return (this._249806824upSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get upSlot4():TalentSlot
        {
            return (this._249806821upSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get upSlot2():TalentSlot
        {
            return (this._249806823upSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get upSlot3():TalentSlot
        {
            return (this._249806822upSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get c2():Canvas
        {
            return (this._3119c2);
        }

        [Bindable(event="propertyChange")]
        public function get c3():Canvas
        {
            return (this._3120c3);
        }

        [Bindable(event="propertyChange")]
        public function get slot9():TalentSlot
        {
            return (this._109532667slot9);
        }

        [Bindable(event="propertyChange")]
        public function get c1():Canvas
        {
            return (this._3118c1);
        }

        public function set upSlot4(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._249806821upSlot4;
            if (_local_2 !== _arg_1)
            {
                this._249806821upSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upSlot4", _local_2, _arg_1));
            };
        }

        public function set upSlot1(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._249806824upSlot1;
            if (_local_2 !== _arg_1)
            {
                this._249806824upSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upSlot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get checkItem():CheckBox
        {
            return (this._398266427checkItem);
        }

        [Bindable(event="propertyChange")]
        public function get upSlot5():TalentSlot
        {
            return (this._249806820upSlot5);
        }

        public function set upSlot5(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._249806820upSlot5;
            if (_local_2 !== _arg_1)
            {
                this._249806820upSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upSlot5", _local_2, _arg_1));
            };
        }

        public function set upSlot3(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._249806822upSlot3;
            if (_local_2 !== _arg_1)
            {
                this._249806822upSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upSlot3", _local_2, _arg_1));
            };
        }

        private function _PetTalentFuncPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TALENT_PANEL_FUNC_U[0];
            _local_1 = Language.BANKPANEL_S[2];
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Language.PAGE_SELECTOR[0];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.PAGE_SELECTOR[1];
            _local_1 = Language.TALENT_PANEL_FUNC_U[1];
            _local_1 = Language.TALENT_PANEL_FUNC_U[2];
            _local_1 = Language.TALENT_PANEL_FUNC_U[3];
            _local_1 = ResManager.getIconUrl(4130220000344);
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Language.TALENT_PANEL_FUNC_U[1];
            _local_1 = ResManager.getIconUrl(4130220000344);
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Language.TALENT_PANEL_FUNC_U[2];
            _local_1 = ResManager.getIconUrl(4130220000344);
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Language.TALENT_PANEL_FUNC_U[3];
            _local_1 = ((Language.TALENT_PANEL_FUNC_U[11] + "") + _point);
            _local_1 = Language.TALENT_PANEL_FUNC_U[24];
            _local_1 = Language.TALENT_PANEL_FUNC_U[9];
        }

        public function updatePoint():void
        {
            if (initialized)
            {
                _point = ((_core.player.pvePoint) ? _core.player.pvePoint : 0);
            };
        }

        public function ___PetTalentFuncPanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            resetTalentSlot();
        }

        private function dataChangeChange():void
        {
            var _local_1:*;
            if (delSlot1.slotData)
            {
                _local_1 = _core.data.gameData[GamePredef.TBL_PET_TALENT][delSlot1.giid];
                if (((_local_1) && (_local_1.exp)))
                {
                    tbPoint.text = Language.TALENT_PANEL_FUNC_U[10].replace("{num}", (_local_1.exp * talentMixNum.value));
                };
            };
        }

        public function cleanFuncSlot():void
        {
            var _local_1:int;
            if (!initialized)
            {
                return;
            };
            _local_1 = 1;
            while (_local_1 <= 5)
            {
                this[("upSlot" + _local_1)].reset();
                this[("upSlot" + _local_1)].slotData = null;
                this[("upSlot" + _local_1)].csid = 0;
                _local_1++;
            };
            _local_1 = 1;
            while (_local_1 <= 2)
            {
                this[("rSlot" + _local_1)].reset();
                this[("rSlot" + _local_1)].slotData = null;
                this[("rSlot" + _local_1)].csid = 0;
                _local_1++;
            };
            this["delSlot1"].reset();
            this["delSlot1"].slotData = null;
            this["delSlot1"].csid = 0;
            tbPoint.text = Language.TALENT_PANEL_FUNC_U[10].replace("{num}", "");
            checkItem.label = Language.TALENT_PANEL_FUNC_U[12].replace("{name}", Language.TALENT_PANEL_FUNC_U[14]);
            upLabel.text = Language.TALENT_PANEL_FUNC_U[13].replace("{num}", "0");
        }

        public function set upLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._256612071upLabel;
            if (_local_2 !== _arg_1)
            {
                this._256612071upLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upLabel", _local_2, _arg_1));
            };
        }

        public function onUpdateTalentData(_arg_1:Object):void
        {
            _updateTalentData(_arg_1);
        }

        public function set upSlot2(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._249806823upSlot2;
            if (_local_2 !== _arg_1)
            {
                this._249806823upSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upSlot2", _local_2, _arg_1));
            };
        }

        private function checkSameTypeAndLvTalentStone(_arg_1:*, _arg_2:*):Boolean
        {
            if (((((_arg_1) && (_arg_2)) && (ToolKit.isEqual(Math.ceil((_arg_1.sid / 10000)), Math.ceil((_arg_2.sid / 10000))))) && (ToolKit.isEqual(_arg_1.lv, _arg_2.lv))))
            {
                return (true);
            };
            return (false);
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeOperationView(1);
        }

        public function set c3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3120c3;
            if (_local_2 !== _arg_1)
            {
                this._3120c3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c3", _local_2, _arg_1));
            };
        }

        private function onBreakTalentStone(_arg_1:Object):void
        {
            if (_arg_1)
            {
                cleanFuncSlot();
                _updateTalentData(_arg_1);
                _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[8]);
            };
        }

        public function set c1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3118c1;
            if (_local_2 !== _arg_1)
            {
                this._3118c1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c1", _local_2, _arg_1));
            };
        }

        public function set c2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3119c2;
            if (_local_2 !== _arg_1)
            {
                this._3119c2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c2", _local_2, _arg_1));
            };
        }

        public function set checkItem(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._398266427checkItem;
            if (_local_2 !== _arg_1)
            {
                this._398266427checkItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "checkItem", _local_2, _arg_1));
            };
        }

        private function updateBagNum(_arg_1:Number):void
        {
            if (!initialized)
            {
                return;
            };
            if (((_arg_1 > itemLen) && (_arg_1 <= max_slot)))
            {
                itemLen = _arg_1;
                initTalentInfo();
            };
        }

        private function upStone():void
        {
            var _local_8:*;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Number;
            var _local_12:String;
            var _local_1:Number = 0;
            var _local_2:* = "";
            var _local_3:* = "";
            var _local_4:Object;
            var _local_5:Number = 0;
            var _local_6:Object = new Object();
            var _local_7:* = 1;
            while (_local_7 <= 5)
            {
                if ((((ToolKit.isBigThan(this[("upSlot" + _local_7)].csid, 0)) && (this[("upSlot" + _local_7)].slotData)) && (this[("upSlot" + _local_7)].giid)))
                {
                    _local_1++;
                    if (_local_1 != 5)
                    {
                        _local_3 = ((_local_3 + this[("upSlot" + _local_7)].csid) + "|");
                        _local_2 = ((_local_2 + this[("upSlot" + _local_7)].giid) + "|");
                    }
                    else
                    {
                        _local_3 = (_local_3 + this[("upSlot" + _local_7)].csid);
                        _local_2 = (_local_2 + this[("upSlot" + _local_7)].giid);
                    };
                    if (((_local_1 > 1) && (!(checkSameTypeAndLvTalentStone(_core.data.gameData[GamePredef.TBL_PET_TALENT][this[("upSlot" + _local_7)].giid], _local_4)))))
                    {
                        _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[16]);
                        return;
                    };
                    _local_4 = _core.data.gameData[GamePredef.TBL_PET_TALENT][this[("upSlot" + _local_7)].giid];
                    if (!_local_6[this[("upSlot" + _local_7)].csid])
                    {
                        _local_6[this[("upSlot" + _local_7)].csid] = 1;
                    }
                    else
                    {
                        _local_6[this[("upSlot" + _local_7)].csid]++;
                    };
                    _local_5 = _local_4.lv;
                };
                _local_7++;
            };
            if (_local_1 == 5)
            {
                if (checkItem.selected)
                {
                    _local_9 = _core.hasItemNum(29, TAL_UP_PLAN_ITEM[_local_5]);
                    _local_10 = _core.hasItemNum(28, TAL_UP_PLAN_ITEM[_local_5]);
                    _local_11 = ToolKit.add(_local_9, _local_10);
                    if (_local_11 < TAL_UP_PLAN_ITEM_NUM[_local_5])
                    {
                        _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[18]);
                        return;
                    };
                };
                for (_local_8 in _local_6)
                {
                    if (!((((_core.player.petTalentData.b) && (_core.player.petTalentData.b[_local_8])) && (_local_6[_local_8])) && (ToolKit.isSmallOrEqual(_local_6[_local_8], _core.player.petTalentData.b[_local_8].n))))
                    {
                        _local_12 = Language.TALENT_PANEL_FUNC_U[23].replace("{num}", Math.floor((_local_8 % countPerPage)));
                        _core.sysMidNote(_local_12);
                        return;
                    };
                };
                _core.remote.call("upTalentStone", new Responder(onUpTalentStone), _local_3, _local_2, checkItem.selected);
            };
        }

        [Bindable(event="propertyChange")]
        private function get _point():Number
        {
            return (this._1468352367_point);
        }

        public function __talentMixNum_change(_arg_1:NumericStepperEvent):void
        {
            dataChangeChange();
        }

        [Bindable(event="propertyChange")]
        public function get slot10():TalentSlot
        {
            return (this._899454819slot10);
        }

        [Bindable(event="propertyChange")]
        public function get btnNextPage():Button
        {
            return (this._1090881890btnNextPage);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():TalentSlot
        {
            return (this._899454817slot12);
        }

        [Bindable(event="propertyChange")]
        public function get rSlot1():TalentSlot
        {
            return (this._951264095rSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get rSlot2():TalentSlot
        {
            return (this._951264094rSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get slot11():TalentSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():TalentSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get delSlot1():TalentSlot
        {
            return (this._802861224delSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():TalentSlot
        {
            return (this._899454814slot15);
        }

        public function __btnLastPage_click(_arg_1:MouseEvent):void
        {
            _SafeStr_1(-1);
        }

        [Bindable(event="propertyChange")]
        public function get slot17():TalentSlot
        {
            return (this._899454812slot17);
        }

        public function onInitTalentBag():void
        {
            if (_core.player.petTalentData)
            {
                txtPageIndicator.text = "1/1";
                maxPage = Math.ceil((itemLen / countPerPage));
                if (((!(maxPage)) || (maxPage == 0)))
                {
                    maxPage = 1;
                };
                if (ToolKit.isBigThan(itemPageNo, maxPage))
                {
                    itemPageNo = 1;
                };
                txtPageIndicator.text = ((itemPageNo + "/") + maxPage);
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot14():TalentSlot
        {
            return (this._899454815slot14);
        }

        public function onResetTalentBag(_arg_1:Object):void
        {
            var _local_2:*;
            if (((_arg_1) && (_core.player.petTalentData)))
            {
                _core.player.petTalentData.b = new Object();
                for (_local_2 in _arg_1)
                {
                    if (((_arg_1[_local_2]) && (ToolKit.isSmallOrEqual(_local_2, max_slot))))
                    {
                        _core.player.petTalentData.b[_local_2] = new Object();
                        _core.player.petTalentData.b[_local_2] = _arg_1[_local_2];
                    };
                };
                onInitTalentFuncPanelData(_core.player.petTalentData);
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot18():TalentSlot
        {
            return (this._899454811slot18);
        }

        [Bindable(event="propertyChange")]
        public function get slot19():TalentSlot
        {
            return (this._899454810slot19);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():TalentSlot
        {
            return (this._899454813slot16);
        }

        [Bindable(event="propertyChange")]
        public function get slot20():TalentSlot
        {
            return (this._899454788slot20);
        }

        [Bindable(event="propertyChange")]
        public function get slot21():TalentSlot
        {
            return (this._899454787slot21);
        }

        private function _updateTalentData(_arg_1:Object):void
        {
            var _local_2:Boolean;
            var _local_3:*;
            if (_arg_1)
            {
                if (!_core.player.petTalentData)
                {
                    _core.player.petTalentData = new Object();
                };
                _local_2 = false;
                if (_arg_1.a)
                {
                    if (!_core.player.petTalentData.b)
                    {
                        _core.player.petTalentData.b = new Object();
                    };
                    for (_local_3 in _arg_1.a)
                    {
                        if (_arg_1.a[_local_3])
                        {
                            if (!_core.player.petTalentData.b[_local_3])
                            {
                                _core.player.petTalentData.b[_local_3] = new Object();
                            };
                            _core.player.petTalentData.b[_local_3].t = _arg_1.a[_local_3].tid;
                            _core.player.petTalentData.b[_local_3].n = _arg_1.a[_local_3].ln;
                            if (initialized)
                            {
                                updateBagNum(_local_3);
                                updateOneTalentBag(_core.player.petTalentData.b[_local_3], _local_3);
                                if ((((!(_local_2)) && (ToolKit.isBigThan(_local_3, (ToolKit.minus(itemPageNo, 1) * countPerPage)))) && (ToolKit.isSmallOrEqual(_local_3, (itemPageNo * countPerPage)))))
                                {
                                    _local_2 = true;
                                };
                            };
                        };
                    };
                };
                if (_arg_1.d)
                {
                    for (_local_3 in _arg_1.d)
                    {
                        if (_arg_1.d[_local_3])
                        {
                            if (ToolKit.isSmallOrEqual(_arg_1.d[_local_3].ln, 0))
                            {
                                delete _core.player.petTalentData.b[_local_3];
                                if (((initialized) && (itemAC[_local_3])))
                                {
                                    delete itemAC[_local_3];
                                };
                            }
                            else
                            {
                                _core.player.petTalentData.b[_local_3].n = _arg_1.d[_local_3].ln;
                                if (initialized)
                                {
                                    updateOneTalentBag(_core.player.petTalentData.b[_local_3], _local_3);
                                };
                            };
                            if (initialized)
                            {
                                if ((((!(_local_2)) && (ToolKit.isBigThan(_local_3, (ToolKit.minus(itemPageNo, 1) * countPerPage)))) && (ToolKit.isSmallOrEqual(_local_3, (itemPageNo * countPerPage)))))
                                {
                                    _local_2 = true;
                                };
                            };
                        };
                    };
                };
                if (_local_2)
                {
                    updateView();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot23():TalentSlot
        {
            return (this._899454785slot23);
        }

        [Bindable(event="propertyChange")]
        public function get slot24():TalentSlot
        {
            return (this._899454784slot24);
        }

        [Bindable(event="propertyChange")]
        public function get slot26():TalentSlot
        {
            return (this._899454782slot26);
        }

        [Bindable(event="propertyChange")]
        public function get slot27():TalentSlot
        {
            return (this._899454781slot27);
        }

        [Bindable(event="propertyChange")]
        public function get slot28():TalentSlot
        {
            return (this._899454780slot28);
        }

        [Bindable(event="propertyChange")]
        public function get slot22():TalentSlot
        {
            return (this._899454786slot22);
        }

        public function __btnNextPage_click(_arg_1:MouseEvent):void
        {
            _SafeStr_1(1);
        }

        [Bindable(event="propertyChange")]
        public function get btnLastPage():Button
        {
            return (this._320271553btnLastPage);
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        [Bindable(event="propertyChange")]
        public function get slot25():TalentSlot
        {
            return (this._899454783slot25);
        }

        private function checkData():void
        {
            if ((((_core.player) && (_core.player.id)) && (!(_core.player.id == _firstLoadCid))))
            {
                cleanFuncSlot();
            };
        }

        public function __bangBtn3_click(_arg_1:MouseEvent):void
        {
            resetTalentBag();
        }

        private function changeOperationView(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            var _local_2:* = 0;
            while (_local_2 <= 2)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
        }

        private function resetTalentBag():void
        {
            _core.remote.call("arrangeTalentBag", new Responder(onResetTalentBag));
        }

        private function initTalentInfo():void
        {
            txtPageIndicator.text = "1/1";
            maxPage = Math.ceil((itemLen / countPerPage));
            if (((!(maxPage)) || (maxPage == 0)))
            {
                maxPage = 1;
            };
            if (ToolKit.isBigThan(itemPageNo, maxPage))
            {
                itemPageNo = 1;
            };
            txtPageIndicator.text = ((itemPageNo + "/") + maxPage);
        }

        public function set firstTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._133022078firstTile;
            if (_local_2 !== _arg_1)
            {
                this._133022078firstTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "firstTile", _local_2, _arg_1));
            };
        }

        public function ___PetTalentFuncPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            upStone();
        }

        private function updateView():void
        {
            var _local_3:Number;
            if (!initialized)
            {
                return;
            };
            var _local_1:* = ToolKit.minus(itemPageNo, 1);
            var _local_2:int = 1;
            while (_local_2 <= countPerPage)
            {
                this[("slot" + _local_2)].reset();
                this[("slot" + _local_2)].slotData = null;
                this[("slot" + _local_2)].sid = ToolKit.add((_local_1 * countPerPage), _local_2);
                _local_3 = ToolKit.add((_local_1 * countPerPage), _local_2);
                if (((((itemAC[_local_3]) && (itemAC[_local_3].ti)) && (itemAC[_local_3].ii)) && (itemAC[_local_3].n)))
                {
                    this[("slot" + _local_2)].type = itemAC[_local_3].ti;
                    this[("slot" + _local_2)].giid = itemAC[_local_3].ii;
                    this[("slot" + _local_2)].stackNum = itemAC[_local_3].n;
                    this[("slot" + _local_2)].quality = itemAC[_local_3].q;
                    this[("slot" + _local_2)].slotData = itemAC[_local_3];
                };
                _local_2++;
            };
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeOperationView(0);
        }

        private function delStone():void
        {
            if ((((this["delSlot1"]) && (this["delSlot1"].slotData)) && (this["delSlot1"].giid)))
            {
                if (((Number(talentMixNum.value) > Number(this.delSlot1.slotData.stackNum)) || (Number(talentMixNum.value) <= 0)))
                {
                    return;
                };
                _core.remote.call("breakTalentStone", new Responder(onBreakTalentStone), this["delSlot1"].csid, this["delSlot1"].giid, talentMixNum.value);
            };
        }

        private function updateOneTalentBag(_arg_1:Object, _arg_2:Number):void
        {
            if (!initialized)
            {
                return;
            };
            if (!_arg_1)
            {
                return;
            };
            if (!itemAC)
            {
                itemAC = new Object();
            };
            if (!itemAC[_arg_2])
            {
                itemAC[_arg_2] = new Object();
                itemAC[_arg_2].ti = GamePredef.TBL_PET_TALENT;
                itemAC[_arg_2].q = 0;
                itemAC[_arg_2].index = _arg_2;
            };
            itemAC[_arg_2].ii = _core.player.petTalentData.b[_arg_2].t;
            itemAC[_arg_2].n = _core.player.petTalentData.b[_arg_2].n;
            updateBagNum(ToolKit.add(_arg_2, 1));
        }

        [Bindable(event="propertyChange")]
        public function get upLabel():Label
        {
            return (this._256612071upLabel);
        }

        private function set _point(_arg_1:Number):void
        {
            var _local_2:Object = this._1468352367_point;
            if (_local_2 !== _arg_1)
            {
                this._1468352367_point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_point", _local_2, _arg_1));
            };
        }

        public function showFuncPanel():void
        {
            initView();
            visible = true;
        }

        public function set btnNextPage(_arg_1:Button):void
        {
            var _local_2:Object = this._1090881890btnNextPage;
            if (_local_2 !== _arg_1)
            {
                this._1090881890btnNextPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnNextPage", _local_2, _arg_1));
            };
        }

        private function _PetTalentFuncPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentFuncPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PetTalentFuncPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentFuncPanel_Canvas1.label = _arg_1;
            }, "_PetTalentFuncPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot4.slotType = _arg_1;
            }, "slot4.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot5.slotType = _arg_1;
            }, "slot5.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot6.slotType = _arg_1;
            }, "slot6.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot7.slotType = _arg_1;
            }, "slot7.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot8.slotType = _arg_1;
            }, "slot8.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot9.slotType = _arg_1;
            }, "slot9.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot10.slotType = _arg_1;
            }, "slot10.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot11.slotType = _arg_1;
            }, "slot11.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot12.slotType = _arg_1;
            }, "slot12.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot13.slotType = _arg_1;
            }, "slot13.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot14.slotType = _arg_1;
            }, "slot14.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot15.slotType = _arg_1;
            }, "slot15.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot16.slotType = _arg_1;
            }, "slot16.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot17.slotType = _arg_1;
            }, "slot17.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot18.slotType = _arg_1;
            }, "slot18.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot19.slotType = _arg_1;
            }, "slot19.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot20.slotType = _arg_1;
            }, "slot20.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot21.slotType = _arg_1;
            }, "slot21.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot22.slotType = _arg_1;
            }, "slot22.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot23.slotType = _arg_1;
            }, "slot23.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot24.slotType = _arg_1;
            }, "slot24.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot25.slotType = _arg_1;
            }, "slot25.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot26.slotType = _arg_1;
            }, "slot26.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot27.slotType = _arg_1;
            }, "slot27.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                slot28.slotType = _arg_1;
            }, "slot28.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PAGE_SELECTOR[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnLastPage.label = _arg_1;
            }, "btnLastPage.label");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                txtPageIndicator.filters = _arg_1;
            }, "txtPageIndicator.filters");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PAGE_SELECTOR[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnNextPage.label = _arg_1;
            }, "btnNextPage.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[35] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000344));
            }, function (_arg_1:Object):void
            {
                _PetTalentFuncPanel_Image1.source = _arg_1;
            }, "_PetTalentFuncPanel_Image1.source");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                upSlot2.slotType = _arg_1;
            }, "upSlot2.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                upSlot1.slotType = _arg_1;
            }, "upSlot1.slotType");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                upSlot3.slotType = _arg_1;
            }, "upSlot3.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                upSlot4.slotType = _arg_1;
            }, "upSlot4.slotType");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                upSlot5.slotType = _arg_1;
            }, "upSlot5.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentFuncPanel_BasicDelayButton1.label = _arg_1;
            }, "_PetTalentFuncPanel_BasicDelayButton1.label");
            result[42] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000344));
            }, function (_arg_1:Object):void
            {
                _PetTalentFuncPanel_Image2.source = _arg_1;
            }, "_PetTalentFuncPanel_Image2.source");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                rSlot1.slotType = _arg_1;
            }, "rSlot1.slotType");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                rSlot2.slotType = _arg_1;
            }, "rSlot2.slotType");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentFuncPanel_BasicDelayButton2.label = _arg_1;
            }, "_PetTalentFuncPanel_BasicDelayButton2.label");
            result[46] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000344));
            }, function (_arg_1:Object):void
            {
                _PetTalentFuncPanel_Image3.source = _arg_1;
            }, "_PetTalentFuncPanel_Image3.source");
            result[47] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                delSlot1.slotType = _arg_1;
            }, "delSlot1.slotType");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentFuncPanel_BasicDelayButton3.label = _arg_1;
            }, "_PetTalentFuncPanel_BasicDelayButton3.label");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.TALENT_PANEL_FUNC_U[11] + "") + _point);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentFuncPanel_Label3.text = _arg_1;
            }, "_PetTalentFuncPanel_Label3.text");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentFuncPanel_IntroText1.text = _arg_1;
            }, "_PetTalentFuncPanel_IntroText1.text");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_FUNC_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn3.label = _arg_1;
            }, "bangBtn3.label");
            result[52] = binding;
            return (result);
        }

        public function set slot12(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        public function set slot13(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set rSlot2(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._951264094rSlot2;
            if (_local_2 !== _arg_1)
            {
                this._951264094rSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rSlot2", _local_2, _arg_1));
            };
        }

        public function set slot19(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454810slot19;
            if (_local_2 !== _arg_1)
            {
                this._899454810slot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot19", _local_2, _arg_1));
            };
        }

        public function set talentMixNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1717904490talentMixNum;
            if (_local_2 !== _arg_1)
            {
                this._1717904490talentMixNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "talentMixNum", _local_2, _arg_1));
            };
        }

        public function set slot17(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        public function set delSlot1(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._802861224delSlot1;
            if (_local_2 !== _arg_1)
            {
                this._802861224delSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delSlot1", _local_2, _arg_1));
            };
        }

        public function set rSlot1(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._951264095rSlot1;
            if (_local_2 !== _arg_1)
            {
                this._951264095rSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rSlot1", _local_2, _arg_1));
            };
        }

        public function set slot11(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
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

        private function setTalentBag(_arg_1:Object):void
        {
            var _local_2:*;
            itemAC = new Object();
            itemLen = 0;
            if (!_arg_1)
            {
                return;
            };
            for (_local_2 in _arg_1)
            {
                if (_arg_1[_local_2])
                {
                    itemAC[_local_2] = new Object();
                    itemAC[_local_2].ti = GamePredef.TBL_PET_TALENT;
                    itemAC[_local_2].ii = _arg_1[_local_2].t;
                    itemAC[_local_2].n = _arg_1[_local_2].n;
                    itemAC[_local_2].q = 0;
                    itemAC[_local_2].index = _local_2;
                    if (((ToolKit.isBigOrEqual(_local_2, itemLen)) && (!(ToolKit.isEqual(0, _local_2)))))
                    {
                        itemLen = ToolKit.add(_local_2, 1);
                        if (ToolKit.isBigThan(itemLen, max_slot))
                        {
                            itemLen = max_slot;
                        };
                    };
                };
            };
            initTalentInfo();
            updateView();
            _firstLoadCid = ((_core.player.id) ? _core.player.id : 0);
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

        public function set txtPageIndicator(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1229795408txtPageIndicator;
            if (_local_2 !== _arg_1)
            {
                this._1229795408txtPageIndicator = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPageIndicator", _local_2, _arg_1));
            };
        }

        public function set slot18(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454811slot18;
            if (_local_2 !== _arg_1)
            {
                this._899454811slot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot18", _local_2, _arg_1));
            };
        }

        public function set slot15(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        private function _SafeStr_1(_arg_1:int):void
        {
            if (ToolKit.isSmallThan(_arg_1, 0))
            {
                if (ToolKit.isBigThan(itemPageNo, 1))
                {
                    itemPageNo--;
                    txtPageIndicator.text = ((itemPageNo + "/") + maxPage);
                    updateView();
                };
            }
            else
            {
                if (ToolKit.isSmallThan(itemPageNo, maxPage))
                {
                    itemPageNo++;
                    txtPageIndicator.text = ((itemPageNo + "/") + maxPage);
                    updateView();
                };
            };
        }

        public function set bangBtn3(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1863324753bangBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1863324753bangBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn3", _local_2, _arg_1));
            };
        }

        public function set slot14(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
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

        private function upStoneSlotChange(_arg_1:Event):void
        {
            var _local_2:*;
            var _local_3:*;
            if (upSlot1.slotData)
            {
                _local_2 = _core.data.gameData[GamePredef.TBL_PET_TALENT][upSlot1.giid];
                if (((_local_2) && (_local_2.lv)))
                {
                    _local_3 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][TAL_UP_PLAN_ITEM[_local_2.lv]];
                    checkItem.label = Language.TALENT_PANEL_FUNC_U[12].replace("{name}", _local_3.name);
                    upLabel.text = Language.TALENT_PANEL_FUNC_U[13].replace("{num}", TAL_UP_PLAN_ITEM_NUM[_local_2.lv]);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get firstTile():Tile
        {
            return (this._133022078firstTile);
        }

        public function set slot16(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function set slot24(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454784slot24;
            if (_local_2 !== _arg_1)
            {
                this._899454784slot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot24", _local_2, _arg_1));
            };
        }

        public function set slot21(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454787slot21;
            if (_local_2 !== _arg_1)
            {
                this._899454787slot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot21", _local_2, _arg_1));
            };
        }

        public function set btnLastPage(_arg_1:Button):void
        {
            var _local_2:Object = this._320271553btnLastPage;
            if (_local_2 !== _arg_1)
            {
                this._320271553btnLastPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLastPage", _local_2, _arg_1));
            };
        }

        private function resetBagData(_arg_1:Number):void
        {
            if (((ToolKit.isBigThan(_arg_1, (ToolKit.minus(itemPageNo, 1) * countPerPage))) && (ToolKit.isSmallOrEqual(_arg_1, (itemPageNo * countPerPage)))))
            {
                updateView();
            };
        }

        public function set slot26(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454782slot26;
            if (_local_2 !== _arg_1)
            {
                this._899454782slot26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot26", _local_2, _arg_1));
            };
        }

        public function set slot23(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454785slot23;
            if (_local_2 !== _arg_1)
            {
                this._899454785slot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot23", _local_2, _arg_1));
            };
        }

        public function set slot27(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454781slot27;
            if (_local_2 !== _arg_1)
            {
                this._899454781slot27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot27", _local_2, _arg_1));
            };
        }

        public function set slot20(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454788slot20;
            if (_local_2 !== _arg_1)
            {
                this._899454788slot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot20", _local_2, _arg_1));
            };
        }

        public function set slot25(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454783slot25;
            if (_local_2 !== _arg_1)
            {
                this._899454783slot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot25", _local_2, _arg_1));
            };
        }

        public function ___PetTalentFuncPanel_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            delStone();
        }

        public function set slot22(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454786slot22;
            if (_local_2 !== _arg_1)
            {
                this._899454786slot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot22", _local_2, _arg_1));
            };
        }

        private function BreakSlotChange(_arg_1:Event):void
        {
            var _local_2:*;
            if (delSlot1.slotData)
            {
                talentMixNum.maximum = delSlot1.slotData.n;
                if (talentMixNum.value > talentMixNum.maximum)
                {
                    talentMixNum.value = talentMixNum.maximum;
                };
                _local_2 = _core.data.gameData[GamePredef.TBL_PET_TALENT][delSlot1.giid];
                if (((_local_2) && (_local_2.exp)))
                {
                    tbPoint.text = Language.TALENT_PANEL_FUNC_U[10].replace("{num}", (_local_2.exp * talentMixNum.value));
                };
            }
            else
            {
                tbPoint.text = Language.TALENT_PANEL_FUNC_U[10].replace("{num}", "");
            };
        }

        public function set slot28(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._899454780slot28;
            if (_local_2 !== _arg_1)
            {
                this._899454780slot28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot28", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:PetTalentFuncPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetTalentFuncPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetTalentFuncPanelWatcherSetupUtil");
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

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        public function set tbPoint(_arg_1:Label):void
        {
            var _local_2:Object = this._1540805694tbPoint;
            if (_local_2 !== _arg_1)
            {
                this._1540805694tbPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tbPoint", _local_2, _arg_1));
            };
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            changeOperationView(2);
        }

        [Bindable(event="propertyChange")]
        public function get talentMixNum():NumericStepper
        {
            return (this._1717904490talentMixNum);
        }

        public function onUpTalentStone(_arg_1:Object):void
        {
            if (_arg_1)
            {
                cleanFuncSlot();
                _updateTalentData(_arg_1);
                _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[6]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn1():BasicGlowButton
        {
            return (this._1863324755bangBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn2():BasicGlowButton
        {
            return (this._1863324754bangBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn3():DelayButton
        {
            return (this._1863324753bangBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get txtPageIndicator():TextInput
        {
            return (this._1229795408txtPageIndicator);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        private function resetTalentSlot():void
        {
            var _local_4:*;
            var _local_5:String;
            if (((((!(this["rSlot1"])) || (!(this["rSlot2"]))) || (!(this["rSlot1"].slotData))) || (!(this["rSlot2"].slotData))))
            {
                return;
            };
            if ((((this["rSlot1"].giid) && (ToolKit.isBigThan(this["rSlot1"].giid, 0))) && (!(checkSameTypeAndLvTalentStone(_core.data.gameData[GamePredef.TBL_PET_TALENT][this["rSlot1"].giid], _core.data.gameData[GamePredef.TBL_PET_TALENT][this["rSlot2"].giid])))))
            {
                _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[16]);
                return;
            };
            var _local_1:Object = new Object();
            var _local_2:String = ((this["rSlot1"].giid + "|") + this["rSlot2"].giid);
            var _local_3:String = ((this["rSlot1"].csid + "|") + this["rSlot2"].csid);
            if (ToolKit.isEqual(this["rSlot1"].csid, this["rSlot2"].csid))
            {
                _local_1[this["rSlot1"].csid] = 2;
            }
            else
            {
                _local_1[this["rSlot1"].csid] = 1;
                _local_1[this["rSlot2"].csid] = 1;
            };
            for (_local_4 in _local_1)
            {
                if (!((((_core.player.petTalentData.b) && (_core.player.petTalentData.b[_local_4])) && (_local_1[_local_4])) && (ToolKit.isSmallOrEqual(_local_1[_local_4], _core.player.petTalentData.b[_local_4].n))))
                {
                    _local_5 = Language.TALENT_PANEL_FUNC_U[23].replace("{num}", Math.floor((_local_4 % countPerPage)));
                    _core.sysMidNote(_local_5);
                    return;
                };
            };
            _core.remote.call("resetTalentSlot", new Responder(onResetTalentSlot), _local_2, _local_3);
        }

        [Bindable(event="propertyChange")]
        public function get tbPoint():Label
        {
            return (this._1540805694tbPoint);
        }

        private function onInitTalentFuncPanelData(_arg_1:Object):void
        {
            cleanFuncSlot();
            if (((_arg_1) && (_arg_1.b)))
            {
                setTalentBag(_arg_1.b);
            }
            else
            {
                setTalentBag(null);
            };
        }

        private function checkSameTypeTalentStone(_arg_1:*, _arg_2:*):Boolean
        {
            if ((((_arg_1) && (_arg_2)) && (ToolKit.isEqual(Math.ceil((_arg_1.sid / 10000)), Math.ceil((_arg_2.sid / 10000))))))
            {
                return (true);
            };
            return (false);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (_core.player.petTalentData)
            {
                onInitTalentFuncPanelData(_core.player.petTalentData);
            }
            else
            {
                onInitTalentFuncPanelData(null);
            };
            if (!delSlot1.hasEventListener(GameEvent.SLOT_GIID_CHANGE))
            {
                delSlot1.addEventListener(GameEvent.SLOT_GIID_CHANGE, BreakSlotChange);
            };
            if (!upSlot1.hasEventListener(GameEvent.SLOT_GIID_CHANGE))
            {
                upSlot1.addEventListener(GameEvent.SLOT_GIID_CHANGE, upStoneSlotChange);
            };
            updatePoint();
        }

        public function onResetTalentSlot(_arg_1:Object):void
        {
            if (_arg_1)
            {
                cleanFuncSlot();
                _updateTalentData(_arg_1);
                _core.sysMidNote(Language.TALENT_PANEL_FUNC_U[7]);
            };
        }

        public function set slot1(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1():TalentSlot
        {
            return (this._109532659slot1);
        }

        [Bindable(event="propertyChange")]
        public function get slot2():TalentSlot
        {
            return (this._109532660slot2);
        }

        [Bindable(event="propertyChange")]
        public function get slot3():TalentSlot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get slot5():TalentSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():TalentSlot
        {
            return (this._109532664slot6);
        }

        public function set slot4(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot4():TalentSlot
        {
            return (this._109532662slot4);
        }


    }
}//package com.qeedoo.ui.view.compDragable

// _SafeStr_1 = "goto" (String#15869, DoABC#2)


