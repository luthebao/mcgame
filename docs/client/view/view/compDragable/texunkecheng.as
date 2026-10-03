// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.texunkecheng

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.Property;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.HorizontalList;
    import mx.containers.ViewStack;
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.core.Repeater;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.binding.Binding;
    import mx.binding.RepeatableBinding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import flash.utils.getDefinitionByName;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.texunkechengRenderer;
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

    public class texunkecheng extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _604200637awdbtn1:BasicDelayButton;
        private var _659388225TXKCMainListDP:ArrayCollection;
        private var TXKC_DAILY_EXP:String = "120";
        private var _2129980119txkcProgress:Property;
        public var _texunkecheng_Label4:Array;
        public var _texunkecheng_Label5:Array;
        public var _texunkecheng_Label6:Array;
        public var _texunkecheng_Label7:Array;
        private var _859449964pageTab2:HButtonTab;
        private var _604200636awdbtn2:BasicDelayButton;
        private var TXKC_OPEN_SPECICAL_COURSE_POINT:String = "680";
        private var _1235462880nextslot1:ItemSlot;
        private var TXKC_GET_COURSE_EXP:String = "500";
        private var _1010580374openDd:BasicDelayButton;
        private var _2067054470shopBtn:BasicDelayButton;
        private var _1875198329TXKCWeeklyListDP:ArrayCollection;
        private var _8673801mainList:HorizontalList;
        private var TXKC_BUY_COURSE_EXP_GOLD:String = "300";
        private var _1235462881nextslot2:ItemSlot;
        private var _803559802pageTab:HButtonTab;
        private var _1279336615TXKCDailyListDP:ArrayCollection;
        private var TXKC_WEEKLY_EXP:String = "280";
        public var _texunkecheng_BasicDelayButton3:Array;
        public var _texunkecheng_BasicDelayButton5:Array;
        public var _texunkecheng_ViewStack1:ViewStack;
        public var _texunkecheng_ViewStack2:ViewStack;
        private var _1337235734ddOpen:Canvas;
        public var _texunkecheng_Image1:Image;
        public var _texunkecheng_Image2:Image;
        public var _texunkecheng_Image3:Image;
        public var _texunkecheng_Image4:Array;
        public var _texunkecheng_Image5:Image;
        private var _113145rpw:Repeater;
        private var TXKC_DAILY_SP_EXP:String = "150";
        public var _texunkecheng_BasicTitleCanvas1:BasicTitleCanvas;
        private var _769790454txkcProgressText:Label;
        public var _texunkecheng_Tile1:Tile;
        public var _texunkecheng_Tile2:Tile;
        private var _2090394679LevLable:Label;
        private var _697734307remainDaysLable:Label;
        private var _582333572introtxt:IntroText;
        private var _113126rpd:Repeater;
        private var _547663022buyAdvCourseOrEXP:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":839,
                    "height":585,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_texunkecheng_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "height":553,
                                "width":836,
                                "x":1,
                                "y":32,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_texunkecheng_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "x":0,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"introtxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "15";
                                        this.top = "16";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "width":588,
                                            "height":119
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"LevLable",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "147";
                                        this.left = "15";
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"Lv 20"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"remainDaysLable",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "170";
                                        this.left = "15";
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"Số ngày còn lại:"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"txkcProgress",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "100";
                                        this.top = "151";
                                        this.right = "365";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":13,
                                            "styleName":"ProgressExp",
                                            "color":0xFFFFFF,
                                            "m":500,
                                            "v":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txkcProgressText",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "146";
                                        this.left = "245";
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"na/na"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_texunkecheng_Image2",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "37";
                                        this.top = "16";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":167,
                                            "height":183
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"buyAdvCourseOrEXP",
                                    "events":{"click":"__buyAdvCourseOrEXP_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "143";
                                        this.right = "233";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":110,
                                            "height":32
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HButtonTab,
                                    "id":"pageTab",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "28";
                                        this.top = "203";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selectedIndex":0,
                                            "tabWidth":150,
                                            "tabHeight":26,
                                            "width":473,
                                            "height":27
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "mouseEnabled":false,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "width":806,
                                            "height":315,
                                            "y":228,
                                            "x":15,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"_texunkecheng_ViewStack1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.top = "0";
                                                    this.right = "0";
                                                    this.bottom = "0";
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
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "x":0,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_texunkecheng_Image3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":0,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HorizontalList,
                                                                        "id":"mainList",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.backgroundAlpha = 0;
                                                                            this.top = "66";
                                                                            this.left = "107";
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "selectable":false,
                                                                                "width":560,
                                                                                "height":180,
                                                                                "itemRenderer":_texunkecheng_ClassFactory1_c()
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"awdbtn1",
                                                                        "events":{"click":"__awdbtn1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "10";
                                                                            this.left = "187";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":2000,
                                                                                "styleName":"BtnNormalBlue",
                                                                                "width":140,
                                                                                "height":30
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"awdbtn2",
                                                                        "events":{"click":"__awdbtn2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":2000,
                                                                                "styleName":"BtnNormalBlue",
                                                                                "width":160,
                                                                                "height":30
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"nextslot2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":717,
                                                                                "y":89,
                                                                                "width":32,
                                                                                "height":32,
                                                                                "acceptable":false,
                                                                                "type":29,
                                                                                "movable":false,
                                                                                "showStackNum":true
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"nextslot1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":717,
                                                                                "y":192,
                                                                                "width":32,
                                                                                "height":32,
                                                                                "acceptable":false,
                                                                                "type":29,
                                                                                "movable":false,
                                                                                "showStackNum":true
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
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "x":0,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":HButtonTab,
                                                                        "id":"pageTab2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "23";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "selectedIndex":0,
                                                                                "tabWidth":120,
                                                                                "tabHeight":26,
                                                                                "width":300,
                                                                                "height":27,
                                                                                "y":5
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "32";
                                                                            this.right = "10";
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"CanvasBorder",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":ViewStack,
                                                                                    "id":"_texunkecheng_ViewStack2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "5";
                                                                                        this.top = "5";
                                                                                        this.right = "5";
                                                                                        this.bottom = "5";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "percentWidth":100,
                                                                                            "percentHeight":100,
                                                                                            "creationPolicy":"all",
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Canvas,
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "0";
                                                                                                    this.top = "0";
                                                                                                    this.right = "0";
                                                                                                    this.bottom = "0";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "horizontalScrollPolicy":"off",
                                                                                                        "verticalScrollPolicy":"off",
                                                                                                        "childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":Tile,
                                                                                                            "id":"_texunkecheng_Tile1",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "y":0,
                                                                                                                    "percentWidth":100,
                                                                                                                    "percentHeight":100,
                                                                                                                    "x":0,
                                                                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                                                                        "type":Repeater,
                                                                                                                        "id":"rpd",
                                                                                                                        "propertiesFactory":function ():Object
                                                                                                                        {
                                                                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                                                    "type":Canvas,
                                                                                                                                    "stylesFactory":function ():void
                                                                                                                                    {
                                                                                                                                        this.left = "10";
                                                                                                                                        this.top = "10";
                                                                                                                                    },
                                                                                                                                    "propertiesFactory":function ():Object
                                                                                                                                    {
                                                                                                                                        return ({
                                                                                                                                            "styleName":"CanvasBorder",
                                                                                                                                            "mouseEnabled":false,
                                                                                                                                            "height":94,
                                                                                                                                            "width":365,
                                                                                                                                            "horizontalScrollPolicy":"off",
                                                                                                                                            "verticalScrollPolicy":"off",
                                                                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                                                                "type":Image,
                                                                                                                                                "id":"_texunkecheng_Image4",
                                                                                                                                                "propertiesFactory":function ():Object
                                                                                                                                                {
                                                                                                                                                    return ({
                                                                                                                                                        "x":0,
                                                                                                                                                        "y":0
                                                                                                                                                    });
                                                                                                                                                }
                                                                                                                                            }), new UIComponentDescriptor({
                                                                                                                                                "type":Label,
                                                                                                                                                "id":"_texunkecheng_Label4",
                                                                                                                                                "stylesFactory":function ():void
                                                                                                                                                {
                                                                                                                                                    this.color = 0xFFFFFF;
                                                                                                                                                    this.fontWeight = "bold";
                                                                                                                                                    this.fontSize = 16;
                                                                                                                                                },
                                                                                                                                                "propertiesFactory":function ():Object
                                                                                                                                                {
                                                                                                                                                    return ({
                                                                                                                                                        "x":10,
                                                                                                                                                        "y":22
                                                                                                                                                    });
                                                                                                                                                }
                                                                                                                                            }), new UIComponentDescriptor({
                                                                                                                                                "type":Label,
                                                                                                                                                "id":"_texunkecheng_Label5",
                                                                                                                                                "stylesFactory":function ():void
                                                                                                                                                {
                                                                                                                                                    this.color = 0xFFFFFF;
                                                                                                                                                    this.fontWeight = "bold";
                                                                                                                                                },
                                                                                                                                                "propertiesFactory":function ():Object
                                                                                                                                                {
                                                                                                                                                    return ({
                                                                                                                                                        "x":10,
                                                                                                                                                        "y":54
                                                                                                                                                    });
                                                                                                                                                }
                                                                                                                                            }), new UIComponentDescriptor({
                                                                                                                                                "type":BasicDelayButton,
                                                                                                                                                "id":"_texunkecheng_BasicDelayButton3",
                                                                                                                                                "events":{"click":"___texunkecheng_BasicDelayButton3_click"},
                                                                                                                                                "stylesFactory":function ():void
                                                                                                                                                {
                                                                                                                                                    this.right = "10";
                                                                                                                                                },
                                                                                                                                                "propertiesFactory":function ():Object
                                                                                                                                                {
                                                                                                                                                    return ({
                                                                                                                                                        "styleName":"BtnNormalBlue",
                                                                                                                                                        "width":73.2,
                                                                                                                                                        "height":25,
                                                                                                                                                        "y":26,
                                                                                                                                                        "clickDelay":2000
                                                                                                                                                    });
                                                                                                                                                }
                                                                                                                                            })]
                                                                                                                                        });
                                                                                                                                    }
                                                                                                                                })]});
                                                                                                                        }
                                                                                                                    })]
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":Canvas,
                                                                                                            "id":"ddOpen",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "y":0,
                                                                                                                    "percentWidth":100,
                                                                                                                    "percentHeight":100,
                                                                                                                    "x":0,
                                                                                                                    "horizontalScrollPolicy":"off",
                                                                                                                    "verticalScrollPolicy":"off",
                                                                                                                    "visible":true,
                                                                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                                                                        "type":Image,
                                                                                                                        "id":"_texunkecheng_Image5",
                                                                                                                        "propertiesFactory":function ():Object
                                                                                                                        {
                                                                                                                            return ({
                                                                                                                                "percentWidth":100,
                                                                                                                                "percentHeight":100,
                                                                                                                                "x":0,
                                                                                                                                "y":0
                                                                                                                            });
                                                                                                                        }
                                                                                                                    }), new UIComponentDescriptor({
                                                                                                                        "type":BasicDelayButton,
                                                                                                                        "id":"openDd",
                                                                                                                        "events":{"click":"__openDd_click"},
                                                                                                                        "stylesFactory":function ():void
                                                                                                                        {
                                                                                                                            this.horizontalCenter = "0";
                                                                                                                            this.verticalCenter = "0";
                                                                                                                        },
                                                                                                                        "propertiesFactory":function ():Object
                                                                                                                        {
                                                                                                                            return ({
                                                                                                                                "clickDelay":2000,
                                                                                                                                "styleName":"BtnNormalBlue",
                                                                                                                                "width":180,
                                                                                                                                "height":28
                                                                                                                            });
                                                                                                                        }
                                                                                                                    })]
                                                                                                                });
                                                                                                            }
                                                                                                        })]
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Tile,
                                                                                                "id":"_texunkecheng_Tile2",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":0,
                                                                                                        "percentWidth":100,
                                                                                                        "percentHeight":100,
                                                                                                        "x":0,
                                                                                                        "childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":Repeater,
                                                                                                            "id":"rpw",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                                        "type":Canvas,
                                                                                                                        "stylesFactory":function ():void
                                                                                                                        {
                                                                                                                            this.left = "10";
                                                                                                                            this.top = "10";
                                                                                                                        },
                                                                                                                        "propertiesFactory":function ():Object
                                                                                                                        {
                                                                                                                            return ({
                                                                                                                                "styleName":"CanvasBorder",
                                                                                                                                "mouseEnabled":false,
                                                                                                                                "height":94,
                                                                                                                                "width":360,
                                                                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                                                                    "type":Label,
                                                                                                                                    "id":"_texunkecheng_Label6",
                                                                                                                                    "stylesFactory":function ():void
                                                                                                                                    {
                                                                                                                                        this.color = 0xFFFFFF;
                                                                                                                                        this.fontWeight = "bold";
                                                                                                                                        this.fontSize = 16;
                                                                                                                                    },
                                                                                                                                    "propertiesFactory":function ():Object
                                                                                                                                    {
                                                                                                                                        return ({
                                                                                                                                            "x":10,
                                                                                                                                            "y":22
                                                                                                                                        });
                                                                                                                                    }
                                                                                                                                }), new UIComponentDescriptor({
                                                                                                                                    "type":Label,
                                                                                                                                    "id":"_texunkecheng_Label7",
                                                                                                                                    "stylesFactory":function ():void
                                                                                                                                    {
                                                                                                                                        this.color = 0xFFFFFF;
                                                                                                                                        this.fontWeight = "bold";
                                                                                                                                    },
                                                                                                                                    "propertiesFactory":function ():Object
                                                                                                                                    {
                                                                                                                                        return ({
                                                                                                                                            "x":10,
                                                                                                                                            "y":54
                                                                                                                                        });
                                                                                                                                    }
                                                                                                                                }), new UIComponentDescriptor({
                                                                                                                                    "type":BasicDelayButton,
                                                                                                                                    "id":"_texunkecheng_BasicDelayButton5",
                                                                                                                                    "events":{"click":"___texunkecheng_BasicDelayButton5_click"},
                                                                                                                                    "stylesFactory":function ():void
                                                                                                                                    {
                                                                                                                                        this.right = "10";
                                                                                                                                    },
                                                                                                                                    "propertiesFactory":function ():Object
                                                                                                                                    {
                                                                                                                                        return ({
                                                                                                                                            "styleName":"BtnNormalBlue",
                                                                                                                                            "width":73.2,
                                                                                                                                            "height":25,
                                                                                                                                            "y":26,
                                                                                                                                            "clickDelay":2000
                                                                                                                                        });
                                                                                                                                    }
                                                                                                                                })]
                                                                                                                            });
                                                                                                                        }
                                                                                                                    })]});
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
                                    "type":BasicDelayButton,
                                    "id":"shopBtn",
                                    "events":{"click":"__shopBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":3000,
                                            "styleName":"BtnStdRed",
                                            "width":110,
                                            "height":32,
                                            "x":493,
                                            "y":185
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
        private var TXKC_AWARD_MAP:Object = {
            "1":{
                "i":2333,
                "n":2
            },
            "2":{
                "i":5216,
                "n":1
            },
            "3":{
                "i":6733,
                "n":10
            },
            "4":{
                "i":4841,
                "n":10
            },
            "5":{
                "i":1333,
                "n":1
            },
            "6":{
                "i":6733,
                "n":10
            },
            "7":{
                "i":1405,
                "n":10
            },
            "8":{
                "i":2336,
                "n":1
            },
            "9":{
                "i":6733,
                "n":10
            },
            "10":{
                "i":6524,
                "n":1
            },
            "11":{
                "i":1365,
                "n":1
            },
            "12":{
                "i":6733,
                "n":10
            },
            "13":{
                "i":2037,
                "n":10
            },
            "14":{
                "i":6733,
                "n":35
            },
            "15":{
                "i":6524,
                "n":1
            },
            "16":{
                "i":5,
                "n":50
            },
            "17":{
                "i":2002,
                "n":2
            },
            "18":{
                "i":6733,
                "n":10
            },
            "19":{
                "i":2037,
                "n":5
            },
            "20":{
                "i":2336,
                "n":1
            },
            "21":{
                "i":6733,
                "n":10
            },
            "22":{
                "i":1315,
                "n":5
            },
            "23":{
                "i":274,
                "n":1
            },
            "24":{
                "i":2333,
                "n":1
            },
            "25":{
                "i":6733,
                "n":10
            },
            "26":{
                "i":2334,
                "n":2
            },
            "27":{
                "i":6733,
                "n":10
            },
            "28":{
                "i":2334,
                "n":1
            },
            "29":{
                "i":2002,
                "n":2
            },
            "30":{
                "i":6733,
                "n":35
            },
            "31":{
                "i":2334,
                "n":1
            },
            "32":{
                "i":5238,
                "n":1
            },
            "33":{
                "i":2334,
                "n":1
            },
            "34":{
                "i":5238,
                "n":1
            },
            "35":{
                "i":2334,
                "n":5
            },
            "36":{
                "i":274,
                "n":3
            },
            "37":{
                "i":2002,
                "n":2
            },
            "38":{
                "i":5216,
                "n":2
            },
            "39":{
                "i":329,
                "n":1
            },
            "40":{
                "i":6516,
                "n":1
            },
            "41":{
                "i":6526,
                "n":1
            },
            "42":{
                "i":6526,
                "n":1
            },
            "43":{
                "i":6526,
                "n":1
            },
            "44":{
                "i":6526,
                "n":1
            },
            "45":{
                "i":6526,
                "n":1
            },
            "46":{
                "i":6526,
                "n":1
            },
            "47":{
                "i":6526,
                "n":1
            },
            "48":{
                "i":6526,
                "n":1
            },
            "49":{
                "i":6526,
                "n":1
            },
            "50":{
                "i":6526,
                "n":1
            },
            "51":{
                "i":6526,
                "n":1
            },
            "52":{
                "i":6526,
                "n":1
            },
            "53":{
                "i":6526,
                "n":1
            },
            "54":{
                "i":6526,
                "n":1
            },
            "55":{
                "i":6526,
                "n":1
            },
            "56":{
                "i":6526,
                "n":1
            },
            "57":{
                "i":6526,
                "n":1
            },
            "58":{
                "i":6526,
                "n":1
            },
            "59":{
                "i":6526,
                "n":1
            },
            "60":{
                "i":6526,
                "n":1
            },
            "61":{
                "i":6526,
                "n":1
            },
            "62":{
                "i":6526,
                "n":1
            },
            "63":{
                "i":6526,
                "n":1
            },
            "64":{
                "i":6526,
                "n":1
            },
            "65":{
                "i":6526,
                "n":1
            },
            "66":{
                "i":6526,
                "n":1
            },
            "67":{
                "i":6526,
                "n":1
            },
            "68":{
                "i":6526,
                "n":1
            },
            "69":{
                "i":6526,
                "n":1
            },
            "70":{
                "i":6526,
                "n":1
            }
        };
        private var TXKC_ADVAN_AWARD_MAP:Object = {
            "1":{
                "i":6734,
                "n":1
            },
            "2":{
                "i":2336,
                "n":1
            },
            "3":{
                "i":6525,
                "n":3
            },
            "4":{
                "i":5215,
                "n":1
            },
            "5":{
                "i":1335,
                "n":1
            },
            "6":{
                "i":6524,
                "n":3
            },
            "7":{
                "i":1405,
                "n":10
            },
            "8":{
                "i":6525,
                "n":1
            },
            "9":{
                "i":1142,
                "n":1
            },
            "10":{
                "i":4595,
                "n":1
            },
            "11":{
                "i":5246,
                "n":1
            },
            "12":{
                "i":6525,
                "n":1
            },
            "13":{
                "i":5246,
                "n":1
            },
            "14":{
                "i":4841,
                "n":20
            },
            "15":{
                "i":2335,
                "n":1
            },
            "16":{
                "i":5,
                "n":99
            },
            "17":{
                "i":6524,
                "n":5
            },
            "18":{
                "i":6524,
                "n":5
            },
            "19":{
                "i":1142,
                "n":1
            },
            "20":{
                "i":4595,
                "n":1
            },
            "21":{
                "i":6525,
                "n":1
            },
            "22":{
                "i":2335,
                "n":1
            },
            "23":{
                "i":6524,
                "n":10
            },
            "24":{
                "i":6733,
                "n":10
            },
            "25":{
                "i":6800,
                "n":1
            },
            "26":{
                "i":1405,
                "n":10
            },
            "27":{
                "i":2335,
                "n":1
            },
            "28":{
                "i":3837,
                "n":1
            },
            "29":{
                "i":4841,
                "n":30
            },
            "30":{
                "i":4596,
                "n":1
            },
            "31":{
                "i":6733,
                "n":10
            },
            "32":{
                "i":6516,
                "n":1
            },
            "33":{
                "i":2335,
                "n":1
            },
            "34":{
                "i":6733,
                "n":10
            },
            "35":{
                "i":3837,
                "n":1
            },
            "36":{
                "i":6733,
                "n":5
            },
            "37":{
                "i":6733,
                "n":5
            },
            "38":{
                "i":6733,
                "n":5
            },
            "39":{
                "i":6525,
                "n":3
            },
            "40":{
                "i":6733,
                "n":50
            },
            "41":{
                "i":6733,
                "n":5
            },
            "42":{
                "i":6733,
                "n":5
            },
            "43":{
                "i":6733,
                "n":5
            },
            "44":{
                "i":6733,
                "n":5
            },
            "45":{
                "i":6733,
                "n":5
            },
            "46":{
                "i":6733,
                "n":5
            },
            "47":{
                "i":6733,
                "n":5
            },
            "48":{
                "i":6733,
                "n":5
            },
            "49":{
                "i":6733,
                "n":5
            },
            "50":{
                "i":6733,
                "n":5
            },
            "51":{
                "i":6733,
                "n":5
            },
            "52":{
                "i":6733,
                "n":5
            },
            "53":{
                "i":6733,
                "n":5
            },
            "54":{
                "i":6733,
                "n":5
            },
            "55":{
                "i":6733,
                "n":5
            },
            "56":{
                "i":6733,
                "n":5
            },
            "57":{
                "i":6733,
                "n":5
            },
            "58":{
                "i":6733,
                "n":5
            },
            "59":{
                "i":6733,
                "n":5
            },
            "60":{
                "i":6733,
                "n":5
            },
            "61":{
                "i":6733,
                "n":5
            },
            "62":{
                "i":6733,
                "n":5
            },
            "63":{
                "i":6733,
                "n":5
            },
            "64":{
                "i":6733,
                "n":5
            },
            "65":{
                "i":6733,
                "n":5
            },
            "66":{
                "i":6733,
                "n":5
            },
            "67":{
                "i":6733,
                "n":5
            },
            "68":{
                "i":6733,
                "n":5
            },
            "69":{
                "i":6733,
                "n":5
            },
            "70":{
                "i":6733,
                "n":5
            }
        };
        private var TXKC_Daily_Lang:Object = {
            "37":"Hoàn thành 3 lần sổ tay ma thú",
            "40":"Hoàn thành 1 lần Ước nguyện",
            "27":"Hoàn thành 1 lần thu hoạch trang viên",
            "7":"Hoàn thành 1 lần nhiệm vụ hái thuốc",
            "6":"Hoàn thành 1 lần nhiệm vụ câu cá",
            "8":"Hoàn thành 1 lần nhiệm vụ trồng tr",
            "4":"Hoàn thành 3 lần nhiệm vụ thần tu",
            "2":"Hoàn thành 3 lần nhiệm vụ treo thưởng",
            "1":"Hoàn thành 3 lần nhiệm vụ gia tộc",
            "26":"Tham gia1 lần đấu pet"
        };
        private var TXKC_Weekly_Lang:Object = {
            "1":"Tích lũy hoàn thành 5 lần phụ bản bất kỳ",
            "2":"Tích lũy hoàn thành 30 lần nhiệm vụ trị an",
            "3":"Tích lũy hoàn thành 30 lần nhiệm vụ thần tu",
            "4":"Tích lũy hoàn thành 30 lần nhiệm vụ trừ ma",
            "5":"Tích lũy hoàn thành 50 lần nhiệm vụ luyện pet",
            "6":"Tích lũy nhận 1000 điểm năng nổ"
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function texunkecheng()
        {
            mx_internal::_document = this;
            this.width = 839;
            this.height = 585;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            texunkecheng._watcherSetupUtil = _arg_1;
        }


        public function set introtxt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._582333572introtxt;
            if (_local_2 !== _arg_1)
            {
                this._582333572introtxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introtxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get TXKCDailyListDP():ArrayCollection
        {
            return (this._1279336615TXKCDailyListDP);
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

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get rpw():Repeater
        {
            return (this._113145rpw);
        }

        public function set shopBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._2067054470shopBtn;
            if (_local_2 !== _arg_1)
            {
                this._2067054470shopBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopBtn", _local_2, _arg_1));
            };
        }

        public function set TXKCWeeklyListDP(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1875198329TXKCWeeklyListDP;
            if (_local_2 !== _arg_1)
            {
                this._1875198329TXKCWeeklyListDP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TXKCWeeklyListDP", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get txkcProgress():Property
        {
            return (this._2129980119txkcProgress);
        }

        private function openDailyQuest():void
        {
            _core.remote.call("takeTXKCDailyQuest", null);
        }

        private function openTXKCShop():void
        {
            _core.remote.call("openTXKCShop", null);
        }

        [Bindable(event="propertyChange")]
        public function get awdbtn1():BasicDelayButton
        {
            return (this._604200637awdbtn1);
        }

        private function _texunkecheng_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TXKC_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220003338);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = ResManager.getIconUrl(4130220003333);
            _local_1 = Language.TXKC_PANEL[2];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.TXKC_PANEL[4];
            _local_1 = pageTab.selectedIndex;
            _local_1 = ResManager.getIconUrl(4130220003334);
            _local_1 = TXKCMainListDP;
            _local_1 = Language.TXKC_PANEL[12];
            _local_1 = Language.TXKC_PANEL[13];
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.TXKC_PANEL[5];
            _local_1 = pageTab2.selectedIndex;
            _local_1 = TXKCDailyListDP;
            _local_1 = ResManager.getIconUrl(4130220003336);
            _local_1 = rpd.currentItem.sp;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = rpd.currentItem.t;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = rpd.currentItem.et;
            _local_1 = rpd.currentItem.id;
            _local_1 = rpd.currentItem.bnab;
            _local_1 = Language.SYSTEMSHOPPANEL_U[18];
            _local_1 = ResManager.getIconUrl(4130220003339);
            _local_1 = Language.TXKC_PANEL[19];
            _local_1 = TXKCWeeklyListDP;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = rpw.currentItem.t;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = rpw.currentItem.et;
            _local_1 = rpw.currentItem.id;
            _local_1 = rpw.currentItem.bnab;
            _local_1 = Language.SYSTEMSHOPPANEL_U[18];
            _local_1 = Language.TXKC_PANEL[3];
        }

        public function set remainDaysLable(_arg_1:Label):void
        {
            var _local_2:Object = this._697734307remainDaysLable;
            if (_local_2 !== _arg_1)
            {
                this._697734307remainDaysLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "remainDaysLable", _local_2, _arg_1));
            };
        }

        private function _texunkecheng_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TXKC_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _texunkecheng_BasicTitleCanvas1.text = _arg_1;
            }, "_texunkecheng_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003338));
            }, function (_arg_1:Object):void
            {
                _texunkecheng_Image1.source = _arg_1;
            }, "_texunkecheng_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                LevLable.filters = _arg_1;
            }, "LevLable.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                remainDaysLable.filters = _arg_1;
            }, "remainDaysLable.filters");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                txkcProgressText.filters = _arg_1;
            }, "txkcProgressText.filters");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003333));
            }, function (_arg_1:Object):void
            {
                _texunkecheng_Image2.source = _arg_1;
            }, "_texunkecheng_Image2.source");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TXKC_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buyAdvCourseOrEXP.label = _arg_1;
            }, "buyAdvCourseOrEXP.label");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTab.filters = _arg_1;
            }, "pageTab.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.TXKC_PANEL[4]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab.selectedIndex);
            }, function (_arg_1:int):void
            {
                _texunkecheng_ViewStack1.selectedIndex = _arg_1;
            }, "_texunkecheng_ViewStack1.selectedIndex");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003334));
            }, function (_arg_1:Object):void
            {
                _texunkecheng_Image3.source = _arg_1;
            }, "_texunkecheng_Image3.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (TXKCMainListDP);
            }, function (_arg_1:Object):void
            {
                mainList.dataProvider = _arg_1;
            }, "mainList.dataProvider");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TXKC_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awdbtn1.label = _arg_1;
            }, "awdbtn1.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TXKC_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awdbtn2.label = _arg_1;
            }, "awdbtn2.label");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                nextslot2.slotType = _arg_1;
            }, "nextslot2.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                nextslot1.slotType = _arg_1;
            }, "nextslot1.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTab2.filters = _arg_1;
            }, "pageTab2.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.TXKC_PANEL[5]);
            }, function (_arg_1:Array):void
            {
                pageTab2.dataArray = _arg_1;
            }, "pageTab2.dataArray");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab2.selectedIndex);
            }, function (_arg_1:int):void
            {
                _texunkecheng_ViewStack2.selectedIndex = _arg_1;
            }, "_texunkecheng_ViewStack2.selectedIndex");
            result[18] = binding;
            binding = new Binding(this, function ():Object
            {
                return (TXKCDailyListDP);
            }, function (_arg_1:Object):void
            {
                rpd.dataProvider = _arg_1;
            }, "rpd.dataProvider");
            result[19] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (ResManager.getIconUrl(4130220003336));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _texunkecheng_Image4[_arg_2[0]].source = _arg_1;
            }, "_texunkecheng_Image4.source");
            result[20] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Boolean
            {
                return (rpd.mx_internal::getItemAt(_arg_2[0]).sp);
            }, function (_arg_1:Boolean, _arg_2:Array):void
            {
                _texunkecheng_Image4[_arg_2[0]].visible = _arg_1;
            }, "_texunkecheng_Image4.visible");
            result[21] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array, _arg_2:Array):void
            {
                _texunkecheng_Label4[_arg_2[0]].filters = _arg_1;
            }, "_texunkecheng_Label4.filters");
            result[22] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = rpd.mx_internal::getItemAt(_arg_2[0]).t;
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _texunkecheng_Label4[_arg_2[0]].text = _arg_1;
            }, "_texunkecheng_Label4.text");
            result[23] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array, _arg_2:Array):void
            {
                _texunkecheng_Label5[_arg_2[0]].filters = _arg_1;
            }, "_texunkecheng_Label5.filters");
            result[24] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = rpd.mx_internal::getItemAt(_arg_2[0]).et;
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _texunkecheng_Label5[_arg_2[0]].text = _arg_1;
            }, "_texunkecheng_Label5.text");
            result[25] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (rpd.mx_internal::getItemAt(_arg_2[0]).id);
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _texunkecheng_BasicDelayButton3[_arg_2[0]].data = _arg_1;
            }, "_texunkecheng_BasicDelayButton3.data");
            result[26] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Boolean
            {
                return (rpd.mx_internal::getItemAt(_arg_2[0]).bnab);
            }, function (_arg_1:Boolean, _arg_2:Array):void
            {
                _texunkecheng_BasicDelayButton3[_arg_2[0]].enabled = _arg_1;
            }, "_texunkecheng_BasicDelayButton3.enabled");
            result[27] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = Language.SYSTEMSHOPPANEL_U[18];
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _texunkecheng_BasicDelayButton3[_arg_2[0]].label = _arg_1;
            }, "_texunkecheng_BasicDelayButton3.label");
            result[28] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003339));
            }, function (_arg_1:Object):void
            {
                _texunkecheng_Image5.source = _arg_1;
            }, "_texunkecheng_Image5.source");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TXKC_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openDd.label = _arg_1;
            }, "openDd.label");
            result[30] = binding;
            binding = new Binding(this, function ():Object
            {
                return (TXKCWeeklyListDP);
            }, function (_arg_1:Object):void
            {
                rpw.dataProvider = _arg_1;
            }, "rpw.dataProvider");
            result[31] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array, _arg_2:Array):void
            {
                _texunkecheng_Label6[_arg_2[0]].filters = _arg_1;
            }, "_texunkecheng_Label6.filters");
            result[32] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = rpw.mx_internal::getItemAt(_arg_2[0]).t;
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _texunkecheng_Label6[_arg_2[0]].text = _arg_1;
            }, "_texunkecheng_Label6.text");
            result[33] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array, _arg_2:Array):void
            {
                _texunkecheng_Label7[_arg_2[0]].filters = _arg_1;
            }, "_texunkecheng_Label7.filters");
            result[34] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = rpw.mx_internal::getItemAt(_arg_2[0]).et;
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _texunkecheng_Label7[_arg_2[0]].text = _arg_1;
            }, "_texunkecheng_Label7.text");
            result[35] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (rpw.mx_internal::getItemAt(_arg_2[0]).id);
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _texunkecheng_BasicDelayButton5[_arg_2[0]].data = _arg_1;
            }, "_texunkecheng_BasicDelayButton5.data");
            result[36] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Boolean
            {
                return (rpw.mx_internal::getItemAt(_arg_2[0]).bnab);
            }, function (_arg_1:Boolean, _arg_2:Array):void
            {
                _texunkecheng_BasicDelayButton5[_arg_2[0]].enabled = _arg_1;
            }, "_texunkecheng_BasicDelayButton5.enabled");
            result[37] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = Language.SYSTEMSHOPPANEL_U[18];
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _texunkecheng_BasicDelayButton5[_arg_2[0]].label = _arg_1;
            }, "_texunkecheng_BasicDelayButton5.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TXKC_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                shopBtn.label = _arg_1;
            }, "shopBtn.label");
            result[39] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get buyAdvCourseOrEXP():BasicGlowButton
        {
            return (this._547663022buyAdvCourseOrEXP);
        }

        public function __openDd_click(_arg_1:MouseEvent):void
        {
            openDailyQuest();
        }

        public function set TXKCDailyListDP(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1279336615TXKCDailyListDP;
            if (_local_2 !== _arg_1)
            {
                this._1279336615TXKCDailyListDP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TXKCDailyListDP", _local_2, _arg_1));
            };
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function set txkcProgress(_arg_1:Property):void
        {
            var _local_2:Object = this._2129980119txkcProgress;
            if (_local_2 !== _arg_1)
            {
                this._2129980119txkcProgress = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txkcProgress", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awdbtn2():BasicDelayButton
        {
            return (this._604200636awdbtn2);
        }

        [Bindable(event="propertyChange")]
        public function get openDd():BasicDelayButton
        {
            return (this._1010580374openDd);
        }

        [Bindable(event="propertyChange")]
        public function get pageTab2():HButtonTab
        {
            return (this._859449964pageTab2);
        }

        public function ___texunkecheng_BasicDelayButton5_click(_arg_1:MouseEvent):void
        {
            WDAwardhandler(_arg_1);
        }

        public function __buyAdvCourseOrEXP_click(_arg_1:MouseEvent):void
        {
            buyAdvCourseOrEXPHandler();
        }

        public function onTXKCData(_arg_1:*):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:int;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            if (((_arg_1.start) && (_arg_1.end)))
            {
                introtxt.text = Language.TXKC_PANEL[7].replace("{start}", _arg_1.start).replace("{end}", _arg_1.end);
            };
            if (_arg_1.days)
            {
                remainDaysLable.text = Language.TXKC_PANEL[6].replace("{days}", _arg_1.days);
            };
            if (_arg_1.flag)
            {
                _local_2 = _arg_1.flag;
                if (_local_2.hasOwnProperty("lev"))
                {
                    LevLable.text = Language.TXKC_PANEL[8].replace("{level}", _local_2.lev);
                };
                if ((((_local_2.hasOwnProperty("exp")) && (_local_2.exp >= 0)) && (_local_2.exp < 500)))
                {
                    txkcProgress.v = int(_local_2.exp);
                    txkcProgressText.text = Language.TXKC_PANEL[9].replace("{v}", int(_local_2.exp));
                };
                if (((_local_2.hasOwnProperty("p")) && (_local_2.p == 0)))
                {
                    buyAdvCourseOrEXP.label = Language.TXKC_PANEL[10];
                };
                if (((_local_2.hasOwnProperty("p")) && (_local_2.p == 1)))
                {
                    buyAdvCourseOrEXP.label = Language.TXKC_PANEL[11];
                };
                if (((((((_local_2.hasOwnProperty("awd1")) && (_local_2.hasOwnProperty("awd2"))) && (_local_2.hasOwnProperty("lev"))) && (_local_2.awd1 >= 0)) && (_local_2.awd2 >= 0)) && (_local_2.lev >= 0)))
                {
                    _local_3 = new ArrayCollection();
                    _local_4 = 1;
                    while (_local_4 <= 70)
                    {
                        _local_6 = new Object();
                        _local_6.a1 = TXKC_AWARD_MAP[_local_4];
                        _local_6.a2 = TXKC_ADVAN_AWARD_MAP[_local_4];
                        _local_6.p = _local_2.p;
                        if (_local_4 <= _local_2.awd1)
                        {
                            _local_6.awd1 = true;
                        }
                        else
                        {
                            _local_6.awd1 = false;
                        };
                        if (_local_4 <= _local_2.awd2)
                        {
                            _local_6.awd2 = true;
                        }
                        else
                        {
                            _local_6.awd2 = false;
                        };
                        _local_6.lev = _local_4;
                        _local_3.addItem(_local_6);
                        _local_4++;
                    };
                    TXKCMainListDP = _local_3;
                    _local_5 = -1;
                    if (_local_2.lev == 0)
                    {
                        _local_5 = 0;
                    }
                    else
                    {
                        if (_local_2.lev <= 70)
                        {
                            _local_5 = (_local_2.lev - 1);
                        };
                    };
                    if (_local_5 >= 0)
                    {
                        mainList.scrollToIndex(_local_5);
                    };
                };
                if ((((_local_2.hasOwnProperty("awd1")) && (_local_2.hasOwnProperty("lev"))) && (_local_2.lev > _local_2.awd1)))
                {
                    awdbtn1.enabled = true;
                }
                else
                {
                    awdbtn1.enabled = false;
                };
                if ((((_local_2.hasOwnProperty("awd2")) && (_local_2.hasOwnProperty("lev"))) && (_local_2.lev > _local_2.awd2)))
                {
                    awdbtn2.enabled = true;
                }
                else
                {
                    awdbtn2.enabled = false;
                };
                if (_local_2.hasOwnProperty("lev"))
                {
                    _local_7 = ((Math.floor((_local_2.lev / 5)) + 1) * 5);
                    if (((_local_7 <= 0) || (_local_7 > 70)))
                    {
                        nextslot2.slotData = null;
                        nextslot2.giid = -1;
                        nextslot2.stackNum = 1;
                        nextslot1.slotData = null;
                        nextslot1.giid = -1;
                        nextslot1.stackNum = 1;
                    }
                    else
                    {
                        _local_8 = TXKC_AWARD_MAP[_local_7].i;
                        _local_9 = TXKC_ADVAN_AWARD_MAP[_local_7].i;
                        _local_10 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_8];
                        _local_11 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_9];
                        nextslot2.slotData = _local_11;
                        nextslot2.stackNum = TXKC_ADVAN_AWARD_MAP[_local_7].n;
                        nextslot2.giid = _local_9;
                        nextslot1.slotData = _local_10;
                        nextslot1.stackNum = TXKC_AWARD_MAP[_local_7].n;
                        nextslot1.giid = _local_8;
                    };
                };
                if ((((_local_2.hasOwnProperty("dd")) && (!(_local_2.dd == false))) && (_local_2.hasOwnProperty("spIndex"))))
                {
                    _local_12 = new ArrayCollection();
                    _local_13 = _local_2.dd;
                    for (_local_4 in _local_13)
                    {
                        if (_local_13[_local_4])
                        {
                            _local_6 = {};
                            _local_6.bnab = false;
                            if (_local_13[_local_4] == "exped")
                            {
                                _local_6.t = (TXKC_Daily_Lang[_local_4] + " : Đã hoàn thành");
                                _local_6.bnab = false;
                            }
                            else
                            {
                                if (_local_13[_local_4] == "true")
                                {
                                    _local_6.t = (TXKC_Daily_Lang[_local_4] + " : Đã hoàn thành");
                                    _local_6.bnab = true;
                                }
                                else
                                {
                                    _local_6.t = ((TXKC_Daily_Lang[_local_4] + " : ") + _local_13[_local_4]);
                                    _local_6.bnab = false;
                                };
                            };
                            _local_6.sp = false;
                            _local_6.et = (Language.TXKC_PANEL[14] + TXKC_DAILY_EXP);
                            if (_local_4 == _local_2.spIndex)
                            {
                                _local_6.sp = true;
                                _local_6.et = (Language.TXKC_PANEL[14] + TXKC_DAILY_SP_EXP);
                            };
                            _local_6.id = int(_local_4);
                            _local_12.addItem(_local_6);
                        };
                    };
                    TXKCDailyListDP = _local_12;
                    ddOpen.visible = false;
                }
                else
                {
                    ddOpen.visible = true;
                };
                if (_local_2.hasOwnProperty("wd"))
                {
                    _local_14 = new ArrayCollection();
                    _local_15 = _local_2.wd;
                    for (_local_4 in _local_15)
                    {
                        if (_local_15[_local_4])
                        {
                            _local_6 = {};
                            _local_6.bnab = false;
                            if (_local_15[_local_4] == "exped")
                            {
                                _local_6.t = (TXKC_Weekly_Lang[_local_4] + " : Đã hoàn thành");
                                _local_6.bnab = false;
                            }
                            else
                            {
                                if (_local_15[_local_4] == "true")
                                {
                                    _local_6.t = (TXKC_Weekly_Lang[_local_4] + " : Đã hoàn thành");
                                    _local_6.bnab = true;
                                }
                                else
                                {
                                    _local_6.t = ((TXKC_Weekly_Lang[_local_4] + " : ") + _local_15[_local_4]);
                                    _local_6.bnab = false;
                                };
                            };
                            _local_6.et = (Language.TXKC_PANEL[14] + TXKC_WEEKLY_EXP);
                            _local_6.id = int(_local_4);
                            _local_14.addItem(_local_6);
                        };
                    };
                    TXKCWeeklyListDP = _local_14;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get TXKCWeeklyListDP():ArrayCollection
        {
            return (this._1875198329TXKCWeeklyListDP);
        }

        public function set awdbtn2(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._604200636awdbtn2;
            if (_local_2 !== _arg_1)
            {
                this._604200636awdbtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awdbtn2", _local_2, _arg_1));
            };
        }

        private function _openAdvCourse(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("openTXKCAdvanceCourse", null);
            };
        }

        public function set LevLable(_arg_1:Label):void
        {
            var _local_2:Object = this._2090394679LevLable;
            if (_local_2 !== _arg_1)
            {
                this._2090394679LevLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "LevLable", _local_2, _arg_1));
            };
        }

        public function set awdbtn1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._604200637awdbtn1;
            if (_local_2 !== _arg_1)
            {
                this._604200637awdbtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awdbtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get introtxt():IntroText
        {
            return (this._582333572introtxt);
        }

        public function set TXKCMainListDP(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._659388225TXKCMainListDP;
            if (_local_2 !== _arg_1)
            {
                this._659388225TXKCMainListDP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TXKCMainListDP", _local_2, _arg_1));
            };
        }

        private function buyAdvCourseOrEXPHandler():void
        {
            var str:String;
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var func:Function;
            var expPanel:TXKCEXPPanel;
            var gfunc:Function;
            if (buyAdvCourseOrEXP.label == Language.TXKC_PANEL[10])
            {
                str = Language.TXKC_PANEL[1].replace("{gold}", TXKC_OPEN_SPECICAL_COURSE_POINT);
                Alert.show(str, Language.TXKC_PANEL[2], (Alert.YES | Alert.NO), null, _openAdvCourse);
                return;
            };
            if (buyAdvCourseOrEXP.label == Language.TXKC_PANEL[11])
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                goldLockFlag = bagPanel.goldLockFlag;
                if (((goldLockFlag) || (!(bagPanel))))
                {
                    gfunc = function (_arg_1:String):void
                    {
                        _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                    return;
                };
                func = function (_arg_1:int):void
                {
                    _core.remote.call("buyTXKCEXP", null, _arg_1);
                };
                expPanel = TXKCEXPPanel(_core.view.getUI(ViewManager.PANEL_TEXUNKECHENG_EXP_PANEL));
                expPanel.exeFunc = func;
                expPanel.show();
                return;
            };
        }

        override public function initialize():void
        {
            var target:texunkecheng;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _texunkecheng_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_texunkechengWatcherSetupUtil");
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

        public function set buyAdvCourseOrEXP(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._547663022buyAdvCourseOrEXP;
            if (_local_2 !== _arg_1)
            {
                this._547663022buyAdvCourseOrEXP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buyAdvCourseOrEXP", _local_2, _arg_1));
            };
        }

        public function __shopBtn_click(_arg_1:MouseEvent):void
        {
            openTXKCShop();
        }

        public function __awdbtn1_click(_arg_1:MouseEvent):void
        {
            getAllAward();
        }

        private function getAllAward():void
        {
            _core.remote.call("takeTXKCFreeAward", null);
        }

        private function WDAwardhandler(_arg_1:Event):void
        {
            _core.remote.call("TXKCGetProgressEXP", null, 2, _arg_1.currentTarget.data);
        }

        [Bindable(event="propertyChange")]
        public function get remainDaysLable():Label
        {
            return (this._697734307remainDaysLable);
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        public function set nextslot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1235462880nextslot1;
            if (_local_2 !== _arg_1)
            {
                this._1235462880nextslot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextslot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get TXKCMainListDP():ArrayCollection
        {
            return (this._659388225TXKCMainListDP);
        }

        [Bindable(event="propertyChange")]
        public function get LevLable():Label
        {
            return (this._2090394679LevLable);
        }

        public function set ddOpen(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1337235734ddOpen;
            if (_local_2 !== _arg_1)
            {
                this._1337235734ddOpen = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ddOpen", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("getTXKCData", null);
        }

        public function set pageTab2(_arg_1:HButtonTab):void
        {
            var _local_2:Object = this._859449964pageTab2;
            if (_local_2 !== _arg_1)
            {
                this._859449964pageTab2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTab2", _local_2, _arg_1));
            };
        }

        public function set openDd(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1010580374openDd;
            if (_local_2 !== _arg_1)
            {
                this._1010580374openDd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openDd", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextslot1():ItemSlot
        {
            return (this._1235462880nextslot1);
        }

        [Bindable(event="propertyChange")]
        public function get nextslot2():ItemSlot
        {
            return (this._1235462881nextslot2);
        }

        private function _texunkecheng_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = texunkechengRenderer;
            return (_local_1);
        }

        public function set nextslot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1235462881nextslot2;
            if (_local_2 !== _arg_1)
            {
                this._1235462881nextslot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextslot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rpd():Repeater
        {
            return (this._113126rpd);
        }

        [Bindable(event="propertyChange")]
        public function get shopBtn():BasicDelayButton
        {
            return (this._2067054470shopBtn);
        }

        [Bindable(event="propertyChange")]
        public function get ddOpen():Canvas
        {
            return (this._1337235734ddOpen);
        }

        private function DDAwardhandler(_arg_1:Event):void
        {
            _core.remote.call("TXKCGetProgressEXP", null, 1, _arg_1.currentTarget.data);
        }

        public function set mainList(_arg_1:HorizontalList):void
        {
            var _local_2:Object = this._8673801mainList;
            if (_local_2 !== _arg_1)
            {
                this._8673801mainList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainList", _local_2, _arg_1));
            };
        }

        public function set rpw(_arg_1:Repeater):void
        {
            var _local_2:Object = this._113145rpw;
            if (_local_2 !== _arg_1)
            {
                this._113145rpw = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rpw", _local_2, _arg_1));
            };
        }

        public function set txkcProgressText(_arg_1:Label):void
        {
            var _local_2:Object = this._769790454txkcProgressText;
            if (_local_2 !== _arg_1)
            {
                this._769790454txkcProgressText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txkcProgressText", _local_2, _arg_1));
            };
        }

        public function __awdbtn2_click(_arg_1:MouseEvent):void
        {
            getAllAdvAward();
        }

        private function getAllAdvAward():void
        {
            _core.remote.call("takeTXKCAdvanAward", null);
        }

        [Bindable(event="propertyChange")]
        public function get mainList():HorizontalList
        {
            return (this._8673801mainList);
        }

        public function set rpd(_arg_1:Repeater):void
        {
            var _local_2:Object = this._113126rpd;
            if (_local_2 !== _arg_1)
            {
                this._113126rpd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rpd", _local_2, _arg_1));
            };
        }

        public function ___texunkecheng_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            DDAwardhandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get txkcProgressText():Label
        {
            return (this._769790454txkcProgressText);
        }


    }
}//package com.qeedoo.ui.view.compDragable

