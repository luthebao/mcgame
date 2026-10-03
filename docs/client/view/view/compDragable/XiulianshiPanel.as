// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.XiulianshiPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.utils.ArrayQueue;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.events.FlexEvent;
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

    public class XiulianshiPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1272061793flagat:Label;
        private var _98445ci3:Image;
        private var _99408di5:Image;
        private var _99500dl4:Label;
        private var _98537cl2:Label;
        private var _98788ct5:Label;
        private var _99191db5:BasicDelayButton;
        private var _99499dl3:Label;
        private var _98229cb4:BasicDelayButton;
        private var _1404994418awdBtn:BasicDelayButton;
        private var _alert:Alert;
        private var _98446ci4:Image;
        private var _99501dl5:Label;
        private var _98230cb5:BasicDelayButton;
        public var _XiulianshiPanel_BasicDelayButton1:BasicDelayButton;
        private var _98538cl3:Label;
        private var _99404di1:Image;
        public var _XiulianshiPanel_IntroText1:IntroText;
        private var _107332log:LinkTextArea;
        public var _XiulianshiPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _98447ci5:Image;
        public var _XiulianshiPanel_Label1:Label;
        private var cid:* = 0;
        public var _XiulianshiPanel_Label3:Label;
        public var _XiulianshiPanel_Label4:Label;
        private var _98784ct1:Label;
        private var _98539cl4:Label;
        private var _99405di2:Image;
        private var _1085375639roomLevel:String = "";
        private var _550778329canvas1:Canvas;
        public var _XiulianshiPanel_Label15:Label;
        private var _98540cl5:Label;
        private var _98785ct2:Label;
        private var _98443ci1:Image;
        private var _98226cb1:BasicDelayButton;
        public var _XiulianshiPanel_Image7:Image;
        public var _XiulianshiPanel_Image1:Image;
        private var _99406di3:Image;
        private var _98786ct3:Label;
        private var _98444ci2:Image;
        private var _98227cb2:BasicDelayButton;
        private var _99497dl1:Label;
        private var _99749dt5:Label;
        private var _99407di4:Image;
        private var _98536cl1:Label;
        private var _98787ct4:Label;
        private var _99498dl2:Label;
        private var _98228cb3:BasicDelayButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":730,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_XiulianshiPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "percentHeight":100,
                                "percentWidth":100,
                                "x":1,
                                "y":32,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_XiulianshiPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                        this.top = "7";
                                        this.horizontalCenter = "0";
                                        this.fontSize = 14;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "30";
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":404,
                                            "height":208,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_XiulianshiPanel_Image1",
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
                                                "type":Label,
                                                "id":"flagat",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "right";
                                                    this.right = "13";
                                                    this.top = "7";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":""});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_XiulianshiPanel_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.top = "7";
                                                    this.left = "13";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"Phòng Tu Luyện Cao Cấp"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_XiulianshiPanel_BasicDelayButton1",
                                                "events":{"click":"___XiulianshiPanel_BasicDelayButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "5";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":2000,
                                                        "styleName":"BtnNormalBlue",
                                                        "width":120,
                                                        "height":23
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_XiulianshiPanel_Label4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.bottom = "8";
                                                    this.left = "15";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":250});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-125";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":30,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-62";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":30,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":30,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "61";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":30,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"ct5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "122";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":30,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cl1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-122";
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":105,
                                                        "text":"",
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cl2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-62";
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":105,
                                                        "text":"",
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cl3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "3";
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":105,
                                                        "text":"",
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cl4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "63";
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":105,
                                                        "text":"",
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"cl5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "123";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":105,
                                                        "text":"",
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ci1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":63,
                                                        "y":58,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ci2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":124,
                                                        "y":58,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ci3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":187,
                                                        "y":58,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ci4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":246,
                                                        "y":58,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ci5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":307,
                                                        "y":58,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"cb1",
                                                "events":{"click":"__cb1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-122";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":2000,
                                                        "styleName":"BtnNormalBlue",
                                                        "y":133,
                                                        "label":"Tu Luyện",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"cb2",
                                                "events":{"click":"__cb2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-59";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":2000,
                                                        "styleName":"BtnNormalBlue",
                                                        "y":133,
                                                        "label":"Tu Luyện",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"cb3",
                                                "events":{"click":"__cb3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":2000,
                                                        "styleName":"BtnNormalBlue",
                                                        "y":133,
                                                        "label":"Tu Luyện",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"cb4",
                                                "events":{"click":"__cb4_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "63";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":2000,
                                                        "styleName":"BtnNormalBlue",
                                                        "y":133,
                                                        "label":"Tu Luyện",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"cb5",
                                                "events":{"click":"__cb5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "124";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":2000,
                                                        "styleName":"BtnNormalBlue",
                                                        "y":133,
                                                        "label":"Tu Luyện",
                                                        "enabled":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "250";
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":404,
                                            "height":208,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_XiulianshiPanel_Image7",
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
                                                "type":Label,
                                                "id":"_XiulianshiPanel_Label15",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "left";
                                                    this.top = "7";
                                                    this.left = "13";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"Phòng Tu Luyện Công Cộng"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"di1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":69,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"di2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":113,
                                                        "y":69,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"di3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":186,
                                                        "y":69,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"di4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":259,
                                                        "y":69,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"di5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":332,
                                                        "y":69,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"dl1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "-147";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":112,
                                                        "text":"",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"dl2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "-72";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":112,
                                                        "text":"",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"dl3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "2";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":112,
                                                        "text":"",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"dl4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "75";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":112,
                                                        "text":"",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"dl5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "148";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":112,
                                                        "text":"",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"dt5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "148";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":39,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"db5",
                                                "events":{"click":"__db5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "147";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":2000,
                                                        "styleName":"BtnNormalBlue",
                                                        "y":142,
                                                        "label":"Tu Luyện",
                                                        "enabled":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "424";
                                        this.top = "30";
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":428,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"canvas1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                    this.left = "5";
                                                    this.right = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":250,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"log",
                                                            "events":{"updateComplete":"__log_updateComplete"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "solid";
                                                                this.textAlign = "left";
                                                                this.borderThickness = 1;
                                                                this.borderColor = 198926;
                                                                this.backgroundAlpha = 0.3;
                                                                this.backgroundColor = 0;
                                                                this.color = 16774324;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "mouseEnabled":false,
                                                                    "editable":false,
                                                                    "selectable":false,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "260";
                                                    this.left = "5";
                                                    this.right = "5";
                                                    this.bottom = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"_XiulianshiPanel_IntroText1",
                                                            "events":{"mouseDown":"___XiulianshiPanel_IntroText1_mouseDown"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "40";
                                                                this.top = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "x":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"awdBtn",
                                                            "events":{"click":"__awdBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "5";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "enabled":false,
                                                                    "clickDelay":2000,
                                                                    "styleName":"BtnNormalBlue",
                                                                    "width":120,
                                                                    "height":23
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
        });
        private var _core:Core = Core.getInstance();
        private var _plist:Array = [];
        private var _plistAdv:Array = [];
        private var _farmLog:ArrayQueue = new ArrayQueue(50);
        private var _timerList:* = [];
        private var _timerDTList:* = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function XiulianshiPanel()
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
            XiulianshiPanel._watcherSetupUtil = _arg_1;
        }


        public function __cb2_click(_arg_1:MouseEvent):void
        {
            enterAdvRoom(2);
        }

        public function ___XiulianshiPanel_IntroText1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function enterAdvRoom(num:int):void
        {
            var func:Function;
            var p:Object = _core.view.getUI(ViewManager.PANEL_PETFIGHT_CONF);
            if (p._farmPetData == undefined)
            {
                _alert = Alert.show(Language.XLS_PANEL[25]);
                return;
            };
            if (this[("cb" + num)].label == Language.XLS_PANEL[10])
            {
                _alert = Alert.show(Language.XLS_PANEL[26]);
            };
            if (this[("cb" + num)].label == Language.XLS_PANEL[7])
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("endHMTXLRoom", null, 2);
                    };
                };
                _alert = Alert.show(Language.XLS_PANEL[15], null, (Alert.YES | Alert.NO), null, func);
            };
            if (this[("cb" + num)].label == Language.XLS_PANEL[11])
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("enterAdvRoom", null, num);
                    };
                };
                _alert = Alert.show(Language.XLS_PANEL[13].replace("{x}", Math.round((_core.player.level * 2))), null, (Alert.YES | Alert.NO), null, func);
            };
            if (this[("cb" + num)].label == Language.XLS_PANEL[9])
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("enterAdvRoom", null, num);
                    };
                };
                _alert = Alert.show(Language.XLS_PANEL[16], null, (Alert.YES | Alert.NO), null, func);
            };
        }

        [Bindable(event="propertyChange")]
        public function get di1():Image
        {
            return (this._99404di1);
        }

        [Bindable(event="propertyChange")]
        public function get di3():Image
        {
            return (this._99406di3);
        }

        [Bindable(event="propertyChange")]
        public function get di4():Image
        {
            return (this._99407di4);
        }

        [Bindable(event="propertyChange")]
        public function get di5():Image
        {
            return (this._99408di5);
        }

        [Bindable(event="propertyChange")]
        public function get di2():Image
        {
            return (this._99405di2);
        }

        public function __awdBtn_click(_arg_1:MouseEvent):void
        {
            getXiuLianAward();
        }

        public function onHMTXLSData(_arg_1:*):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            if (_arg_1)
            {
                resetHMTUi();
                _local_2 = _arg_1.pubdata;
                if (_local_2)
                {
                    if (_local_2.hasOwnProperty("plist"))
                    {
                        _local_3 = "";
                        if (_arg_1.hasOwnProperty("nmldata"))
                        {
                            _local_3 = _arg_1.nmldata.name;
                        };
                        _plist = [];
                        _local_4 = 1;
                        for (_local_5 in _local_2.plist)
                        {
                            _local_6 = _local_2.plist[_local_5];
                            if (_local_6.name != _local_3)
                            {
                                _plist[_local_4] = _local_6;
                                this[("di" + _local_4)].source = ResManager.getIconUrl(_local_6.iconCode);
                                this[("dl" + _local_4)].text = _local_6.name;
                                if (++_local_4 >= 5) break;
                            };
                        };
                    };
                    if (_local_2.hasOwnProperty("plistadv"))
                    {
                        _plistAdv = [];
                        for (_local_5 in _local_2.plistadv)
                        {
                            if ((((((!(_local_5 == 1)) && (!(_local_5 == 2))) && (!(_local_5 == 3))) && (!(_local_5 == 4))) && (!(_local_5 == 5)))) break;
                            _local_6 = _local_2.plistadv[_local_5];
                            _plistAdv[_local_5] = _local_6;
                            this[("ci" + _local_5)].source = ResManager.getIconUrl(_local_6.iconCode);
                            this[("cl" + _local_5)].text = _local_6.name;
                            setHMTTimer((_local_6.st / 1000), (_arg_1.now / 1000), _local_5);
                            if (_local_6.ab == 1)
                            {
                                this[("cb" + _local_5)].enabled = true;
                                this[("cb" + _local_5)].label = Language.XLS_PANEL[9];
                            }
                            else
                            {
                                this[("cb" + _local_5)].enabled = false;
                                this[("cb" + _local_5)].label = Language.XLS_PANEL[10];
                            };
                        };
                    };
                    if (_local_2.hasOwnProperty("flagat"))
                    {
                        flagat.text = Language.XLS_PANEL[20].replace("{num}", int(_local_2.flagat));
                    };
                };
                if (_arg_1.hasOwnProperty("lev"))
                {
                    if (_arg_1.lev == 4)
                    {
                        roomLevel = Language.XLS_PANEL[4].replace("{s}", String((int(_arg_1.lev) * 100))).replace("{e}", "∞");
                    }
                    else
                    {
                        if (_arg_1.lev == 3)
                        {
                            roomLevel = Language.XLS_PANEL[4].replace("{s}", "300").replace("{e}", "399");
                        };
                        if (_arg_1.lev == 2)
                        {
                            roomLevel = Language.XLS_PANEL[4].replace("{s}", "200").replace("{e}", "299");
                        };
                        if (_arg_1.lev == 1)
                        {
                            roomLevel = Language.XLS_PANEL[4].replace("{s}", "100").replace("{e}", "199");
                        };
                        if (_arg_1.lev == 0)
                        {
                            roomLevel = Language.XLS_PANEL[4].replace("{s}", "1").replace("{e}", "99");
                        };
                    };
                }
                else
                {
                    roomLevel = Language.XLS_PANEL[8];
                };
                if (_arg_1.hasOwnProperty("awd"))
                {
                    awdBtn.enabled = true;
                };
                if (_arg_1.hasOwnProperty("advdata"))
                {
                    _local_5 = 1;
                    while (_local_5 <= 5)
                    {
                        this[("cb" + _local_5)].enabled = false;
                        _local_5++;
                    };
                    db5.enabled = false;
                    for (_local_5 in _plistAdv)
                    {
                        if (_plistAdv[_local_5].cid == _arg_1.advdata.cid)
                        {
                            this[("cb" + _local_5)].enabled = false;
                            this[("cb" + _local_5)].label = Language.XLS_PANEL[10];
                        };
                    };
                };
                if (_arg_1.hasOwnProperty("nmldata"))
                {
                    _local_7 = _arg_1.nmldata;
                    di5.source = ResManager.getIconUrl(_local_7.iconCode);
                    dl5.text = _local_7.name;
                    setHMTTimer((_local_7.st / 1000), (_arg_1.now / 1000), 6);
                    db5.label = Language.XLS_PANEL[7];
                    db5.enabled = true;
                    _local_5 = 1;
                    while (_local_5 <= 5)
                    {
                        this[("cb" + _local_5)].enabled = false;
                        _local_5++;
                    };
                };
                this.cid = _core.player.id;
            }
            else
            {
                resetHMTUi();
            };
        }

        private function _XiulianshiPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.XLS_PANEL[0];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = roomLevel;
            _local_1 = ResManager.getIconUrl(4130220003340);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.XLS_PANEL[1];
            _local_1 = Language.XLS_PANEL[17];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = ResManager.getIconUrl(4130220003341);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.XLS_PANEL[19];
            _local_1 = Language.XLS_PANEL[2];
        }

        public function set log(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._107332log;
            if (_local_2 !== _arg_1)
            {
                this._107332log = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "log", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ci1():Image
        {
            return (this._98443ci1);
        }

        [Bindable(event="propertyChange")]
        public function get ci2():Image
        {
            return (this._98444ci2);
        }

        [Bindable(event="propertyChange")]
        public function get ci3():Image
        {
            return (this._98445ci3);
        }

        [Bindable(event="propertyChange")]
        public function get ci5():Image
        {
            return (this._98447ci5);
        }

        [Bindable(event="propertyChange")]
        public function get awdBtn():BasicDelayButton
        {
            return (this._1404994418awdBtn);
        }

        public function set di3(_arg_1:Image):void
        {
            var _local_2:Object = this._99406di3;
            if (_local_2 !== _arg_1)
            {
                this._99406di3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "di3", _local_2, _arg_1));
            };
        }

        private function hmtAwradText(_arg_1:*):String
        {
            return ("");
        }

        public function __cb4_click(_arg_1:MouseEvent):void
        {
            enterAdvRoom(4);
        }

        public function set di1(_arg_1:Image):void
        {
            var _local_2:Object = this._99404di1;
            if (_local_2 !== _arg_1)
            {
                this._99404di1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "di1", _local_2, _arg_1));
            };
        }

        public function set di5(_arg_1:Image):void
        {
            var _local_2:Object = this._99408di5;
            if (_local_2 !== _arg_1)
            {
                this._99408di5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "di5", _local_2, _arg_1));
            };
        }

        public function set di2(_arg_1:Image):void
        {
            var _local_2:Object = this._99405di2;
            if (_local_2 !== _arg_1)
            {
                this._99405di2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "di2", _local_2, _arg_1));
            };
        }

        public function set di4(_arg_1:Image):void
        {
            var _local_2:Object = this._99407di4;
            if (_local_2 !== _arg_1)
            {
                this._99407di4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "di4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dl1():Label
        {
            return (this._99497dl1);
        }

        [Bindable(event="propertyChange")]
        public function get dl2():Label
        {
            return (this._99498dl2);
        }

        [Bindable(event="propertyChange")]
        public function get dl5():Label
        {
            return (this._99501dl5);
        }

        [Bindable(event="propertyChange")]
        public function get flagat():Label
        {
            return (this._1272061793flagat);
        }

        [Bindable(event="propertyChange")]
        public function get ci4():Image
        {
            return (this._98446ci4);
        }

        [Bindable(event="propertyChange")]
        public function get dl3():Label
        {
            return (this._99499dl3);
        }

        private function EventUp(f:Function, ... arg):Function
        {
            return (function (_arg_1:Event):*
            {
                f.apply(null, [_arg_1].concat(arg));
            });
        }

        [Bindable(event="propertyChange")]
        public function get dl4():Label
        {
            return (this._99500dl4);
        }

        public function addHMTXLLog(_arg_1:String):void
        {
            _farmLog.push((_arg_1 + "\n"));
            log.htmlText = _farmLog.join();
        }

        private function set roomLevel(_arg_1:String):void
        {
            var _local_2:Object = this._1085375639roomLevel;
            if (_local_2 !== _arg_1)
            {
                this._1085375639roomLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomLevel", _local_2, _arg_1));
            };
        }

        public function __cb1_click(_arg_1:MouseEvent):void
        {
            enterAdvRoom(1);
        }

        public function __db5_click(_arg_1:MouseEvent):void
        {
            enterPubRoom();
        }

        [Bindable(event="propertyChange")]
        public function get cl1():Label
        {
            return (this._98536cl1);
        }

        [Bindable(event="propertyChange")]
        public function get cl2():Label
        {
            return (this._98537cl2);
        }

        [Bindable(event="propertyChange")]
        public function get cl3():Label
        {
            return (this._98538cl3);
        }

        [Bindable(event="propertyChange")]
        public function get cl4():Label
        {
            return (this._98539cl4);
        }

        [Bindable(event="propertyChange")]
        public function get cl5():Label
        {
            return (this._98540cl5);
        }

        private function resetHMTUi():void
        {
            var _local_1:*;
            var _local_2:*;
            _plistAdv = [];
            _plist = [];
            roomLevel = Language.XLS_PANEL[6];
            for (_local_1 in _timerList)
            {
                if (((_timerList[_local_1]) && (_timerList[_local_1].running)))
                {
                    _timerList[_local_1].stop();
                };
            };
            _local_2 = 1;
            while (_local_2 <= 5)
            {
                this[("ci" + _local_2)].source = null;
                this[("cl" + _local_2)].text = "";
                this[("ct" + _local_2)].text = "";
                this[("cb" + _local_2)].enabled = true;
                this[("cb" + _local_2)].label = Language.XLS_PANEL[11];
                _local_2++;
            };
            var _local_3:* = 1;
            while (_local_3 < 6)
            {
                this[("di" + _local_3)].source = null;
                this[("dl" + _local_3)].text = "";
                if (_local_3 == 5)
                {
                    this[("dt" + _local_3)].text = "";
                    this[("db" + _local_3)].label = Language.XLS_PANEL[11];
                    this[("db" + _local_3)].enabled = true;
                };
                _local_3++;
            };
            awdBtn.enabled = false;
            flagat.text = "";
            if (this.cid != _core.player.id)
            {
                _farmLog.clear();
                this.cid = _core.player.id;
            };
        }

        public function set db5(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._99191db5;
            if (_local_2 !== _arg_1)
            {
                this._99191db5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "db5", _local_2, _arg_1));
            };
        }

        private function setHMTTimer(_arg_1:uint, _arg_2:uint, _arg_3:int):void
        {
            var _local_4:Timer;
            var _local_5:*;
            if (!_timerList[_arg_3])
            {
                _local_4 = new Timer(1000);
                _local_5 = (_arg_2 - _arg_1);
                if (_local_5 < 0)
                {
                    _local_5 = 0;
                };
                _timerDTList[_arg_3] = _local_5;
                _local_4.addEventListener(TimerEvent.TIMER, EventUp(changeTimer, _arg_3));
                _local_4.start();
                _timerList[_arg_3] = _local_4;
            }
            else
            {
                _local_4 = _timerList[_arg_3];
                _local_4.stop();
                _local_5 = (_arg_2 - _arg_1);
                if (_local_5 < 0)
                {
                    _local_5 = 0;
                };
                _timerDTList[_arg_3] = _local_5;
                _local_4.start();
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function set ci3(_arg_1:Image):void
        {
            var _local_2:Object = this._98445ci3;
            if (_local_2 !== _arg_1)
            {
                this._98445ci3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ci3", _local_2, _arg_1));
            };
        }

        public function set ci1(_arg_1:Image):void
        {
            var _local_2:Object = this._98443ci1;
            if (_local_2 !== _arg_1)
            {
                this._98443ci1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ci1", _local_2, _arg_1));
            };
        }

        public function set ci5(_arg_1:Image):void
        {
            var _local_2:Object = this._98447ci5;
            if (_local_2 !== _arg_1)
            {
                this._98447ci5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ci5", _local_2, _arg_1));
            };
        }

        public function set ci2(_arg_1:Image):void
        {
            var _local_2:Object = this._98444ci2;
            if (_local_2 !== _arg_1)
            {
                this._98444ci2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ci2", _local_2, _arg_1));
            };
        }

        public function set awdBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1404994418awdBtn;
            if (_local_2 !== _arg_1)
            {
                this._1404994418awdBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awdBtn", _local_2, _arg_1));
            };
        }

        public function set ci4(_arg_1:Image):void
        {
            var _local_2:Object = this._98446ci4;
            if (_local_2 !== _arg_1)
            {
                this._98446ci4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ci4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get log():LinkTextArea
        {
            return (this._107332log);
        }

        private function getXiuLianAward():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("getHMTAward", null);
                };
            };
            Alert.show(Language.XLS_PANEL[12], null, (Alert.YES | Alert.NO), null, func);
        }

        public function set dt5(_arg_1:Label):void
        {
            var _local_2:Object = this._99749dt5;
            if (_local_2 !== _arg_1)
            {
                this._99749dt5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dt5", _local_2, _arg_1));
            };
        }

        public function set flagat(_arg_1:Label):void
        {
            var _local_2:Object = this._1272061793flagat;
            if (_local_2 !== _arg_1)
            {
                this._1272061793flagat = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "flagat", _local_2, _arg_1));
            };
        }

        public function set dl1(_arg_1:Label):void
        {
            var _local_2:Object = this._99497dl1;
            if (_local_2 !== _arg_1)
            {
                this._99497dl1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dl1", _local_2, _arg_1));
            };
        }

        public function set dl2(_arg_1:Label):void
        {
            var _local_2:Object = this._99498dl2;
            if (_local_2 !== _arg_1)
            {
                this._99498dl2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dl2", _local_2, _arg_1));
            };
        }

        public function set dl4(_arg_1:Label):void
        {
            var _local_2:Object = this._99500dl4;
            if (_local_2 !== _arg_1)
            {
                this._99500dl4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dl4", _local_2, _arg_1));
            };
        }

        public function set dl5(_arg_1:Label):void
        {
            var _local_2:Object = this._99501dl5;
            if (_local_2 !== _arg_1)
            {
                this._99501dl5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dl5", _local_2, _arg_1));
            };
        }

        public function __cb3_click(_arg_1:MouseEvent):void
        {
            enterAdvRoom(3);
        }

        public function set cb1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._98226cb1;
            if (_local_2 !== _arg_1)
            {
                this._98226cb1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb1", _local_2, _arg_1));
            };
        }

        public function set dl3(_arg_1:Label):void
        {
            var _local_2:Object = this._99499dl3;
            if (_local_2 !== _arg_1)
            {
                this._99499dl3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dl3", _local_2, _arg_1));
            };
        }

        public function set cb3(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._98228cb3;
            if (_local_2 !== _arg_1)
            {
                this._98228cb3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get roomLevel():String
        {
            return (this._1085375639roomLevel);
        }

        public function set cb4(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._98229cb4;
            if (_local_2 !== _arg_1)
            {
                this._98229cb4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb4", _local_2, _arg_1));
            };
        }

        public function set cb2(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._98227cb2;
            if (_local_2 !== _arg_1)
            {
                this._98227cb2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb2", _local_2, _arg_1));
            };
        }

        public function ___XiulianshiPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            setDefencePets();
        }

        public function changeTimer(_arg_1:TimerEvent, ... _args):*
        {
            var _local_3:* = _args[0];
            var _local_4:* = _timerDTList[_local_3];
            if (_local_4 == null)
            {
                _local_4 = 0;
            };
            _timerDTList[_local_3] = (_local_4 + 1);
            var _local_5:* = TimeUtil.secToTime(_local_4);
            if (_local_3 == 6)
            {
                dt5.text = _local_5;
            }
            else
            {
                this[("ct" + _local_3)].text = _local_5;
            };
        }

        [Bindable(event="propertyChange")]
        public function get db5():BasicDelayButton
        {
            return (this._99191db5);
        }

        public function set cb5(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._98230cb5;
            if (_local_2 !== _arg_1)
            {
                this._98230cb5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cb5", _local_2, _arg_1));
            };
        }

        public function __log_updateComplete(_arg_1:FlexEvent):void
        {
            canvas1_updateCompleteHandler();
        }

        private function enterPubRoom():void
        {
            var func:Function;
            if (db5.label == Language.XLS_PANEL[7])
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("endHMTXLRoom", null, 1);
                    };
                };
                _alert = Alert.show(Language.XLS_PANEL[15], null, (Alert.YES | Alert.NO), null, func);
            };
            if (db5.label == Language.XLS_PANEL[11])
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("enterPubRoom", null);
                    };
                };
                _alert = Alert.show(Language.XLS_PANEL[14], null, (Alert.YES | Alert.NO), null, func);
            };
        }

        override public function initialize():void
        {
            var target:XiulianshiPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _XiulianshiPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_XiulianshiPanelWatcherSetupUtil");
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
        public function get dt5():Label
        {
            return (this._99749dt5);
        }

        private function _XiulianshiPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XLS_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiulianshiPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_XiulianshiPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiulianshiPanel_Label1.filters = _arg_1;
            }, "_XiulianshiPanel_Label1.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = roomLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiulianshiPanel_Label1.text = _arg_1;
            }, "_XiulianshiPanel_Label1.text");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003340));
            }, function (_arg_1:Object):void
            {
                _XiulianshiPanel_Image1.source = _arg_1;
            }, "_XiulianshiPanel_Image1.source");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                flagat.filters = _arg_1;
            }, "flagat.filters");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiulianshiPanel_Label3.filters = _arg_1;
            }, "_XiulianshiPanel_Label3.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XLS_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiulianshiPanel_BasicDelayButton1.label = _arg_1;
            }, "_XiulianshiPanel_BasicDelayButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XLS_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiulianshiPanel_Label4.text = _arg_1;
            }, "_XiulianshiPanel_Label4.text");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiulianshiPanel_Label4.filters = _arg_1;
            }, "_XiulianshiPanel_Label4.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ct1.filters = _arg_1;
            }, "ct1.filters");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ct2.filters = _arg_1;
            }, "ct2.filters");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ct3.filters = _arg_1;
            }, "ct3.filters");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ct4.filters = _arg_1;
            }, "ct4.filters");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ct5.filters = _arg_1;
            }, "ct5.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                cl1.filters = _arg_1;
            }, "cl1.filters");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                cl2.filters = _arg_1;
            }, "cl2.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                cl3.filters = _arg_1;
            }, "cl3.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                cl4.filters = _arg_1;
            }, "cl4.filters");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                cl5.filters = _arg_1;
            }, "cl5.filters");
            result[18] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003341));
            }, function (_arg_1:Object):void
            {
                _XiulianshiPanel_Image7.source = _arg_1;
            }, "_XiulianshiPanel_Image7.source");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiulianshiPanel_Label15.filters = _arg_1;
            }, "_XiulianshiPanel_Label15.filters");
            result[20] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                dl1.filters = _arg_1;
            }, "dl1.filters");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                dl2.filters = _arg_1;
            }, "dl2.filters");
            result[22] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                dl3.filters = _arg_1;
            }, "dl3.filters");
            result[23] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                dl4.filters = _arg_1;
            }, "dl4.filters");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                dl5.filters = _arg_1;
            }, "dl5.filters");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                dt5.filters = _arg_1;
            }, "dt5.filters");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XLS_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiulianshiPanel_IntroText1.htmlText = _arg_1;
            }, "_XiulianshiPanel_IntroText1.htmlText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XLS_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awdBtn.label = _arg_1;
            }, "awdBtn.label");
            result[28] = binding;
            return (result);
        }

        public function set canvas1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._550778329canvas1;
            if (_local_2 !== _arg_1)
            {
                this._550778329canvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cb3():BasicDelayButton
        {
            return (this._98228cb3);
        }

        [Bindable(event="propertyChange")]
        public function get cb4():BasicDelayButton
        {
            return (this._98229cb4);
        }

        [Bindable(event="propertyChange")]
        public function get cb5():BasicDelayButton
        {
            return (this._98230cb5);
        }

        [Bindable(event="propertyChange")]
        public function get cb1():BasicDelayButton
        {
            return (this._98226cb1);
        }

        [Bindable(event="propertyChange")]
        public function get cb2():BasicDelayButton
        {
            return (this._98227cb2);
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

        public function set ct5(_arg_1:Label):void
        {
            var _local_2:Object = this._98788ct5;
            if (_local_2 !== _arg_1)
            {
                this._98788ct5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct5", _local_2, _arg_1));
            };
        }

        public function set cl1(_arg_1:Label):void
        {
            var _local_2:Object = this._98536cl1;
            if (_local_2 !== _arg_1)
            {
                this._98536cl1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cl1", _local_2, _arg_1));
            };
        }

        public function set cl2(_arg_1:Label):void
        {
            var _local_2:Object = this._98537cl2;
            if (_local_2 !== _arg_1)
            {
                this._98537cl2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cl2", _local_2, _arg_1));
            };
        }

        public function set cl3(_arg_1:Label):void
        {
            var _local_2:Object = this._98538cl3;
            if (_local_2 !== _arg_1)
            {
                this._98538cl3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cl3", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("getHMTXLSData", null);
        }

        public function set cl5(_arg_1:Label):void
        {
            var _local_2:Object = this._98540cl5;
            if (_local_2 !== _arg_1)
            {
                this._98540cl5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cl5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvas1():Canvas
        {
            return (this._550778329canvas1);
        }

        public function set cl4(_arg_1:Label):void
        {
            var _local_2:Object = this._98539cl4;
            if (_local_2 !== _arg_1)
            {
                this._98539cl4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cl4", _local_2, _arg_1));
            };
        }

        public function __cb5_click(_arg_1:MouseEvent):void
        {
            enterAdvRoom(5);
        }

        [Bindable(event="propertyChange")]
        public function get ct1():Label
        {
            return (this._98784ct1);
        }

        [Bindable(event="propertyChange")]
        public function get ct2():Label
        {
            return (this._98785ct2);
        }

        private function setDefencePets():void
        {
            var _local_2:String;
            var _local_3:Object;
            var _local_1:Boolean;
            for (_local_2 in _core.player.petList)
            {
                _local_1 = true;
                break;
            };
            if (_local_1)
            {
                _local_3 = _core.view.getUI(ViewManager.PANEL_PETFIGHT_CONF);
                _local_3.visible = (!(_local_3.visible));
                _local_3.petCrossConf = {
                    "f":false,
                    "t":false
                };
                _local_3.isXiulianshi = true;
            }
            else
            {
                Alert.show(Language.XLS_PANEL[3]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get ct4():Label
        {
            return (this._98787ct4);
        }

        [Bindable(event="propertyChange")]
        public function get ct5():Label
        {
            return (this._98788ct5);
        }

        private function canvas1_updateCompleteHandler():void
        {
            log.verticalScrollPosition = log.maxVerticalScrollPosition;
        }

        [Bindable(event="propertyChange")]
        public function get ct3():Label
        {
            return (this._98786ct3);
        }


    }
}//package com.qeedoo.ui.view.compDragable

