// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.Moyintuce

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.ItemSlotEquFunc;
    import mx.controls.Image;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.LinkButton;
    import mx.controls.List;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import com.qeedoo.game.data.GameData;
    import mx.events.ListEvent;
    import mx.core.ClassFactory;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
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

    public class Moyintuce extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1036623713detailInfo:Label;
        private var _1351530636dprop1_32:RoundedLabel;
        private var _1351500905dprop2_14:RoundedLabel;
        private var _1853834247suitName1:Label;
        private var _1652929113EMTotalPropLbl1_13:RoundedLabel;
        private var _96835805etip3:Label;
        private var _1106142757levUps:ItemSlotEquFunc;
        public var _Moyintuce_RoundedLabel4:RoundedLabel;
        public var _Moyintuce_Label11:Label;
        private var _1072548639buyLimitLabel:RoundedLabel;
        private var _468962284EMTotalPropLbl1_9:RoundedLabel;
        private var nowPage1:* = 1;
        private var _1298838077ename3:Label;
        private var _1652929053EMTotalPropLbl1_31:RoundedLabel;
        private var _1351530696dprop1_14:RoundedLabel;
        private var _1652929112EMTotalPropLbl1_14:RoundedLabel;
        private var _1652928984EMTotalPropLbl1_58:RoundedLabel;
        private var _468962285EMTotalPropLbl1_8:RoundedLabel;
        private var _1527955858mytcbg2:Image;
        private var nowPage2:* = 1;
        private var _2070563983detailInfo0:Label;
        private var _2121806779dprop2_9:RoundedLabel;
        private var _468962286EMTotalPropLbl1_7:RoundedLabel;
        private var dp:ArrayCollection = null;
        public var _Moyintuce_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1652929052EMTotalPropLbl1_32:RoundedLabel;
        private var _2121806784dprop2_4:RoundedLabel;
        private var _468962287EMTotalPropLbl1_6:RoundedLabel;
        private var _2121806782dprop2_6:RoundedLabel;
        private var _1059090152mytcVS:ViewStack;
        private var _2121806780dprop2_8:RoundedLabel;
        private var nowTabText:* = "";
        private var _2146310748levUpBtn:BasicDelayButton;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _1298838079ename1:Label;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _2121807743dprop1_6:RoundedLabel;
        private var _468962288EMTotalPropLbl1_5:RoundedLabel;
        private var _2121807741dprop1_8:RoundedLabel;
        private var _1652928960EMTotalPropLbl1_61:RoundedLabel;
        private var _2121807745dprop1_4:RoundedLabel;
        private var _468962289EMTotalPropLbl1_4:RoundedLabel;
        private var _96835803etip1:Label;
        private var nowTab:* = 1;
        private var _100675es1:ItemSlotEquFunc;
        private var _1527910589mytc3bg:Image;
        private var _1853834246suitName2:Label;
        private var _1351500846dprop2_31:RoundedLabel;
        private var _1351500721dprop2_72:RoundedLabel;
        private var _1652929050EMTotalPropLbl1_34:RoundedLabel;
        private var _94109721buyYL:BasicGlowButton;
        private var _1070599158nextLevPropText0:Canvas;
        private var _1212390534nextLevPropText:Canvas;
        private var _1351530637dprop1_31:RoundedLabel;
        private var _1351530512dprop1_72:RoundedLabel;
        private var _694585521yanliaoslot:ItemSlot;
        private var _1351500906dprop2_13:RoundedLabel;
        private var _100676es2:ItemSlotEquFunc;
        private var _1351500777dprop2_58:RoundedLabel;
        private var _1652928928EMTotalPropLbl1_72:RoundedLabel;
        private var _3446038pnum:RoundedLabel;
        private var _1351500908dprop2_11:RoundedLabel;
        private var _1351500753dprop2_61:RoundedLabel;
        private var _1298838078ename2:Label;
        private var _1351530568dprop1_58:RoundedLabel;
        private var _204464502activeBtn:BasicDelayButton;
        private var flag:Object;
        public var _Moyintuce_Label2:Label;
        private var _1351530697dprop1_13:RoundedLabel;
        private var _96835804etip2:Label;
        public var _Moyintuce_LinkButton1:LinkButton;
        private var _981567783pprice:RoundedLabel;
        private var _2121806787dprop2_1:RoundedLabel;
        private var _2121806783dprop2_5:RoundedLabel;
        private var _1652929115EMTotalPropLbl1_11:RoundedLabel;
        private var _1351530544dprop1_61:RoundedLabel;
        private var _100677es3:ItemSlotEquFunc;
        private var _2121806781dprop2_7:RoundedLabel;
        private var _1863324753bangBtn3:BasicGlowButton;
        private var _2121807742dprop1_7:RoundedLabel;
        private var _1351500843dprop2_34:RoundedLabel;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _1351530699dprop1_11:RoundedLabel;
        private var _2121807740dprop1_9:RoundedLabel;
        private var _468962292EMTotalPropLbl1_1:RoundedLabel;
        private var _1860721589suitTree:List;
        private var _2121807748dprop1_1:RoundedLabel;
        private var _1351530634dprop1_34:RoundedLabel;
        private var _2121807744dprop1_5:RoundedLabel;
        private var _1059089760mytcbg:Image;
        private var _1351500845dprop2_32:RoundedLabel;
        private var _cid:* = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":730,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_Moyintuce_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "width":728,
                                "height":467,
                                "x":1,
                                "y":32,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"mytcbg",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":0,
                                            "x":0,
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_Moyintuce_LinkButton1",
                                    "events":{"click":"___Moyintuce_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "3";
                                        this.right = "3";
                                        this.color = 0xFFFFFF;
                                        this.textDecoration = "underline";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":78});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "10";
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":211,
                                            "height":439,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalGap = 1;
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
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
                                                                    "width":41
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
                                                                    "width":41
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
                                                                    "width":41
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
                                                                    "width":41
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
                                                        "width":205,
                                                        "height":100.3,
                                                        "y":24,
                                                        "x":3,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"mytcbg2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":0,
                                                                    "x":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"yanliaoslot",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "21";
                                                                this.top = "12";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"movable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"pnum",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":72,
                                                                    "y":8,
                                                                    "text":"Chứa Ma Tâm * 255"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"pprice",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":72,
                                                                    "y":28,
                                                                    "text":"Giá: 1299 coin"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"buyLimitLabel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.left = "18";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":52});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"buyYL",
                                                            "events":{"click":"__buyYL_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-9";
                                                                this.verticalCenter = "34";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed2",
                                                                    "width":50
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
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"auto",
                                                        "height":312,
                                                        "y":124.3,
                                                        "width":205,
                                                        "x":3,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_Moyintuce_RoundedLabel4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23.5,
                                                                    "y":10,
                                                                    "height":17
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":29
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":49
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":66
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":83
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":117
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":134
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_31",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":151
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":168
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":185
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":202
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_61",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":219
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_32",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":236
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_58",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":253
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_34",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":270
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"EMTotalPropLbl1_72",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":287
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
                                            "styleName":"CanvasBorder",
                                            "width":211,
                                            "height":439,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "x":220,
                                            "y":10,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"suitTree",
                                                "events":{
                                                    "itemClick":"__suitTree_itemClick",
                                                    "mouseDown":"__suitTree_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                    this.left = "4";
                                                    this.top = "7";
                                                    this.bottom = "7";
                                                    this.right = "4";
                                                    this.selectionColor = 5458828;
                                                    this.rollOverColor = 11775705;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selectable":true,
                                                        "itemRenderer":_Moyintuce_ClassFactory1_c()
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"mytc3bg",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":283,
                                            "height":439,
                                            "x":436,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"mytcVS",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":283,
                                            "height":439,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "x":436,
                                            "y":10,
                                            "selectedIndex":2,
                                            "creationPolicy":"all",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"suitName1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 15;
                                                                this.color = 16768881;
                                                                this.textAlign = "center";
                                                                this.top = "13";
                                                                this.horizontalCenter = "0";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":200,
                                                                    "height":27
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_Moyintuce_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "left";
                                                                this.top = "59";
                                                                this.left = "30";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":248,
                                                                    "height":27
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"ename1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 26367;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"装备",
                                                                    "width":90,
                                                                    "x":3,
                                                                    "y":83
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"ename2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 26367;
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "-5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"装备",
                                                                    "width":90,
                                                                    "y":83
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"ename3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 26367;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"装备",
                                                                    "width":77,
                                                                    "y":83,
                                                                    "x":188
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"es1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-93";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":107});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"es2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":107});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"es3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "85";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":107});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"etip1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xBDBDBD;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"装备",
                                                                    "width":90,
                                                                    "x":3,
                                                                    "y":143
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"etip2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xBDBDBD;
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "-5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"装备",
                                                                    "width":90,
                                                                    "y":143
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"etip3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xBDBDBD;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"装备",
                                                                    "width":77,
                                                                    "y":143,
                                                                    "x":188
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"activeBtn",
                                                            "events":{"click":"__activeBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":2000,
                                                                    "styleName":"BtnNormalBlue",
                                                                    "y":171,
                                                                    "height":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"nextLevPropText0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":27,
                                                                    "y":238,
                                                                    "width":231,
                                                                    "height":191,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":19
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":39
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":56
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":73
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":90
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_11",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":107
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_13",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":124
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_31",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":141
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":19
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":39
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_14",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":56
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_61",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":73
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_32",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":90
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_58",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":107
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_34",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":124
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop1_72",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":141
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___Moyintuce_Button1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "7";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":319,
                                                                    "width":12,
                                                                    "height":25,
                                                                    "styleName":"BtnShowButtons",
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___Moyintuce_Button2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "8";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":319,
                                                                    "width":12,
                                                                    "height":25,
                                                                    "styleName":"BtnHideButtons",
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"detailInfo0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "left";
                                                                this.top = "230";
                                                                this.horizontalCenter = "-37";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":155,
                                                                    "height":27
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
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"suitName2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 15;
                                                                this.color = 16768881;
                                                                this.textAlign = "center";
                                                                this.top = "18";
                                                                this.horizontalCenter = "0";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":155,
                                                                    "height":27
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_Moyintuce_Label11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "center";
                                                                this.top = "56";
                                                                this.horizontalCenter = "0";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Vật thăng cấp:",
                                                                    "width":137
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"levUps",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":84});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"levUpBtn",
                                                            "events":{"click":"__levUpBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":2000,
                                                                    "styleName":"BtnNormalBlue",
                                                                    "y":136,
                                                                    "label":"Thăng cấp",
                                                                    "enabled":false,
                                                                    "width":104
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"nextLevPropText",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":27,
                                                                    "y":238,
                                                                    "width":231,
                                                                    "height":191,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":19
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":39
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":56
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":73
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":90
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_11",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":107
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_13",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":124
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_31",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":4,
                                                                                "y":141
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_8",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":19
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":39
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_14",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":56
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_61",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":73
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_32",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":90
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_58",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":107
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_34",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":124
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"dprop2_72",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":141
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___Moyintuce_Button3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "7";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":319,
                                                                    "width":12,
                                                                    "height":25,
                                                                    "styleName":"BtnShowButtons",
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___Moyintuce_Button4_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "8";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":319,
                                                                    "width":12,
                                                                    "height":25,
                                                                    "styleName":"BtnHideButtons",
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"detailInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.textAlign = "left";
                                                                this.top = "230";
                                                                this.horizontalCenter = "-37";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":155,
                                                                    "height":27
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
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "x":0,
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
        });
        private var _core:Core = Core.getInstance();
        private var _dm:DataManager = DataManager.getInstance();
        private var prop:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function Moyintuce()
        {
            mx_internal::_document = this;
            this.width = 730;
            this.height = 500;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            Moyintuce._watcherSetupUtil = _arg_1;
        }


        public function set suitName1(_arg_1:Label):void
        {
            var _local_2:Object = this._1853834247suitName1;
            if (_local_2 !== _arg_1)
            {
                this._1853834247suitName1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "suitName1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mytcbg2():Image
        {
            return (this._1527955858mytcbg2);
        }

        public function set pprice(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._981567783pprice;
            if (_local_2 !== _arg_1)
            {
                this._981567783pprice = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pprice", _local_2, _arg_1));
            };
        }

        public function __buyYL_click(_arg_1:MouseEvent):void
        {
            buyYanliao();
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_1():RoundedLabel
        {
            return (this._468962292EMTotalPropLbl1_1);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevPropText0():Canvas
        {
            return (this._1070599158nextLevPropText0);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_4():RoundedLabel
        {
            return (this._468962289EMTotalPropLbl1_4);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_7():RoundedLabel
        {
            return (this._468962286EMTotalPropLbl1_7);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_8():RoundedLabel
        {
            return (this._468962285EMTotalPropLbl1_8);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_9():RoundedLabel
        {
            return (this._468962284EMTotalPropLbl1_9);
        }

        private function _Moyintuce_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Moyintuce_BasicTitleCanvas1.text = _arg_1;
            }, "_Moyintuce_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003342));
            }, function (_arg_1:Object):void
            {
                mytcbg.source = _arg_1;
            }, "mytcbg.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Moyintuce_LinkButton1.label = _arg_1;
            }, "_Moyintuce_LinkButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn3.label = _arg_1;
            }, "bangBtn3.label");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003701));
            }, function (_arg_1:Object):void
            {
                mytcbg2.source = _arg_1;
            }, "mytcbg2.source");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buyLimitLabel.text = _arg_1;
            }, "buyLimitLabel.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buyYL.label = _arg_1;
            }, "buyYL.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Moyintuce_RoundedLabel4.text = _arg_1;
            }, "_Moyintuce_RoundedLabel4.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_1.text = _arg_1;
            }, "EMTotalPropLbl1_1.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_4.text = _arg_1;
            }, "EMTotalPropLbl1_4.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_5.text = _arg_1;
            }, "EMTotalPropLbl1_5.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_6.text = _arg_1;
            }, "EMTotalPropLbl1_6.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_7.text = _arg_1;
            }, "EMTotalPropLbl1_7.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_11.text = _arg_1;
            }, "EMTotalPropLbl1_11.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_13.text = _arg_1;
            }, "EMTotalPropLbl1_13.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_31.text = _arg_1;
            }, "EMTotalPropLbl1_31.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_8.text = _arg_1;
            }, "EMTotalPropLbl1_8.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_9.text = _arg_1;
            }, "EMTotalPropLbl1_9.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_14.text = _arg_1;
            }, "EMTotalPropLbl1_14.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_61.text = _arg_1;
            }, "EMTotalPropLbl1_61.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_32.text = _arg_1;
            }, "EMTotalPropLbl1_32.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_58.text = _arg_1;
            }, "EMTotalPropLbl1_58.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_34.text = _arg_1;
            }, "EMTotalPropLbl1_34.text");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                EMTotalPropLbl1_72.text = _arg_1;
            }, "EMTotalPropLbl1_72.text");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003700));
            }, function (_arg_1:Object):void
            {
                mytc3bg.source = _arg_1;
            }, "mytc3bg.source");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                suitName1.filters = _arg_1;
            }, "suitName1.filters");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Moyintuce_Label2.text = _arg_1;
            }, "_Moyintuce_Label2.text");
            result[29] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _Moyintuce_Label2.filters = _arg_1;
            }, "_Moyintuce_Label2.filters");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ename1.filters = _arg_1;
            }, "ename1.filters");
            result[31] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ename2.filters = _arg_1;
            }, "ename2.filters");
            result[32] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ename3.filters = _arg_1;
            }, "ename3.filters");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                etip1.filters = _arg_1;
            }, "etip1.filters");
            result[34] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                etip2.filters = _arg_1;
            }, "etip2.filters");
            result[35] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                etip3.filters = _arg_1;
            }, "etip3.filters");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                activeBtn.label = _arg_1;
            }, "activeBtn.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_1.text = _arg_1;
            }, "dprop1_1.text");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_4.text = _arg_1;
            }, "dprop1_4.text");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_5.text = _arg_1;
            }, "dprop1_5.text");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_6.text = _arg_1;
            }, "dprop1_6.text");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_7.text = _arg_1;
            }, "dprop1_7.text");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_11.text = _arg_1;
            }, "dprop1_11.text");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_13.text = _arg_1;
            }, "dprop1_13.text");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_31.text = _arg_1;
            }, "dprop1_31.text");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_8.text = _arg_1;
            }, "dprop1_8.text");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_9.text = _arg_1;
            }, "dprop1_9.text");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_14.text = _arg_1;
            }, "dprop1_14.text");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_61.text = _arg_1;
            }, "dprop1_61.text");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_32.text = _arg_1;
            }, "dprop1_32.text");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_58.text = _arg_1;
            }, "dprop1_58.text");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_34.text = _arg_1;
            }, "dprop1_34.text");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop1_72.text = _arg_1;
            }, "dprop1_72.text");
            result[53] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                detailInfo0.filters = _arg_1;
            }, "detailInfo0.filters");
            result[54] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                suitName2.filters = _arg_1;
            }, "suitName2.filters");
            result[55] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _Moyintuce_Label11.filters = _arg_1;
            }, "_Moyintuce_Label11.filters");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_1.text = _arg_1;
            }, "dprop2_1.text");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_4.text = _arg_1;
            }, "dprop2_4.text");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_5.text = _arg_1;
            }, "dprop2_5.text");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_6.text = _arg_1;
            }, "dprop2_6.text");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_7.text = _arg_1;
            }, "dprop2_7.text");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_11.text = _arg_1;
            }, "dprop2_11.text");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_13.text = _arg_1;
            }, "dprop2_13.text");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_31.text = _arg_1;
            }, "dprop2_31.text");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_8.text = _arg_1;
            }, "dprop2_8.text");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_9.text = _arg_1;
            }, "dprop2_9.text");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_14.text = _arg_1;
            }, "dprop2_14.text");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_61.text = _arg_1;
            }, "dprop2_61.text");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_32.text = _arg_1;
            }, "dprop2_32.text");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_58.text = _arg_1;
            }, "dprop2_58.text");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_34.text = _arg_1;
            }, "dprop2_34.text");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MYTC_PROP[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                dprop2_72.text = _arg_1;
            }, "dprop2_72.text");
            result[72] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                detailInfo.filters = _arg_1;
            }, "detailInfo.filters");
            result[73] = binding;
            return (result);
        }

        public function set EMTotalPropLbl1_1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962292EMTotalPropLbl1_1;
            if (_local_2 !== _arg_1)
            {
                this._468962292EMTotalPropLbl1_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get suitName2():Label
        {
            return (this._1853834246suitName2);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_5():RoundedLabel
        {
            return (this._468962288EMTotalPropLbl1_5);
        }

        public function set EMTotalPropLbl1_4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962289EMTotalPropLbl1_4;
            if (_local_2 !== _arg_1)
            {
                this._468962289EMTotalPropLbl1_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_4", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962285EMTotalPropLbl1_8;
            if (_local_2 !== _arg_1)
            {
                this._468962285EMTotalPropLbl1_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_58():RoundedLabel
        {
            return (this._1652928984EMTotalPropLbl1_58);
        }

        public function set EMTotalPropLbl1_7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962286EMTotalPropLbl1_7;
            if (_local_2 !== _arg_1)
            {
                this._468962286EMTotalPropLbl1_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_7", _local_2, _arg_1));
            };
        }

        public function set pnum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3446038pnum;
            if (_local_2 !== _arg_1)
            {
                this._3446038pnum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pnum", _local_2, _arg_1));
            };
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

        public function set EMTotalPropLbl1_5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962288EMTotalPropLbl1_5;
            if (_local_2 !== _arg_1)
            {
                this._468962288EMTotalPropLbl1_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_5", _local_2, _arg_1));
            };
        }

        public function set mytcVS(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1059090152mytcVS;
            if (_local_2 !== _arg_1)
            {
                this._1059090152mytcVS = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mytcVS", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962287EMTotalPropLbl1_6;
            if (_local_2 !== _arg_1)
            {
                this._468962287EMTotalPropLbl1_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_6", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_9(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962284EMTotalPropLbl1_9;
            if (_local_2 !== _arg_1)
            {
                this._468962284EMTotalPropLbl1_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_9", _local_2, _arg_1));
            };
        }

        public function set buyYL(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._94109721buyYL;
            if (_local_2 !== _arg_1)
            {
                this._94109721buyYL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buyYL", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get buyYL():BasicGlowButton
        {
            return (this._94109721buyYL);
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_1():RoundedLabel
        {
            return (this._2121806787dprop2_1);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_6():RoundedLabel
        {
            return (this._468962287EMTotalPropLbl1_6);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_61():RoundedLabel
        {
            return (this._1652928960EMTotalPropLbl1_61);
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_5():RoundedLabel
        {
            return (this._2121806783dprop2_5);
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_6():RoundedLabel
        {
            return (this._2121806782dprop2_6);
        }

        public function set buyLimitLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1072548639buyLimitLabel;
            if (_local_2 !== _arg_1)
            {
                this._1072548639buyLimitLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buyLimitLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_4():RoundedLabel
        {
            return (this._2121806784dprop2_4);
        }

        public function onMYTCData(_arg_1:*):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:Array;
            var _local_11:Array;
            var _local_12:*;
            var _local_13:*;
            resetMYTCUi();
            flag = _arg_1;
            if ((((_arg_1) && (_arg_1.hasOwnProperty("tc"))) && (dp)))
            {
                prop = [];
                _local_2 = _arg_1.tc;
                for (_local_3 in dp)
                {
                    dp[_local_3].op = false;
                    dp[_local_3].lev = 0;
                    _local_5 = (int(_local_3) + 1);
                    if (_local_2[_local_5])
                    {
                        _local_6 = int(_local_2[_local_5]);
                        if (((dp[_local_3]) && (dp[_local_3].tid == _local_5)))
                        {
                            _local_7 = dp[_local_3];
                            _local_7.op = true;
                            _local_7.lev = _local_6;
                            if (((_local_7.detail) && (_local_7.detail[_local_6])))
                            {
                                _local_8 = _core.player.classId;
                                _local_9 = _local_7.detail[_local_6][("c" + _local_8)];
                                _local_10 = _local_9.split("|");
                                for (_local_4 in _local_10)
                                {
                                    _local_11 = _local_10[_local_4].split(":");
                                    _local_12 = int(_local_11[0]);
                                    _local_13 = Number(_local_11[1]);
                                    if (((_local_12 > 0) && (_local_13 > 0)))
                                    {
                                        if (prop[_local_12] > 0)
                                        {
                                            prop[_local_12] = (prop[_local_12] + _local_13);
                                        }
                                        else
                                        {
                                            prop[_local_12] = _local_13;
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                suitTree.dataProvider = dp;
                for (_local_4 in prop)
                {
                    if (prop[_local_4] > 0)
                    {
                        if (this[("EMTotalPropLbl1_" + _local_4)])
                        {
                            this[("EMTotalPropLbl1_" + _local_4)].text = ((Language.MYTC_PROP[_local_4] + ": ") + prop[_local_4]);
                        };
                    };
                };
            };
            switch (nowTab)
            {
                case 1:
                    if (((_arg_1) && (_arg_1.hasOwnProperty("lt"))))
                    {
                        if (_arg_1.lt <= 0)
                        {
                            buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", 0);
                        }
                        else
                        {
                            if (((_arg_1.lt > 0) && (_arg_1.lt <= 3)))
                            {
                                buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", _arg_1.lt);
                            };
                        };
                    };
                    return;
                case 2:
                    if (((_arg_1) && (_arg_1.hasOwnProperty("lt2"))))
                    {
                        if (_arg_1.lt2 <= 0)
                        {
                            buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", 0);
                        }
                        else
                        {
                            if (((_arg_1.lt2 > 0) && (_arg_1.lt2 <= 3)))
                            {
                                buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", _arg_1.lt2);
                            };
                        };
                    };
                    return;
                case 3:
                    if (((_arg_1) && (_arg_1.hasOwnProperty("lt3"))))
                    {
                        if (_arg_1.lt3 <= 0)
                        {
                            buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", 0);
                        }
                        else
                        {
                            if (((_arg_1.lt3 > 0) && (_arg_1.lt3 <= 1)))
                            {
                                buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", _arg_1.lt3);
                            };
                        };
                    };
                    return;
                case 4:
                    if (((_arg_1) && (_arg_1.hasOwnProperty("lt4"))))
                    {
                        if (_arg_1.lt4 <= 0)
                        {
                            buyLimitLabel.text = Language.MYTC_PANEL[22].replace("{buytime}", 0);
                        }
                        else
                        {
                            if (((_arg_1.lt4 > 0) && (_arg_1.lt4 <= 3)))
                            {
                                buyLimitLabel.text = Language.MYTC_PANEL[22].replace("{buytime}", _arg_1.lt4);
                            };
                        };
                    };
                    return;
            };
        }

        private function setDetailPropPanel(_arg_1:*, _arg_2:*):void
        {
            var _local_7:*;
            var _local_8:Array;
            var _local_9:*;
            var _local_10:*;
            if (((_arg_1 <= 0) || (_arg_1 > 10)))
            {
                return;
            };
            nowPage1 = _arg_1;
            var _local_3:* = [];
            var _local_4:* = _core.player.classId;
            var _local_5:* = _arg_2[_arg_1][("c" + _local_4)];
            var _local_6:Array = _local_5.split("|");
            for (_local_7 in _local_6)
            {
                _local_8 = _local_6[_local_7].split(":");
                _local_9 = int(_local_8[0]);
                _local_10 = Number(_local_8[1]);
                if (((_local_9 > 0) && (_local_10 > 0)))
                {
                    if (_local_3[_local_9] > 0)
                    {
                        _local_3[_local_9] = (_local_3[_local_9] + _local_10);
                    }
                    else
                    {
                        _local_3[_local_9] = _local_10;
                    };
                };
            };
            dprop1_1.text = (Language.MYTC_PROP[1] + ": 0");
            dprop1_4.text = (Language.MYTC_PROP[4] + ": 0");
            dprop1_5.text = (Language.MYTC_PROP[5] + ": 0");
            dprop1_6.text = (Language.MYTC_PROP[6] + ": 0");
            dprop1_7.text = (Language.MYTC_PROP[7] + ": 0");
            dprop1_11.text = (Language.MYTC_PROP[11] + ": 0");
            dprop1_13.text = (Language.MYTC_PROP[13] + ": 0");
            dprop1_31.text = (Language.MYTC_PROP[31] + ": 0");
            dprop1_8.text = (Language.MYTC_PROP[8] + ": 0");
            dprop1_9.text = (Language.MYTC_PROP[9] + ": 0");
            dprop1_14.text = (Language.MYTC_PROP[14] + ": 0");
            dprop1_61.text = (Language.MYTC_PROP[61] + ": 0");
            dprop1_32.text = (Language.MYTC_PROP[32] + ": 0");
            dprop1_58.text = (Language.MYTC_PROP[58] + ": 0");
            dprop1_34.text = (Language.MYTC_PROP[34] + ": 0");
            dprop1_72.text = (Language.MYTC_PROP[72] + ": 0");
            for (_local_7 in _local_3)
            {
                if (_local_3[_local_7] > 0)
                {
                    if (this[("dprop1_" + _local_7)])
                    {
                        this[("dprop1_" + _local_7)].text = ((Language.MYTC_PROP[_local_7] + ": ") + _local_3[_local_7]);
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_72():RoundedLabel
        {
            return (this._1351500721dprop2_72);
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_8():RoundedLabel
        {
            return (this._2121806780dprop2_8);
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            bangSele(2);
        }

        public function set EMTotalPropLbl1_58(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652928984EMTotalPropLbl1_58;
            if (_local_2 !== _arg_1)
            {
                this._1652928984EMTotalPropLbl1_58 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_58", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_58():RoundedLabel
        {
            return (this._1351500777dprop2_58);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_72():RoundedLabel
        {
            return (this._1652928928EMTotalPropLbl1_72);
        }

        public function set dprop2_58(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500777dprop2_58;
            if (_local_2 !== _arg_1)
            {
                this._1351500777dprop2_58 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_58", _local_2, _arg_1));
            };
        }

        private function buyYanliao():void
        {
            var func:Function = function (closeEvent:CloseEvent):void
            {
                var bagPanel:BagPanel;
                var goldLockFlag:Boolean;
                var gfunc:Function;
                if (((closeEvent) && (closeEvent.detail == Alert.YES)))
                {
                    bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                    goldLockFlag = bagPanel.goldLockFlag;
                    if (((!(nowTab == 3)) && ((goldLockFlag) || (!(bagPanel)))))
                    {
                        _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                        gfunc = function (_arg_1:String):void
                        {
                            _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                        };
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                        return;
                    };
                    _core.remote.call("buyMYyanliao", null, _core.cid, nowTab);
                };
            };
            var str:String = nowTabText;
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        public function ___Moyintuce_Button3_click(_arg_1:MouseEvent):void
        {
            detailPreFunc(2);
        }

        public function set dprop1_13(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530697dprop1_13;
            if (_local_2 !== _arg_1)
            {
                this._1351530697dprop1_13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_13", _local_2, _arg_1));
            };
        }

        public function set dprop1_14(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530696dprop1_14;
            if (_local_2 !== _arg_1)
            {
                this._1351530696dprop1_14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_9():RoundedLabel
        {
            return (this._2121806779dprop2_9);
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_61():RoundedLabel
        {
            return (this._1351500753dprop2_61);
        }

        [Bindable(event="propertyChange")]
        public function get suitTree():List
        {
            return (this._1860721589suitTree);
        }

        public function set dprop2_1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121806787dprop2_1;
            if (_local_2 !== _arg_1)
            {
                this._2121806787dprop2_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_1():RoundedLabel
        {
            return (this._2121807748dprop1_1);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_4():RoundedLabel
        {
            return (this._2121807745dprop1_4);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_6():RoundedLabel
        {
            return (this._2121807743dprop1_6);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_8():RoundedLabel
        {
            return (this._2121807741dprop1_8);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_9():RoundedLabel
        {
            return (this._2121807740dprop1_9);
        }

        private function detailPreFunc(_arg_1:*):void
        {
            var _local_2:* = suitTree.selectedItem;
            if (_local_2)
            {
                if (_arg_1 == 1)
                {
                    if (nowPage1 <= 1)
                    {
                        return;
                    };
                    setDetailPropPanel(--nowPage1, _local_2.detail);
                    detailInfo0.text = Language.MYTC_PANEL[6].replace("{num}", nowPage1);
                };
                if (_arg_1 == 2)
                {
                    if (nowPage2 <= 1)
                    {
                        return;
                    };
                    setDetailPropPanel2(--nowPage2, _local_2.detail);
                    detailInfo.text = Language.MYTC_PANEL[6].replace("{num}", nowPage2);
                    if (_local_2.lev)
                    {
                        if (nowPage2 == _local_2.lev)
                        {
                            detailInfo.text = (detailInfo.text + Language.MYTC_PANEL[15]);
                        };
                    };
                };
            };
        }

        public function set EMTotalPropLbl1_61(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652928960EMTotalPropLbl1_61;
            if (_local_2 !== _arg_1)
            {
                this._1652928960EMTotalPropLbl1_61 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_61", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_7():RoundedLabel
        {
            return (this._2121807742dprop1_7);
        }

        public function set dprop2_9(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121806779dprop2_9;
            if (_local_2 !== _arg_1)
            {
                this._2121806779dprop2_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_9", _local_2, _arg_1));
            };
        }

        public function set dprop2_6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121806782dprop2_6;
            if (_local_2 !== _arg_1)
            {
                this._2121806782dprop2_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_6", _local_2, _arg_1));
            };
        }

        public function set dprop2_7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121806781dprop2_7;
            if (_local_2 !== _arg_1)
            {
                this._2121806781dprop2_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_5():RoundedLabel
        {
            return (this._2121807744dprop1_5);
        }

        public function set dprop2_5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121806783dprop2_5;
            if (_local_2 !== _arg_1)
            {
                this._2121806783dprop2_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_5", _local_2, _arg_1));
            };
        }

        public function set es1(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object = this._100675es1;
            if (_local_2 !== _arg_1)
            {
                this._100675es1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "es1", _local_2, _arg_1));
            };
        }

        public function set suitTree(_arg_1:List):void
        {
            var _local_2:Object = this._1860721589suitTree;
            if (_local_2 !== _arg_1)
            {
                this._1860721589suitTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "suitTree", _local_2, _arg_1));
            };
        }

        public function set dprop1_11(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530699dprop1_11;
            if (_local_2 !== _arg_1)
            {
                this._1351530699dprop1_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get detailInfo():Label
        {
            return (this._1036623713detailInfo);
        }

        public function set dprop2_8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121806780dprop2_8;
            if (_local_2 !== _arg_1)
            {
                this._2121806780dprop2_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_8", _local_2, _arg_1));
            };
        }

        public function set dprop2_4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121806784dprop2_4;
            if (_local_2 !== _arg_1)
            {
                this._2121806784dprop2_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_4", _local_2, _arg_1));
            };
        }

        public function set dprop2_72(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500721dprop2_72;
            if (_local_2 !== _arg_1)
            {
                this._1351500721dprop2_72 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_72", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_7():RoundedLabel
        {
            return (this._2121806781dprop2_7);
        }

        [Bindable(event="propertyChange")]
        public function get mytcbg():Image
        {
            return (this._1059089760mytcbg);
        }

        public function set es3(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object = this._100677es3;
            if (_local_2 !== _arg_1)
            {
                this._100677es3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "es3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mytc3bg():Image
        {
            return (this._1527910589mytc3bg);
        }

        public function set EMTotalPropLbl1_72(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652928928EMTotalPropLbl1_72;
            if (_local_2 !== _arg_1)
            {
                this._1652928928EMTotalPropLbl1_72 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_72", _local_2, _arg_1));
            };
        }

        public function set dprop2_61(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500753dprop2_61;
            if (_local_2 !== _arg_1)
            {
                this._1351500753dprop2_61 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_61", _local_2, _arg_1));
            };
        }

        public function set es2(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object = this._100676es2;
            if (_local_2 !== _arg_1)
            {
                this._100676es2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "es2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pprice():RoundedLabel
        {
            return (this._981567783pprice);
        }

        [Bindable(event="propertyChange")]
        public function get etip1():Label
        {
            return (this._96835803etip1);
        }

        [Bindable(event="propertyChange")]
        public function get etip2():Label
        {
            return (this._96835804etip2);
        }

        public function list_itemClickHandler():void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_1:* = suitTree.selectedItem;
            if (((_local_1.hasOwnProperty("m1")) && (_local_1.m1 == 0)))
            {
                mytcVS.selectedIndex = 2;
                return;
            };
            if ((((_local_1) && (_local_1.hasOwnProperty("op"))) && (_local_1.op == false)))
            {
                mytcVS.selectedIndex = 0;
                if (((_local_1.hasOwnProperty("m1")) && (_local_1.m1 > 0)))
                {
                    _local_3 = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][int(_local_1.m1)];
                    es1.giid = _local_3.id;
                    es1.type = GamePredef.TBL_EQUIPT_TEMPLATE;
                    es1.stackNum = 1;
                    ename1.text = _local_3.name;
                    es1.enabled = false;
                    etip1.text = Language.MYTC_PANEL[13];
                };
                if (((_local_1.hasOwnProperty("m2")) && (_local_1.m2 > 0)))
                {
                    _local_4 = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][int(_local_1.m2)];
                    es2.giid = _local_4.id;
                    es2.type = GamePredef.TBL_EQUIPT_TEMPLATE;
                    es2.stackNum = 1;
                    ename2.text = _local_4.name;
                    es2.enabled = false;
                    etip2.text = Language.MYTC_PANEL[13];
                };
                if (((_local_1.hasOwnProperty("m3")) && (_local_1.m3 > 0)))
                {
                    _local_5 = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][int(_local_1.m3)];
                    es3.giid = _local_5.id;
                    es3.type = GamePredef.TBL_EQUIPT_TEMPLATE;
                    es3.stackNum = 1;
                    ename3.text = _local_5.name;
                    es3.enabled = false;
                    etip3.text = Language.MYTC_PANEL[13];
                };
                suitName1.text = _local_1.name;
                _local_2 = (GamePredef.SLOT_SID_BAG[0] + 1);
                while (_local_2 <= GamePredef.SLOT_SID_BAG[7])
                {
                    _local_6 = _core.data.getSlot({"sid":_local_2});
                    if (((_local_6) && (_local_6.type == GamePredef.TBL_EQUIPT_INSTANCE)))
                    {
                        _local_7 = _core.data.getData(GamePredef.TBL_EQUIPT_INSTANCE, _local_6.itemId);
                        _local_8 = _local_7.tid;
                        if (_local_8 == _local_3.id)
                        {
                            es1.enabled = true;
                            etip1.text = Language.MYTC_PANEL[14];
                        };
                        if (_local_8 == _local_4.id)
                        {
                            es2.enabled = true;
                            etip2.text = Language.MYTC_PANEL[14];
                        };
                        if (_local_8 == _local_5.id)
                        {
                            es3.enabled = true;
                            etip3.text = Language.MYTC_PANEL[14];
                        };
                    };
                    _local_2++;
                };
                setDetailPropPanel(1, _local_1.detail);
                detailInfo0.text = Language.MYTC_PANEL[6].replace("{num}", 1);
            }
            else
            {
                if ((((_local_1) && (_local_1.hasOwnProperty("op"))) && (_local_1.op == true)))
                {
                    levUps.giid = 6874;
                    levUps.type = GamePredef.TBL_ITEM_TEMPLATE;
                    _local_9 = int(_local_1.lev);
                    if (((_local_9 >= 1) && (_local_9 < 10)))
                    {
                        _local_10 = _local_1.detail[(_local_9 + 1)].cost;
                        levUps.stackNum = _local_10;
                        levUpBtn.enabled = true;
                    }
                    else
                    {
                        if (_local_9 >= 10)
                        {
                            levUpBtn.enabled = false;
                            levUps.stackNum = 0;
                        }
                        else
                        {
                            return;
                        };
                    };
                    mytcVS.selectedIndex = 1;
                    suitName2.text = (((_local_1.name + "lv. [") + _local_9) + "] ");
                    setDetailPropPanel2(_local_9, _local_1.detail);
                    detailInfo.text = Language.MYTC_PANEL[6].replace("{num}", _local_9);
                    if (_local_1.lev)
                    {
                        detailInfo.text = (detailInfo.text + Language.MYTC_PANEL[15]);
                    };
                }
                else
                {
                    mytcVS.selectedIndex = 2;
                };
            };
        }

        public function set detailInfo0(_arg_1:Label):void
        {
            var _local_2:Object = this._2070563983detailInfo0;
            if (_local_2 !== _arg_1)
            {
                this._2070563983detailInfo0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "detailInfo0", _local_2, _arg_1));
            };
        }

        public function __bangBtn3_click(_arg_1:MouseEvent):void
        {
            bangSele(4);
        }

        public function set dprop1_32(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530636dprop1_32;
            if (_local_2 !== _arg_1)
            {
                this._1351530636dprop1_32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_32", _local_2, _arg_1));
            };
        }

        private function levelUpSuit():void
        {
            var item:* = undefined;
            item = suitTree.selectedItem;
            if (item == null)
            {
                return;
            };
            if (item.lev >= 10)
            {
                Alert.show(Language.MYTC_PANEL[16]);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("updateMYTCItem", null, item.tid);
                };
            };
            Alert.show(Language.MYTC_PANEL[5].replace("{num1}", item.detail[(item.lev + 1)].cost), null, (Alert.YES | Alert.NO), null, func);
        }

        public function set dprop1_31(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530637dprop1_31;
            if (_local_2 !== _arg_1)
            {
                this._1351530637dprop1_31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_31", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get etip3():Label
        {
            return (this._96835805etip3);
        }

        public function set dprop1_1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121807748dprop1_1;
            if (_local_2 !== _arg_1)
            {
                this._2121807748dprop1_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_1", _local_2, _arg_1));
            };
        }

        public function set dprop1_4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121807745dprop1_4;
            if (_local_2 !== _arg_1)
            {
                this._2121807745dprop1_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_4", _local_2, _arg_1));
            };
        }

        public function set dprop1_6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121807743dprop1_6;
            if (_local_2 !== _arg_1)
            {
                this._2121807743dprop1_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_6", _local_2, _arg_1));
            };
        }

        public function set activeBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._204464502activeBtn;
            if (_local_2 !== _arg_1)
            {
                this._204464502activeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeBtn", _local_2, _arg_1));
            };
        }

        public function set dprop1_8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121807741dprop1_8;
            if (_local_2 !== _arg_1)
            {
                this._2121807741dprop1_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_8", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function set dprop1_9(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121807740dprop1_9;
            if (_local_2 !== _arg_1)
            {
                this._2121807740dprop1_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_9", _local_2, _arg_1));
            };
        }

        public function ___Moyintuce_Button2_click(_arg_1:MouseEvent):void
        {
            detailNextFunc(1);
        }

        public function set dprop1_7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121807742dprop1_7;
            if (_local_2 !== _arg_1)
            {
                this._2121807742dprop1_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_7", _local_2, _arg_1));
            };
        }

        public function __levUpBtn_click(_arg_1:MouseEvent):void
        {
            levelUpSuit();
        }

        public function set dprop1_34(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530634dprop1_34;
            if (_local_2 !== _arg_1)
            {
                this._1351530634dprop1_34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_34", _local_2, _arg_1));
            };
        }

        public function set dprop1_5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2121807744dprop1_5;
            if (_local_2 !== _arg_1)
            {
                this._2121807744dprop1_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_5", _local_2, _arg_1));
            };
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            bangSele(1);
        }

        public function set nextLevPropText(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1212390534nextLevPropText;
            if (_local_2 !== _arg_1)
            {
                this._1212390534nextLevPropText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevPropText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pnum():RoundedLabel
        {
            return (this._3446038pnum);
        }

        private function resetMYTCUi():void
        {
            suitTree.dataProvider = null;
            mytcVS.selectedIndex = 2;
            EMTotalPropLbl1_1.text = (Language.MYTC_PROP[1] + ": 0");
            EMTotalPropLbl1_4.text = (Language.MYTC_PROP[4] + ": 0");
            EMTotalPropLbl1_5.text = (Language.MYTC_PROP[5] + ": 0");
            EMTotalPropLbl1_6.text = (Language.MYTC_PROP[6] + ": 0");
            EMTotalPropLbl1_7.text = (Language.MYTC_PROP[7] + ": 0");
            EMTotalPropLbl1_11.text = (Language.MYTC_PROP[11] + ": 0");
            EMTotalPropLbl1_13.text = (Language.MYTC_PROP[13] + ": 0");
            EMTotalPropLbl1_31.text = (Language.MYTC_PROP[31] + ": 0");
            EMTotalPropLbl1_8.text = (Language.MYTC_PROP[8] + ": 0");
            EMTotalPropLbl1_9.text = (Language.MYTC_PROP[9] + ": 0");
            EMTotalPropLbl1_14.text = (Language.MYTC_PROP[14] + ": 0");
            EMTotalPropLbl1_61.text = (Language.MYTC_PROP[61] + ": 0");
            EMTotalPropLbl1_32.text = (Language.MYTC_PROP[32] + ": 0");
            EMTotalPropLbl1_58.text = (Language.MYTC_PROP[58] + ": 0");
            EMTotalPropLbl1_34.text = (Language.MYTC_PROP[34] + ": 0");
            EMTotalPropLbl1_72.text = (Language.MYTC_PROP[72] + ": 0");
        }

        [Bindable(event="propertyChange")]
        public function get buyLimitLabel():RoundedLabel
        {
            return (this._1072548639buyLimitLabel);
        }

        public function __suitTree_itemClick(_arg_1:ListEvent):void
        {
            list_itemClickHandler();
        }

        public function set yanliaoslot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._694585521yanliaoslot;
            if (_local_2 !== _arg_1)
            {
                this._694585521yanliaoslot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yanliaoslot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mytcVS():ViewStack
        {
            return (this._1059090152mytcVS);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_11():RoundedLabel
        {
            return (this._1351530699dprop1_11);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_13():RoundedLabel
        {
            return (this._1351530697dprop1_13);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_14():RoundedLabel
        {
            return (this._1351530696dprop1_14);
        }

        private function activeSuit():void
        {
            var item:* = undefined;
            var func:Function;
            item = suitTree.selectedItem;
            if (item == null)
            {
                return;
            };
            if ((((es1.enabled) && (es2.enabled)) && (es3.enabled)))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("activeMYTCItem", null, item.tid);
                    };
                };
                Alert.show(Language.MYTC_PANEL[17], null, (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                Alert.show(Language.MYTC_PANEL[8]);
            };
        }

        public function set dprop2_14(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500905dprop2_14;
            if (_local_2 !== _arg_1)
            {
                this._1351500905dprop2_14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_14", _local_2, _arg_1));
            };
        }

        public function set dprop2_11(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500908dprop2_11;
            if (_local_2 !== _arg_1)
            {
                this._1351500908dprop2_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get es1():ItemSlotEquFunc
        {
            return (this._100675es1);
        }

        private function _Moyintuce_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = Moyintuce_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set detailInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1036623713detailInfo;
            if (_local_2 !== _arg_1)
            {
                this._1036623713detailInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "detailInfo", _local_2, _arg_1));
            };
        }

        public function set mytcbg(_arg_1:Image):void
        {
            var _local_2:Object = this._1059089760mytcbg;
            if (_local_2 !== _arg_1)
            {
                this._1059089760mytcbg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mytcbg", _local_2, _arg_1));
            };
        }

        public function set levUpBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._2146310748levUpBtn;
            if (_local_2 !== _arg_1)
            {
                this._2146310748levUpBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levUpBtn", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_11(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929115EMTotalPropLbl1_11;
            if (_local_2 !== _arg_1)
            {
                this._1652929115EMTotalPropLbl1_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get es2():ItemSlotEquFunc
        {
            return (this._100676es2);
        }

        [Bindable(event="propertyChange")]
        public function get es3():ItemSlotEquFunc
        {
            return (this._100677es3);
        }

        [Bindable(event="propertyChange")]
        public function get yanliaoslot():ItemSlot
        {
            return (this._694585521yanliaoslot);
        }

        public function set EMTotalPropLbl1_14(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929112EMTotalPropLbl1_14;
            if (_local_2 !== _arg_1)
            {
                this._1652929112EMTotalPropLbl1_14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_14", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_13(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929113EMTotalPropLbl1_13;
            if (_local_2 !== _arg_1)
            {
                this._1652929113EMTotalPropLbl1_13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_13", _local_2, _arg_1));
            };
        }

        public function set dprop2_13(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500906dprop2_13;
            if (_local_2 !== _arg_1)
            {
                this._1351500906dprop2_13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_13", _local_2, _arg_1));
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

        public function set bangBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324756bangBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1863324756bangBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn0", _local_2, _arg_1));
            };
        }

        public function ___Moyintuce_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set dprop1_58(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530568dprop1_58;
            if (_local_2 !== _arg_1)
            {
                this._1351530568dprop1_58 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_58", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_32():RoundedLabel
        {
            return (this._1351530636dprop1_32);
        }

        [Bindable(event="propertyChange")]
        public function get detailInfo0():Label
        {
            return (this._2070563983detailInfo0);
        }

        public function set mytc3bg(_arg_1:Image):void
        {
            var _local_2:Object = this._1527910589mytc3bg;
            if (_local_2 !== _arg_1)
            {
                this._1527910589mytc3bg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mytc3bg", _local_2, _arg_1));
            };
        }

        public function set ename2(_arg_1:Label):void
        {
            var _local_2:Object = this._1298838078ename2;
            if (_local_2 !== _arg_1)
            {
                this._1298838078ename2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ename2", _local_2, _arg_1));
            };
        }

        public function set ename1(_arg_1:Label):void
        {
            var _local_2:Object = this._1298838079ename1;
            if (_local_2 !== _arg_1)
            {
                this._1298838079ename1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ename1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_31():RoundedLabel
        {
            return (this._1351530637dprop1_31);
        }

        public function set ename3(_arg_1:Label):void
        {
            var _local_2:Object = this._1298838077ename3;
            if (_local_2 !== _arg_1)
            {
                this._1298838077ename3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ename3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get activeBtn():BasicDelayButton
        {
            return (this._204464502activeBtn);
        }

        private function helpInfo():void
        {
            var _local_1:String = Language.MYTC_PANEL[1].toString();
            Alert.show(_local_1);
        }

        public function ___Moyintuce_Button4_click(_arg_1:MouseEvent):void
        {
            detailNextFunc(2);
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_11():RoundedLabel
        {
            return (this._1351500908dprop2_11);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevPropText():Canvas
        {
            return (this._1212390534nextLevPropText);
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            bangSele(3);
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

        private function setDetailPropPanel2(_arg_1:*, _arg_2:*):void
        {
            var _local_7:*;
            var _local_8:Array;
            var _local_9:*;
            var _local_10:*;
            if (((_arg_1 <= 0) || (_arg_1 > 10)))
            {
                return;
            };
            nowPage2 = _arg_1;
            var _local_3:* = [];
            var _local_4:* = _core.player.classId;
            var _local_5:* = _arg_2[_arg_1][("c" + _local_4)];
            var _local_6:Array = _local_5.split("|");
            for (_local_7 in _local_6)
            {
                _local_8 = _local_6[_local_7].split(":");
                _local_9 = int(_local_8[0]);
                _local_10 = Number(_local_8[1]);
                if (((_local_9 > 0) && (_local_10 > 0)))
                {
                    if (_local_3[_local_9] > 0)
                    {
                        _local_3[_local_9] = (_local_3[_local_9] + _local_10);
                    }
                    else
                    {
                        _local_3[_local_9] = _local_10;
                    };
                };
            };
            dprop2_1.text = (Language.MYTC_PROP[1] + ": 0");
            dprop2_4.text = (Language.MYTC_PROP[4] + ": 0");
            dprop2_5.text = (Language.MYTC_PROP[5] + ": 0");
            dprop2_6.text = (Language.MYTC_PROP[6] + ": 0");
            dprop2_7.text = (Language.MYTC_PROP[7] + ": 0");
            dprop2_11.text = (Language.MYTC_PROP[11] + ": 0");
            dprop2_13.text = (Language.MYTC_PROP[13] + ": 0");
            dprop2_31.text = (Language.MYTC_PROP[31] + ": 0");
            dprop2_8.text = (Language.MYTC_PROP[8] + ": 0");
            dprop2_9.text = (Language.MYTC_PROP[9] + ": 0");
            dprop2_14.text = (Language.MYTC_PROP[14] + ": 0");
            dprop2_61.text = (Language.MYTC_PROP[61] + ": 0");
            dprop2_32.text = (Language.MYTC_PROP[32] + ": 0");
            dprop2_58.text = (Language.MYTC_PROP[58] + ": 0");
            dprop2_34.text = (Language.MYTC_PROP[34] + ": 0");
            dprop2_72.text = (Language.MYTC_PROP[72] + ": 0");
            for (_local_7 in _local_3)
            {
                if (_local_3[_local_7] > 0)
                {
                    if (this[("dprop2_" + _local_7)])
                    {
                        this[("dprop2_" + _local_7)].text = ((Language.MYTC_PROP[_local_7] + ": ") + _local_3[_local_7]);
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_11():RoundedLabel
        {
            return (this._1652929115EMTotalPropLbl1_11);
        }

        public function __activeBtn_click(_arg_1:MouseEvent):void
        {
            activeSuit();
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_13():RoundedLabel
        {
            return (this._1652929113EMTotalPropLbl1_13);
        }

        override public function initialize():void
        {
            var target:Moyintuce;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _Moyintuce_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MoyintuceWatcherSetupUtil");
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

        public function set dprop2_31(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500846dprop2_31;
            if (_local_2 !== _arg_1)
            {
                this._1351500846dprop2_31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_31", _local_2, _arg_1));
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

        public function set dprop2_34(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500843dprop2_34;
            if (_local_2 !== _arg_1)
            {
                this._1351500843dprop2_34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_34", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levUpBtn():BasicDelayButton
        {
            return (this._2146310748levUpBtn);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_14():RoundedLabel
        {
            return (this._1652929112EMTotalPropLbl1_14);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_58():RoundedLabel
        {
            return (this._1351530568dprop1_58);
        }

        public function set etip3(_arg_1:Label):void
        {
            var _local_2:Object = this._96835805etip3;
            if (_local_2 !== _arg_1)
            {
                this._96835805etip3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "etip3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn2():BasicGlowButton
        {
            return (this._1863324754bangBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get ename1():Label
        {
            return (this._1298838079ename1);
        }

        public function set EMTotalPropLbl1_31(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929053EMTotalPropLbl1_31;
            if (_local_2 !== _arg_1)
            {
                this._1652929053EMTotalPropLbl1_31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_31", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn3():BasicGlowButton
        {
            return (this._1863324753bangBtn3);
        }

        private function detailNextFunc(_arg_1:*):void
        {
            var _local_2:* = suitTree.selectedItem;
            if (_local_2)
            {
                if (_arg_1 == 1)
                {
                    if (nowPage1 >= 10)
                    {
                        return;
                    };
                    setDetailPropPanel(++nowPage1, _local_2.detail);
                    detailInfo0.text = Language.MYTC_PANEL[6].replace("{num}", nowPage1);
                };
                if (_arg_1 == 2)
                {
                    if (nowPage2 >= 10)
                    {
                        return;
                    };
                    setDetailPropPanel2(++nowPage2, _local_2.detail);
                    detailInfo.text = Language.MYTC_PANEL[6].replace("{num}", nowPage2);
                    if (_local_2.lev)
                    {
                        if (nowPage2 == _local_2.lev)
                        {
                            detailInfo.text = (detailInfo.text + Language.MYTC_PANEL[15]);
                        };
                    };
                };
            };
        }

        public function ___Moyintuce_Button1_click(_arg_1:MouseEvent):void
        {
            detailPreFunc(1);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_34():RoundedLabel
        {
            return (this._1351530634dprop1_34);
        }

        public function set etip1(_arg_1:Label):void
        {
            var _local_2:Object = this._96835803etip1;
            if (_local_2 !== _arg_1)
            {
                this._96835803etip1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "etip1", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_32(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929052EMTotalPropLbl1_32;
            if (_local_2 !== _arg_1)
            {
                this._1652929052EMTotalPropLbl1_32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_32", _local_2, _arg_1));
            };
        }

        private function bangSele(_arg_1:*):void
        {
            nowTab = _arg_1;
            bangBtn0.selected = (bangBtn1.selected = (bangBtn2.selected = (bangBtn3.selected = false)));
            switch (_arg_1)
            {
                case 1:
                    pnum.text = Language.MYTC_PANEL[9].replace("{num}", 0xFF);
                    pprice.text = Language.MYTC_PANEL[10].replace("{type}", "Coin").replace("{price}", "1299");
                    buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", ((flag) ? flag.lt : "N/A"));
                    yanliaoslot.stackNum = 0xFF;
                    nowTabText = Language.MYTC_PANEL[12].replace("{type}", "Coin").replace("{price}", "1299").replace("{num}", 0xFF);
                    mytcbg2.source = ResManager.getIconUrl(4130220003701);
                    bangBtn0.selected = true;
                    return;
                case 2:
                    pnum.text = Language.MYTC_PANEL[9].replace("{num}", 10);
                    pprice.text = Language.MYTC_PANEL[10].replace("{type}", "Vàng").replace("{price}", "888");
                    buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", ((flag) ? flag.lt2 : "N/A"));
                    yanliaoslot.stackNum = 10;
                    nowTabText = Language.MYTC_PANEL[12].replace("{type}", "Vàng").replace("{price}", "888").replace("{num}", 10);
                    mytcbg2.source = ResManager.getIconUrl(4130220003702);
                    bangBtn1.selected = true;
                    return;
                case 3:
                    pnum.text = Language.MYTC_PANEL[9].replace("{num}", 10);
                    pprice.text = Language.MYTC_PANEL[10].replace("{type}", "Kim phiếu").replace("{price}", "1688");
                    buyLimitLabel.text = Language.MYTC_PANEL[11].replace("{buytime}", ((flag) ? flag.lt3 : "N/A"));
                    yanliaoslot.stackNum = 10;
                    nowTabText = Language.MYTC_PANEL[12].replace("{type}", "Kim phiếu").replace("{price}", "1688").replace("{num}", 10);
                    mytcbg2.source = ResManager.getIconUrl(4130220003703);
                    bangBtn2.selected = true;
                    return;
                case 4:
                    pnum.text = Language.MYTC_PANEL[9].replace("{num}", 10);
                    pprice.text = Language.MYTC_PANEL[10].replace("{type}", "Vàng").replace("{price}", "888");
                    buyLimitLabel.text = Language.MYTC_PANEL[22].replace("{buytime}", ((flag) ? flag.lt4 : "N/A"));
                    yanliaoslot.stackNum = 10;
                    nowTabText = Language.MYTC_PANEL[12].replace("{type}", "Vàng").replace("{price}", "888").replace("{num}", 10);
                    mytcbg2.source = ResManager.getIconUrl(4130220003704);
                    bangBtn3.selected = true;
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get ename2():Label
        {
            return (this._1298838078ename2);
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_31():RoundedLabel
        {
            return (this._1351500846dprop2_31);
        }

        public function __suitTree_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        override public function initView():void
        {
            var _local_1:ArrayCollection;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (((dp == null) || (!(_cid == _core.cid))))
            {
                _local_1 = new ArrayCollection();
                _local_2 = GameData.d[GamePredef.TBL_MYTC_SUIT];
                for (_local_3 in _local_2)
                {
                    _local_4 = _local_2[_local_3];
                    _local_5 = {};
                    _local_5.tid = _local_3;
                    _local_5.name = _local_4.name;
                    _local_5.m1 = _local_4.m1;
                    _local_5.m2 = _local_4.m2;
                    _local_5.m3 = _local_4.m3;
                    _local_5.op = false;
                    _local_5.lev = 0;
                    _local_6 = _core.data.gameDataIndex[GamePredef.TBL_MYTC_DETAIL][_local_3];
                    _local_7 = {};
                    for (_local_8 in _local_6)
                    {
                        if (_local_6[_local_8])
                        {
                            _local_7[_local_6[_local_8].lev] = _local_6[_local_8];
                        };
                    };
                    _local_5.detail = _local_7;
                    _local_1.addItemAt(_local_5, (_local_3 - 1));
                };
                dp = _local_1;
                _cid = _core.cid;
                yanliaoslot.type = GamePredef.TBL_ITEM_TEMPLATE;
                yanliaoslot.giid = 6874;
                yanliaoslot.enabled = true;
                yanliaoslot.acceptable = false;
                yanliaoslot.visible = true;
                yanliaoslot.stackNum = 0xFF;
            };
            bangSele(1);
            _core.remote.call("getMYTCDataView", null);
        }

        public function set levUps(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object = this._1106142757levUps;
            if (_local_2 !== _arg_1)
            {
                this._1106142757levUps = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levUps", _local_2, _arg_1));
            };
        }

        public function set dprop1_61(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530544dprop1_61;
            if (_local_2 !== _arg_1)
            {
                this._1351530544dprop1_61 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_61", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_34(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929050EMTotalPropLbl1_34;
            if (_local_2 !== _arg_1)
            {
                this._1652929050EMTotalPropLbl1_34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_34", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_13():RoundedLabel
        {
            return (this._1351500906dprop2_13);
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_14():RoundedLabel
        {
            return (this._1351500905dprop2_14);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_61():RoundedLabel
        {
            return (this._1351530544dprop1_61);
        }

        public function set dprop1_72(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351530512dprop1_72;
            if (_local_2 !== _arg_1)
            {
                this._1351530512dprop1_72 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop1_72", _local_2, _arg_1));
            };
        }

        public function set mytcbg2(_arg_1:Image):void
        {
            var _local_2:Object = this._1527955858mytcbg2;
            if (_local_2 !== _arg_1)
            {
                this._1527955858mytcbg2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mytcbg2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_31():RoundedLabel
        {
            return (this._1652929053EMTotalPropLbl1_31);
        }

        [Bindable(event="propertyChange")]
        public function get ename3():Label
        {
            return (this._1298838077ename3);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_34():RoundedLabel
        {
            return (this._1652929050EMTotalPropLbl1_34);
        }

        [Bindable(event="propertyChange")]
        public function get levUps():ItemSlotEquFunc
        {
            return (this._1106142757levUps);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_32():RoundedLabel
        {
            return (this._1652929052EMTotalPropLbl1_32);
        }

        [Bindable(event="propertyChange")]
        public function get dprop1_72():RoundedLabel
        {
            return (this._1351530512dprop1_72);
        }

        public function set etip2(_arg_1:Label):void
        {
            var _local_2:Object = this._96835804etip2;
            if (_local_2 !== _arg_1)
            {
                this._96835804etip2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "etip2", _local_2, _arg_1));
            };
        }

        public function set nextLevPropText0(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1070599158nextLevPropText0;
            if (_local_2 !== _arg_1)
            {
                this._1070599158nextLevPropText0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevPropText0", _local_2, _arg_1));
            };
        }

        public function set suitName2(_arg_1:Label):void
        {
            var _local_2:Object = this._1853834246suitName2;
            if (_local_2 !== _arg_1)
            {
                this._1853834246suitName2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "suitName2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_32():RoundedLabel
        {
            return (this._1351500845dprop2_32);
        }

        [Bindable(event="propertyChange")]
        public function get dprop2_34():RoundedLabel
        {
            return (this._1351500843dprop2_34);
        }

        private function _Moyintuce_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MYTC_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220003342);
            _local_1 = Language.PANEL_PETGUARD[19];
            _local_1 = Language.MYTC_PANEL[18];
            _local_1 = Language.MYTC_PANEL[19];
            _local_1 = Language.MYTC_PANEL[20];
            _local_1 = Language.MYTC_PANEL[21];
            _local_1 = ResManager.getIconUrl(4130220003701);
            _local_1 = Language.MYTC_PANEL[11];
            _local_1 = Language.ACTIVEPANEL_U[4];
            _local_1 = Language.WAR_SPRITE[3];
            _local_1 = Language.MYTC_PROP[1];
            _local_1 = Language.MYTC_PROP[4];
            _local_1 = Language.MYTC_PROP[5];
            _local_1 = Language.MYTC_PROP[6];
            _local_1 = Language.MYTC_PROP[7];
            _local_1 = Language.MYTC_PROP[11];
            _local_1 = Language.MYTC_PROP[13];
            _local_1 = Language.MYTC_PROP[31];
            _local_1 = Language.MYTC_PROP[8];
            _local_1 = Language.MYTC_PROP[9];
            _local_1 = Language.MYTC_PROP[14];
            _local_1 = Language.MYTC_PROP[61];
            _local_1 = Language.MYTC_PROP[32];
            _local_1 = Language.MYTC_PROP[58];
            _local_1 = Language.MYTC_PROP[34];
            _local_1 = Language.MYTC_PROP[72];
            _local_1 = ResManager.getIconUrl(4130220003700);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MYTC_PANEL[2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MYTC_PANEL[7];
            _local_1 = Language.MYTC_PROP[1];
            _local_1 = Language.MYTC_PROP[4];
            _local_1 = Language.MYTC_PROP[5];
            _local_1 = Language.MYTC_PROP[6];
            _local_1 = Language.MYTC_PROP[7];
            _local_1 = Language.MYTC_PROP[11];
            _local_1 = Language.MYTC_PROP[13];
            _local_1 = Language.MYTC_PROP[31];
            _local_1 = Language.MYTC_PROP[8];
            _local_1 = Language.MYTC_PROP[9];
            _local_1 = Language.MYTC_PROP[14];
            _local_1 = Language.MYTC_PROP[61];
            _local_1 = Language.MYTC_PROP[32];
            _local_1 = Language.MYTC_PROP[58];
            _local_1 = Language.MYTC_PROP[34];
            _local_1 = Language.MYTC_PROP[72];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MYTC_PROP[1];
            _local_1 = Language.MYTC_PROP[4];
            _local_1 = Language.MYTC_PROP[5];
            _local_1 = Language.MYTC_PROP[6];
            _local_1 = Language.MYTC_PROP[7];
            _local_1 = Language.MYTC_PROP[11];
            _local_1 = Language.MYTC_PROP[13];
            _local_1 = Language.MYTC_PROP[31];
            _local_1 = Language.MYTC_PROP[8];
            _local_1 = Language.MYTC_PROP[9];
            _local_1 = Language.MYTC_PROP[14];
            _local_1 = Language.MYTC_PROP[61];
            _local_1 = Language.MYTC_PROP[32];
            _local_1 = Language.MYTC_PROP[58];
            _local_1 = Language.MYTC_PROP[34];
            _local_1 = Language.MYTC_PROP[72];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get suitName1():Label
        {
            return (this._1853834247suitName1);
        }

        public function set dprop2_32(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1351500845dprop2_32;
            if (_local_2 !== _arg_1)
            {
                this._1351500845dprop2_32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dprop2_32", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

