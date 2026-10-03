// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MedalPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.MedalSlot;
    import mx.controls.Button;
    import mx.containers.Tile;
    import mx.controls.Label;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.controls.TextInput;
    import mx.containers.ViewStack;
    import mx.controls.NumericStepper;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.event.GameEvent;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
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

    public class MedalPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _77309086breakExp:BasicTxtButton;
        private var _899454782slot26:MedalSlot;
        private var _109532667slot9:MedalSlot;
        private var _899454813slot16:MedalSlot;
        private var _320271553btnLastPage:Button;
        private var _133022078firstTile:Tile;
        private var _1401996146joinLab1:Label;
        private var _1087623231slot2005:MedalSlot;
        private var _1137874432basicPro12:Label;
        private var _1430699005joinLab:Label;
        private var _1092506293lv2003:BasicTxtButton;
        private var _899454787slot21:MedalSlot;
        private var _109532661slot3:MedalSlot;
        private var _899454818slot11:MedalSlot;
        private var _alert:Alert;
        public var _MedalPanel_Label1:Label;
        public var _MedalPanel_Label9:Label;
        private var _1087653021slot1006:MedalSlot;
        private var _1699273611basicPro4:Label;
        private var _click:Number = 0;
        private var _1087653025slot1002:MedalSlot;
        private var _1092536084lv1003:BasicTxtButton;
        private var _486611074btnArrange2:DelayButton;
        private var _1453420078breakBtnMore:DelayButton;
        private var _1923965520btnArrange:DelayButton;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _899454781slot27:MedalSlot;
        private var _899454812slot17:MedalSlot;
        private var _1203783036myExpUpP:BasicTxtButton;
        private var _1087623234slot2002:MedalSlot;
        private var _109532662slot4:MedalSlot;
        private var _1087623230slot2006:MedalSlot;
        private var _1092506292lv2004:BasicTxtButton;
        private var _899454786slot22:MedalSlot;
        public var _MedalPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _899454817slot12:MedalSlot;
        private var countPerPage:uint = 28;
        private var _1092536083lv1004:BasicTxtButton;
        private var _839638551upInfo:IntroText;
        public var _MedalPanel_Canvas10:Canvas;
        private var medalMaxLv:uint = 10;
        private var _changed:Boolean = false;
        private var _1087653024slot1003:MedalSlot;
        private var _1137874431basicPro13:Label;
        private var _899454780slot28:MedalSlot;
        private var _109532663slot5:MedalSlot;
        private var _899454811slot18:MedalSlot;
        private var _1699273612basicPro3:Label;
        private var _1424290038nextProp:BasicTxtButton;
        private var _1863324753bangBtn3:BasicGlowButton;
        private var itemPageNo:uint = 1;
        private var _535111522myExpBreakP:BasicTxtButton;
        private var _1092506291lv2005:BasicTxtButton;
        private var _486611072btnArrange0:DelayButton;
        private var _899454785slot23:MedalSlot;
        private var _899454816slot13:MedalSlot;
        private var _1087623233slot2003:MedalSlot;
        private var _486611075btnArrange3:DelayButton;
        private var itemLen:Number = 0;
        private var _109532659slot1:MedalSlot;
        private var _77306077breakBtn:DelayButton;
        private var _1092536082lv1005:BasicTxtButton;
        private var _111458690upExp:BasicTxtButton;
        private var maxPage:uint = 1;
        private var _1435225412charImg1:Image;
        private var _1137874429basicPro15:Label;
        public var _MedalPanel_BasicTxtButton7:BasicTxtButton;
        private var _739034253charImg:Image;
        private var _677847411petImg1:Image;
        private var _1229795408txtPageIndicator:TextInput;
        private var _109532664slot6:MedalSlot;
        private var _1092476505lv3000:BasicTxtButton;
        private var _899454810slot19:MedalSlot;
        private var _808459627vsBang:ViewStack;
        private var _1087653023slot1004:MedalSlot;
        private var _1092506290lv2006:BasicTxtButton;
        private var _899454784slot24:MedalSlot;
        private var _899454815slot14:MedalSlot;
        private var _111455681upBtn:DelayButton;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _1788135535materialMixNum:NumericStepper;
        private var _1137874430basicPro14:Label;
        private var _1699273609basicPro6:Label;
        private var _1699273613basicPro2:Label;
        private var _1549623129delInfo:IntroText;
        private var _1092506295lv2001:BasicTxtButton;
        private var _1092536081lv1006:BasicTxtButton;
        private var _1087593445slot3000:MedalSlot;
        private var _109532665slot7:MedalSlot;
        public var _MedalPanel_Image5:Image;
        public var _MedalPanel_Image6:Image;
        private var _1087623232slot2004:MedalSlot;
        private var _1137874433basicPro11:Label;
        private var _1092476504lv3001:BasicTxtButton;
        private var _firstLoadCid:Number = 0;
        private var _1092536086lv1001:BasicTxtButton;
        private var _486611073btnArrange1:DelayButton;
        public var _MedalPanel_BasicTxtButton15:BasicTxtButton;
        public var _MedalPanel_BasicTxtButton17:BasicTxtButton;
        public var _MedalPanel_BasicTxtButton18:BasicTxtButton;
        public var _MedalPanel_BasicTxtButton19:BasicTxtButton;
        private var _899454783slot25:MedalSlot;
        private var _899454814slot15:MedalSlot;
        public var _MedalPanel_BasicTxtButton24:BasicTxtButton;
        public var _MedalPanel_BasicTxtButton25:BasicTxtButton;
        private var _1699273610basicPro5:Label;
        private var _1137874428basicPro16:Label;
        public var _MedalPanel_BasicTxtButton29:BasicTxtButton;
        public var _MedalPanel_BasicTxtButton26:BasicTxtButton;
        private var _alert1:Alert;
        private var _1087653026slot1001:MedalSlot;
        private var _109532666slot8:MedalSlot;
        private var _1087653022slot1005:MedalSlot;
        public var _MedalPanel_BasicTxtButton30:BasicTxtButton;
        private var _1092506294lv2002:BasicTxtButton;
        private var _899454788slot20:MedalSlot;
        private var _isLoadInfo:Boolean = false;
        private var _899454819slot10:MedalSlot;
        private var _1090881890btnNextPage:Button;
        private var _2131388249nowProp:BasicTxtButton;
        private var _1908728987pJoinName:BasicTxtButton;
        private var _109532660slot2:MedalSlot;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _1401936171joinName:BasicTxtButton;
        private var _1092536085lv1002:BasicTxtButton;
        private var _1087593444slot3001:MedalSlot;
        private var _1699273614basicPro1:Label;
        private var _1087623235slot2001:MedalSlot;
        private var _991697372petImg:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":545,
                    "height":405,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MedalPanel_BasicTitleCanvas1"
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
                                "x":10,
                                "percentWidth":100,
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
                                            "width":90
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
                                            "width":90
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
                                            "width":90
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
                                            "width":90
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsBang",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "175";
                            this.top = "60";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "label":"Hornor",
                                                        "width":195,
                                                        "height":320,
                                                        "x":10,
                                                        "y":3,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"petImg",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":160,
                                                                    "height":160,
                                                                    "visible":false,
                                                                    "x":20,
                                                                    "y":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"petImg1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":160,
                                                                    "height":160,
                                                                    "visible":false,
                                                                    "x":20,
                                                                    "y":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MedalSlot,
                                                            "id":"slot1006",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "sid":1006,
                                                                    "width":34,
                                                                    "height":34,
                                                                    "acceptable":false,
                                                                    "x":80.5,
                                                                    "y":104,
                                                                    "iconWidth":34,
                                                                    "iconHeight":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"lv1003",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 15643682;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":122,
                                                                    "y":230,
                                                                    "width":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MedalSlot,
                                                            "id":"slot1002",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "sid":1002,
                                                                    "width":50,
                                                                    "height":50,
                                                                    "acceptable":true,
                                                                    "x":135,
                                                                    "y":97,
                                                                    "iconWidth":50,
                                                                    "iconHeight":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"lv1004",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 15643682;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":230,
                                                                    "width":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MedalSlot,
                                                            "id":"slot1005",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "sid":1005,
                                                                    "width":50,
                                                                    "height":50,
                                                                    "acceptable":true,
                                                                    "x":10,
                                                                    "y":97,
                                                                    "iconWidth":50,
                                                                    "iconHeight":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"lv1002",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 15643682;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":140,
                                                                    "y":150,
                                                                    "width":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MedalSlot,
                                                            "id":"slot1001",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "sid":1001,
                                                                    "width":50,
                                                                    "height":50,
                                                                    "acceptable":true,
                                                                    "x":72.5,
                                                                    "y":21,
                                                                    "iconWidth":50,
                                                                    "iconHeight":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"lv1001",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 15643682;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":78.5,
                                                                    "y":75,
                                                                    "width":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MedalSlot,
                                                            "id":"slot1004",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "sid":1004,
                                                                    "width":50,
                                                                    "height":50,
                                                                    "acceptable":true,
                                                                    "x":31,
                                                                    "y":176,
                                                                    "iconWidth":50,
                                                                    "iconHeight":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"lv1005",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 15643682;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":150,
                                                                    "width":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MedalSlot,
                                                            "id":"slot1003",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "sid":1003,
                                                                    "width":50,
                                                                    "height":50,
                                                                    "acceptable":true,
                                                                    "x":116,
                                                                    "y":176,
                                                                    "iconWidth":50,
                                                                    "iconHeight":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"lv1006",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 15643682;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":77.5,
                                                                    "y":150,
                                                                    "width":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_MedalPanel_BasicTxtButton7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":258
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"pJoinName",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 58862;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":55.25,
                                                                    "y":279
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
                                                        "width":143,
                                                        "height":320,
                                                        "x":207,
                                                        "y":3,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_MedalPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 15116365;
                                                                this.fontSize = 14;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":26,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":50,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":78,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":106,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":134,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":162,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"joinLab",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 15116365;
                                                                this.fontSize = 14;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":200,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":228,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"btnArrange2",
                                                            "events":{"click":"__btnArrange2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.left = "2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":65,
                                                                    "useHandCursor":true,
                                                                    "y":290,
                                                                    "clickDelay":2000
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"btnArrange3",
                                                            "events":{"click":"__btnArrange3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.right = "2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":65,
                                                                    "useHandCursor":true,
                                                                    "y":290,
                                                                    "clickDelay":2000
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
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "label":"Hornor",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"Hornor",
                                                                    "width":195,
                                                                    "height":320,
                                                                    "x":10,
                                                                    "y":3,
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"charImg",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":160,
                                                                                "height":160,
                                                                                "visible":false,
                                                                                "x":20,
                                                                                "y":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"charImg1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":160,
                                                                                "height":160,
                                                                                "visible":false,
                                                                                "x":20,
                                                                                "y":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MedalSlot,
                                                                        "id":"slot2006",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "sid":2006,
                                                                                "width":34,
                                                                                "height":34,
                                                                                "acceptable":false,
                                                                                "x":80.5,
                                                                                "y":103,
                                                                                "iconWidth":34,
                                                                                "iconHeight":34
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"lv2003",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15643682;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":122,
                                                                                "y":230,
                                                                                "width":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MedalSlot,
                                                                        "id":"slot2002",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "sid":2002,
                                                                                "width":50,
                                                                                "height":50,
                                                                                "acceptable":true,
                                                                                "x":135,
                                                                                "y":97,
                                                                                "iconWidth":50,
                                                                                "iconHeight":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"lv2004",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15643682;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":230,
                                                                                "width":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MedalSlot,
                                                                        "id":"slot2005",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "sid":2005,
                                                                                "width":50,
                                                                                "height":50,
                                                                                "acceptable":true,
                                                                                "x":10,
                                                                                "y":97,
                                                                                "iconWidth":50,
                                                                                "iconHeight":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"lv2002",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15643682;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":140,
                                                                                "y":150,
                                                                                "width":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MedalSlot,
                                                                        "id":"slot2001",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "sid":2001,
                                                                                "width":50,
                                                                                "height":50,
                                                                                "acceptable":true,
                                                                                "x":72.5,
                                                                                "y":21,
                                                                                "iconWidth":50,
                                                                                "iconHeight":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"lv2001",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15643682;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":78.5,
                                                                                "y":75,
                                                                                "width":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MedalSlot,
                                                                        "id":"slot2004",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "sid":2004,
                                                                                "width":50,
                                                                                "height":50,
                                                                                "acceptable":true,
                                                                                "x":31,
                                                                                "y":176,
                                                                                "iconWidth":50,
                                                                                "iconHeight":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"lv2005",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15643682;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":150,
                                                                                "width":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":MedalSlot,
                                                                        "id":"slot2003",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "sid":2003,
                                                                                "width":50,
                                                                                "height":50,
                                                                                "acceptable":true,
                                                                                "x":116,
                                                                                "y":176,
                                                                                "iconWidth":50,
                                                                                "iconHeight":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"lv2006",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15643682;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":77.5,
                                                                                "y":150,
                                                                                "width":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_MedalPanel_BasicTxtButton15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":258
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"joinName",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 58862;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":95.5,
                                                                                "y":258,
                                                                                "width":84.5
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
                                                        "width":143,
                                                        "height":320,
                                                        "x":207,
                                                        "y":3,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_MedalPanel_Label9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 15116365;
                                                                this.fontSize = 14;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":26,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":50,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":78,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":106,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":134,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro15",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":162,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"joinLab1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 15116365;
                                                                this.fontSize = 14;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":200,
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"basicPro16",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 1961723;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":228,
                                                                    "width":118,
                                                                    "height":20,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"btnArrange0",
                                                            "events":{"click":"__btnArrange0_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.left = "2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":65,
                                                                    "useHandCursor":true,
                                                                    "y":290,
                                                                    "clickDelay":2000
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"btnArrange1",
                                                            "events":{"click":"__btnArrange1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.right = "2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":65,
                                                                    "useHandCursor":true,
                                                                    "y":290,
                                                                    "clickDelay":2000
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
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MedalPanel_Image5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":110});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"delInfo",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":3,
                                                        "width":348,
                                                        "height":105
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":MedalSlot,
                                                "id":"slot3000",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "sid":3000,
                                                        "width":50,
                                                        "height":50,
                                                        "acceptable":true,
                                                        "x":155,
                                                        "y":146,
                                                        "iconWidth":50,
                                                        "iconHeight":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MedalPanel_BasicTxtButton17",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":125,
                                                        "y":116,
                                                        "height":22
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"breakBtn",
                                                "events":{"click":"__breakBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "153";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":50,
                                                        "useHandCursor":true,
                                                        "y":274,
                                                        "clickDelay":3000
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"breakBtnMore",
                                                "events":{"click":"__breakBtnMore_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "193";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "useHandCursor":true,
                                                        "y":300,
                                                        "clickDelay":4000
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"materialMixNum",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":298,
                                                        "minimum":1,
                                                        "maximum":999,
                                                        "x":114,
                                                        "value":1
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MedalPanel_BasicTxtButton18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":97,
                                                        "y":222,
                                                        "width":84.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MedalPanel_BasicTxtButton19",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":97,
                                                        "y":248,
                                                        "width":84.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"myExpBreakP",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":174,
                                                        "y":248,
                                                        "width":84.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"lv3000",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 15643682;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":162.5,
                                                        "y":200,
                                                        "width":42.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"breakExp",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":174,
                                                        "y":222,
                                                        "width":84.5
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
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MedalPanel_Image6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":110});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"upInfo",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":3,
                                                        "width":348,
                                                        "height":105
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":MedalSlot,
                                                "id":"slot3001",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "sid":3000,
                                                        "width":50,
                                                        "height":50,
                                                        "acceptable":true,
                                                        "x":155,
                                                        "y":146,
                                                        "iconWidth":50,
                                                        "iconHeight":50,
                                                        "showStackNum":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"lv3001",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 15643682;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":162.5,
                                                        "y":200,
                                                        "width":42.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MedalPanel_BasicTxtButton24",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":97,
                                                        "y":222,
                                                        "width":84.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MedalPanel_BasicTxtButton25",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":97,
                                                        "y":248,
                                                        "width":84.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"upBtn",
                                                "events":{"click":"__upBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "153";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":50,
                                                        "useHandCursor":true,
                                                        "y":275,
                                                        "clickDelay":3000
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MedalPanel_BasicTxtButton26",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":117,
                                                        "y":116,
                                                        "height":22
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"upExp",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":174,
                                                        "y":222,
                                                        "width":84.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"myExpUpP",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":174,
                                                        "y":248,
                                                        "width":84.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MedalPanel_BasicTxtButton29",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26,
                                                        "y":116,
                                                        "width":84,
                                                        "height":22
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_MedalPanel_BasicTxtButton30",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":242,
                                                        "y":116,
                                                        "height":22
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"nextProp",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":234,
                                                        "y":146,
                                                        "width":126,
                                                        "height":22
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"nowProp",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26,
                                                        "y":146,
                                                        "width":121,
                                                        "height":22
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
                        "id":"_MedalPanel_Canvas10",
                        "stylesFactory":function ():void
                        {
                            this.top = "60";
                            this.bottom = "15";
                            this.left = "375";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
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
                                            "width":155,
                                            "height":268,
                                            "direction":"horizontal",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "styleName":"TileSlot",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                                "type":MedalSlot,
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
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"btnArrange",
                                    "events":{"click":"__btnArrange_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "48";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":70,
                                            "useHandCursor":true,
                                            "y":305,
                                            "clickDelay":30000
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var itemAC:Object = new Object();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MedalPanel()
        {
            mx_internal::_document = this;
            this.width = 545;
            this.height = 405;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___MedalPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MedalPanel._watcherSetupUtil = _arg_1;
        }


        public function set basicPro12(_arg_1:Label):void
        {
            var _local_2:Object = this._1137874432basicPro12;
            if (_local_2 !== _arg_1)
            {
                this._1137874432basicPro12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro12", _local_2, _arg_1));
            };
        }

        public function set basicPro13(_arg_1:Label):void
        {
            var _local_2:Object = this._1137874431basicPro13;
            if (_local_2 !== _arg_1)
            {
                this._1137874431basicPro13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get joinLab():Label
        {
            return (this._1430699005joinLab);
        }

        public function set slot9(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        public function set basicPro15(_arg_1:Label):void
        {
            var _local_2:Object = this._1137874429basicPro15;
            if (_local_2 !== _arg_1)
            {
                this._1137874429basicPro15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro15", _local_2, _arg_1));
            };
        }

        public function set basicPro16(_arg_1:Label):void
        {
            var _local_2:Object = this._1137874428basicPro16;
            if (_local_2 !== _arg_1)
            {
                this._1137874428basicPro16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro16", _local_2, _arg_1));
            };
        }

        public function set basicPro14(_arg_1:Label):void
        {
            var _local_2:Object = this._1137874430basicPro14;
            if (_local_2 !== _arg_1)
            {
                this._1137874430basicPro14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro14", _local_2, _arg_1));
            };
        }

        public function set slot8(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        public function set joinLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1430699005joinLab;
            if (_local_2 !== _arg_1)
            {
                this._1430699005joinLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinLab", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        private function setMedalBag(_arg_1:Object):void
        {
            var _local_2:*;
            if (!_arg_1)
            {
                return;
            };
            itemAC = new Object();
            itemLen = 0;
            for (_local_2 in _arg_1)
            {
                if (_arg_1[_local_2])
                {
                    itemAC[_local_2] = new Object();
                    itemAC[_local_2].ti = GamePredef.TBL_MEDAL;
                    itemAC[_local_2].ii = _arg_1[_local_2].t;
                    itemAC[_local_2].n = _arg_1[_local_2].n;
                    itemAC[_local_2].q = 0;
                    itemAC[_local_2].index = _local_2;
                    if (((ToolKit.isBigOrEqual(_local_2, itemLen)) && (!(ToolKit.isEqual(0, _local_2)))))
                    {
                        itemLen = ToolKit.add(_local_2, 1);
                        if (ToolKit.isBigThan(itemLen, GamePredef.MEDAL_BAG_MAX_ID))
                        {
                            itemLen = GamePredef.MEDAL_BAG_MAX_ID;
                        };
                    };
                };
            };
            initBagInfo();
            updateView();
            _firstLoadCid = ((_core.player.id) ? _core.player.id : 0);
            this.visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get slot3000():MedalSlot
        {
            return (this._1087593445slot3000);
        }

        [Bindable(event="propertyChange")]
        public function get slot3001():MedalSlot
        {
            return (this._1087593444slot3001);
        }

        private function updateMedalProp():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Object;
            _local_1 = 1;
            while (_local_1 <= 5)
            {
                this[("basicPro" + _local_1)].text = "";
                this[("basicPro1" + _local_1)].text = "";
                _local_1++;
            };
            _local_2 = 1;
            _local_1 = 1001;
            while (_local_1 <= 1005)
            {
                if (((this[("slot" + _local_1)]) && (this[("slot" + _local_1)].slotData)))
                {
                    _local_3 = GameData.d[GamePredef.TBL_MEDAL][this[("slot" + _local_1)].giid];
                    if (_local_3)
                    {
                        this[("basicPro" + _local_2)].text = ((GamePredef.MEDAL_PROP_NAME[_local_3.propType] + " +") + (Number(_local_3.propVal) / 100));
                        if (((_local_3.preflag) && (ToolKit.isEqual(_local_3.preflag, 1))))
                        {
                            this[("basicPro" + _local_2)].text = (this[("basicPro" + _local_2)].text + "%");
                        };
                        _local_2++;
                    };
                };
                _local_1++;
            };
            _local_2 = 1;
            _local_1 = 2001;
            while (_local_1 <= 2005)
            {
                if (((this[("slot" + _local_1)]) && (this[("slot" + _local_1)].slotData)))
                {
                    _local_3 = GameData.d[GamePredef.TBL_MEDAL][this[("slot" + _local_1)].giid];
                    if (_local_3)
                    {
                        this[("basicPro1" + _local_2)].text = ((GamePredef.MEDAL_PROP_NAME[_local_3.propType] + " +") + (Number(_local_3.propVal) / 100));
                        if (((_local_3.preflag) && (ToolKit.isEqual(_local_3.preflag, 1))))
                        {
                            this[("basicPro1" + _local_2)].text = (this[("basicPro1" + _local_2)].text + "%");
                        };
                        _local_2++;
                    };
                };
                _local_1++;
            };
        }

        public function set slot3000(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087593445slot3000;
            if (_local_2 !== _arg_1)
            {
                this._1087593445slot3000 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3000", _local_2, _arg_1));
            };
        }

        public function set slot3001(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087593444slot3001;
            if (_local_2 !== _arg_1)
            {
                this._1087593444slot3001 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3001", _local_2, _arg_1));
            };
        }

        public function set petImg(_arg_1:Image):void
        {
            var _local_2:Object = this._991697372petImg;
            if (_local_2 !== _arg_1)
            {
                this._991697372petImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg", _local_2, _arg_1));
            };
        }

        private function upSlotChange(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (slot3001.slotData)
            {
                nowProp.text = "";
                nextProp.text = "";
                _local_2 = GameData.d[GamePredef.TBL_MEDAL][this.slot3001.giid];
                lv3001.label = ("LV " + _local_2.level);
                upExp.label = _local_2.upExp;
                nowProp.text = ((GamePredef.MEDAL_PROP_NAME[_local_2.propType] + " +") + (Number(_local_2.propVal) / 100));
                if (Number(_local_2.level) >= GamePredef.MEDAL_MAX_LEVEL)
                {
                    nextProp.text = Language.MEDAL_P[35];
                }
                else
                {
                    for each (_local_3 in _core.data.gameDataIndex[GamePredef.TBL_MEDAL][_local_2.basicTid])
                    {
                        if (Number(_local_3.level) == ToolKit.add(1, _local_2.level))
                        {
                            nextProp.text = ((GamePredef.MEDAL_PROP_NAME[_local_3.propType] + " +") + (Number(_local_3.propVal) / 100));
                            break;
                        };
                    };
                };
            };
        }

        public function ___MedalPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initMedalPanel();
        }

        public function __btnArrange1_click(_arg_1:MouseEvent):void
        {
            getOprInfo(2);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro1():Label
        {
            return (this._1699273614basicPro1);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro2():Label
        {
            return (this._1699273613basicPro2);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro3():Label
        {
            return (this._1699273612basicPro3);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro4():Label
        {
            return (this._1699273611basicPro4);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro5():Label
        {
            return (this._1699273610basicPro5);
        }

        public function onBreakMedal(_arg_1:Object):void
        {
            if (_arg_1 == "ban")
            {
                _core.sysMidNote(Language.MEDAL_P[55]);
                return;
            };
            if ((((((_arg_1) && (_firstLoadCid)) && (_core.player)) && (_core.player.id)) && (_firstLoadCid == _core.player.id)))
            {
                updateMedalInfoByOpr(_arg_1);
                _core.player.medalExp = _arg_1.medalExp;
                initBagInfo();
                updateView();
                if (this.slot3000.slotData)
                {
                    this.slot3000.slotData = null;
                    this.slot3000.reset();
                    lv3000.label = "";
                    breakExp.label = "";
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnArrange3():DelayButton
        {
            return (this._486611075btnArrange3);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro6():Label
        {
            return (this._1699273609basicPro6);
        }

        [Bindable(event="propertyChange")]
        public function get btnArrange0():DelayButton
        {
            return (this._486611072btnArrange0);
        }

        [Bindable(event="propertyChange")]
        public function get btnArrange1():DelayButton
        {
            return (this._486611073btnArrange1);
        }

        [Bindable(event="propertyChange")]
        public function get charImg():Image
        {
            return (this._739034253charImg);
        }

        [Bindable(event="propertyChange")]
        public function get joinLab1():Label
        {
            return (this._1401996146joinLab1);
        }

        [Bindable(event="propertyChange")]
        public function get btnArrange2():DelayButton
        {
            return (this._486611074btnArrange2);
        }

        private function _MedalPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MedalPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn3.label = _arg_1;
            }, "bangBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot1006.slotType = _arg_1;
            }, "slot1006.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot1002.slotType = _arg_1;
            }, "slot1002.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot1005.slotType = _arg_1;
            }, "slot1005.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot1001.slotType = _arg_1;
            }, "slot1001.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot1004.slotType = _arg_1;
            }, "slot1004.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot1003.slotType = _arg_1;
            }, "slot1003.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton7.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton7.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_Label1.text = _arg_1;
            }, "_MedalPanel_Label1.text");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MedalPanel_Label1.filters = _arg_1;
            }, "_MedalPanel_Label1.filters");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                joinLab.text = _arg_1;
            }, "joinLab.text");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                joinLab.filters = _arg_1;
            }, "joinLab.filters");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnArrange2.label = _arg_1;
            }, "btnArrange2.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnArrange3.label = _arg_1;
            }, "btnArrange3.label");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot2006.slotType = _arg_1;
            }, "slot2006.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot2002.slotType = _arg_1;
            }, "slot2002.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot2005.slotType = _arg_1;
            }, "slot2005.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot2001.slotType = _arg_1;
            }, "slot2001.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot2004.slotType = _arg_1;
            }, "slot2004.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot2003.slotType = _arg_1;
            }, "slot2003.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton15.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton15.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_Label9.text = _arg_1;
            }, "_MedalPanel_Label9.text");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MedalPanel_Label9.filters = _arg_1;
            }, "_MedalPanel_Label9.filters");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                joinLab1.text = _arg_1;
            }, "joinLab1.text");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                joinLab1.filters = _arg_1;
            }, "joinLab1.filters");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnArrange0.label = _arg_1;
            }, "btnArrange0.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnArrange1.label = _arg_1;
            }, "btnArrange1.label");
            result[30] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_CHARACTER);
            }, function (_arg_1:Object):void
            {
                _MedalPanel_Image5.source = _arg_1;
            }, "_MedalPanel_Image5.source");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delInfo.text = _arg_1;
            }, "delInfo.text");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot3000.slotType = _arg_1;
            }, "slot3000.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton17.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton17.label");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                breakBtn.label = _arg_1;
            }, "breakBtn.label");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                breakBtnMore.label = _arg_1;
            }, "breakBtnMore.label");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton18.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton18.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton19.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton19.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.medalExp;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myExpBreakP.label = _arg_1;
            }, "myExpBreakP.label");
            result[39] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_CHARACTER);
            }, function (_arg_1:Object):void
            {
                _MedalPanel_Image6.source = _arg_1;
            }, "_MedalPanel_Image6.source");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upInfo.text = _arg_1;
            }, "upInfo.text");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot3001.slotType = _arg_1;
            }, "slot3001.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton24.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton24.label");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton25.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton25.label");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn.label = _arg_1;
            }, "upBtn.label");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton26.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton26.label");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.medalExp;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myExpUpP.label = _arg_1;
            }, "myExpUpP.label");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton29.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton29.label");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_BasicTxtButton30.label = _arg_1;
            }, "_MedalPanel_BasicTxtButton30.label");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MedalPanel_Canvas10.label = _arg_1;
            }, "_MedalPanel_Canvas10.label");
            result[50] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[51] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[52] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[53] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot4.slotType = _arg_1;
            }, "slot4.slotType");
            result[54] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot5.slotType = _arg_1;
            }, "slot5.slotType");
            result[55] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot6.slotType = _arg_1;
            }, "slot6.slotType");
            result[56] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot7.slotType = _arg_1;
            }, "slot7.slotType");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot8.slotType = _arg_1;
            }, "slot8.slotType");
            result[58] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot9.slotType = _arg_1;
            }, "slot9.slotType");
            result[59] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot10.slotType = _arg_1;
            }, "slot10.slotType");
            result[60] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot11.slotType = _arg_1;
            }, "slot11.slotType");
            result[61] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot12.slotType = _arg_1;
            }, "slot12.slotType");
            result[62] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot13.slotType = _arg_1;
            }, "slot13.slotType");
            result[63] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot14.slotType = _arg_1;
            }, "slot14.slotType");
            result[64] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot15.slotType = _arg_1;
            }, "slot15.slotType");
            result[65] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot16.slotType = _arg_1;
            }, "slot16.slotType");
            result[66] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot17.slotType = _arg_1;
            }, "slot17.slotType");
            result[67] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot18.slotType = _arg_1;
            }, "slot18.slotType");
            result[68] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot19.slotType = _arg_1;
            }, "slot19.slotType");
            result[69] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot20.slotType = _arg_1;
            }, "slot20.slotType");
            result[70] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot21.slotType = _arg_1;
            }, "slot21.slotType");
            result[71] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot22.slotType = _arg_1;
            }, "slot22.slotType");
            result[72] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot23.slotType = _arg_1;
            }, "slot23.slotType");
            result[73] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot24.slotType = _arg_1;
            }, "slot24.slotType");
            result[74] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot25.slotType = _arg_1;
            }, "slot25.slotType");
            result[75] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot26.slotType = _arg_1;
            }, "slot26.slotType");
            result[76] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot27.slotType = _arg_1;
            }, "slot27.slotType");
            result[77] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MEDAL);
            }, function (_arg_1:int):void
            {
                slot28.slotType = _arg_1;
            }, "slot28.slotType");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PAGE_SELECTOR[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnLastPage.label = _arg_1;
            }, "btnLastPage.label");
            result[79] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                txtPageIndicator.filters = _arg_1;
            }, "txtPageIndicator.filters");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PAGE_SELECTOR[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnNextPage.label = _arg_1;
            }, "btnNextPage.label");
            result[81] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnArrange.label = _arg_1;
            }, "btnArrange.label");
            result[82] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get slot10():MedalSlot
        {
            return (this._899454819slot10);
        }

        [Bindable(event="propertyChange")]
        public function get breakExp():BasicTxtButton
        {
            return (this._77309086breakExp);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():MedalSlot
        {
            return (this._899454817slot12);
        }

        [Bindable(event="propertyChange")]
        public function get slot14():MedalSlot
        {
            return (this._899454815slot14);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():MedalSlot
        {
            return (this._899454814slot15);
        }

        private function _resetEquiptMedal(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (_arg_1)
            {
                this[("slot" + _arg_1.i)].reset();
                _local_2 = new Object();
                this[("slot" + _arg_1.i)].type = GamePredef.TBL_MEDAL;
                _local_2.ti = GamePredef.TBL_MEDAL;
                this[("slot" + _arg_1.i)].giid = _arg_1.t;
                _local_2.ii = _arg_1.t;
                this[("slot" + _arg_1.i)].stackNum = _arg_1.n;
                _local_2.n = _arg_1.n;
                _local_2.q = 0;
                _local_2.index = Number(_arg_1.i);
                _local_3 = GameData.d[GamePredef.TBL_MEDAL][_arg_1.t];
                if (_local_3)
                {
                    _local_2.q = _local_3.q;
                    this[("lv" + _arg_1.i)].label = ("LV " + _local_3.level);
                }
                else
                {
                    this[("lv" + _arg_1.i)].label = "";
                };
                this[("slot" + _arg_1.i)].slotData = _local_2;
                this[("slot" + _arg_1.i)].labelVisible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot17():MedalSlot
        {
            return (this._899454812slot17);
        }

        [Bindable(event="propertyChange")]
        public function get slot11():MedalSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():MedalSlot
        {
            return (this._899454816slot13);
        }

        public function __btnLastPage_click(_arg_1:MouseEvent):void
        {
            _SafeStr_1(-1);
        }

        [Bindable(event="propertyChange")]
        public function get slot18():MedalSlot
        {
            return (this._899454811slot18);
        }

        [Bindable(event="propertyChange")]
        public function get slot19():MedalSlot
        {
            return (this._899454810slot19);
        }

        public function __breakBtnMore_click(_arg_1:MouseEvent):void
        {
            breakMedal(2);
        }

        [Bindable(event="propertyChange")]
        public function get slot20():MedalSlot
        {
            return (this._899454788slot20);
        }

        [Bindable(event="propertyChange")]
        public function get slot21():MedalSlot
        {
            return (this._899454787slot21);
        }

        [Bindable(event="propertyChange")]
        public function get slot22():MedalSlot
        {
            return (this._899454786slot22);
        }

        [Bindable(event="propertyChange")]
        public function get slot23():MedalSlot
        {
            return (this._899454785slot23);
        }

        [Bindable(event="propertyChange")]
        public function get slot24():MedalSlot
        {
            return (this._899454784slot24);
        }

        [Bindable(event="propertyChange")]
        public function get slot26():MedalSlot
        {
            return (this._899454782slot26);
        }

        [Bindable(event="propertyChange")]
        public function get slot27():MedalSlot
        {
            return (this._899454781slot27);
        }

        [Bindable(event="propertyChange")]
        public function get slot28():MedalSlot
        {
            return (this._899454780slot28);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():MedalSlot
        {
            return (this._899454813slot16);
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

        private function setJoinSlot(_arg_1:Number):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (((!(_arg_1)) || (_arg_1 == 0)))
            {
                this.slot2006.reset();
                this.joinLab1.visible = false;
                this["basicPro16"].text = "";
                this.joinName.label = "";
                this.lv2006.visible = false;
                charImg.visible = true;
                charImg1.visible = false;
            }
            else
            {
                this.slot2006.reset();
                _local_2 = new Object();
                this.slot2006.type = GamePredef.TBL_MEDAL;
                _local_2.ti = GamePredef.TBL_MEDAL;
                this.slot2006.giid = _arg_1;
                _local_2.ii = _arg_1;
                this.slot2006.stackNum = 1;
                _local_2.n = 1;
                _local_2.q = 0;
                _local_3 = GameData.d[GamePredef.TBL_MEDAL][this.slot2006.giid];
                if (_local_3)
                {
                    _local_2.q = _local_3.q;
                    this["basicPro16"].text = ((GamePredef.MEDAL_PROP_NAME[_local_3.propType] + " +") + (Number(_local_3.propVal) / 100));
                    if (((_local_3.preflag) && (ToolKit.isEqual(_local_3.preflag, 1))))
                    {
                        this["basicPro16"].text = (this["basicPro16"].text + "%");
                    };
                    this.joinName.label = _local_3.name;
                    this.lv2006.visible = true;
                    this.lv2006.text = ("LV " + _local_3.level);
                }
                else
                {
                    this["basicPro16"].text = "";
                    this.joinName.label = "";
                    this.lv2006.visible = false;
                };
                this.slot2006.slotData = _local_2;
                this.joinLab1.visible = true;
                charImg1.visible = true;
                charImg.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot25():MedalSlot
        {
            return (this._899454783slot25);
        }

        public function __bangBtn3_click(_arg_1:MouseEvent):void
        {
            bangSele(3);
        }

        [Bindable(event="propertyChange")]
        public function get breakBtn():DelayButton
        {
            return (this._77306077breakBtn);
        }

        public function set basicPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273614basicPro1;
            if (_local_2 !== _arg_1)
            {
                this._1699273614basicPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro1", _local_2, _arg_1));
            };
        }

        public function set basicPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273613basicPro2;
            if (_local_2 !== _arg_1)
            {
                this._1699273613basicPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lv1002():BasicTxtButton
        {
            return (this._1092536085lv1002);
        }

        public function set basicPro5(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273610basicPro5;
            if (_local_2 !== _arg_1)
            {
                this._1699273610basicPro5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lv1004():BasicTxtButton
        {
            return (this._1092536083lv1004);
        }

        public function set basicPro6(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273609basicPro6;
            if (_local_2 !== _arg_1)
            {
                this._1699273609basicPro6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro6", _local_2, _arg_1));
            };
        }

        public function set basicPro3(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273612basicPro3;
            if (_local_2 !== _arg_1)
            {
                this._1699273612basicPro3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro3", _local_2, _arg_1));
            };
        }

        public function set basicPro4(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273611basicPro4;
            if (_local_2 !== _arg_1)
            {
                this._1699273611basicPro4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lv1003():BasicTxtButton
        {
            return (this._1092536084lv1003);
        }

        [Bindable(event="propertyChange")]
        public function get lv1005():BasicTxtButton
        {
            return (this._1092536082lv1005);
        }

        [Bindable(event="propertyChange")]
        public function get lv1001():BasicTxtButton
        {
            return (this._1092536086lv1001);
        }

        public function set btnArrange0(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._486611072btnArrange0;
            if (_local_2 !== _arg_1)
            {
                this._486611072btnArrange0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnArrange0", _local_2, _arg_1));
            };
        }

        public function set btnArrange1(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._486611073btnArrange1;
            if (_local_2 !== _arg_1)
            {
                this._486611073btnArrange1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnArrange1", _local_2, _arg_1));
            };
        }

        public function set btnArrange2(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._486611074btnArrange2;
            if (_local_2 !== _arg_1)
            {
                this._486611074btnArrange2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnArrange2", _local_2, _arg_1));
            };
        }

        public function set btnArrange3(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._486611075btnArrange3;
            if (_local_2 !== _arg_1)
            {
                this._486611075btnArrange3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnArrange3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lv1006():BasicTxtButton
        {
            return (this._1092536081lv1006);
        }

        public function set myExpUpP(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1203783036myExpUpP;
            if (_local_2 !== _arg_1)
            {
                this._1203783036myExpUpP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myExpUpP", _local_2, _arg_1));
            };
        }

        private function initMedalInfo(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_4:*;
            if (!_arg_1)
            {
                return;
            };
            _local_2 = 1001;
            while (_local_2 <= 1005)
            {
                if (this[("slot" + _local_2)])
                {
                    this[("slot" + _local_2)].reset();
                    this[("slot" + _local_2)].labelTitle = Language.MEDAL_P[ToolKit.add(ToolKit.minus(_local_2, 1001), 41)];
                    this[("slot" + _local_2)].labelVisible = true;
                };
                _local_2++;
            };
            _local_2 = 2001;
            while (_local_2 <= 2005)
            {
                if (this[("slot" + _local_2)])
                {
                    this[("slot" + _local_2)].reset();
                    this[("slot" + _local_2)].labelTitle = Language.MEDAL_P[ToolKit.add(ToolKit.minus(_local_2, 2001), 41)];
                    this[("slot" + _local_2)].labelVisible = true;
                };
                _local_2++;
            };
            if (this.slot1006)
            {
                this.slot1006.reset();
                this.joinLab.visible = false;
                this["basicPro6"].text = "";
                this.pJoinName.label = "";
                this.lv1006.visible = false;
                petImg.visible = true;
                petImg1.visible = false;
            };
            if (this.slot2006)
            {
                this.slot2006.reset();
                this.joinLab1.visible = false;
                this["basicPro16"].text = "";
                this.joinName.label = "";
                this.lv2006.visible = false;
                charImg.visible = true;
                charImg1.visible = false;
            };
            var _local_3:Object = new Object();
            for (_local_4 in _arg_1.medalBag)
            {
                if (((_arg_1.medalBag[_local_4]) && (ToolKit.isSmallOrEqual(_local_4, 320))))
                {
                    _local_3[_local_4] = new Object();
                    _local_3[_local_4] = _arg_1.medalBag[_local_4];
                }
                else
                {
                    if (((_arg_1.medalBag[_local_4]) && (GamePredef.MEDAL_EQUIPT_SID[_local_4])))
                    {
                        _arg_1.medalBag[_local_4]["i"] = _local_4;
                        _resetEquiptMedal(_arg_1.medalBag[_local_4]);
                    };
                };
            };
            if (_arg_1.petBuff)
            {
                setPetJoinSlot(_arg_1.petBuff.t);
            };
            if (_arg_1.charBuff)
            {
                setJoinSlot(_arg_1.charBuff.t);
            };
            updateMedalProp();
            setMedalBag(_local_3);
            _core.player.medalExp = _arg_1.medalExp;
            slot3000.removeEventListener(GameEvent.SLOT_GIID_CHANGE, BreakSlotChange);
            slot3001.removeEventListener(GameEvent.SLOT_GIID_CHANGE, upSlotChange);
            slot3000.addEventListener(GameEvent.SLOT_GIID_CHANGE, BreakSlotChange);
            slot3001.addEventListener(GameEvent.SLOT_GIID_CHANGE, upSlotChange);
            if (slot3000.slotData)
            {
                this.slot3000.reset();
                lv3000.label = "";
                breakExp.label = "";
            };
            if (slot3001.slotData)
            {
                this.slot3001.reset();
                lv3001.label = "";
                upExp.label = "";
                nowProp.text = "";
                nextProp.text = "";
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextProp():BasicTxtButton
        {
            return (this._1424290038nextProp);
        }

        public function set charImg(_arg_1:Image):void
        {
            var _local_2:Object = this._739034253charImg;
            if (_local_2 !== _arg_1)
            {
                this._739034253charImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charImg", _local_2, _arg_1));
            };
        }

        public function __btnArrange0_click(_arg_1:MouseEvent):void
        {
            getOprInfo(1);
        }

        public function set vsBang(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._808459627vsBang;
            if (_local_2 !== _arg_1)
            {
                this._808459627vsBang = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsBang", _local_2, _arg_1));
            };
        }

        private function upMedal():void
        {
            var _local_1:Object;
            var _local_2:Object;
            if ((((this.slot3001.slotData) && (this.slot3001.slotData.index)) && (itemAC[this.slot3001.slotData.index])))
            {
                _local_1 = GameData.d[GamePredef.TBL_MEDAL][this.slot3001.giid];
                for each (_local_2 in _core.data.gameDataIndex[GamePredef.TBL_MEDAL][_local_1.basicTid])
                {
                    if (Number(_local_2.level) == ToolKit.add(1, _local_1.level))
                    {
                        if (((_local_2.clevel) && (Number(_local_2.clevel) > _core.player.level)))
                        {
                            _core.sysMidNote(Language.MEDAL_P[54]);
                            return;
                        };
                    };
                };
                if (((_local_1) && (Number(_local_1.upExp) <= _core.player.medalExp)))
                {
                    _core.remote.call("upMedal", new Responder(onUpMedal), this.slot3001.slotData.index);
                }
                else
                {
                    _core.sysMidNote(Language.MEDAL_P[38]);
                };
            };
        }

        public function set joinLab1(_arg_1:Label):void
        {
            var _local_2:Object = this._1401996146joinLab1;
            if (_local_2 !== _arg_1)
            {
                this._1401996146joinLab1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinLab1", _local_2, _arg_1));
            };
        }

        private function breakMedal(type:int):void
        {
            var gfunc:Function;
            var item:Object;
            var index:Number;
            var handler:Function;
            var str:String;
            var nummater:Number;
            if (!_core.delPass)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            if ((((this.slot3000.slotData) && (this.slot3000.slotData.index)) && (itemAC[this.slot3000.slotData.index])))
            {
                item = _core.data.getGameData(itemAC[this.slot3000.slotData.index].ti, itemAC[this.slot3000.slotData.index].ii);
                index = this.slot3000.slotData.index;
                if (type == 1)
                {
                    if (item.q >= 2)
                    {
                        handler = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("breakMedal", new Responder(onBreakMedal), index, 1, 1);
                            };
                        };
                        if (_alert1)
                        {
                            PopUpManager.removePopUp(_alert1);
                            _alert1 = null;
                        };
                        str = Language.MEDAL_P[58].toString();
                        _alert1 = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                        return;
                    };
                    _core.remote.call("breakMedal", new Responder(onBreakMedal), this.slot3000.slotData.index, 1, 1);
                }
                else
                {
                    if (((Number(materialMixNum.value) > Number(this.slot3000.slotData.stackNum)) || (Number(materialMixNum.value) <= 0)))
                    {
                        return;
                    };
                    nummater = Number(materialMixNum.value);
                    if (item.q >= 2)
                    {
                        handler = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("breakMedal", new Responder(onBreakMedal), index, nummater, 2);
                            };
                        };
                        if (_alert1)
                        {
                            PopUpManager.removePopUp(_alert1);
                            _alert1 = null;
                        };
                        str = Language.MEDAL_P[58].toString();
                        _alert1 = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                        return;
                    };
                    _core.remote.call("breakMedal", new Responder(onBreakMedal), this.slot3000.slotData.index, Number(materialMixNum.value), 2);
                };
            };
        }

        public function set slot10(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        public function set breakExp(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._77309086breakExp;
            if (_local_2 !== _arg_1)
            {
                this._77309086breakExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "breakExp", _local_2, _arg_1));
            };
        }

        public function set slot12(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        public function set slot13(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set slot14(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        public function get charImg1():Image
        {
            return (this._1435225412charImg1);
        }

        public function set petImg1(_arg_1:Image):void
        {
            var _local_2:Object = this._677847411petImg1;
            if (_local_2 !== _arg_1)
            {
                this._677847411petImg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petImg1", _local_2, _arg_1));
            };
        }

        public function set slot17(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lv2001():BasicTxtButton
        {
            return (this._1092506295lv2001);
        }

        [Bindable(event="propertyChange")]
        public function get lv2002():BasicTxtButton
        {
            return (this._1092506294lv2002);
        }

        [Bindable(event="propertyChange")]
        public function get lv2003():BasicTxtButton
        {
            return (this._1092506293lv2003);
        }

        [Bindable(event="propertyChange")]
        public function get lv2004():BasicTxtButton
        {
            return (this._1092506292lv2004);
        }

        [Bindable(event="propertyChange")]
        public function get lv2005():BasicTxtButton
        {
            return (this._1092506291lv2005);
        }

        [Bindable(event="propertyChange")]
        public function get lv2006():BasicTxtButton
        {
            return (this._1092506290lv2006);
        }

        public function set slot18(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454811slot18;
            if (_local_2 !== _arg_1)
            {
                this._899454811slot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot18", _local_2, _arg_1));
            };
        }

        public function set slot15(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        public function set slot11(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        public function set slot16(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function set slot19(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454810slot19;
            if (_local_2 !== _arg_1)
            {
                this._899454810slot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot19", _local_2, _arg_1));
            };
        }

        private function arrangeMedalBag():void
        {
            if ((!(itemLen)) == 0)
            {
                _core.remote.call("arrangeMedalBag", new Responder(onArrangeMedalBag));
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

        public function set slot20(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454788slot20;
            if (_local_2 !== _arg_1)
            {
                this._899454788slot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot20", _local_2, _arg_1));
            };
        }

        public function set slot21(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454787slot21;
            if (_local_2 !== _arg_1)
            {
                this._899454787slot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot21", _local_2, _arg_1));
            };
        }

        public function set slot22(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454786slot22;
            if (_local_2 !== _arg_1)
            {
                this._899454786slot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot22", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get firstTile():Tile
        {
            return (this._133022078firstTile);
        }

        public function set slot24(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454784slot24;
            if (_local_2 !== _arg_1)
            {
                this._899454784slot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot24", _local_2, _arg_1));
            };
        }

        private function onArrangeMedalBag(_arg_1:Object):void
        {
            var _local_3:*;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Object = new Object();
            for (_local_3 in _arg_1)
            {
                if (((_arg_1[_local_3]) && (ToolKit.isSmallOrEqual(_local_3, 320))))
                {
                    _local_2[_local_3] = new Object();
                    _local_2[_local_3] = _arg_1[_local_3];
                };
            };
            setMedalBag(_local_2);
        }

        public function set slot27(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454781slot27;
            if (_local_2 !== _arg_1)
            {
                this._899454781slot27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot27", _local_2, _arg_1));
            };
        }

        public function set slot28(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454780slot28;
            if (_local_2 !== _arg_1)
            {
                this._899454780slot28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot28", _local_2, _arg_1));
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

        public function set slot26(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454782slot26;
            if (_local_2 !== _arg_1)
            {
                this._899454782slot26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot26", _local_2, _arg_1));
            };
        }

        private function BreakSlotChange(_arg_1:Event):void
        {
            var _local_2:Object;
            if (slot3000.slotData)
            {
                _local_2 = GameData.d[GamePredef.TBL_MEDAL][this.slot3000.giid];
                lv3000.label = ("LV " + _local_2.level);
                breakExp.label = _local_2.exp;
                materialMixNum.maximum = slot3000.slotData.n;
                if (materialMixNum.value > materialMixNum.maximum)
                {
                    materialMixNum.value = materialMixNum.maximum;
                };
            };
        }

        public function set slot25(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454783slot25;
            if (_local_2 !== _arg_1)
            {
                this._899454783slot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot25", _local_2, _arg_1));
            };
        }

        public function updateMedalInBag(_arg_1:Object):void
        {
            if ((((((_arg_1) && (_firstLoadCid)) && (_core.player)) && (_core.player.id)) && (_firstLoadCid == _core.player.id)))
            {
                _updateMedalInBag(_arg_1);
                initBagInfo();
                updateView();
            };
        }

        public function set slot23(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._899454785slot23;
            if (_local_2 !== _arg_1)
            {
                this._899454785slot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot23", _local_2, _arg_1));
            };
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            bangSele(2);
        }

        [Bindable(event="propertyChange")]
        public function get upExp():BasicTxtButton
        {
            return (this._111458690upExp);
        }

        [Bindable(event="propertyChange")]
        public function get lv3001():BasicTxtButton
        {
            return (this._1092476504lv3001);
        }

        public function set joinName(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1401936171joinName;
            if (_local_2 !== _arg_1)
            {
                this._1401936171joinName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "joinName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnArrange():DelayButton
        {
            return (this._1923965520btnArrange);
        }

        public function __upBtn_click(_arg_1:MouseEvent):void
        {
            upMedal();
        }

        private function initBagInfo():void
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

        [Bindable(event="propertyChange")]
        public function get lv3000():BasicTxtButton
        {
            return (this._1092476505lv3000);
        }

        public function set breakBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._77306077breakBtn;
            if (_local_2 !== _arg_1)
            {
                this._77306077breakBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "breakBtn", _local_2, _arg_1));
            };
        }

        private function bangSele(_arg_1:Number):void
        {
            var _local_2:int = 4;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("bangBtn" + _local_3)].selected = false;
                _local_3++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
            vsBang.selectedIndex = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get upBtn():DelayButton
        {
            return (this._111455681upBtn);
        }

        [Bindable(event="propertyChange")]
        public function get breakBtnMore():DelayButton
        {
            return (this._1453420078breakBtnMore);
        }

        public function set lv1001(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092536086lv1001;
            if (_local_2 !== _arg_1)
            {
                this._1092536086lv1001 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv1001", _local_2, _arg_1));
            };
        }

        public function set lv1002(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092536085lv1002;
            if (_local_2 !== _arg_1)
            {
                this._1092536085lv1002 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv1002", _local_2, _arg_1));
            };
        }

        public function set lv1006(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092536081lv1006;
            if (_local_2 !== _arg_1)
            {
                this._1092536081lv1006 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv1006", _local_2, _arg_1));
            };
        }

        public function set lv1003(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092536084lv1003;
            if (_local_2 !== _arg_1)
            {
                this._1092536084lv1003 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv1003", _local_2, _arg_1));
            };
        }

        public function set lv1004(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092536083lv1004;
            if (_local_2 !== _arg_1)
            {
                this._1092536083lv1004 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv1004", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upInfo():IntroText
        {
            return (this._839638551upInfo);
        }

        public function set lv1005(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092536082lv1005;
            if (_local_2 !== _arg_1)
            {
                this._1092536082lv1005 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv1005", _local_2, _arg_1));
            };
        }

        public function set nextProp(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1424290038nextProp;
            if (_local_2 !== _arg_1)
            {
                this._1424290038nextProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextProp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1():MedalSlot
        {
            return (this._109532659slot1);
        }

        [Bindable(event="propertyChange")]
        public function get slot2():MedalSlot
        {
            return (this._109532660slot2);
        }

        [Bindable(event="propertyChange")]
        public function get slot4():MedalSlot
        {
            return (this._109532662slot4);
        }

        [Bindable(event="propertyChange")]
        public function get slot7():MedalSlot
        {
            return (this._109532665slot7);
        }

        [Bindable(event="propertyChange")]
        public function get slot9():MedalSlot
        {
            return (this._109532667slot9);
        }

        [Bindable(event="propertyChange")]
        public function get slot3():MedalSlot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get slot5():MedalSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro11():Label
        {
            return (this._1137874433basicPro11);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro12():Label
        {
            return (this._1137874432basicPro12);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro13():Label
        {
            return (this._1137874431basicPro13);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro15():Label
        {
            return (this._1137874429basicPro15);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro16():Label
        {
            return (this._1137874428basicPro16);
        }

        [Bindable(event="propertyChange")]
        public function get slot6():MedalSlot
        {
            return (this._109532664slot6);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro14():Label
        {
            return (this._1137874430basicPro14);
        }

        public function __btnArrange_click(_arg_1:MouseEvent):void
        {
            arrangeMedalBag();
        }

        [Bindable(event="propertyChange")]
        public function get slot8():MedalSlot
        {
            return (this._109532666slot8);
        }

        [Bindable(event="propertyChange")]
        public function get petImg():Image
        {
            return (this._991697372petImg);
        }

        public function onUpMedal(_arg_1:Object):void
        {
            if ((((((_arg_1) && (_firstLoadCid)) && (_core.player)) && (_core.player.id)) && (_firstLoadCid == _core.player.id)))
            {
                updateMedalInfoByOpr(_arg_1);
                _core.player.medalExp = _arg_1.medalExp;
                initBagInfo();
                updateView();
                if (this.slot3001.slotData)
                {
                    this.slot3001.slotData = null;
                    this.slot3001.reset();
                    lv3001.label = "";
                    upExp.label = "";
                    nowProp.text = "";
                    nextProp.text = "";
                };
            };
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            bangSele(1);
        }

        private function initMedalPanel():void
        {
            charImg.source = ResManager.getIconUrl(parseInt("4130220000207"));
            petImg.source = ResManager.getIconUrl(parseInt("4130220000207"));
            petImg1.source = ResManager.getIconUrl(parseInt("4130220000208"));
            charImg1.source = ResManager.getIconUrl(parseInt("4130220000208"));
        }

        [Bindable(event="propertyChange")]
        public function get myExpUpP():BasicTxtButton
        {
            return (this._1203783036myExpUpP);
        }

        public function onMoveMedal(_arg_1:Object):void
        {
            var _local_2:int;
            if ((((((_arg_1) && (_firstLoadCid)) && (_core.player)) && (_core.player.id)) && (_firstLoadCid == _core.player.id)))
            {
                updateMedalInfoByOpr(_arg_1);
                _local_2 = _arg_1["type"];
                if (1 == _local_2)
                {
                    setJoinSlot(_arg_1["joinTid"]);
                }
                else
                {
                    if (2 == _local_2)
                    {
                        setPetJoinSlot(_arg_1["petJoinTid"]);
                    };
                };
                updateMedalProp();
                initBagInfo();
                updateView();
            };
        }

        public function set charImg1(_arg_1:Image):void
        {
            var _local_2:Object = this._1435225412charImg1;
            if (_local_2 !== _arg_1)
            {
                this._1435225412charImg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charImg1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petImg1():Image
        {
            return (this._677847411petImg1);
        }

        public function set lv2001(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092506295lv2001;
            if (_local_2 !== _arg_1)
            {
                this._1092506295lv2001 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv2001", _local_2, _arg_1));
            };
        }

        public function set lv2002(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092506294lv2002;
            if (_local_2 !== _arg_1)
            {
                this._1092506294lv2002 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv2002", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vsBang():ViewStack
        {
            return (this._808459627vsBang);
        }

        public function set lv2004(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092506292lv2004;
            if (_local_2 !== _arg_1)
            {
                this._1092506292lv2004 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv2004", _local_2, _arg_1));
            };
        }

        public function set lv2003(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092506293lv2003;
            if (_local_2 !== _arg_1)
            {
                this._1092506293lv2003 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv2003", _local_2, _arg_1));
            };
        }

        public function set lv2005(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092506291lv2005;
            if (_local_2 !== _arg_1)
            {
                this._1092506291lv2005 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv2005", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnNextPage():Button
        {
            return (this._1090881890btnNextPage);
        }

        public function set lv2006(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092506290lv2006;
            if (_local_2 !== _arg_1)
            {
                this._1092506290lv2006 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv2006", _local_2, _arg_1));
            };
        }

        private function updateMedalInfoByOpr(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            for (_local_2 in _arg_1)
            {
                switch (_local_2)
                {
                    case "del":
                        if (((Number(_arg_1[_local_2]) <= GamePredef.MEDAL_BAG_MAX_ID) && (Number(_arg_1[_local_2]) > 0)))
                        {
                            if (((itemAC[Number(_arg_1[_local_2])]) && (delete itemAC[Number(_arg_1[_local_2])])))
                            {
                                if (ToolKit.isEqual(ToolKit.add(Number(_arg_1[_local_2]), 1), itemLen))
                                {
                                    itemLen = 0;
                                    for (_local_2 in itemAC)
                                    {
                                        if (itemAC[_local_2])
                                        {
                                            if (ToolKit.isBigOrEqual(Number(_local_2), itemLen))
                                            {
                                                itemLen = ToolKit.add(Number(_local_2), 1);
                                                if (ToolKit.isBigThan(itemLen, GamePredef.MEDAL_BAG_MAX_ID))
                                                {
                                                    itemLen = GamePredef.MEDAL_BAG_MAX_ID;
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        }
                        else
                        {
                            if (GamePredef.MEDAL_EQUIPT_SID[Number(_arg_1[_local_2])])
                            {
                                this[("slot" + Number(_arg_1[_local_2]))].slotData = null;
                                this[("slot" + Number(_arg_1[_local_2]))].reset();
                                this[("lv" + Number(_arg_1[_local_2]))].label = "";
                                this[("slot" + Number(_arg_1[_local_2]))].labelVisible = true;
                            };
                        };
                        break;
                    case "pa":
                        if (_arg_1[_local_2])
                        {
                            for (_local_3 in _arg_1[_local_2])
                            {
                                if (_arg_1[_local_2][_local_3])
                                {
                                    if (GamePredef.MEDAL_EQUIPT_SID[_local_3])
                                    {
                                        _arg_1[_local_2][_local_3]["i"] = Number(_local_3);
                                        _resetEquiptMedal(_arg_1[_local_2][_local_3]);
                                    };
                                };
                            };
                        };
                        break;
                    case "ba":
                        if (_arg_1[_local_2])
                        {
                            for (_local_3 in _arg_1[_local_2])
                            {
                                if (_arg_1[_local_2][_local_3])
                                {
                                    if (((Number(_local_3) <= GamePredef.MEDAL_BAG_MAX_ID) && (Number(_local_3) > 0)))
                                    {
                                        _arg_1[_local_2][_local_3]["i"] = Number(_local_3);
                                        _updateMedalInBag(_arg_1[_local_2][_local_3]);
                                    };
                                };
                            };
                        };
                        break;
                };
            };
        }

        public function set slot1003(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087653024slot1003;
            if (_local_2 !== _arg_1)
            {
                this._1087653024slot1003 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1003", _local_2, _arg_1));
            };
        }

        public function set slot1001(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087653026slot1001;
            if (_local_2 !== _arg_1)
            {
                this._1087653026slot1001 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1001", _local_2, _arg_1));
            };
        }

        public function set myExpBreakP(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._535111522myExpBreakP;
            if (_local_2 !== _arg_1)
            {
                this._535111522myExpBreakP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myExpBreakP", _local_2, _arg_1));
            };
        }

        private function getOprInfo(_arg_1:int):void
        {
            var _local_4:int;
            var _local_5:int;
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var _local_2:String = Language.MEDAL_P[46];
            if (_arg_1 == 2)
            {
                _local_4 = 0;
                _local_5 = 4;
                _local_4 = 0;
                while (_local_4 < _local_5)
                {
                    if (this[("bangBtn" + _local_4)].selected) break;
                    _local_4++;
                };
                if (_local_4 == 0)
                {
                    _local_2 = Language.MEDAL_P[47];
                }
                else
                {
                    if (_local_4 == 1)
                    {
                        _local_2 = Language.MEDAL_P[53];
                    };
                };
            };
            _alert = Alert.show(_local_2, null, Alert.OK, null, null);
            var _local_3:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            _local_3.htmlText = _local_2;
            _local_3.filters = GamePredef.FILTER_TEXT1;
        }

        public function set delInfo(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1549623129delInfo;
            if (_local_2 !== _arg_1)
            {
                this._1549623129delInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delInfo", _local_2, _arg_1));
            };
        }

        public function set slot1005(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087653022slot1005;
            if (_local_2 !== _arg_1)
            {
                this._1087653022slot1005 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1005", _local_2, _arg_1));
            };
        }

        private function setPetJoinSlot(_arg_1:Number):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (((!(_arg_1)) || (_arg_1 == 0)))
            {
                this.slot1006.reset();
                this.joinLab.visible = false;
                this["basicPro6"].text = "";
                this.pJoinName.label = "";
                this.lv1006.visible = false;
                petImg.visible = true;
                petImg1.visible = false;
            }
            else
            {
                this.slot1006.reset();
                _local_2 = new Object();
                this.slot1006.type = GamePredef.TBL_MEDAL;
                _local_2.ti = GamePredef.TBL_MEDAL;
                this.slot1006.giid = _arg_1;
                _local_2.ii = _arg_1;
                this.slot1006.stackNum = 1;
                _local_2.n = 1;
                _local_2.q = 0;
                _local_3 = GameData.d[GamePredef.TBL_MEDAL][this.slot1006.giid];
                if (_local_3)
                {
                    this["basicPro6"].text = ((GamePredef.MEDAL_PROP_NAME[_local_3.propType] + " +") + (Number(_local_3.propVal) / 100));
                    if (((_local_3.preflag) && (ToolKit.isEqual(_local_3.preflag, 1))))
                    {
                        this["basicPro6"].text = (this["basicPro6"].text + "%");
                    };
                    _local_2.q = _local_3.q;
                    this.pJoinName.label = _local_3.name;
                    this.lv1006.visible = true;
                    this.lv1006.text = ("LV " + _local_3.level);
                }
                else
                {
                    this["basicPro6"].text = "";
                    this.pJoinName.label = "";
                    this.lv1006.visible = false;
                };
                this.slot1006.slotData = _local_2;
                this.joinLab.visible = true;
                petImg1.visible = true;
                petImg.visible = false;
            };
        }

        public function set slot1002(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087653025slot1002;
            if (_local_2 !== _arg_1)
            {
                this._1087653025slot1002 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1002", _local_2, _arg_1));
            };
        }

        public function set pJoinName(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1908728987pJoinName;
            if (_local_2 !== _arg_1)
            {
                this._1908728987pJoinName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pJoinName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get joinName():BasicTxtButton
        {
            return (this._1401936171joinName);
        }

        public function set slot1004(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087653023slot1004;
            if (_local_2 !== _arg_1)
            {
                this._1087653023slot1004 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1004", _local_2, _arg_1));
            };
        }

        public function set nowProp(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._2131388249nowProp;
            if (_local_2 !== _arg_1)
            {
                this._2131388249nowProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nowProp", _local_2, _arg_1));
            };
        }

        public function __btnArrange3_click(_arg_1:MouseEvent):void
        {
            getOprInfo(2);
        }

        public function set slot1006(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087653021slot1006;
            if (_local_2 !== _arg_1)
            {
                this._1087653021slot1006 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1006", _local_2, _arg_1));
            };
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

        public function set upExp(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._111458690upExp;
            if (_local_2 !== _arg_1)
            {
                this._111458690upExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upExp", _local_2, _arg_1));
            };
        }

        private function updateView():void
        {
            var _local_3:Number;
            var _local_4:Object;
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
                    if (itemAC[_local_3].ti == GamePredef.TBL_CREATURE)
                    {
                        this[("slot" + _local_2)].setStyleName(_core.basic.colorByGrowRate((itemAC[_local_3].q / 10)));
                    }
                    else
                    {
                        _local_4 = _core.data.getGameData(itemAC[_local_3].ti, itemAC[_local_3].ii);
                        (((_local_4) && (_local_4.color)) && (this[("slot" + _local_2)].setStyleName(0)));
                    };
                };
                _local_2++;
            };
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            bangSele(0);
        }

        public function set materialMixNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1788135535materialMixNum;
            if (_local_2 !== _arg_1)
            {
                this._1788135535materialMixNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "materialMixNum", _local_2, _arg_1));
            };
        }

        public function set lv3001(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092476504lv3001;
            if (_local_2 !== _arg_1)
            {
                this._1092476504lv3001 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv3001", _local_2, _arg_1));
            };
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

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
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

        public function set lv3000(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1092476505lv3000;
            if (_local_2 !== _arg_1)
            {
                this._1092476505lv3000 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv3000", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1002():MedalSlot
        {
            return (this._1087653025slot1002);
        }

        public function set btnArrange(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1923965520btnArrange;
            if (_local_2 !== _arg_1)
            {
                this._1923965520btnArrange = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnArrange", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1004():MedalSlot
        {
            return (this._1087653023slot1004);
        }

        [Bindable(event="propertyChange")]
        public function get myExpBreakP():BasicTxtButton
        {
            return (this._535111522myExpBreakP);
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
        public function get slot1003():MedalSlot
        {
            return (this._1087653024slot1003);
        }

        [Bindable(event="propertyChange")]
        public function get slot1001():MedalSlot
        {
            return (this._1087653026slot1001);
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

        [Bindable(event="propertyChange")]
        public function get delInfo():IntroText
        {
            return (this._1549623129delInfo);
        }

        public function set slot2002(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087623234slot2002;
            if (_local_2 !== _arg_1)
            {
                this._1087623234slot2002 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2002", _local_2, _arg_1));
            };
        }

        public function set slot2003(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087623233slot2003;
            if (_local_2 !== _arg_1)
            {
                this._1087623233slot2003 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2003", _local_2, _arg_1));
            };
        }

        public function set slot2004(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087623232slot2004;
            if (_local_2 !== _arg_1)
            {
                this._1087623232slot2004 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2004", _local_2, _arg_1));
            };
        }

        public function set slot2001(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087623235slot2001;
            if (_local_2 !== _arg_1)
            {
                this._1087623235slot2001 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2001", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1006():MedalSlot
        {
            return (this._1087653021slot1006);
        }

        public function __breakBtn_click(_arg_1:MouseEvent):void
        {
            breakMedal(1);
        }

        [Bindable(event="propertyChange")]
        public function get pJoinName():BasicTxtButton
        {
            return (this._1908728987pJoinName);
        }

        public function set slot2005(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087623231slot2005;
            if (_local_2 !== _arg_1)
            {
                this._1087623231slot2005 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2005", _local_2, _arg_1));
            };
        }

        public function set slot2006(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._1087623230slot2006;
            if (_local_2 !== _arg_1)
            {
                this._1087623230slot2006 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2006", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1005():MedalSlot
        {
            return (this._1087653022slot1005);
        }

        override public function initialize():void
        {
            var target:MedalPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MedalPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MedalPanelWatcherSetupUtil");
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
        public function get materialMixNum():NumericStepper
        {
            return (this._1788135535materialMixNum);
        }

        [Bindable(event="propertyChange")]
        public function get nowProp():BasicTxtButton
        {
            return (this._2131388249nowProp);
        }

        public function set upBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._111455681upBtn;
            if (_local_2 !== _arg_1)
            {
                this._111455681upBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn", _local_2, _arg_1));
            };
        }

        public function set breakBtnMore(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1453420078breakBtnMore;
            if (_local_2 !== _arg_1)
            {
                this._1453420078breakBtnMore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "breakBtnMore", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        public function get bangBtn3():BasicGlowButton
        {
            return (this._1863324753bangBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn2():BasicGlowButton
        {
            return (this._1863324754bangBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get txtPageIndicator():TextInput
        {
            return (this._1229795408txtPageIndicator);
        }

        public function __btnArrange2_click(_arg_1:MouseEvent):void
        {
            getOprInfo(1);
        }

        [Bindable(event="propertyChange")]
        public function get slot2002():MedalSlot
        {
            return (this._1087623234slot2002);
        }

        [Bindable(event="propertyChange")]
        public function get slot2003():MedalSlot
        {
            return (this._1087623233slot2003);
        }

        [Bindable(event="propertyChange")]
        public function get slot2004():MedalSlot
        {
            return (this._1087623232slot2004);
        }

        [Bindable(event="propertyChange")]
        public function get slot2006():MedalSlot
        {
            return (this._1087623230slot2006);
        }

        [Bindable(event="propertyChange")]
        public function get slot2001():MedalSlot
        {
            return (this._1087623235slot2001);
        }

        [Bindable(event="propertyChange")]
        public function get slot2005():MedalSlot
        {
            return (this._1087623231slot2005);
        }

        public function set upInfo(_arg_1:IntroText):void
        {
            var _local_2:Object = this._839638551upInfo;
            if (_local_2 !== _arg_1)
            {
                this._839638551upInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upInfo", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (((!(_firstLoadCid)) || (((_core.player) && (_core.player.id)) && (!(_firstLoadCid == _core.player.id)))))
            {
                _core.remote.call("getMedalInfo", new Responder(initMedalInfo));
                return;
            };
            this.visible = true;
        }

        public function set slot1(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        public function set slot7(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        private function _MedalPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MEDAL_P[0];
            _local_1 = Language.MEDAL_P[1];
            _local_1 = Language.MEDAL_P[50];
            _local_1 = Language.MEDAL_P[3];
            _local_1 = Language.MEDAL_P[2];
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Language.MEDAL_P[13];
            _local_1 = Language.MOUNTPANEL_U[12];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MEDAL_P[15];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MEDAL_P[39];
            _local_1 = Language.MEDAL_P[40];
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Language.MEDAL_P[13];
            _local_1 = Language.MOUNTPANEL_U[12];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MEDAL_P[15];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MEDAL_P[39];
            _local_1 = Language.MEDAL_P[40];
            _local_1 = ResManager.TOTEM_CHARACTER;
            _local_1 = Language.MEDAL_P[49];
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Language.MEDAL_P[9];
            _local_1 = Language.MEDAL_P[11];
            _local_1 = Language.MEDAL_P[12];
            _local_1 = Language.MEDAL_P[10];
            _local_1 = Language.MEDAL_P[7];
            _local_1 = _core.player.medalExp;
            _local_1 = ResManager.TOTEM_CHARACTER;
            _local_1 = Language.MEDAL_P[48];
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Language.MEDAL_P[6];
            _local_1 = Language.MEDAL_P[7];
            _local_1 = Language.MEDAL_P[5];
            _local_1 = Language.MEDAL_P[8];
            _local_1 = _core.player.medalExp;
            _local_1 = Language.MEDAL_P[21];
            _local_1 = Language.MEDAL_P[22];
            _local_1 = Language.BANKPANEL_S[2];
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Slot.SLOT_MEDAL;
            _local_1 = Language.PAGE_SELECTOR[0];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.PAGE_SELECTOR[1];
            _local_1 = Language.MEDAL_P[4];
        }

        private function _updateMedalInBag(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (!itemAC[_arg_1.i])
                {
                    itemAC[_arg_1.i] = new Object();
                    if (ToolKit.isBigOrEqual(_arg_1.i, itemLen))
                    {
                        itemLen = ToolKit.add(Number(_arg_1.i), 1);
                        if (ToolKit.isBigThan(itemLen, GamePredef.MEDAL_BAG_MAX_ID))
                        {
                            itemLen = GamePredef.MEDAL_BAG_MAX_ID;
                        };
                    };
                };
                itemAC[_arg_1.i].ti = GamePredef.TBL_MEDAL;
                itemAC[_arg_1.i].ii = _arg_1.t;
                itemAC[_arg_1.i].n = _arg_1.n;
                itemAC[_arg_1.i].q = 0;
                itemAC[_arg_1.i].index = Number(_arg_1.i);
            };
        }

        public function set slot4(_arg_1:MedalSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }

        public function set basicPro11(_arg_1:Label):void
        {
            var _local_2:Object = this._1137874433basicPro11;
            if (_local_2 !== _arg_1)
            {
                this._1137874433basicPro11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro11", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

// _SafeStr_1 = "goto" (String#15869, DoABC#2)


