// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CardGamePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.Canvas;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import com.qeedoo.game.view.ViewManager;
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

    public class CardGamePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _image4X:Number = 301;
        private var _676567394typeLab1:Label;
        private var _676567392typeLab3:Label;
        private var _now:Number = 0;
        private var _1012459193oneLab:Label;
        private var _676567390typeLab5:Label;
        private var _94431009card1:Image;
        private var _image5X:Number = 398;
        private var _1455232140changeBtn:Button;
        public var _CardGamePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _860703839twoLab:Label;
        private var _106893lab:Label;
        private var _changeTime:Number = 0;
        private var _1491692172soulLabNum:Label;
        private var _num1:Number = -1;
        private var _num2:Number = -1;
        private var _num3:Number = -1;
        private var _num4:Number = -1;
        private var _num5:Number = -1;
        private var _alert:Alert;
        private var _94431011card3:Image;
        private var _1414633127addPlayBtn:BasicGlowButton;
        private var s:Number = 0;
        private var PM_UP_TIMES:Number = 5;
        private var _mMax:Number = 10;
        private var _2022077798soulLab:Label;
        private var _676835138typeCan4:Canvas;
        private var _ready:Boolean = false;
        private var _676835141typeCan1:Canvas;
        private var _454209194mainBackImag:Image;
        private var _676835136typeCan6:Canvas;
        private var _max:Number = 5;
        private var _676835134typeCan8:Canvas;
        private var _imageWidth:Number = 96;
        private var _1473722127threeLab:Label;
        private var _676567388typeLab7:Label;
        private var _676567386typeLab9:Label;
        private var _94431012card4:Image;
        private var _676567393typeLab2:Label;
        private var _676567391typeLab4:Label;
        private var _helpAlert:Alert;
        private var _flag2:Boolean = true;
        private var _flag4:Boolean = true;
        private var _flag3:Boolean = true;
        private var _flag1:Boolean = true;
        private var _flag5:Boolean = true;
        public var _CardGamePanel_LinkButton1:LinkButton;
        public var _CardGamePanel_LinkButton2:LinkButton;
        private var _174674056cardCanvas:Canvas;
        private var _1672591068changeLabel:Label;
        private var _676835139typeCan3:Canvas;
        private var _676835133typeCan9:Canvas;
        private var _3313732lab1:Label;
        private var _image1X:Number = 10;
        private var _676835140typeCan2:Canvas;
        private var _676835137typeCan5:Canvas;
        private var _94431013card5:Image;
        private var _indexType:Number = 8;
        private var _676835135typeCan7:Canvas;
        public var _CardGamePanel_Label9:Label;
        private var _image2X:Number = 107;
        private var _94431010card2:Image;
        private var _1316769434startBtn:Button;
        private var _image3X:Number = 204;
        private var _676567389typeLab6:Label;
        private var _1621978433awardBtn:Button;
        private var _676567387typeLab8:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":628,
                    "height":429,
                    "creationPolicy":"all",
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_CardGamePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cardCanvas",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "solid";
                            this.backgroundImage = "";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":117,
                                "y":39,
                                "width":501,
                                "height":372,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "styleName":"txtArea",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"mainBackImag",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":501,
                                            "height":372
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"startBtn",
                                    "events":{"click":"__startBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":199.5,
                                            "y":302,
                                            "width":100.5,
                                            "height":32,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"changeLabel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":199.5,
                                            "y":340,
                                            "width":126,
                                            "height":21
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"threeLab",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":177.5,
                                            "y":271,
                                            "width":192.5,
                                            "height":24
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"changeBtn",
                                    "events":{"click":"__changeBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":124.5,
                                            "y":302,
                                            "width":108,
                                            "height":32,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"awardBtn",
                                    "events":{"click":"__awardBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":269.5,
                                            "y":302,
                                            "width":100.5,
                                            "height":32,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lab1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16187149;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":325,
                                            "y":340,
                                            "width":123,
                                            "height":17
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"soulLab",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16187149;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":340,
                                            "width":44,
                                            "height":17
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"soulLabNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":38,
                                            "y":340,
                                            "width":123,
                                            "height":17
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lab",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":408,
                                            "y":340,
                                            "width":123,
                                            "height":17
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"addPlayBtn",
                                    "events":{"click":"__addPlayBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":446,
                                            "y":338,
                                            "styleName":"CrystalYellowButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"twoLab",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 24;
                                        this.color = 0xFFFF;
                                        this.top = "69";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"",
                                            "width":179,
                                            "height":30,
                                            "x":220
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"card1",
                                    "events":{"click":"__card1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":8,
                                            "y":123,
                                            "width":96,
                                            "height":140,
                                            "buttonMode":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"card2",
                                    "events":{"click":"__card2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":105,
                                            "y":123,
                                            "width":96,
                                            "height":140,
                                            "buttonMode":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"card3",
                                    "events":{"click":"__card3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":202,
                                            "y":123,
                                            "width":96,
                                            "height":140,
                                            "buttonMode":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"card4",
                                    "events":{"click":"__card4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":299,
                                            "y":123,
                                            "width":96,
                                            "height":140,
                                            "buttonMode":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"card5",
                                    "events":{"click":"__card5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":396,
                                            "y":123,
                                            "width":96,
                                            "height":140,
                                            "buttonMode":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_CardGamePanel_LinkButton1",
                                    "events":{"click":"___CardGamePanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15863835;
                                        this.textDecoration = "underline";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":427,
                                            "y":8,
                                            "width":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"oneLab",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 24;
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"",
                                            "width":179,
                                            "height":30,
                                            "x":220,
                                            "y":33.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_CardGamePanel_LinkButton2",
                                    "events":{"click":"___CardGamePanel_LinkButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textDecoration = "underline";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":78,
                                            "y":338,
                                            "x":100
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "solid";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":39,
                                "width":99,
                                "height":367,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "styleName":"txtArea",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":98,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_CardGamePanel_Label9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":8,
                                                        "styleName":"LabelTitle"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "32";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan1",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":37,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":93,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan2",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":74,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "width":81,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan3",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":111,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "width":81,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan4",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":148,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "width":81,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan5",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":185,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "width":81,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan6",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":224,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "width":81,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan7",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":259,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "width":81,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan8",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":298,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "width":81,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                    this.right = "3";
                                                    this.top = "33";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"height":5});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"typeCan9",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":333,
                                            "width":95,
                                            "height":35,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"typeLab9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontWeight = "normal";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "width":81,
                                                        "height":35
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
        private var _timer:Timer = new Timer(20);
        private var _resObj:Object = {
            "0":3130090000047,
            "1":3130090000048,
            "2":3130090000049,
            "3":3130090000050,
            "4":3130090000051,
            "5":3130090000052,
            "6":3130090000053,
            "7":3130090000044,
            "8":3130090000045,
            "9":3130090000046
        };
        private var _cardImage:Array = new Array();
        private var _CARD_AWARD:Object = {
            "1":{
                "p":144000,
                "name":"Thùng 5 lá"
            },
            "2":{
                "p":90000,
                "name":"Sảnh 5 lá"
            },
            "3":{
                "p":54000,
                "name":"Tứ quý"
            },
            "4":{
                "p":30000,
                "name":"Cù lũ"
            },
            "5":{
                "p":18000,
                "name":"Sảnh 4 lá "
            },
            "6":{
                "p":12000,
                "name":"Thùng 3 lá"
            },
            "7":{
                "p":7200,
                "name":"2 đôi"
            },
            "8":{
                "p":3600,
                "name":"1 đôi"
            },
            "9":{
                "p":600,
                "name":"Không"
            }
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CardGamePanel()
        {
            mx_internal::_document = this;
            this.width = 628;
            this.height = 429;
            this.styleName = "StandardContent";
            this.creationPolicy = "all";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___CardGamePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CardGamePanel._watcherSetupUtil = _arg_1;
        }


        private function onInitCardPanel(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:Number;
            var _local_4:Array;
            var _local_5:*;
            if (_arg_1)
            {
                _local_2 = 1;
                while (_local_2 <= 9)
                {
                    _local_3 = Math.ceil(((Number(_CARD_AWARD[_local_2].p) * (1 + ((Number(_core.player.level) - 60) * 0.0125))) / 2));
                    if (_core.MC_BIRTH_FLAG[100])
                    {
                        _local_3 = Math.ceil((_local_3 * _core.MC_BIRTH_FLAG[100]));
                    };
                    this[("typeLab" + _local_2)].text = Language.CARD_GAME_P[13].toString().replace("{typeName}", _CARD_AWARD[_local_2].name).replace("{point}", _local_3);
                    _local_2++;
                };
                if (_arg_1.flag)
                {
                    _num1 = -1;
                    _num2 = -1;
                    _num3 = -1;
                    _num4 = -1;
                    _num5 = -1;
                    _max = _arg_1.max;
                    _now = _arg_1.now;
                    _ready = false;
                    this.lab.text = ((_now + "/") + _max);
                    this.changeLabel.htmlText = Language.CARD_GAME_P[5].toString().replace("{num}", 0);
                    this.oneLab.text = Language.CARD_GAME_P[11].toString().replace("{name}", "Không");
                    this.twoLab.text = Language.CARD_GAME_P[12].toString().replace("{num}", "Không");
                    this.card1.source = _cardImage[0];
                    this.card2.source = _cardImage[0];
                    this.card3.source = _cardImage[0];
                    this.card4.source = _cardImage[0];
                    this.card5.source = _cardImage[0];
                    this.changeBtn.visible = false;
                    this.awardBtn.visible = false;
                    this.startBtn.visible = true;
                    if (ToolKit.isBigOrEqual(_now, _max))
                    {
                        this.startBtn.enabled = false;
                    }
                    else
                    {
                        this.startBtn.enabled = true;
                    };
                    this.threeLab.htmlText = Language.CARD_GAME_P[7].toString();
                    _local_2 = 1;
                    while (_local_2 <= 9)
                    {
                        _local_3 = Math.ceil(((Number(_CARD_AWARD[_local_2].p) * (1 + ((Number(_core.player.level) - 60) * 0.0125))) / 2));
                        if (_core.MC_BIRTH_FLAG[100])
                        {
                            _local_3 = Math.ceil((_local_3 * _core.MC_BIRTH_FLAG[100]));
                        };
                        this[("typeLab" + _local_2)].text = Language.CARD_GAME_P[13].toString().replace("{typeName}", _CARD_AWARD[_local_2].name).replace("{point}", _local_3);
                        _local_2++;
                    };
                    _local_2 = 1;
                    while (_local_2 <= 5)
                    {
                        this[("card" + _local_2)].buttonMode = false;
                        _local_2++;
                    };
                    this.visible = true;
                }
                else
                {
                    _max = _arg_1.max;
                    _now = _arg_1.now;
                    this.lab.text = ((_now + "/") + _max);
                    this["_flag1"] = false;
                    this["_flag2"] = false;
                    this["_flag3"] = false;
                    this["_flag4"] = false;
                    this["_flag5"] = false;
                    _num1 = _arg_1.s1;
                    _num2 = _arg_1.s2;
                    _num3 = _arg_1.s3;
                    _num4 = _arg_1.s4;
                    _num5 = _arg_1.s5;
                    this._changeTime = _arg_1.changeTime;
                    this.card1.source = _cardImage[_num1];
                    this.card2.source = _cardImage[_num2];
                    this.card3.source = _cardImage[_num3];
                    this.card4.source = _cardImage[_num4];
                    this.card5.source = _cardImage[_num5];
                    this.changeBtn.visible = true;
                    this.awardBtn.visible = true;
                    this.startBtn.visible = false;
                    this.changeLabel.htmlText = Language.CARD_GAME_P[5].toString().replace("{num}", (this._changeTime * 5));
                    _local_4 = new Array();
                    _local_4.push(_num1);
                    _local_4.push(_num2);
                    _local_4.push(_num3);
                    _local_4.push(_num4);
                    _local_4.push(_num5);
                    _local_5 = getCardAwardType(_local_4);
                    this.oneLab.text = Language.CARD_GAME_P[11].toString().replace("{name}", this._CARD_AWARD[_local_5].name);
                    _local_3 = Math.ceil(((Number(_CARD_AWARD[_local_5].p) * (1 + ((Number(_core.player.level) - 60) * 0.0125))) / 2));
                    if (_core.MC_BIRTH_FLAG[100])
                    {
                        _local_3 = Math.ceil((_local_3 * _core.MC_BIRTH_FLAG[100]));
                    };
                    this.twoLab.text = Language.CARD_GAME_P[12].toString().replace("{num}", _local_3);
                    _ready = true;
                    this.threeLab.htmlText = Language.CARD_GAME_P[6].toString();
                    _local_2 = 1;
                    while (_local_2 <= 9)
                    {
                        _local_3 = Math.ceil(((Number(_CARD_AWARD[_local_2].p) * (1 + ((Number(_core.player.level) - 60) * 0.0125))) / 2));
                        if (_core.MC_BIRTH_FLAG[100])
                        {
                            _local_3 = Math.ceil((_local_3 * _core.MC_BIRTH_FLAG[100]));
                        };
                        this[("typeLab" + _local_2)].text = Language.CARD_GAME_P[13].toString().replace("{typeName}", _CARD_AWARD[_local_2].name).replace("{point}", _local_3);
                        _local_2++;
                    };
                    _local_2 = 1;
                    while (_local_2 <= 5)
                    {
                        this[("card" + _local_2)].buttonMode = true;
                        _local_2++;
                    };
                    this.visible = true;
                };
            };
        }

        public function __card5_click(_arg_1:MouseEvent):void
        {
            overTurnCard(5);
        }

        public function set threeLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1473722127threeLab;
            if (_local_2 !== _arg_1)
            {
                this._1473722127threeLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "threeLab", _local_2, _arg_1));
            };
        }

        public function overTurnCard(_arg_1:Number):void
        {
            if (((!(_ready)) || (_timer.running)))
            {
                return;
            };
            var _local_2:Array = new Array();
            if (this[("_flag" + _arg_1)])
            {
                this[("_flag" + _arg_1)] = false;
            }
            else
            {
                this[("_flag" + _arg_1)] = true;
            };
            var _local_3:* = {
                "index":_arg_1,
                "flag":this[("_flag" + _arg_1)],
                "num":this[("_num" + _arg_1)]
            };
            _local_2.push(_local_3);
            overTurnCardTimer(_local_2);
        }

        public function __changeBtn_click(_arg_1:MouseEvent):void
        {
            chageCard();
        }

        public function set card4(_arg_1:Image):void
        {
            var _local_2:Object = this._94431012card4;
            if (_local_2 !== _arg_1)
            {
                this._94431012card4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "card4", _local_2, _arg_1));
            };
        }

        public function set card1(_arg_1:Image):void
        {
            var _local_2:Object = this._94431009card1;
            if (_local_2 !== _arg_1)
            {
                this._94431009card1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "card1", _local_2, _arg_1));
            };
        }

        public function set changeLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1672591068changeLabel;
            if (_local_2 !== _arg_1)
            {
                this._1672591068changeLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeLabel", _local_2, _arg_1));
            };
        }

        private function getCardAwardType(_arg_1:Array):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:Number;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:Array;
            var _local_11:*;
            var _local_12:*;
            _arg_1.sort();
            var _local_2:Object = new Object();
            for (_local_3 in _arg_1)
            {
                if (_arg_1[_local_3])
                {
                    _local_6 = 1;
                    for (_local_7 in _arg_1)
                    {
                        if (((Number(_arg_1[_local_3]) == Number(_arg_1[_local_7])) && (!(_local_3 == _local_7))))
                        {
                            _local_6++;
                        };
                    };
                    _local_2[_arg_1[_local_3]] = _local_6;
                };
            };
            _local_4 = 0;
            for (_local_3 in _local_2)
            {
                if (_local_2[_local_3])
                {
                    _local_4++;
                };
            };
            _local_5 = 9;
            switch (_local_4)
            {
                case 1:
                    _local_5 = 1;
                    break;
                case 2:
                    _local_8 = false;
                    for (_local_3 in _local_2)
                    {
                        if (((_local_2[_local_3]) && (Number(_local_2[_local_3]) == 4)))
                        {
                            _local_8 = true;
                        };
                    };
                    if (_local_8)
                    {
                        _local_5 = 3;
                    }
                    else
                    {
                        _local_5 = 4;
                    };
                    break;
                case 3:
                    _local_8 = false;
                    for (_local_3 in _local_2)
                    {
                        if (((_local_2[_local_3]) && (Number(_local_2[_local_3]) == 3)))
                        {
                            _local_8 = true;
                        };
                    };
                    if (_local_8)
                    {
                        _local_5 = 6;
                    }
                    else
                    {
                        _local_5 = 7;
                    };
                    break;
                case 4:
                    _local_8 = true;
                    _local_9 = 0;
                    _local_10 = new Array();
                    for (_local_3 in _local_2)
                    {
                        if (_local_2[_local_3])
                        {
                            _local_10.push(_local_3);
                        };
                    };
                    _local_10.sort();
                    for (_local_3 in _local_10)
                    {
                        if (_local_10[_local_3])
                        {
                            if (_local_9 == 0)
                            {
                                _local_9 = _local_10[_local_3];
                            }
                            else
                            {
                                if (ToolKit.isEqual(ToolKit.minus(_local_10[_local_3], _local_9), 1))
                                {
                                    _local_9 = _local_10[_local_3];
                                }
                                else
                                {
                                    if (!ToolKit.isEqual(ToolKit.minus(_local_10[_local_3], _local_9), 1))
                                    {
                                        _local_8 = false;
                                        break;
                                    };
                                };
                            };
                        };
                    };
                    if (_local_8)
                    {
                        _local_5 = 5;
                    }
                    else
                    {
                        _local_5 = 8;
                    };
                    break;
                case 5:
                    _local_11 = false;
                    _local_12 = false;
                    if (((ToolKit.isEqual(ToolKit.minus(_arg_1[3], _arg_1[0]), 3)) || (ToolKit.isEqual(ToolKit.minus(_arg_1[4], _arg_1[1]), 3))))
                    {
                        _local_12 = true;
                    };
                    if (ToolKit.isEqual(ToolKit.minus(_arg_1[4], _arg_1[0]), 4))
                    {
                        _local_11 = true;
                    };
                    if (_local_11)
                    {
                        _local_5 = 2;
                    }
                    else
                    {
                        if (_local_12)
                        {
                            _local_5 = 5;
                        }
                        else
                        {
                            _local_5 = 9;
                        };
                    };
                    break;
            };
            _local_3 = 1;
            while (_local_3 <= 9)
            {
                this[("typeCan" + _local_3)].clearStyle("backgroundColor");
                this[("typeLab" + _local_3)].setStyle("color", "#FFFFFF");
                _local_3++;
            };
            this[("typeCan" + _local_5)].setStyle("backgroundColor", "0x7FCDFE");
            this[("typeLab" + _local_5)].setStyle("color", "#0x2B333C");
            return (_local_5);
        }

        public function __card2_click(_arg_1:MouseEvent):void
        {
            overTurnCard(2);
        }

        public function set card2(_arg_1:Image):void
        {
            var _local_2:Object = this._94431010card2;
            if (_local_2 !== _arg_1)
            {
                this._94431010card2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "card2", _local_2, _arg_1));
            };
        }

        public function set card3(_arg_1:Image):void
        {
            var _local_2:Object = this._94431011card3;
            if (_local_2 !== _arg_1)
            {
                this._94431011card3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "card3", _local_2, _arg_1));
            };
        }

        public function ___CardGamePanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            gotosoul();
        }

        public function set card5(_arg_1:Image):void
        {
            var _local_2:Object = this._94431013card5;
            if (_local_2 !== _arg_1)
            {
                this._94431013card5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "card5", _local_2, _arg_1));
            };
        }

        private function onStartGame(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:*;
            var _local_5:Number;
            var _local_6:*;
            var _local_7:*;
            if (_arg_1)
            {
                this.threeLab.htmlText = Language.CARD_GAME_P[6].toString();
                _ready = true;
                this["_flag1"] = false;
                this["_flag2"] = false;
                this["_flag3"] = false;
                this["_flag4"] = false;
                this["_flag5"] = false;
                this.changeBtn.visible = true;
                this.awardBtn.visible = true;
                _now = _arg_1.useTime;
                this.lab.text = ((_now + "/") + _max);
                this._changeTime = _arg_1.changeTime;
                _local_2 = new Array();
                if (_arg_1.s1)
                {
                    _local_7 = {
                        "index":1,
                        "flag":this["_flag1"],
                        "num":Number(_arg_1.s1)
                    };
                    _num1 = _arg_1.s1;
                    _local_2.push(_local_7);
                };
                if (_arg_1.s2)
                {
                    _local_7 = {
                        "index":2,
                        "flag":this["_flag2"],
                        "num":Number(_arg_1.s2)
                    };
                    _num2 = _arg_1.s2;
                    _local_2.push(_local_7);
                };
                if (_arg_1.s3)
                {
                    _local_7 = {
                        "index":3,
                        "flag":this["_flag3"],
                        "num":Number(_arg_1.s3)
                    };
                    _num3 = _arg_1.s3;
                    _local_2.push(_local_7);
                };
                if (_arg_1.s4)
                {
                    _local_7 = {
                        "index":4,
                        "flag":this["_flag4"],
                        "num":Number(_arg_1.s4)
                    };
                    _num4 = _arg_1.s4;
                    _local_2.push(_local_7);
                };
                if (_arg_1.s5)
                {
                    _local_7 = {
                        "index":5,
                        "flag":this["_flag5"],
                        "num":Number(_arg_1.s5)
                    };
                    _num5 = _arg_1.s5;
                    _local_2.push(_local_7);
                };
                this.changeLabel.htmlText = Language.CARD_GAME_P[5].toString().replace("{num}", 0);
                _local_3 = new Array();
                _local_3.push(_num1);
                _local_3.push(_num2);
                _local_3.push(_num3);
                _local_3.push(_num4);
                _local_3.push(_num5);
                _local_4 = getCardAwardType(_local_3);
                this.oneLab.text = Language.CARD_GAME_P[11].toString().replace("{name}", this._CARD_AWARD[_local_4].name);
                _local_5 = Math.ceil(((Number(_CARD_AWARD[_local_4].p) * (1 + ((Number(_core.player.level) - 60) * 0.0125))) / 2));
                if (_core.MC_BIRTH_FLAG[100])
                {
                    _local_5 = Math.ceil((_local_5 * _core.MC_BIRTH_FLAG[100]));
                };
                this.twoLab.text = Language.CARD_GAME_P[12].toString().replace("{num}", _local_5);
                overTurnCardTimer(_local_2);
                _local_6 = 1;
                while (_local_6 <= 5)
                {
                    this[("card" + _local_6)].buttonMode = true;
                    _local_6++;
                };
            }
            else
            {
                _local_6 = 1;
                while (_local_6 <= 5)
                {
                    this[("card" + _local_6)].buttonMode = false;
                    _local_6++;
                };
                this.startBtn.visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab1():Label
        {
            return (this._3313732lab1);
        }

        private function _CardGamePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CARD_GAME_P[14];
            _local_1 = Language.CARD_GAME_P[10];
            _local_1 = Language.CARD_GAME_P[8];
            _local_1 = Language.CARD_GAME_P[9];
            _local_1 = Language.CARD_GAME_P[1];
            _local_1 = Language.CARD_GAME_P[23];
            _local_1 = Language.CARD_GAME_P[22];
            _local_1 = Language.CARD_GAME_P[23];
            _local_1 = _core.player.soulPnt;
            _local_1 = Language.CARD_GAME_P[23];
            _local_1 = ((_now + "/") + _max);
            _local_1 = Language.CARD_GAME_P[2];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.CARD_GAME_P[19];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.PET_SOUL_PANEL[2];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.CARD_GAME_P[18];
        }

        public function getCardAward():void
        {
            var handler:Function;
            if (!_ready)
            {
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("getCardAward", new Responder(onGetCardAward));
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.CARD_GAME_P[16].toString();
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        private function onAddPlayTime(_arg_1:Number):void
        {
            addPlayBtn.enabled = true;
            if (_arg_1)
            {
                _max = _arg_1;
                this.lab.text = ((_now + "/") + _max);
                if (ToolKit.isBigOrEqual(_now, _max))
                {
                    this.startBtn.enabled = false;
                }
                else
                {
                    this.startBtn.enabled = true;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get cardCanvas():Canvas
        {
            return (this._174674056cardCanvas);
        }

        public function set lab1(_arg_1:Label):void
        {
            var _local_2:Object = this._3313732lab1;
            if (_local_2 !== _arg_1)
            {
                this._3313732lab1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab1", _local_2, _arg_1));
            };
        }

        public function set oneLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1012459193oneLab;
            if (_local_2 !== _arg_1)
            {
                this._1012459193oneLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneLab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get typeLab1():Label
        {
            return (this._676567394typeLab1);
        }

        [Bindable(event="propertyChange")]
        public function get typeLab3():Label
        {
            return (this._676567392typeLab3);
        }

        [Bindable(event="propertyChange")]
        public function get soulLab():Label
        {
            return (this._2022077798soulLab);
        }

        [Bindable(event="propertyChange")]
        public function get typeLab5():Label
        {
            return (this._676567390typeLab5);
        }

        [Bindable(event="propertyChange")]
        public function get typeLab2():Label
        {
            return (this._676567393typeLab2);
        }

        [Bindable(event="propertyChange")]
        public function get addPlayBtn():BasicGlowButton
        {
            return (this._1414633127addPlayBtn);
        }

        public function ___CardGamePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get startBtn():Button
        {
            return (this._1316769434startBtn);
        }

        public function chageCard():void
        {
            var handler:Function;
            var str:String;
            var tf:IUITextField;
            if (!_ready)
            {
                return;
            };
            if ((((((!(_flag1)) && (!(_flag2))) && (!(_flag3))) && (!(_flag5))) && (!(_flag4))))
            {
                _core.sysMidNote(Language.CARD_GAME_P[21]);
                return;
            };
            if (((Number(_changeTime)) && (Number(_changeTime) > 0)))
            {
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        if (!changeBtn.enabled)
                        {
                            return;
                        };
                        changeBtn.enabled = false;
                        _core.remote.call("changeCard", new Responder(onChageCard), _flag1, _flag2, _flag3, _flag4, _flag5);
                    };
                };
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                str = Language.CARD_GAME_P[4].toString().replace("{num}", (_changeTime * 5));
                _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = str;
                tf.filters = GamePredef.FILTER_TEXT1;
            }
            else
            {
                changeBtn.enabled = false;
                _core.remote.call("changeCard", new Responder(onChageCard), _flag1, _flag2, _flag3, _flag4, _flag5);
            };
        }

        [Bindable(event="propertyChange")]
        public function get typeLab7():Label
        {
            return (this._676567388typeLab7);
        }

        [Bindable(event="propertyChange")]
        public function get typeLab9():Label
        {
            return (this._676567386typeLab9);
        }

        [Bindable(event="propertyChange")]
        public function get changeBtn():Button
        {
            return (this._1455232140changeBtn);
        }

        [Bindable(event="propertyChange")]
        public function get typeLab4():Label
        {
            return (this._676567391typeLab4);
        }

        [Bindable(event="propertyChange")]
        public function get mainBackImag():Image
        {
            return (this._454209194mainBackImag);
        }

        [Bindable(event="propertyChange")]
        public function get soulLabNum():Label
        {
            return (this._1491692172soulLabNum);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan1():Canvas
        {
            return (this._676835141typeCan1);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan2():Canvas
        {
            return (this._676835140typeCan2);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan4():Canvas
        {
            return (this._676835138typeCan4);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn():Button
        {
            return (this._1621978433awardBtn);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan6():Canvas
        {
            return (this._676835136typeCan6);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan7():Canvas
        {
            return (this._676835135typeCan7);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan8():Canvas
        {
            return (this._676835134typeCan8);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan9():Canvas
        {
            return (this._676835133typeCan9);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan3():Canvas
        {
            return (this._676835139typeCan3);
        }

        [Bindable(event="propertyChange")]
        public function get typeLab6():Label
        {
            return (this._676567389typeLab6);
        }

        [Bindable(event="propertyChange")]
        public function get typeCan5():Canvas
        {
            return (this._676835137typeCan5);
        }

        [Bindable(event="propertyChange")]
        public function get typeLab8():Label
        {
            return (this._676567387typeLab8);
        }

        public function __card4_click(_arg_1:MouseEvent):void
        {
            overTurnCard(4);
        }

        public function initPanel():void
        {
            if (_core.cid)
            {
                _core.remote.call("initCardPlayPanel", new Responder(onInitCardPanel));
            };
        }

        public function __card1_click(_arg_1:MouseEvent):void
        {
            overTurnCard(1);
        }

        [Bindable(event="propertyChange")]
        public function get threeLab():Label
        {
            return (this._1473722127threeLab);
        }

        private function init():void
        {
            var _local_1:* = 1;
            while (_local_1 <= 9)
            {
                this[("typeLab" + _local_1)].text = Language.CARD_GAME_P[13].toString().replace("{typeName}", _CARD_AWARD[_local_1].name).replace("{point}", _CARD_AWARD[_local_1].p);
                if (_core.MC_BIRTH_FLAG[100])
                {
                    this[("typeLab" + _local_1)].text = Language.CARD_GAME_P[13].toString().replace("{typeName}", _CARD_AWARD[_local_1].name).replace("{point}", Math.ceil((_CARD_AWARD[_local_1].p * _core.MC_BIRTH_FLAG[100])));
                };
                _local_1++;
            };
            mainBackImag.source = ResManager.getIconUrl(parseInt("4130090100019"));
            _cardImage.push(ResManager.hash(ResManager.getIconUrlNoHash(parseInt(_resObj[0].toString()))));
            _cardImage.push(ResManager.hash(ResManager.getIconUrlNoHash(parseInt(_resObj[1].toString()))));
            _cardImage.push(ResManager.hash(ResManager.getIconUrlNoHash(parseInt(_resObj[2].toString()))));
            _cardImage.push(ResManager.hash(ResManager.getIconUrlNoHash(parseInt(_resObj[3].toString()))));
            _cardImage.push(ResManager.hash(ResManager.getIconUrlNoHash(parseInt(_resObj[4].toString()))));
            _cardImage.push(ResManager.hash(ResManager.getIconUrlNoHash(parseInt(_resObj[5].toString()))));
            _cardImage.push(ResManager.hash(ResManager.getIconUrlNoHash(parseInt(_resObj[6].toString()))));
        }

        public function ___CardGamePanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set cardCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._174674056cardCanvas;
            if (_local_2 !== _arg_1)
            {
                this._174674056cardCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardCanvas", _local_2, _arg_1));
            };
        }

        public function set changeBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1455232140changeBtn;
            if (_local_2 !== _arg_1)
            {
                this._1455232140changeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeBtn", _local_2, _arg_1));
            };
        }

        public function set lab(_arg_1:Label):void
        {
            var _local_2:Object = this._106893lab;
            if (_local_2 !== _arg_1)
            {
                this._106893lab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab", _local_2, _arg_1));
            };
        }

        public function set soulLabNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1491692172soulLabNum;
            if (_local_2 !== _arg_1)
            {
                this._1491692172soulLabNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulLabNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get card1():Image
        {
            return (this._94431009card1);
        }

        [Bindable(event="propertyChange")]
        public function get card2():Image
        {
            return (this._94431010card2);
        }

        [Bindable(event="propertyChange")]
        public function get card3():Image
        {
            return (this._94431011card3);
        }

        [Bindable(event="propertyChange")]
        public function get card4():Image
        {
            return (this._94431012card4);
        }

        [Bindable(event="propertyChange")]
        public function get card5():Image
        {
            return (this._94431013card5);
        }

        [Bindable(event="propertyChange")]
        public function get changeLabel():Label
        {
            return (this._1672591068changeLabel);
        }

        public function set soulLab(_arg_1:Label):void
        {
            var _local_2:Object = this._2022077798soulLab;
            if (_local_2 !== _arg_1)
            {
                this._2022077798soulLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulLab", _local_2, _arg_1));
            };
        }

        private function _CardGamePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CardGamePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_CardGamePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                startBtn.label = _arg_1;
            }, "startBtn.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changeBtn.label = _arg_1;
            }, "changeBtn.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn.label = _arg_1;
            }, "awardBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lab1.text = _arg_1;
            }, "lab1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lab1.toolTip = _arg_1;
            }, "lab1.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulLab.text = _arg_1;
            }, "soulLab.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulLab.toolTip = _arg_1;
            }, "soulLab.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.soulPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulLabNum.text = _arg_1;
            }, "soulLabNum.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulLabNum.toolTip = _arg_1;
            }, "soulLabNum.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((_now + "/") + _max);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lab.text = _arg_1;
            }, "lab.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addPlayBtn.label = _arg_1;
            }, "addPlayBtn.label");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                twoLab.filters = _arg_1;
            }, "twoLab.filters");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CardGamePanel_LinkButton1.label = _arg_1;
            }, "_CardGamePanel_LinkButton1.label");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                oneLab.filters = _arg_1;
            }, "oneLab.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CardGamePanel_LinkButton2.label = _arg_1;
            }, "_CardGamePanel_LinkButton2.label");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _CardGamePanel_Label9.filters = _arg_1;
            }, "_CardGamePanel_Label9.filters");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CARD_GAME_P[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CardGamePanel_Label9.text = _arg_1;
            }, "_CardGamePanel_Label9.text");
            result[17] = binding;
            return (result);
        }

        public function set startBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1316769434startBtn;
            if (_local_2 !== _arg_1)
            {
                this._1316769434startBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startBtn", _local_2, _arg_1));
            };
        }

        public function set typeLab1(_arg_1:Label):void
        {
            var _local_2:Object = this._676567394typeLab1;
            if (_local_2 !== _arg_1)
            {
                this._676567394typeLab1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab1", _local_2, _arg_1));
            };
        }

        public function set typeLab2(_arg_1:Label):void
        {
            var _local_2:Object = this._676567393typeLab2;
            if (_local_2 !== _arg_1)
            {
                this._676567393typeLab2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab2", _local_2, _arg_1));
            };
        }

        public function set typeLab3(_arg_1:Label):void
        {
            var _local_2:Object = this._676567392typeLab3;
            if (_local_2 !== _arg_1)
            {
                this._676567392typeLab3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab3", _local_2, _arg_1));
            };
        }

        public function set typeLab5(_arg_1:Label):void
        {
            var _local_2:Object = this._676567390typeLab5;
            if (_local_2 !== _arg_1)
            {
                this._676567390typeLab5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab5", _local_2, _arg_1));
            };
        }

        public function set typeLab9(_arg_1:Label):void
        {
            var _local_2:Object = this._676567386typeLab9;
            if (_local_2 !== _arg_1)
            {
                this._676567386typeLab9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab9", _local_2, _arg_1));
            };
        }

        public function set addPlayBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1414633127addPlayBtn;
            if (_local_2 !== _arg_1)
            {
                this._1414633127addPlayBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPlayBtn", _local_2, _arg_1));
            };
        }

        private function getImageX(_arg_1:Number):Object
        {
            var _local_2:Number = 10;
            switch (_arg_1)
            {
                case 1:
                    _local_2 = _image1X;
                    break;
                case 2:
                    _local_2 = _image2X;
                    break;
                case 3:
                    _local_2 = _image3X;
                    break;
                case 4:
                    _local_2 = _image4X;
                    break;
                case 5:
                    _local_2 = _image5X;
                    break;
            };
            return (_local_2);
        }

        public function set mainBackImag(_arg_1:Image):void
        {
            var _local_2:Object = this._454209194mainBackImag;
            if (_local_2 !== _arg_1)
            {
                this._454209194mainBackImag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainBackImag", _local_2, _arg_1));
            };
        }

        public function set typeLab7(_arg_1:Label):void
        {
            var _local_2:Object = this._676567388typeLab7;
            if (_local_2 !== _arg_1)
            {
                this._676567388typeLab7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get oneLab():Label
        {
            return (this._1012459193oneLab);
        }

        private function getCardImageObj(_arg_1:Number):Object
        {
            var _local_2:*;
            switch (_arg_1)
            {
                case 1:
                    _local_2 = this.card1;
                    break;
                case 2:
                    _local_2 = this.card2;
                    break;
                case 3:
                    _local_2 = this.card3;
                    break;
                case 4:
                    _local_2 = this.card4;
                    break;
                case 5:
                    _local_2 = this.card5;
                    break;
            };
            return (_local_2);
        }

        public function set typeLab6(_arg_1:Label):void
        {
            var _local_2:Object = this._676567389typeLab6;
            if (_local_2 !== _arg_1)
            {
                this._676567389typeLab6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab6", _local_2, _arg_1));
            };
        }

        public function set typeLab8(_arg_1:Label):void
        {
            var _local_2:Object = this._676567387typeLab8;
            if (_local_2 !== _arg_1)
            {
                this._676567387typeLab8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab8", _local_2, _arg_1));
            };
        }

        public function set twoLab(_arg_1:Label):void
        {
            var _local_2:Object = this._860703839twoLab;
            if (_local_2 !== _arg_1)
            {
                this._860703839twoLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "twoLab", _local_2, _arg_1));
            };
        }

        public function startGame():void
        {
            if (_ready)
            {
                return;
            };
            this.startBtn.visible = false;
            _core.remote.call("startGame", new Responder(onStartGame));
        }

        public function set typeCan1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835141typeCan1;
            if (_local_2 !== _arg_1)
            {
                this._676835141typeCan1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan1", _local_2, _arg_1));
            };
        }

        public function set typeCan2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835140typeCan2;
            if (_local_2 !== _arg_1)
            {
                this._676835140typeCan2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan2", _local_2, _arg_1));
            };
        }

        public function set typeCan3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835139typeCan3;
            if (_local_2 !== _arg_1)
            {
                this._676835139typeCan3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan3", _local_2, _arg_1));
            };
        }

        public function set typeLab4(_arg_1:Label):void
        {
            var _local_2:Object = this._676567391typeLab4;
            if (_local_2 !== _arg_1)
            {
                this._676567391typeLab4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeLab4", _local_2, _arg_1));
            };
        }

        public function set typeCan4(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835138typeCan4;
            if (_local_2 !== _arg_1)
            {
                this._676835138typeCan4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan4", _local_2, _arg_1));
            };
        }

        public function set awardBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1621978433awardBtn;
            if (_local_2 !== _arg_1)
            {
                this._1621978433awardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn", _local_2, _arg_1));
            };
        }

        public function __startBtn_click(_arg_1:MouseEvent):void
        {
            startGame();
        }

        public function set typeCan5(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835137typeCan5;
            if (_local_2 !== _arg_1)
            {
                this._676835137typeCan5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan5", _local_2, _arg_1));
            };
        }

        public function set typeCan9(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835133typeCan9;
            if (_local_2 !== _arg_1)
            {
                this._676835133typeCan9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan9", _local_2, _arg_1));
            };
        }

        public function set typeCan6(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835136typeCan6;
            if (_local_2 !== _arg_1)
            {
                this._676835136typeCan6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan6", _local_2, _arg_1));
            };
        }

        public function set typeCan7(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835135typeCan7;
            if (_local_2 !== _arg_1)
            {
                this._676835135typeCan7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan7", _local_2, _arg_1));
            };
        }

        private function onChageCard(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:*;
            var _local_5:Number;
            var _local_6:*;
            changeBtn.enabled = true;
            if (_arg_1)
            {
                _local_2 = new Array();
                if (_arg_1.s1)
                {
                    this["_flag1"] = false;
                    _local_6 = {
                        "index":1,
                        "flag":this["_flag1"],
                        "num":Number(_arg_1.s1)
                    };
                    _num1 = _arg_1.s1;
                    _local_2.push(_local_6);
                };
                if (_arg_1.s2)
                {
                    this["_flag2"] = false;
                    _local_6 = {
                        "index":2,
                        "flag":this["_flag2"],
                        "num":Number(_arg_1.s2)
                    };
                    _num2 = _arg_1.s2;
                    _local_2.push(_local_6);
                };
                if (_arg_1.s3)
                {
                    this["_flag3"] = false;
                    _local_6 = {
                        "index":3,
                        "flag":this["_flag3"],
                        "num":Number(_arg_1.s3)
                    };
                    _num3 = _arg_1.s3;
                    _local_2.push(_local_6);
                };
                if (_arg_1.s4)
                {
                    this["_flag4"] = false;
                    _local_6 = {
                        "index":4,
                        "flag":this["_flag4"],
                        "num":Number(_arg_1.s4)
                    };
                    _num4 = _arg_1.s4;
                    _local_2.push(_local_6);
                };
                if (_arg_1.s5)
                {
                    this["_flag5"] = false;
                    _local_6 = {
                        "index":5,
                        "flag":this["_flag5"],
                        "num":Number(_arg_1.s5)
                    };
                    _num5 = _arg_1.s5;
                    _local_2.push(_local_6);
                };
                this._changeTime = _arg_1.changeTime;
                this.changeLabel.htmlText = Language.CARD_GAME_P[5].toString().replace("{num}", (this._changeTime * 5));
                _local_3 = new Array();
                _local_3.push(_num1);
                _local_3.push(_num2);
                _local_3.push(_num3);
                _local_3.push(_num4);
                _local_3.push(_num5);
                _local_4 = getCardAwardType(_local_3);
                this.oneLab.text = Language.CARD_GAME_P[11].toString().replace("{name}", this._CARD_AWARD[_local_4].name);
                _local_5 = Math.ceil(((Number(_CARD_AWARD[_local_4].p) * (1 + ((Number(_core.player.level) - 60) * 0.0125))) / 2));
                if (_core.MC_BIRTH_FLAG[100])
                {
                    _local_5 = Math.ceil((_local_5 * _core.MC_BIRTH_FLAG[100]));
                };
                this.twoLab.text = Language.CARD_GAME_P[12].toString().replace("{num}", _local_5);
                overTurnCardTimer(_local_2);
            };
        }

        public function __card3_click(_arg_1:MouseEvent):void
        {
            overTurnCard(3);
        }

        [Bindable(event="propertyChange")]
        public function get lab():Label
        {
            return (this._106893lab);
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CARD_GAME_P[20].toString();
            _helpAlert = Alert.show(_local_1, Language.CARD_GAME_P[19].toString(), Alert.YES, null, null);
        }

        public function set typeCan8(_arg_1:Canvas):void
        {
            var _local_2:Object = this._676835134typeCan8;
            if (_local_2 !== _arg_1)
            {
                this._676835134typeCan8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "typeCan8", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:CardGamePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CardGamePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CardGamePanelWatcherSetupUtil");
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
        public function get twoLab():Label
        {
            return (this._860703839twoLab);
        }

        private function overTurnCardTimer(indexArr:Array):void
        {
            var func:Function;
            var i:* = undefined;
            var cardIndex:String;
            var cardResIndex:String;
            var obj1:* = undefined;
            func = function (_arg_1:Event):void
            {
                var _local_2:*;
                var _local_3:*;
                var _local_4:String;
                var _local_5:String;
                if (s == 0)
                {
                    for (_local_2 in indexArr)
                    {
                        if (indexArr[_local_2])
                        {
                            _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                            _local_3.scaleX = 0.75;
                            _local_3.scaleY = 1;
                        };
                    };
                    s++;
                }
                else
                {
                    if (s == 1)
                    {
                        for (_local_2 in indexArr)
                        {
                            if (indexArr[_local_2])
                            {
                                _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                                _local_3.scaleX = 0.5;
                                _local_3.scaleY = 1;
                            };
                        };
                        s++;
                    }
                    else
                    {
                        if (s == 2)
                        {
                            for (_local_2 in indexArr)
                            {
                                if (indexArr[_local_2])
                                {
                                    _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                                    _local_3.scaleX = 0.25;
                                    _local_3.scaleY = 1;
                                };
                            };
                            s++;
                        }
                        else
                        {
                            if (s == 3)
                            {
                                for (_local_2 in indexArr)
                                {
                                    if (indexArr[_local_2])
                                    {
                                        _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                                        _local_3.scaleX = 0.03;
                                        _local_3.scaleY = 1;
                                    };
                                };
                                s++;
                            }
                            else
                            {
                                if (s == 4)
                                {
                                    for (_local_2 in indexArr)
                                    {
                                        if (indexArr[_local_2])
                                        {
                                            _local_4 = indexArr[_local_2].index.toString();
                                            _local_5 = indexArr[_local_2].num.toString();
                                            _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                                            if (indexArr[_local_2].flag)
                                            {
                                                _local_3.source = _cardImage[0];
                                            }
                                            else
                                            {
                                                _local_3.source = _cardImage[_local_5];
                                            };
                                            _local_3.scaleX = 0.03;
                                            _local_3.scaleY = 1;
                                        };
                                    };
                                    s++;
                                }
                                else
                                {
                                    if (s == 5)
                                    {
                                        for (_local_2 in indexArr)
                                        {
                                            if (indexArr[_local_2])
                                            {
                                                _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                                                _local_3.scaleX = 0.25;
                                                _local_3.scaleY = 1;
                                            };
                                        };
                                        s++;
                                    }
                                    else
                                    {
                                        if (s == 6)
                                        {
                                            for (_local_2 in indexArr)
                                            {
                                                if (indexArr[_local_2])
                                                {
                                                    _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                                                    _local_3.scaleX = 0.5;
                                                    _local_3.scaleY = 1;
                                                };
                                            };
                                            s++;
                                        }
                                        else
                                        {
                                            if (s == 7)
                                            {
                                                for (_local_2 in indexArr)
                                                {
                                                    if (indexArr[_local_2])
                                                    {
                                                        _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                                                        _local_3.scaleX = 0.75;
                                                        _local_3.scaleY = 1;
                                                    };
                                                };
                                                s++;
                                            }
                                            else
                                            {
                                                if (s == 8)
                                                {
                                                    for (_local_2 in indexArr)
                                                    {
                                                        if (indexArr[_local_2])
                                                        {
                                                            _local_4 = indexArr[_local_2].index.toString();
                                                            _local_5 = indexArr[_local_2].num.toString();
                                                            _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                                                            if (indexArr[_local_2].flag)
                                                            {
                                                                _local_3.source = _cardImage[0];
                                                            }
                                                            else
                                                            {
                                                                _local_3.source = _cardImage[_local_5];
                                                            };
                                                            _local_3.scaleX = 1;
                                                            _local_3.scaleY = 1;
                                                        };
                                                    };
                                                    s = 0;
                                                    _timer.removeEventListener(TimerEvent.TIMER, func);
                                                    _timer.stop();
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                for (_local_2 in indexArr)
                {
                    if (indexArr[_local_2])
                    {
                        _local_3 = getCardImageObj(Number(indexArr[_local_2].index));
                        _local_3.x = (getImageX(Number(indexArr[_local_2].index)) + ((_imageWidth * (1 - _local_3.scaleX)) / 2));
                    };
                };
            };
            if (_timer.running)
            {
                _timer.removeEventListener(TimerEvent.TIMER, func);
                _timer.stop();
            };
            i = 1;
            while (i <= 5)
            {
                this[("card" + i)].x = getImageX(i);
                this[("card" + i)].width = _imageWidth;
                this[("card" + i)].scaleX = 1;
                i++;
            };
            _timer.addEventListener(TimerEvent.TIMER, func);
            _timer.start();
            for (i in indexArr)
            {
                if (indexArr[i])
                {
                    cardIndex = indexArr[i].index.toString();
                    cardResIndex = indexArr[i].num.toString();
                    obj1 = getCardImageObj(Number(indexArr[i].index));
                    if (indexArr[i].flag)
                    {
                        obj1.source = _cardImage[cardResIndex];
                    }
                    else
                    {
                        obj1.source = _cardImage[0];
                    };
                };
            };
        }

        public function __addPlayBtn_click(_arg_1:MouseEvent):void
        {
            addPlayTime();
        }

        private function gotosoul():void
        {
            _core.view.show(ViewManager.POPU_SOUL_PRODUCT);
        }

        public function addPlayTime():void
        {
            var handler:Function;
            var max:Number = _mMax;
            if (((_core.player.pmLevel) && (ToolKit.isBigThan(_core.player.pmLevel, 0))))
            {
                max = ToolKit.add(_mMax, (_core.player.pmLevel * PM_UP_TIMES));
            };
            if (_max >= max)
            {
                _core.sysMsg(Language.CARD_GAME_P[15]);
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (!addPlayBtn.enabled)
                    {
                        return;
                    };
                    addPlayBtn.enabled = false;
                    _core.remote.call("addPlayTime", new Responder(onAddPlayTime));
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var _gold:Number = ToolKit.add((ToolKit.minus(_max, 5) * 5), 20);
            if (((_gold) && (ToolKit.isBigThan(_gold, 40))))
            {
                _gold = 40;
            };
            var str:String = Language.CARD_GAME_P[3].toString().replace("{num}", _gold);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        public function __awardBtn_click(_arg_1:MouseEvent):void
        {
            getCardAward();
        }

        private function onGetCardAward(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:*;
            if (_arg_1)
            {
                _ready = false;
                _flag1 = true;
                _flag2 = true;
                _flag3 = true;
                _flag4 = true;
                _flag5 = true;
                _local_2 = new Array();
                _local_2.push({
                    "index":1,
                    "flag":_flag1,
                    "num":_num1
                });
                _local_2.push({
                    "index":2,
                    "flag":_flag2,
                    "num":_num2
                });
                _local_2.push({
                    "index":3,
                    "flag":_flag3,
                    "num":_num3
                });
                _local_2.push({
                    "index":4,
                    "flag":_flag4,
                    "num":_num4
                });
                _local_2.push({
                    "index":5,
                    "flag":_flag5,
                    "num":_num5
                });
                this.changeLabel.htmlText = Language.CARD_GAME_P[5].toString().replace("{num}", 0);
                this.threeLab.htmlText = Language.CARD_GAME_P[7].toString();
                _num1 = -1;
                _num2 = -1;
                _num3 = -1;
                _num4 = -1;
                _num5 = -1;
                this.changeBtn.visible = false;
                this.awardBtn.visible = false;
                if (ToolKit.isBigOrEqual(_now, _max))
                {
                    this.startBtn.enabled = false;
                }
                else
                {
                    this.startBtn.enabled = true;
                };
                this.startBtn.visible = true;
                this.oneLab.text = Language.CARD_GAME_P[11].toString().replace("{name}", "Không");
                this.twoLab.text = Language.CARD_GAME_P[12].toString().replace("{num}", "Không");
                overTurnCardTimer(_local_2);
                _local_3 = 1;
                while (_local_3 <= 5)
                {
                    this[("card" + _local_3)].buttonMode = false;
                    _local_3++;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

