// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MazeInfoPanel

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import mx.controls.Alert;
    import com.qeedoo.game.data.GameData;
    import flash.utils.setTimeout;
    import mx.events.CloseEvent;
    import flash.net.Responder;
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

    public class MazeInfoPanel extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _103662810map42:Image;
        private var _296157064addSkipNumButton:Button;
        private var _103662720map15:Image;
        private var _3343960map4:Image;
        private var _3343964map8:Image;
        private var _103662779map32:Image;
        private var _103662839map50:Image;
        private var _103662749map23:Image;
        private var _103662784map37:Image;
        private var _124012844btnChange:Button;
        private var _103662809map41:Image;
        private var _103662719map14:Image;
        private var _103662746map20:Image;
        private var _103662817map49:Image;
        private var _103662754map28:Image;
        private var _103662781map34:Image;
        private var _2147412359skipNum:RoundedLabel;
        private var _3343956map0:Image;
        private var _103662716map11:Image;
        private var _103662841map52:Image;
        private var _103662814map46:Image;
        private var _103662724map19:Image;
        private var _103662751map25:Image;
        private var _3343963map7:Image;
        private var _103662811map43:Image;
        private var _103662721map16:Image;
        private var _617523018MazeInfoC:Canvas;
        public var _MazeInfoPanel_Button5:Button;
        public var _MazeInfoPanel_Button6:Button;
        public var _MazeInfoPanel_LinkButton1:LinkButton;
        public var _MazeInfoPanel_LinkButton2:LinkButton;
        private var _103662777map30:Image;
        private var _103662785map38:Image;
        private var _3343959map3:Image;
        private var _103662747map21:Image;
        private var _103662755map29:Image;
        private var _94091838buff1:Image;
        private var _103662782map35:Image;
        private var _3343962map6:Image;
        private var _103662717map12:Image;
        private var _103662815map47:Image;
        private var _103662842map53:Image;
        private var _103662752map26:Image;
        private var _1422976620actNum:RoundedLabel;
        private var _103662812map44:Image;
        private var _103662722map17:Image;
        private var _94091840buff3:Image;
        private var _3343958map2:Image;
        private var _103662778map31:Image;
        public var _MazeInfoPanel_RoundedLabel1:RoundedLabel;
        public var _MazeInfoPanel_RoundedLabel3:RoundedLabel;
        public var _MazeInfoPanel_RoundedLabel6:RoundedLabel;
        private var _103662786map39:Image;
        private var _3343961map5:Image;
        private var _3343965map9:Image;
        private var _103662748map22:Image;
        private var _103662783map36:Image;
        private var _94091839buff2:Image;
        private var _103662808map40:Image;
        private var _103662718map13:Image;
        private var _851204994recoverNum:RoundedLabel;
        private var _103662816map48:Image;
        private var _103662753map27:Image;
        private var _103662780map33:Image;
        private var _103662715map10:Image;
        private var _103662813map45:Image;
        private var _103662840map51:Image;
        private var _103662723map18:Image;
        private var _103662750map24:Image;
        private var _1739038741addRecoverNumButton:Button;
        private var _3343957map1:Image;
        private var _94091841buff4:Image;
        private var _158535007mapImage:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":212,
                    "height":550,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnChange",
                        "events":{"click":"__btnChange_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":240,
                                "width":12,
                                "height":25,
                                "styleName":"BtnHideButtons",
                                "visible":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"MazeInfoC",
                        "stylesFactory":function ():void
                        {
                            this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":12,
                                "y":0,
                                "width":200,
                                "percentHeight":100,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_MazeInfoPanel_LinkButton1",
                                    "events":{"click":"___MazeInfoPanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFE600;
                                        this.textDecoration = "underline";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":20,
                                            "y":20,
                                            "width":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_MazeInfoPanel_LinkButton2",
                                    "events":{"click":"___MazeInfoPanel_LinkButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFE600;
                                        this.textDecoration = "underline";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":110,
                                            "y":20,
                                            "width":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":40,
                                            "height":80,
                                            "percentWidth":100,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_MazeInfoPanel_RoundedLabel1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "0";
                                                    this.fontSize = 16;
                                                    this.textAlign = "center";
                                                    this.fontStyle = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":5});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"buff1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":30,
                                                        "height":30,
                                                        "x":40,
                                                        "y":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"buff2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":30,
                                                        "height":30,
                                                        "x":80,
                                                        "y":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"buff3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":30,
                                                        "height":30,
                                                        "x":120,
                                                        "y":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"buff4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":30,
                                                        "height":30,
                                                        "x":160,
                                                        "y":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"actNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "0";
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                    this.fontStyle = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":60});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":120,
                                            "height":65,
                                            "percentWidth":100,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_MazeInfoPanel_RoundedLabel3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "0";
                                                    this.fontSize = 16;
                                                    this.textAlign = "center";
                                                    this.fontStyle = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":5});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"skipNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "0";
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                    this.fontStyle = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":25});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"addSkipNumButton",
                                                "events":{"buttonDown":"__addSkipNumButton_buttonDown"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":150,
                                                        "y":25,
                                                        "styleName":"BtnAdd"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"recoverNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "0";
                                                    this.fontSize = 12;
                                                    this.textAlign = "center";
                                                    this.fontStyle = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":45});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"addRecoverNumButton",
                                                "events":{"buttonDown":"__addRecoverNumButton_buttonDown"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":150,
                                                        "y":45,
                                                        "styleName":"BtnAdd"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":185,
                                            "height":300,
                                            "percentWidth":100,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_MazeInfoPanel_RoundedLabel6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.horizontalCenter = "0";
                                                    this.fontSize = 16;
                                                    this.textAlign = "center";
                                                    this.fontStyle = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":5});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "y":0,
                                                        "percentHeight":100,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"mapImage",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":176,
                                                                    "height":264,
                                                                    "x":5,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":59
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":59
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":59
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":59
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":59
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":59
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":88
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":88
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":88
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":88
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":88
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":88
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":117
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map19",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":117
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":117
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map21",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":117
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map22",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":117
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map23",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":117
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map24",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":146
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map25",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":146
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map26",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":146
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map27",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":146
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map28",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":146
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map29",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":146
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map30",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map31",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map32",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map33",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map34",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map35",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map36",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":204
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map37",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":204
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map38",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":204
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map39",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":204
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map40",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":204
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map41",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":204
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map42",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":233
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map43",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":233
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map44",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":233
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map45",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":233
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map46",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":233
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map47",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":233
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map48",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":5,
                                                                    "y":262
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map49",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":34,
                                                                    "y":262
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map50",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":63,
                                                                    "y":262
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map51",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":92,
                                                                    "y":262
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map52",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":121,
                                                                    "y":262
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"map53",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":29,
                                                                    "height":29,
                                                                    "x":150,
                                                                    "y":262
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___MazeInfoPanel_Button4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":500,
                                            "x":80,
                                            "styleName":"BtnWbQuit",
                                            "height":50,
                                            "width":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_MazeInfoPanel_Button5",
                                    "events":{"click":"___MazeInfoPanel_Button5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":500,
                                            "x":10,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_MazeInfoPanel_Button6",
                                    "events":{"click":"___MazeInfoPanel_Button6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":530,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        public var mapPic:Class = MazeInfoPanel_mapPic;
        public var huiPic:Class = MazeInfoPanel_huiPic;
        public var huangPic:Class = MazeInfoPanel_huangPic;
        public var lanPic:Class = MazeInfoPanel_lanPic;
        public var lanQiPic:Class = MazeInfoPanel_lanQiPic;
        public var huangQiPic:Class = MazeInfoPanel_huangQiPic;
        public var huiZhongPic:Class = MazeInfoPanel_huiZhongPic;
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MazeInfoPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.right = "0";
                this.backgroundAlpha = 0;
            };
            this.width = 212;
            this.height = 550;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___MazeInfoPanel_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MazeInfoPanel._watcherSetupUtil = _arg_1;
        }


        public function set map52(_arg_1:Image):void
        {
            var _local_2:Object = this._103662841map52;
            if (_local_2 !== _arg_1)
            {
                this._103662841map52 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map52", _local_2, _arg_1));
            };
        }

        public function set map53(_arg_1:Image):void
        {
            var _local_2:Object = this._103662842map53;
            if (_local_2 !== _arg_1)
            {
                this._103662842map53 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map53", _local_2, _arg_1));
            };
        }

        public function ___MazeInfoPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            showPlayRule();
        }

        public function updateData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!this.visible)
            {
                this.visible = true;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.MAIN_SYS);
            if (_local_2.sysBtnBar.visible)
            {
                _local_2.sysBtnBar.visible = false;
            };
            var _local_3:Object = _core.view.getUI(ViewManager.MAIN_MINIMAP);
            if (_local_3.visible)
            {
                _local_3.visible = false;
            };
            var _local_4:Object = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
            if (_local_4)
            {
                _local_4.hide();
            };
            var _local_5:Object = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            if (_local_5.visible)
            {
                _local_5.visible = false;
            };
            var _local_6:Object = _core.view.getUI(ViewManager.PANEL_BAG);
            if (_local_6.visible)
            {
                _local_6.visible = false;
            };
            if (_arg_1.actNum >= 0)
            {
                actNum.text = Language.MAZE_INFO_PANEL_U[3].toString().replace("{num}", int(_arg_1.actNum));
            };
            if (_arg_1.skipNum >= 0)
            {
                skipNum.text = Language.MAZE_INFO_PANEL_U[5].toString().replace("{num}", int(_arg_1.skipNum));
            };
            if (_arg_1.recoverNum >= 0)
            {
                recoverNum.text = Language.MAZE_INFO_PANEL_U[7].toString().replace("{num}", int(_arg_1.recoverNum));
            };
            var _local_7:* = 0;
            while (_local_7 < 53)
            {
                if (_arg_1[_local_7])
                {
                    this[("map" + _local_7)].source = lanPic;
                }
                else
                {
                    this[("map" + _local_7)].source = huiPic;
                };
                _local_7++;
            };
            if (_arg_1.currentIndex != null)
            {
                this[("map" + _arg_1.currentIndex)].source = huangPic;
                this["map0"].source = lanQiPic;
                if (_arg_1.currentIndex == 0)
                {
                    this["map0"].source = huangQiPic;
                };
            };
            if (_arg_1.mazeBuff != null)
            {
                updateMazeBuff(_arg_1.mazeBuff);
            }
            else
            {
                updateMazeBuff(null);
            };
        }

        private function showBattle():void
        {
            _core.view.changeVisible(ViewManager.PANEL_BATTLESET);
            _core.view.getUI(ViewManager.PANEL_BATTLESET).updateView();
        }

        public function onGetMazeData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!this.visible)
            {
                this.visible = true;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.MAIN_SYS);
            if (_local_2.sysBtnBar.visible)
            {
                _local_2.sysBtnBar.visible = false;
            };
            var _local_3:Object = _core.view.getUI(ViewManager.MAIN_MINIMAP);
            if (_local_3.visible)
            {
                _local_3.visible = false;
            };
            var _local_4:Object = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
            if (_local_4)
            {
                _local_4.hide();
            };
            var _local_5:Object = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            if (_local_5.visible)
            {
                _local_5.visible = false;
            };
            var _local_6:Object = _core.view.getUI(ViewManager.PANEL_BAG);
            if (_local_6.visible)
            {
                _local_6.visible = false;
            };
            actNum.text = Language.MAZE_INFO_PANEL_U[3].toString().replace("{num}", int(_arg_1.actNum));
            skipNum.text = Language.MAZE_INFO_PANEL_U[5].toString().replace("{num}", int(_arg_1.skipNum));
            recoverNum.text = Language.MAZE_INFO_PANEL_U[7].toString().replace("{num}", int(_arg_1.recoverNum));
            if (_arg_1.actNum >= 0)
            {
                actNum.text = Language.MAZE_INFO_PANEL_U[3].toString().replace("{num}", int(_arg_1.actNum));
            };
            if (_arg_1.skipNum >= 0)
            {
                skipNum.text = Language.MAZE_INFO_PANEL_U[5].toString().replace("{num}", int(_arg_1.skipNum));
            };
            if (_arg_1.recoverNum >= 0)
            {
                recoverNum.text = Language.MAZE_INFO_PANEL_U[7].toString().replace("{num}", int(_arg_1.recoverNum));
            };
            var _local_7:* = 0;
            while (_local_7 < 53)
            {
                if (_arg_1[_local_7])
                {
                    this[("map" + _local_7)].source = lanPic;
                }
                else
                {
                    this[("map" + _local_7)].source = huiPic;
                };
                _local_7++;
            };
            if (_arg_1.currentIndex != null)
            {
                this[("map" + _arg_1.currentIndex)].source = huangPic;
                this["map0"].source = lanQiPic;
                if (_arg_1.currentIndex == 0)
                {
                    this["map0"].source = huangQiPic;
                };
            };
            if (_arg_1.mazeBuff != null)
            {
                updateMazeBuff(_arg_1.mazeBuff);
            }
            else
            {
                updateMazeBuff(null);
            };
        }

        [Bindable(event="propertyChange")]
        public function get addRecoverNumButton():Button
        {
            return (this._1739038741addRecoverNumButton);
        }

        public function ___MazeInfoPanel_Button5_click(_arg_1:MouseEvent):void
        {
            showBattle();
        }

        public function set addRecoverNumButton(_arg_1:Button):void
        {
            var _local_2:Object = this._1739038741addRecoverNumButton;
            if (_local_2 !== _arg_1)
            {
                this._1739038741addRecoverNumButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addRecoverNumButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get buff2():Image
        {
            return (this._94091839buff2);
        }

        [Bindable(event="propertyChange")]
        public function get buff4():Image
        {
            return (this._94091841buff4);
        }

        [Bindable(event="propertyChange")]
        public function get buff3():Image
        {
            return (this._94091840buff3);
        }

        [Bindable(event="propertyChange")]
        public function get buff1():Image
        {
            return (this._94091838buff1);
        }

        [Bindable(event="propertyChange")]
        public function get map0():Image
        {
            return (this._3343956map0);
        }

        [Bindable(event="propertyChange")]
        public function get map2():Image
        {
            return (this._3343958map2);
        }

        [Bindable(event="propertyChange")]
        public function get map3():Image
        {
            return (this._3343959map3);
        }

        public function set btnChange(_arg_1:Button):void
        {
            var _local_2:Object = this._124012844btnChange;
            if (_local_2 !== _arg_1)
            {
                this._124012844btnChange = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnChange", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map6():Image
        {
            return (this._3343962map6);
        }

        [Bindable(event="propertyChange")]
        public function get map7():Image
        {
            return (this._3343963map7);
        }

        [Bindable(event="propertyChange")]
        public function get map1():Image
        {
            return (this._3343957map1);
        }

        [Bindable(event="propertyChange")]
        public function get map4():Image
        {
            return (this._3343960map4);
        }

        [Bindable(event="propertyChange")]
        public function get map8():Image
        {
            return (this._3343964map8);
        }

        [Bindable(event="propertyChange")]
        public function get map5():Image
        {
            return (this._3343961map5);
        }

        public function showPlayRule():void
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_MAZE_PLAY_RULE);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        [Bindable(event="propertyChange")]
        public function get map9():Image
        {
            return (this._3343965map9);
        }

        [Bindable(event="propertyChange")]
        public function get addSkipNumButton():Button
        {
            return (this._296157064addSkipNumButton);
        }

        [Bindable(event="propertyChange")]
        public function get map10():Image
        {
            return (this._103662715map10);
        }

        [Bindable(event="propertyChange")]
        public function get map14():Image
        {
            return (this._103662719map14);
        }

        public function set buff4(_arg_1:Image):void
        {
            var _local_2:Object = this._94091841buff4;
            if (_local_2 !== _arg_1)
            {
                this._94091841buff4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buff4", _local_2, _arg_1));
            };
        }

        public function set buff1(_arg_1:Image):void
        {
            var _local_2:Object = this._94091838buff1;
            if (_local_2 !== _arg_1)
            {
                this._94091838buff1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buff1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map12():Image
        {
            return (this._103662717map12);
        }

        public function set buff2(_arg_1:Image):void
        {
            var _local_2:Object = this._94091839buff2;
            if (_local_2 !== _arg_1)
            {
                this._94091839buff2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buff2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map18():Image
        {
            return (this._103662723map18);
        }

        [Bindable(event="propertyChange")]
        public function get map11():Image
        {
            return (this._103662716map11);
        }

        [Bindable(event="propertyChange")]
        public function get map13():Image
        {
            return (this._103662718map13);
        }

        public function set buff3(_arg_1:Image):void
        {
            var _local_2:Object = this._94091840buff3;
            if (_local_2 !== _arg_1)
            {
                this._94091840buff3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buff3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map17():Image
        {
            return (this._103662722map17);
        }

        [Bindable(event="propertyChange")]
        public function get map15():Image
        {
            return (this._103662720map15);
        }

        [Bindable(event="propertyChange")]
        public function get map16():Image
        {
            return (this._103662721map16);
        }

        [Bindable(event="propertyChange")]
        public function get map20():Image
        {
            return (this._103662746map20);
        }

        [Bindable(event="propertyChange")]
        public function get map19():Image
        {
            return (this._103662724map19);
        }

        [Bindable(event="propertyChange")]
        public function get map24():Image
        {
            return (this._103662750map24);
        }

        [Bindable(event="propertyChange")]
        public function get map25():Image
        {
            return (this._103662751map25);
        }

        [Bindable(event="propertyChange")]
        public function get map27():Image
        {
            return (this._103662753map27);
        }

        [Bindable(event="propertyChange")]
        public function get map22():Image
        {
            return (this._103662748map22);
        }

        [Bindable(event="propertyChange")]
        public function get map23():Image
        {
            return (this._103662749map23);
        }

        [Bindable(event="propertyChange")]
        public function get map26():Image
        {
            return (this._103662752map26);
        }

        public function changeVisible():*
        {
            if (MazeInfoC.visible)
            {
                MazeInfoC.visible = false;
                btnChange.x = 200;
                btnChange.styleName = "BtnShowButtons";
            }
            else
            {
                MazeInfoC.visible = true;
                btnChange.x = 0;
                btnChange.styleName = "BtnHideButtons";
            };
        }

        public function ___MazeInfoPanel_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function set map3(_arg_1:Image):void
        {
            var _local_2:Object = this._3343959map3;
            if (_local_2 !== _arg_1)
            {
                this._3343959map3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map3", _local_2, _arg_1));
            };
        }

        public function set map0(_arg_1:Image):void
        {
            var _local_2:Object = this._3343956map0;
            if (_local_2 !== _arg_1)
            {
                this._3343956map0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map0", _local_2, _arg_1));
            };
        }

        public function set map4(_arg_1:Image):void
        {
            var _local_2:Object = this._3343960map4;
            if (_local_2 !== _arg_1)
            {
                this._3343960map4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map4", _local_2, _arg_1));
            };
        }

        public function set map1(_arg_1:Image):void
        {
            var _local_2:Object = this._3343957map1;
            if (_local_2 !== _arg_1)
            {
                this._3343957map1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map29():Image
        {
            return (this._103662755map29);
        }

        public function updateMazeBuff(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_5:Number;
            if (!_arg_1)
            {
                this["buff1"].source = "";
                this["buff2"].source = "";
                this["buff3"].source = "";
                this["buff4"].source = "";
                return;
            };
            var _local_2:int = 1;
            for (_local_3 in _arg_1)
            {
                _local_4 = _core.data.getData(GamePredef.TBL_BUFF, _arg_1[_local_3]);
                _local_5 = _local_4.iconCode;
                this[("buff" + _local_2)].source = ResManager.getIconUrl(_local_5);
                this[("buff" + _local_2)].toolTip = _local_4.name;
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get MazeInfoC():Canvas
        {
            return (this._617523018MazeInfoC);
        }

        [Bindable(event="propertyChange")]
        public function get map30():Image
        {
            return (this._103662777map30);
        }

        public function set map2(_arg_1:Image):void
        {
            var _local_2:Object = this._3343958map2;
            if (_local_2 !== _arg_1)
            {
                this._3343958map2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map35():Image
        {
            return (this._103662782map35);
        }

        [Bindable(event="propertyChange")]
        public function get map36():Image
        {
            return (this._103662783map36);
        }

        [Bindable(event="propertyChange")]
        public function get map31():Image
        {
            return (this._103662778map31);
        }

        [Bindable(event="propertyChange")]
        public function get map32():Image
        {
            return (this._103662779map32);
        }

        [Bindable(event="propertyChange")]
        public function get map28():Image
        {
            return (this._103662754map28);
        }

        public function set map7(_arg_1:Image):void
        {
            var _local_2:Object = this._3343963map7;
            if (_local_2 !== _arg_1)
            {
                this._3343963map7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map7", _local_2, _arg_1));
            };
        }

        public function ___MazeInfoPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            showEventInfo();
        }

        [Bindable(event="propertyChange")]
        public function get map39():Image
        {
            return (this._103662786map39);
        }

        public function set map5(_arg_1:Image):void
        {
            var _local_2:Object = this._3343961map5;
            if (_local_2 !== _arg_1)
            {
                this._3343961map5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map33():Image
        {
            return (this._103662780map33);
        }

        [Bindable(event="propertyChange")]
        public function get map34():Image
        {
            return (this._103662781map34);
        }

        public function set mapImage(_arg_1:Image):void
        {
            var _local_2:Object = this._158535007mapImage;
            if (_local_2 !== _arg_1)
            {
                this._158535007mapImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mapImage", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map37():Image
        {
            return (this._103662784map37);
        }

        [Bindable(event="propertyChange")]
        public function get map38():Image
        {
            return (this._103662785map38);
        }

        public function __btnChange_click(_arg_1:MouseEvent):void
        {
            changeVisible();
        }

        public function set map6(_arg_1:Image):void
        {
            var _local_2:Object = this._3343962map6;
            if (_local_2 !== _arg_1)
            {
                this._3343962map6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map40():Image
        {
            return (this._103662808map40);
        }

        [Bindable(event="propertyChange")]
        public function get map41():Image
        {
            return (this._103662809map41);
        }

        [Bindable(event="propertyChange")]
        public function get map42():Image
        {
            return (this._103662810map42);
        }

        [Bindable(event="propertyChange")]
        public function get map43():Image
        {
            return (this._103662811map43);
        }

        [Bindable(event="propertyChange")]
        public function get map44():Image
        {
            return (this._103662812map44);
        }

        [Bindable(event="propertyChange")]
        public function get map45():Image
        {
            return (this._103662813map45);
        }

        [Bindable(event="propertyChange")]
        public function get map21():Image
        {
            return (this._103662747map21);
        }

        public function ___MazeInfoPanel_Button4_click(_arg_1:MouseEvent):void
        {
            leaveMaze();
        }

        [Bindable(event="propertyChange")]
        public function get map46():Image
        {
            return (this._103662814map46);
        }

        private function startTransport(_arg_1:CloseEvent):void
        {
            var _local_2:Boolean;
            var _local_3:*;
            var _local_4:*;
            var _local_5:Array;
            if (_arg_1.detail == Alert.YES)
            {
                _local_2 = false;
                if (_core.player.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
                {
                    if (_core.player.posMapId)
                    {
                        _local_3 = GameData.d[GamePredef.TBL_MAP][_core.player.posMapId];
                        if ((((_local_3) && (_local_3.safeX)) && (_local_3.safeY)))
                        {
                            _local_4 = _core.player.normalView.hitTestLayer;
                            _local_5 = _core.move.getRoute(_core.player.posX, _core.player.posY, _local_3.safeX, _local_3.safeY, _local_4);
                            if (((!(_local_5)) || (_local_5.length <= 1)))
                            {
                                if ((((_local_5.length == 1) && (_local_5[0][0] == _core.player.posX)) && (_local_5[0][1] == _core.player.posY)))
                                {
                                    _local_2 = true;
                                };
                            };
                        };
                    };
                };
                if (_local_2)
                {
                    transport();
                }
                else
                {
                    _core.view.getUI(ViewManager.POPU_WAIT).showText(Language.USERSYSTEMSETPANEL_S[16]);
                    _core.view.getUI(ViewManager.POPU_WAIT).showTime(20);
                    setTimeout(transport, 20000);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get map48():Image
        {
            return (this._103662816map48);
        }

        public function set addSkipNumButton(_arg_1:Button):void
        {
            var _local_2:Object = this._296157064addSkipNumButton;
            if (_local_2 !== _arg_1)
            {
                this._296157064addSkipNumButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addSkipNumButton", _local_2, _arg_1));
            };
        }

        public function set map8(_arg_1:Image):void
        {
            var _local_2:Object = this._3343964map8;
            if (_local_2 !== _arg_1)
            {
                this._3343964map8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map8", _local_2, _arg_1));
            };
        }

        public function set map9(_arg_1:Image):void
        {
            var _local_2:Object = this._3343965map9;
            if (_local_2 !== _arg_1)
            {
                this._3343965map9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map47():Image
        {
            return (this._103662815map47);
        }

        public function set map11(_arg_1:Image):void
        {
            var _local_2:Object = this._103662716map11;
            if (_local_2 !== _arg_1)
            {
                this._103662716map11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map49():Image
        {
            return (this._103662817map49);
        }

        public function set map10(_arg_1:Image):void
        {
            var _local_2:Object = this._103662715map10;
            if (_local_2 !== _arg_1)
            {
                this._103662715map10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map51():Image
        {
            return (this._103662840map51);
        }

        public function set map12(_arg_1:Image):void
        {
            var _local_2:Object = this._103662717map12;
            if (_local_2 !== _arg_1)
            {
                this._103662717map12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map12", _local_2, _arg_1));
            };
        }

        public function addRecoverNum():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("mazeBuyRecoverNum", new Responder(updateData), null);
                };
            };
            Alert.show(Language.MAZE_INFO_PANEL_U[11].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        public function set map17(_arg_1:Image):void
        {
            var _local_2:Object = this._103662722map17;
            if (_local_2 !== _arg_1)
            {
                this._103662722map17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map17", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            _core.remote.call("getMazeData", new Responder(onGetMazeData), null);
        }

        public function set map19(_arg_1:Image):void
        {
            var _local_2:Object = this._103662724map19;
            if (_local_2 !== _arg_1)
            {
                this._103662724map19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map19", _local_2, _arg_1));
            };
        }

        public function set map13(_arg_1:Image):void
        {
            var _local_2:Object = this._103662718map13;
            if (_local_2 !== _arg_1)
            {
                this._103662718map13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map13", _local_2, _arg_1));
            };
        }

        public function set map14(_arg_1:Image):void
        {
            var _local_2:Object = this._103662719map14;
            if (_local_2 !== _arg_1)
            {
                this._103662719map14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map14", _local_2, _arg_1));
            };
        }

        public function set skipNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2147412359skipNum;
            if (_local_2 !== _arg_1)
            {
                this._2147412359skipNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skipNum", _local_2, _arg_1));
            };
        }

        public function set recoverNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._851204994recoverNum;
            if (_local_2 !== _arg_1)
            {
                this._851204994recoverNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recoverNum", _local_2, _arg_1));
            };
        }

        public function set map18(_arg_1:Image):void
        {
            var _local_2:Object = this._103662723map18;
            if (_local_2 !== _arg_1)
            {
                this._103662723map18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map18", _local_2, _arg_1));
            };
        }

        public function leaveMaze():*
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("mazeLeave", new Responder(onMazeLeave), null);
                };
            };
            Alert.show(Language.MAZE_INFO_PANEL_U[14].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        public function onMazeLeave(_arg_1:Object):*
        {
            if (this.visible)
            {
                this.visible = false;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.MAIN_SYS);
            if (!_local_2.sysBtnBar.visible)
            {
                _local_2.sysBtnBar.visible = true;
            };
            var _local_3:Object = _core.view.getUI(ViewManager.MAIN_MINIMAP);
            if (!_local_3.visible)
            {
                _local_3.visible = true;
            };
            var _local_4:Object = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            if (!_local_4.visible)
            {
                _local_4.visible = true;
            };
        }

        public function set map16(_arg_1:Image):void
        {
            var _local_2:Object = this._103662721map16;
            if (_local_2 !== _arg_1)
            {
                this._103662721map16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map16", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map52():Image
        {
            return (this._103662841map52);
        }

        public function set map15(_arg_1:Image):void
        {
            var _local_2:Object = this._103662720map15;
            if (_local_2 !== _arg_1)
            {
                this._103662720map15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map15", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get map50():Image
        {
            return (this._103662839map50);
        }

        [Bindable(event="propertyChange")]
        public function get map53():Image
        {
            return (this._103662842map53);
        }

        public function set actNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1422976620actNum;
            if (_local_2 !== _arg_1)
            {
                this._1422976620actNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actNum", _local_2, _arg_1));
            };
        }

        private function alertTransport():void
        {
            if (_core.state == GamePredef.ST_CORE_NORMAL)
            {
                Alert.show(Language.USERSYSTEMSETPANEL_S[15], "", (Alert.YES | Alert.NO), null, startTransport);
            };
        }

        private function transport():void
        {
            _core.view.hide(ViewManager.POPU_WAIT);
            if (_core.state == GamePredef.ST_CORE_NORMAL)
            {
                _core.remote.toMovable();
            }
            else
            {
                _core.sysMidNote(Language.USERSYSTEMSETPANEL_S[17]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnChange():Button
        {
            return (this._124012844btnChange);
        }

        public function set map20(_arg_1:Image):void
        {
            var _local_2:Object = this._103662746map20;
            if (_local_2 !== _arg_1)
            {
                this._103662746map20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map20", _local_2, _arg_1));
            };
        }

        public function set map21(_arg_1:Image):void
        {
            var _local_2:Object = this._103662747map21;
            if (_local_2 !== _arg_1)
            {
                this._103662747map21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map21", _local_2, _arg_1));
            };
        }

        public function set map22(_arg_1:Image):void
        {
            var _local_2:Object = this._103662748map22;
            if (_local_2 !== _arg_1)
            {
                this._103662748map22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map22", _local_2, _arg_1));
            };
        }

        public function __addSkipNumButton_buttonDown(_arg_1:FlexEvent):void
        {
            addSkipNum();
        }

        public function __addRecoverNumButton_buttonDown(_arg_1:FlexEvent):void
        {
            addRecoverNum();
        }

        public function set map23(_arg_1:Image):void
        {
            var _local_2:Object = this._103662749map23;
            if (_local_2 !== _arg_1)
            {
                this._103662749map23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map23", _local_2, _arg_1));
            };
        }

        public function set map27(_arg_1:Image):void
        {
            var _local_2:Object = this._103662753map27;
            if (_local_2 !== _arg_1)
            {
                this._103662753map27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map27", _local_2, _arg_1));
            };
        }

        public function set map24(_arg_1:Image):void
        {
            var _local_2:Object = this._103662750map24;
            if (_local_2 !== _arg_1)
            {
                this._103662750map24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map24", _local_2, _arg_1));
            };
        }

        public function set map28(_arg_1:Image):void
        {
            var _local_2:Object = this._103662754map28;
            if (_local_2 !== _arg_1)
            {
                this._103662754map28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map28", _local_2, _arg_1));
            };
        }

        public function set map25(_arg_1:Image):void
        {
            var _local_2:Object = this._103662751map25;
            if (_local_2 !== _arg_1)
            {
                this._103662751map25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map25", _local_2, _arg_1));
            };
        }

        public function set map29(_arg_1:Image):void
        {
            var _local_2:Object = this._103662755map29;
            if (_local_2 !== _arg_1)
            {
                this._103662755map29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map29", _local_2, _arg_1));
            };
        }

        public function set map26(_arg_1:Image):void
        {
            var _local_2:Object = this._103662752map26;
            if (_local_2 !== _arg_1)
            {
                this._103662752map26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map26", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mapImage():Image
        {
            return (this._158535007mapImage);
        }

        public function ___MazeInfoPanel_Button6_click(_arg_1:MouseEvent):void
        {
            alertTransport();
        }

        private function _MazeInfoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeInfoPanel_LinkButton1.label = _arg_1;
            }, "_MazeInfoPanel_LinkButton1.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeInfoPanel_LinkButton2.label = _arg_1;
            }, "_MazeInfoPanel_LinkButton2.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeInfoPanel_RoundedLabel1.text = _arg_1;
            }, "_MazeInfoPanel_RoundedLabel1.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actNum.text = _arg_1;
            }, "actNum.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeInfoPanel_RoundedLabel3.text = _arg_1;
            }, "_MazeInfoPanel_RoundedLabel3.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                skipNum.text = _arg_1;
            }, "skipNum.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addSkipNumButton.toolTip = _arg_1;
            }, "addSkipNumButton.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                recoverNum.text = _arg_1;
            }, "recoverNum.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                addRecoverNumButton.toolTip = _arg_1;
            }, "addRecoverNumButton.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_INFO_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeInfoPanel_RoundedLabel6.text = _arg_1;
            }, "_MazeInfoPanel_RoundedLabel6.text");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (mapPic);
            }, function (_arg_1:Object):void
            {
                mapImage.source = _arg_1;
            }, "mapImage.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map0.source = _arg_1;
            }, "map0.source");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map1.source = _arg_1;
            }, "map1.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map2.source = _arg_1;
            }, "map2.source");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map3.source = _arg_1;
            }, "map3.source");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map4.source = _arg_1;
            }, "map4.source");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map5.source = _arg_1;
            }, "map5.source");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map6.source = _arg_1;
            }, "map6.source");
            result[17] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map7.source = _arg_1;
            }, "map7.source");
            result[18] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map8.source = _arg_1;
            }, "map8.source");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map9.source = _arg_1;
            }, "map9.source");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map10.source = _arg_1;
            }, "map10.source");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map11.source = _arg_1;
            }, "map11.source");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map12.source = _arg_1;
            }, "map12.source");
            result[23] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map13.source = _arg_1;
            }, "map13.source");
            result[24] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map14.source = _arg_1;
            }, "map14.source");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map15.source = _arg_1;
            }, "map15.source");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map16.source = _arg_1;
            }, "map16.source");
            result[27] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map17.source = _arg_1;
            }, "map17.source");
            result[28] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map18.source = _arg_1;
            }, "map18.source");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map19.source = _arg_1;
            }, "map19.source");
            result[30] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map20.source = _arg_1;
            }, "map20.source");
            result[31] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map21.source = _arg_1;
            }, "map21.source");
            result[32] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map22.source = _arg_1;
            }, "map22.source");
            result[33] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map23.source = _arg_1;
            }, "map23.source");
            result[34] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map24.source = _arg_1;
            }, "map24.source");
            result[35] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map25.source = _arg_1;
            }, "map25.source");
            result[36] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map26.source = _arg_1;
            }, "map26.source");
            result[37] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map27.source = _arg_1;
            }, "map27.source");
            result[38] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map28.source = _arg_1;
            }, "map28.source");
            result[39] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map29.source = _arg_1;
            }, "map29.source");
            result[40] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map30.source = _arg_1;
            }, "map30.source");
            result[41] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map31.source = _arg_1;
            }, "map31.source");
            result[42] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map32.source = _arg_1;
            }, "map32.source");
            result[43] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map33.source = _arg_1;
            }, "map33.source");
            result[44] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map34.source = _arg_1;
            }, "map34.source");
            result[45] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map35.source = _arg_1;
            }, "map35.source");
            result[46] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map36.source = _arg_1;
            }, "map36.source");
            result[47] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map37.source = _arg_1;
            }, "map37.source");
            result[48] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map38.source = _arg_1;
            }, "map38.source");
            result[49] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map39.source = _arg_1;
            }, "map39.source");
            result[50] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map40.source = _arg_1;
            }, "map40.source");
            result[51] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map41.source = _arg_1;
            }, "map41.source");
            result[52] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map42.source = _arg_1;
            }, "map42.source");
            result[53] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map43.source = _arg_1;
            }, "map43.source");
            result[54] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map44.source = _arg_1;
            }, "map44.source");
            result[55] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map45.source = _arg_1;
            }, "map45.source");
            result[56] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map46.source = _arg_1;
            }, "map46.source");
            result[57] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map47.source = _arg_1;
            }, "map47.source");
            result[58] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map48.source = _arg_1;
            }, "map48.source");
            result[59] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map49.source = _arg_1;
            }, "map49.source");
            result[60] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map50.source = _arg_1;
            }, "map50.source");
            result[61] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map51.source = _arg_1;
            }, "map51.source");
            result[62] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiPic);
            }, function (_arg_1:Object):void
            {
                map52.source = _arg_1;
            }, "map52.source");
            result[63] = binding;
            binding = new Binding(this, function ():Object
            {
                return (huiZhongPic);
            }, function (_arg_1:Object):void
            {
                map53.source = _arg_1;
            }, "map53.source");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeInfoPanel_Button5.label = _arg_1;
            }, "_MazeInfoPanel_Button5.label");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeInfoPanel_Button6.toolTip = _arg_1;
            }, "_MazeInfoPanel_Button6.toolTip");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeInfoPanel_Button6.label = _arg_1;
            }, "_MazeInfoPanel_Button6.label");
            result[67] = binding;
            return (result);
        }

        public function set MazeInfoC(_arg_1:Canvas):void
        {
            var _local_2:Object = this._617523018MazeInfoC;
            if (_local_2 !== _arg_1)
            {
                this._617523018MazeInfoC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MazeInfoC", _local_2, _arg_1));
            };
        }

        public function set map30(_arg_1:Image):void
        {
            var _local_2:Object = this._103662777map30;
            if (_local_2 !== _arg_1)
            {
                this._103662777map30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map30", _local_2, _arg_1));
            };
        }

        public function set map32(_arg_1:Image):void
        {
            var _local_2:Object = this._103662779map32;
            if (_local_2 !== _arg_1)
            {
                this._103662779map32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map32", _local_2, _arg_1));
            };
        }

        public function set map31(_arg_1:Image):void
        {
            var _local_2:Object = this._103662778map31;
            if (_local_2 !== _arg_1)
            {
                this._103662778map31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map31", _local_2, _arg_1));
            };
        }

        public function set map35(_arg_1:Image):void
        {
            var _local_2:Object = this._103662782map35;
            if (_local_2 !== _arg_1)
            {
                this._103662782map35 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map35", _local_2, _arg_1));
            };
        }

        public function set map36(_arg_1:Image):void
        {
            var _local_2:Object = this._103662783map36;
            if (_local_2 !== _arg_1)
            {
                this._103662783map36 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map36", _local_2, _arg_1));
            };
        }

        public function set map38(_arg_1:Image):void
        {
            var _local_2:Object = this._103662785map38;
            if (_local_2 !== _arg_1)
            {
                this._103662785map38 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map38", _local_2, _arg_1));
            };
        }

        public function set map39(_arg_1:Image):void
        {
            var _local_2:Object = this._103662786map39;
            if (_local_2 !== _arg_1)
            {
                this._103662786map39 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map39", _local_2, _arg_1));
            };
        }

        public function set map33(_arg_1:Image):void
        {
            var _local_2:Object = this._103662780map33;
            if (_local_2 !== _arg_1)
            {
                this._103662780map33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map33", _local_2, _arg_1));
            };
        }

        public function set map34(_arg_1:Image):void
        {
            var _local_2:Object = this._103662781map34;
            if (_local_2 !== _arg_1)
            {
                this._103662781map34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map34", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skipNum():RoundedLabel
        {
            return (this._2147412359skipNum);
        }

        override public function initialize():void
        {
            var target:MazeInfoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MazeInfoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MazeInfoPanelWatcherSetupUtil");
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
        public function get recoverNum():RoundedLabel
        {
            return (this._851204994recoverNum);
        }

        [Bindable(event="propertyChange")]
        public function get actNum():RoundedLabel
        {
            return (this._1422976620actNum);
        }

        private function _MazeInfoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAZE_INFO_PANEL_U[0];
            _local_1 = Language.MAZE_INFO_PANEL_U[1];
            _local_1 = Language.MAZE_INFO_PANEL_U[2];
            _local_1 = Language.MAZE_INFO_PANEL_U[3];
            _local_1 = Language.MAZE_INFO_PANEL_U[4];
            _local_1 = Language.MAZE_INFO_PANEL_U[5];
            _local_1 = Language.MAZE_INFO_PANEL_U[8];
            _local_1 = Language.MAZE_INFO_PANEL_U[7];
            _local_1 = Language.MAZE_INFO_PANEL_U[9];
            _local_1 = Language.MAZE_INFO_PANEL_U[6];
            _local_1 = mapPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiPic;
            _local_1 = huiZhongPic;
            _local_1 = Language.MINIMAPCANVAS_U[18];
            _local_1 = Language.USERSYSTEMSETPANEL_S[19];
            _local_1 = Language.USERSYSTEMSETPANEL_U[4];
        }

        public function set map37(_arg_1:Image):void
        {
            var _local_2:Object = this._103662784map37;
            if (_local_2 !== _arg_1)
            {
                this._103662784map37 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map37", _local_2, _arg_1));
            };
        }

        public function addSkipNum():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("mazeBuySkipNum", new Responder(updateData), null);
                };
            };
            Alert.show(Language.MAZE_INFO_PANEL_U[10].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        public function set map40(_arg_1:Image):void
        {
            var _local_2:Object = this._103662808map40;
            if (_local_2 !== _arg_1)
            {
                this._103662808map40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map40", _local_2, _arg_1));
            };
        }

        public function set map41(_arg_1:Image):void
        {
            var _local_2:Object = this._103662809map41;
            if (_local_2 !== _arg_1)
            {
                this._103662809map41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map41", _local_2, _arg_1));
            };
        }

        public function set map42(_arg_1:Image):void
        {
            var _local_2:Object = this._103662810map42;
            if (_local_2 !== _arg_1)
            {
                this._103662810map42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map42", _local_2, _arg_1));
            };
        }

        public function set map43(_arg_1:Image):void
        {
            var _local_2:Object = this._103662811map43;
            if (_local_2 !== _arg_1)
            {
                this._103662811map43 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map43", _local_2, _arg_1));
            };
        }

        public function set map44(_arg_1:Image):void
        {
            var _local_2:Object = this._103662812map44;
            if (_local_2 !== _arg_1)
            {
                this._103662812map44 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map44", _local_2, _arg_1));
            };
        }

        public function set map45(_arg_1:Image):void
        {
            var _local_2:Object = this._103662813map45;
            if (_local_2 !== _arg_1)
            {
                this._103662813map45 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map45", _local_2, _arg_1));
            };
        }

        public function set map46(_arg_1:Image):void
        {
            var _local_2:Object = this._103662814map46;
            if (_local_2 !== _arg_1)
            {
                this._103662814map46 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map46", _local_2, _arg_1));
            };
        }

        public function set map47(_arg_1:Image):void
        {
            var _local_2:Object = this._103662815map47;
            if (_local_2 !== _arg_1)
            {
                this._103662815map47 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map47", _local_2, _arg_1));
            };
        }

        public function set map48(_arg_1:Image):void
        {
            var _local_2:Object = this._103662816map48;
            if (_local_2 !== _arg_1)
            {
                this._103662816map48 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map48", _local_2, _arg_1));
            };
        }

        public function set map49(_arg_1:Image):void
        {
            var _local_2:Object = this._103662817map49;
            if (_local_2 !== _arg_1)
            {
                this._103662817map49 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map49", _local_2, _arg_1));
            };
        }

        public function initView():void
        {
        }

        public function showEventInfo():void
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_MAZE_EVENT_INFO);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        public function set map50(_arg_1:Image):void
        {
            var _local_2:Object = this._103662839map50;
            if (_local_2 !== _arg_1)
            {
                this._103662839map50 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map50", _local_2, _arg_1));
            };
        }

        public function set map51(_arg_1:Image):void
        {
            var _local_2:Object = this._103662840map51;
            if (_local_2 !== _arg_1)
            {
                this._103662840map51 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "map51", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

