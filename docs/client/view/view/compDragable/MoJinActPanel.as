// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MoJinActPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.containers.ViewStack;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Alert;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.FlexEvent;
    import mx.events.CloseEvent;
    import com.qeedoo.game.utils.TimeUtil;
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

    public class MoJinActPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1260729712lb_num_C1:Label;
        private var _427915793lb_num_BB1:Label;
        private var _1110417470label6:Label;
        private var _808329852vsFlop:ViewStack;
        private var _1260729742lb_num_B2:Label;
        private var _1975932390lb_point_B0:Label;
        private var _427914800lb_num_CC2:Label;
        private var _1185080788img_B2:Image;
        private var _1260729744lb_num_B0:Label;
        private var _1975932359lb_point_A0:Label;
        private var _496824467lb_point_mlxt:Label;
        private var _102754665lb_r2:Label;
        private var _1185080757img_C2:Image;
        private var _1260729774lb_num_A1:Label;
        private var _1110417469label7:Label;
        private var _1147382393lb_point:Label;
        private var _1975932423lb_point_C2:Label;
        private var _1975932360lb_point_A1:Label;
        private var _1110417472label4:Label;
        private var _427916786lb_num_AA0:Label;
        private var _1975934120lb_point_xh:Label;
        public var _MoJinActPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _63203309label10:Label;
        private var _427915794lb_num_BB0:Label;
        private var _427914799lb_num_CC3:Label;
        private var _1260729711lb_num_C2:Label;
        private var _427914801lb_num_CC1:Label;
        private var _1975932392lb_point_B2:Label;
        private var _1185080759img_C0:Image;
        public var _MoJinActPanel_Image11:Image;
        public var _MoJinActPanel_Image12:Image;
        public var _MoJinActPanel_Image17:Image;
        public var _MoJinActPanel_Image18:Image;
        public var _MoJinActPanel_Image19:Image;
        private var itemRuleStr:String = "";
        private var _1185080790img_B0:Image;
        private var _1110417474label2:Label;
        private var _1185080821img_A0:Image;
        private var _1260729713lb_num_C0:Label;
        public var _MoJinActPanel_Image21:Image;
        public var _MoJinActPanel_Image22:Image;
        public var _MoJinActPanel_Image23:Image;
        public var _MoJinActPanel_Image24:Image;
        public var _MoJinActPanel_Image25:Image;
        public var _MoJinActPanel_Image26:Image;
        public var _MoJinActPanel_Image20:Image;
        private var _helpAlert:Alert;
        private var _1124416174lb_point_xxf:Label;
        private var _102754663lb_r0:Label;
        private var _1185080756img_C3:Image;
        private var _427915792lb_num_BB2:Label;
        private var _1110417468label8:Label;
        private var _1260729743lb_num_B1:Label;
        private var _1975932422lb_point_C1:Label;
        private var _1110417471label5:Label;
        private var _1185080789img_B1:Image;
        private var _1975932391lb_point_B1:Label;
        private var _1260729775lb_num_A0:Label;
        private var _427914802lb_num_CC0:Label;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _1185080758img_C1:Image;
        private var _1260729710lb_num_C3:Label;
        private var _1975932421lb_point_C0:Label;
        private var _1110417473label3:Label;
        private var _789140625helpinfo:Label;
        public var _MoJinActPanel_Image1:Image;
        private var _102754664lb_r1:Label;
        public var _MoJinActPanel_Image3:Image;
        public var _MoJinActPanel_Image6:Image;
        public var _MoJinActPanel_Image7:Image;
        private var _1185080820img_A1:Image;
        private var _427916785lb_num_AA1:Label;
        public var _MoJinActPanel_Image2:Image;
        private var _1975932424lb_point_C3:Label;
        private var _1110417467label9:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":600,
                    "height":570,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MoJinActPanel_BasicTitleCanvas1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn0",
                        "events":{"click":"__bangBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "labelPlacement":"bottom",
                                "width":70,
                                "x":20,
                                "y":35
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
                                "width":70,
                                "x":89,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"lb_point",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFD700;
                            this.fontSize = 12;
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":412,
                                "y":35,
                                "width":178
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsFlop",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":55,
                                "width":580,
                                "height":490,
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":580,
                                            "height":490,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MoJinActPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":580,
                                                        "height":490
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "label":"Hornor",
                                                        "y":16,
                                                        "width":560,
                                                        "height":100,
                                                        "x":10,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":560,
                                                                    "height":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":30,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_A0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0100,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_A1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":332,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_A0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":245,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_A1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":321,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":25,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"领取"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":251,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":327,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_r0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 14;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":78,
                                                                    "y":24,
                                                                    "width":168
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_A1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":332,
                                                                    "y":37,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_A0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0101,
                                                                    "y":37,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
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
                                                        "y":119,
                                                        "width":560,
                                                        "height":100,
                                                        "x":10,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":560,
                                                                    "height":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":30,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_B0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0100,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_B1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":332,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_B2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":408,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button4_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":25,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"领取"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button5_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":251,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button6_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":327,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button7_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":403,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_r1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 14;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":78,
                                                                    "y":24,
                                                                    "width":168
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_B0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":246,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_B1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":323,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_B2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":398,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_B1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":332,
                                                                    "y":37,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_B2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":409,
                                                                    "y":37,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_B0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0101,
                                                                    "y":37,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
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
                                                        "y":222,
                                                        "width":560,
                                                        "height":100,
                                                        "x":10,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":560,
                                                                    "height":100
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_C0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":246,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_C1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":322,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_C2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":398,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_C3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":473,
                                                                    "y":80,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":30,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_C0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0100,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_C1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":332,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_C2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":408,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_C3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":484,
                                                                    "y":11,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button8_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":25,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"领取"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button9_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":251,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button10_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":327,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button11_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":403,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button12_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":479,
                                                                    "y":57,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_r2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 14;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":78,
                                                                    "y":24,
                                                                    "width":168
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_C3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":485,
                                                                    "y":37,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_C2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":409,
                                                                    "y":36,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_C0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0101,
                                                                    "y":37,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_C1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":332,
                                                                    "y":37,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
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
                                                        "y":325,
                                                        "width":560,
                                                        "height":160,
                                                        "x":10,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":560,
                                                                    "height":160
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_xh",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":447,
                                                                    "y":33,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_xxf",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":447,
                                                                    "y":85,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_point_mlxt",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFD700;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":447,
                                                                    "y":137,
                                                                    "width":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":120,
                                                                    "y":10,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168,
                                                                    "y":20,
                                                                    "text":"+"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168,
                                                                    "y":67,
                                                                    "text":"+"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":244,
                                                                    "y":67,
                                                                    "text":"+"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image19",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":196,
                                                                    "y":10,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":120,
                                                                    "y":60,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image21",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":196,
                                                                    "y":60,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image22",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":272,
                                                                    "y":60,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image23",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":120,
                                                                    "y":110,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image24",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":196,
                                                                    "y":110,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image25",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":272,
                                                                    "y":110,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_MoJinActPanel_Image26",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":348,
                                                                    "y":110,
                                                                    "width":40,
                                                                    "height":40
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button13_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":453,
                                                                    "y":10,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button14_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":453,
                                                                    "y":63,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___MoJinActPanel_Button15_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":453,
                                                                    "y":116,
                                                                    "width":50,
                                                                    "height":23,
                                                                    "label":"兑换"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168,
                                                                    "y":118,
                                                                    "text":"+"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":244,
                                                                    "y":118,
                                                                    "text":"+"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":320,
                                                                    "y":118,
                                                                    "text":"+"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":20,
                                                                    "y":19,
                                                                    "width":81,
                                                                    "text":"组合一："
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":20,
                                                                    "y":69,
                                                                    "width":81,
                                                                    "text":"组合二："
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"label10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":20,
                                                                    "y":117,
                                                                    "width":81,
                                                                    "text":"组合三："
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_AA1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":197,
                                                                    "y":36,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_AA0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":121,
                                                                    "y":36,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_BB0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":121,
                                                                    "y":86,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_BB1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":197,
                                                                    "y":86,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_BB2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":273,
                                                                    "y":86,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_CC0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":121,
                                                                    "y":135,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_CC1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":196,
                                                                    "y":135,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_CC2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":272,
                                                                    "y":135,
                                                                    "width":43,
                                                                    "height":18,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"lb_num_CC3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":349,
                                                                    "y":135,
                                                                    "width":43,
                                                                    "height":18,
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
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "y":60,
                                            "width":580,
                                            "height":490,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"helpinfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "width":560,
                                                        "height":470
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
        private var MoJinActConf:Object = {};
        private var MoJinActData:Object = {};
        private var _core:Core = Core.getInstance();
        private var iidObj:Object = {};
        private var typeArr:Array = ["福礼包", "尊享包", "至尊包"];
        private var numArr:Array = ["numA", "numB", "numC"];
        private var chipType:Array = ["itemA", "itemB", "itemC"];
        private var strArr:Array = [["邂", "逅"], ["小", "幸", "福"], ["魔", "力", "学", "堂"]];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MoJinActPanel()
        {
            mx_internal::_document = this;
            this.width = 600;
            this.height = 570;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            this.addEventListener("creationComplete", ___MoJinActPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MoJinActPanel._watcherSetupUtil = _arg_1;
        }


        public function set lb_num_BB1(_arg_1:Label):void
        {
            var _local_2:Object = this._427915793lb_num_BB1;
            if (_local_2 !== _arg_1)
            {
                this._427915793lb_num_BB1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_BB1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_C0():Label
        {
            return (this._1975932421lb_point_C0);
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_C2():Label
        {
            return (this._1975932423lb_point_C2);
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_B1():Label
        {
            return (this._1975932391lb_point_B1);
        }

        public function set lb_point_C0(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932421lb_point_C0;
            if (_local_2 !== _arg_1)
            {
                this._1975932421lb_point_C0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_C0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_C1():Label
        {
            return (this._1975932422lb_point_C1);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_AA0():Label
        {
            return (this._427916786lb_num_AA0);
        }

        public function set lb_point_C3(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932424lb_point_C3;
            if (_local_2 !== _arg_1)
            {
                this._1975932424lb_point_C3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_C3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img_A0():Image
        {
            return (this._1185080821img_A0);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_CC1():Label
        {
            return (this._427914801lb_num_CC1);
        }

        public function set img_A0(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080821img_A0;
            if (_local_2 !== _arg_1)
            {
                this._1185080821img_A0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_A0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_C3():Label
        {
            return (this._1975932424lb_point_C3);
        }

        [Bindable(event="propertyChange")]
        public function get label10():Label
        {
            return (this._63203309label10);
        }

        [Bindable(event="propertyChange")]
        public function get img_A1():Image
        {
            return (this._1185080820img_A1);
        }

        public function set lb_num_AA0(_arg_1:Label):void
        {
            var _local_2:Object = this._427916786lb_num_AA0;
            if (_local_2 !== _arg_1)
            {
                this._427916786lb_num_AA0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_AA0", _local_2, _arg_1));
            };
        }

        public function set lb_point_C2(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932423lb_point_C2;
            if (_local_2 !== _arg_1)
            {
                this._1975932423lb_point_C2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_C2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_AA1():Label
        {
            return (this._427916785lb_num_AA1);
        }

        public function set img_A1(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080820img_A1;
            if (_local_2 !== _arg_1)
            {
                this._1185080820img_A1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_A1", _local_2, _arg_1));
            };
        }

        public function set lb_point_C1(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932422lb_point_C1;
            if (_local_2 !== _arg_1)
            {
                this._1975932422lb_point_C1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_C1", _local_2, _arg_1));
            };
        }

        public function set lb_num_AA1(_arg_1:Label):void
        {
            var _local_2:Object = this._427916785lb_num_AA1;
            if (_local_2 !== _arg_1)
            {
                this._427916785lb_num_AA1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_AA1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img_B0():Image
        {
            return (this._1185080790img_B0);
        }

        [Bindable(event="propertyChange")]
        public function get img_B1():Image
        {
            return (this._1185080789img_B1);
        }

        public function ___MoJinActPanel_Button6_click(_arg_1:MouseEvent):void
        {
            exchangeChip(11);
        }

        private function _MoJinActPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOJINACT[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MoJinActPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MoJinActPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOJINACT[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOJINACT[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000933));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image1.source = _arg_1;
            }, "_MoJinActPanel_Image1.source");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000935));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image2.source = _arg_1;
            }, "_MoJinActPanel_Image2.source");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000939));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image3.source = _arg_1;
            }, "_MoJinActPanel_Image3.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000925));
            }, function (_arg_1:Object):void
            {
                img_A0.source = _arg_1;
            }, "img_A0.source");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000924));
            }, function (_arg_1:Object):void
            {
                img_A1.source = _arg_1;
            }, "img_A1.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000936));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image6.source = _arg_1;
            }, "_MoJinActPanel_Image6.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000940));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image7.source = _arg_1;
            }, "_MoJinActPanel_Image7.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000930));
            }, function (_arg_1:Object):void
            {
                img_B0.source = _arg_1;
            }, "img_B0.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000931));
            }, function (_arg_1:Object):void
            {
                img_B1.source = _arg_1;
            }, "img_B1.source");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000932));
            }, function (_arg_1:Object):void
            {
                img_B2.source = _arg_1;
            }, "img_B2.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000937));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image11.source = _arg_1;
            }, "_MoJinActPanel_Image11.source");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000941));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image12.source = _arg_1;
            }, "_MoJinActPanel_Image12.source");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000926));
            }, function (_arg_1:Object):void
            {
                img_C0.source = _arg_1;
            }, "img_C0.source");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000927));
            }, function (_arg_1:Object):void
            {
                img_C1.source = _arg_1;
            }, "img_C1.source");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000928));
            }, function (_arg_1:Object):void
            {
                img_C2.source = _arg_1;
            }, "img_C2.source");
            result[17] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000929));
            }, function (_arg_1:Object):void
            {
                img_C3.source = _arg_1;
            }, "img_C3.source");
            result[18] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000934));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image17.source = _arg_1;
            }, "_MoJinActPanel_Image17.source");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000925));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image18.source = _arg_1;
            }, "_MoJinActPanel_Image18.source");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000924));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image19.source = _arg_1;
            }, "_MoJinActPanel_Image19.source");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000930));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image20.source = _arg_1;
            }, "_MoJinActPanel_Image20.source");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000931));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image21.source = _arg_1;
            }, "_MoJinActPanel_Image21.source");
            result[23] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000932));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image22.source = _arg_1;
            }, "_MoJinActPanel_Image22.source");
            result[24] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000926));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image23.source = _arg_1;
            }, "_MoJinActPanel_Image23.source");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000927));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image24.source = _arg_1;
            }, "_MoJinActPanel_Image24.source");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000928));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image25.source = _arg_1;
            }, "_MoJinActPanel_Image25.source");
            result[27] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000929));
            }, function (_arg_1:Object):void
            {
                _MoJinActPanel_Image26.source = _arg_1;
            }, "_MoJinActPanel_Image26.source");
            result[28] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get img_B2():Image
        {
            return (this._1185080788img_B2);
        }

        [Bindable(event="propertyChange")]
        public function get img_C0():Image
        {
            return (this._1185080759img_C0);
        }

        [Bindable(event="propertyChange")]
        public function get img_C2():Image
        {
            return (this._1185080757img_C2);
        }

        [Bindable(event="propertyChange")]
        public function get img_C3():Image
        {
            return (this._1185080756img_C3);
        }

        public function set img_B0(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080790img_B0;
            if (_local_2 !== _arg_1)
            {
                this._1185080790img_B0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_B0", _local_2, _arg_1));
            };
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        public function set img_B2(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080788img_B2;
            if (_local_2 !== _arg_1)
            {
                this._1185080788img_B2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_B2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img_C1():Image
        {
            return (this._1185080758img_C1);
        }

        public function set label10(_arg_1:Label):void
        {
            var _local_2:Object = this._63203309label10;
            if (_local_2 !== _arg_1)
            {
                this._63203309label10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_A0():Label
        {
            return (this._1260729775lb_num_A0);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_A1():Label
        {
            return (this._1260729774lb_num_A1);
        }

        public function ___MoJinActPanel_Button14_click(_arg_1:MouseEvent):void
        {
            exchangeChipGroup(1);
        }

        public function set img_B1(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080789img_B1;
            if (_local_2 !== _arg_1)
            {
                this._1185080789img_B1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_B1", _local_2, _arg_1));
            };
        }

        public function ___MoJinActPanel_Button3_click(_arg_1:MouseEvent):void
        {
            exchangeChip(1);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_B1():Label
        {
            return (this._1260729743lb_num_B1);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_B2():Label
        {
            return (this._1260729742lb_num_B2);
        }

        private function changeView(_arg_1:Number):void
        {
            vsFlop.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 2)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_B0():Label
        {
            return (this._1260729744lb_num_B0);
        }

        public function ___MoJinActPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_C0():Label
        {
            return (this._1260729713lb_num_C0);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_C1():Label
        {
            return (this._1260729712lb_num_C1);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_C2():Label
        {
            return (this._1260729711lb_num_C2);
        }

        public function set img_C0(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080759img_C0;
            if (_local_2 !== _arg_1)
            {
                this._1185080759img_C0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_C0", _local_2, _arg_1));
            };
        }

        public function set img_C2(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080757img_C2;
            if (_local_2 !== _arg_1)
            {
                this._1185080757img_C2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_C2", _local_2, _arg_1));
            };
        }

        public function set img_C3(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080756img_C3;
            if (_local_2 !== _arg_1)
            {
                this._1185080756img_C3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_C3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_C3():Label
        {
            return (this._1260729710lb_num_C3);
        }

        public function ___MoJinActPanel_Button11_click(_arg_1:MouseEvent):void
        {
            exchangeChip(22);
        }

        public function set img_C1(_arg_1:Image):void
        {
            var _local_2:Object = this._1185080758img_C1;
            if (_local_2 !== _arg_1)
            {
                this._1185080758img_C1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_C1", _local_2, _arg_1));
            };
        }

        public function set lb_num_A0(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729775lb_num_A0;
            if (_local_2 !== _arg_1)
            {
                this._1260729775lb_num_A0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_A0", _local_2, _arg_1));
            };
        }

        public function set lb_num_A1(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729774lb_num_A1;
            if (_local_2 !== _arg_1)
            {
                this._1260729774lb_num_A1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_A1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_xh():Label
        {
            return (this._1975934120lb_point_xh);
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_mlxt():Label
        {
            return (this._496824467lb_point_mlxt);
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_xxf():Label
        {
            return (this._1124416174lb_point_xxf);
        }

        private function exchangeChipGroup(type:Number):void
        {
            var a:* = undefined;
            var b:* = undefined;
            var c:* = undefined;
            var typeStr:String = "";
            var rebateNum:Number = 9999;
            if (type == 0)
            {
                typeStr = "“邂”“逅”";
                rebateNum = MoJinActConf.numXH;
                a = 0;
                while (a < 2)
                {
                    if (MoJinActData.itemA[a] < 1)
                    {
                        Alert.show(Language.MOJINACT[7], "", Alert.YES);
                        return;
                    };
                    a++;
                };
            }
            else
            {
                if (type == 1)
                {
                    typeStr = "“小”“幸”“福”";
                    rebateNum = MoJinActConf.numXXF;
                    b = 0;
                    while (b < 3)
                    {
                        if (MoJinActData.itemB[b] < 1)
                        {
                            Alert.show(Language.MOJINACT[7], "", Alert.YES);
                            return;
                        };
                        b++;
                    };
                }
                else
                {
                    typeStr = "“魔”“力”“学”“堂”";
                    rebateNum = MoJinActConf.numMLXT;
                    c = 0;
                    while (c < 4)
                    {
                        if (MoJinActData.itemC[c] < 1)
                        {
                            Alert.show(Language.MOJINACT[7], "", Alert.YES);
                            return;
                        };
                        c++;
                    };
                };
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("exchangeMoJinChipGroup", null, type);
                };
            };
            Alert.show(Language.MOJINACT[9].replace("{type}", typeStr).replace("{num}", rebateNum), "", (Alert.YES | Alert.NO), null, func);
        }

        public function ___MoJinActPanel_Button8_click(_arg_1:MouseEvent):void
        {
            getLuckyBox(2);
        }

        public function set lb_r0(_arg_1:Label):void
        {
            var _local_2:Object = this._102754663lb_r0;
            if (_local_2 !== _arg_1)
            {
                this._102754663lb_r0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_r0", _local_2, _arg_1));
            };
        }

        public function set lb_r1(_arg_1:Label):void
        {
            var _local_2:Object = this._102754664lb_r1;
            if (_local_2 !== _arg_1)
            {
                this._102754664lb_r1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_r1", _local_2, _arg_1));
            };
        }

        public function set lb_r2(_arg_1:Label):void
        {
            var _local_2:Object = this._102754665lb_r2;
            if (_local_2 !== _arg_1)
            {
                this._102754665lb_r2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_r2", _local_2, _arg_1));
            };
        }

        public function set lb_num_B1(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729743lb_num_B1;
            if (_local_2 !== _arg_1)
            {
                this._1260729743lb_num_B1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_B1", _local_2, _arg_1));
            };
        }

        public function set lb_num_B2(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729742lb_num_B2;
            if (_local_2 !== _arg_1)
            {
                this._1260729742lb_num_B2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_B2", _local_2, _arg_1));
            };
        }

        public function set helpinfo(_arg_1:Label):void
        {
            var _local_2:Object = this._789140625helpinfo;
            if (_local_2 !== _arg_1)
            {
                this._789140625helpinfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "helpinfo", _local_2, _arg_1));
            };
        }

        public function set lb_num_B0(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729744lb_num_B0;
            if (_local_2 !== _arg_1)
            {
                this._1260729744lb_num_B0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_B0", _local_2, _arg_1));
            };
        }

        public function ___MoJinActPanel_Button5_click(_arg_1:MouseEvent):void
        {
            exchangeChip(10);
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function set vsFlop(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._808329852vsFlop;
            if (_local_2 !== _arg_1)
            {
                this._808329852vsFlop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsFlop", _local_2, _arg_1));
            };
        }

        public function set lb_point(_arg_1:Label):void
        {
            var _local_2:Object = this._1147382393lb_point;
            if (_local_2 !== _arg_1)
            {
                this._1147382393lb_point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point", _local_2, _arg_1));
            };
        }

        private function exchangeChip(type:Number):void
        {
            var Num:Number = Math.floor((type / 10));
            var index:Number = (type % 10);
            var itemNum:Number = MoJinActData[chipType[Num]][index];
            if (itemNum < 1)
            {
                Alert.show(Language.MOJINACT[7], "", Alert.YES);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("exchangeMoJinChip", null, type);
                };
            };
            Alert.show(Language.MOJINACT[8].replace("{type}", strArr[Num][index]).replace("{num}", MoJinActConf[numArr[Num]][index]), "", (Alert.YES | Alert.NO), null, func);
        }

        public function refreshMoJinActData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            MoJinActConf = _arg_1["conf"];
            MoJinActData = _arg_1["data"];
            var _local_2:* = 0;
            while (_local_2 < 3)
            {
                this[("lb_r" + _local_2)].htmlText = Language.MOJINACT[3].replace("{num}", MoJinActConf.luckybox[_local_2]).replace("{type}", typeArr[_local_2]);
                _local_2++;
            };
            var _local_3:* = "金";
            var _local_4:* = 0;
            while (_local_4 < 2)
            {
                this[("lb_point_A" + _local_4)].htmlText = (MoJinActConf.numA[_local_4] + _local_3);
                this[("lb_num_A" + _local_4)].htmlText = MoJinActData.itemA[_local_4];
                this[("lb_num_AA" + _local_4)].htmlText = MoJinActData.itemA[_local_4];
                _local_4++;
            };
            var _local_5:* = 0;
            while (_local_5 < 3)
            {
                this[("lb_point_B" + _local_5)].htmlText = (MoJinActConf.numB[_local_5] + _local_3);
                this[("lb_num_B" + _local_5)].htmlText = MoJinActData.itemB[_local_5];
                this[("lb_num_BB" + _local_5)].htmlText = MoJinActData.itemB[_local_5];
                _local_5++;
            };
            var _local_6:* = 0;
            while (_local_6 < 4)
            {
                this[("lb_point_C" + _local_6)].htmlText = (MoJinActConf.numC[_local_6] + _local_3);
                this[("lb_num_C" + _local_6)].htmlText = MoJinActData.itemC[_local_6];
                this[("lb_num_CC" + _local_6)].htmlText = MoJinActData.itemC[_local_6];
                _local_6++;
            };
            lb_point_xh.htmlText = (MoJinActConf.numXH + _local_3);
            lb_point_xxf.htmlText = (MoJinActConf.numXXF + _local_3);
            lb_point_mlxt.htmlText = (MoJinActConf.numMLXT + _local_3);
            lb_point.htmlText = Language.MOJINACT[4].replace("{num}", MoJinActData.interNum);
            helpinfo.htmlText = Language.MOJINACT[10].replace("{num}", (Number(MoJinActConf.payNumOne) * 10)).replace("{time1}", TimeUtil.dateTimeToString(new Date(MoJinActConf.start))).replace("{time2}", TimeUtil.dateTimeToString(new Date(MoJinActConf.end)));
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        public function set lb_num_C3(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729710lb_num_C3;
            if (_local_2 !== _arg_1)
            {
                this._1260729710lb_num_C3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_C3", _local_2, _arg_1));
            };
        }

        public function set lb_num_C1(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729712lb_num_C1;
            if (_local_2 !== _arg_1)
            {
                this._1260729712lb_num_C1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_C1", _local_2, _arg_1));
            };
        }

        public function ___MoJinActPanel_Button2_click(_arg_1:MouseEvent):void
        {
            exchangeChip(0);
        }

        public function set lb_num_C0(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729713lb_num_C0;
            if (_local_2 !== _arg_1)
            {
                this._1260729713lb_num_C0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_C0", _local_2, _arg_1));
            };
        }

        public function ___MoJinActPanel_Button13_click(_arg_1:MouseEvent):void
        {
            exchangeChipGroup(0);
        }

        public function set lb_point_mlxt(_arg_1:Label):void
        {
            var _local_2:Object = this._496824467lb_point_mlxt;
            if (_local_2 !== _arg_1)
            {
                this._496824467lb_point_mlxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_mlxt", _local_2, _arg_1));
            };
        }

        private function getLuckyBox(type:Number):void
        {
            var needNum:Number = MoJinActConf.luckybox[type];
            if (needNum > MoJinActData.interNum)
            {
                Alert.show(Language.MOJINACT[5], "", Alert.YES);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("getMoJinLuckyBox", null, type);
                };
            };
            Alert.show(Language.MOJINACT[6].replace("{num}", needNum).replace("{type}", typeArr[type]), "", (Alert.YES | Alert.NO), null, func);
        }

        public function set lb_num_C2(_arg_1:Label):void
        {
            var _local_2:Object = this._1260729711lb_num_C2;
            if (_local_2 !== _arg_1)
            {
                this._1260729711lb_num_C2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_C2", _local_2, _arg_1));
            };
        }

        public function set lb_point_xh(_arg_1:Label):void
        {
            var _local_2:Object = this._1975934120lb_point_xh;
            if (_local_2 !== _arg_1)
            {
                this._1975934120lb_point_xh = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_xh", _local_2, _arg_1));
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

        public function ___MoJinActPanel_Button10_click(_arg_1:MouseEvent):void
        {
            exchangeChip(21);
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

        public function set lb_point_xxf(_arg_1:Label):void
        {
            var _local_2:Object = this._1124416174lb_point_xxf;
            if (_local_2 !== _arg_1)
            {
                this._1124416174lb_point_xxf = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_xxf", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_r1():Label
        {
            return (this._102754664lb_r1);
        }

        [Bindable(event="propertyChange")]
        public function get lb_r2():Label
        {
            return (this._102754665lb_r2);
        }

        [Bindable(event="propertyChange")]
        public function get lb_r0():Label
        {
            return (this._102754663lb_r0);
        }

        public function ___MoJinActPanel_Button7_click(_arg_1:MouseEvent):void
        {
            exchangeChip(12);
        }

        [Bindable(event="propertyChange")]
        public function get helpinfo():Label
        {
            return (this._789140625helpinfo);
        }

        public function set label2(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417474label2;
            if (_local_2 !== _arg_1)
            {
                this._1110417474label2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label2", _local_2, _arg_1));
            };
        }

        public function set label3(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417473label3;
            if (_local_2 !== _arg_1)
            {
                this._1110417473label3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label3", _local_2, _arg_1));
            };
        }

        public function set label5(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417471label5;
            if (_local_2 !== _arg_1)
            {
                this._1110417471label5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label5", _local_2, _arg_1));
            };
        }

        public function set label6(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417470label6;
            if (_local_2 !== _arg_1)
            {
                this._1110417470label6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label6", _local_2, _arg_1));
            };
        }

        public function set label7(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417469label7;
            if (_local_2 !== _arg_1)
            {
                this._1110417469label7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label7", _local_2, _arg_1));
            };
        }

        public function set label4(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417472label4;
            if (_local_2 !== _arg_1)
            {
                this._1110417472label4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label4", _local_2, _arg_1));
            };
        }

        public function set label8(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417468label8;
            if (_local_2 !== _arg_1)
            {
                this._1110417468label8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vsFlop():ViewStack
        {
            return (this._808329852vsFlop);
        }

        override public function initialize():void
        {
            var target:MoJinActPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MoJinActPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MoJinActPanelWatcherSetupUtil");
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

        public function set label9(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417467label9;
            if (_local_2 !== _arg_1)
            {
                this._1110417467label9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label9", _local_2, _arg_1));
            };
        }

        public function set lb_point_A0(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932359lb_point_A0;
            if (_local_2 !== _arg_1)
            {
                this._1975932359lb_point_A0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_A0", _local_2, _arg_1));
            };
        }

        public function set lb_num_CC0(_arg_1:Label):void
        {
            var _local_2:Object = this._427914802lb_num_CC0;
            if (_local_2 !== _arg_1)
            {
                this._427914802lb_num_CC0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_CC0", _local_2, _arg_1));
            };
        }

        public function ___MoJinActPanel_Button15_click(_arg_1:MouseEvent):void
        {
            exchangeChipGroup(2);
        }

        [Bindable(event="propertyChange")]
        public function get lb_point():Label
        {
            return (this._1147382393lb_point);
        }

        public function set lb_num_CC3(_arg_1:Label):void
        {
            var _local_2:Object = this._427914799lb_num_CC3;
            if (_local_2 !== _arg_1)
            {
                this._427914799lb_num_CC3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_CC3", _local_2, _arg_1));
            };
        }

        public function set lb_num_CC1(_arg_1:Label):void
        {
            var _local_2:Object = this._427914801lb_num_CC1;
            if (_local_2 !== _arg_1)
            {
                this._427914801lb_num_CC1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_CC1", _local_2, _arg_1));
            };
        }

        public function set lb_num_CC2(_arg_1:Label):void
        {
            var _local_2:Object = this._427914800lb_num_CC2;
            if (_local_2 !== _arg_1)
            {
                this._427914800lb_num_CC2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_CC2", _local_2, _arg_1));
            };
        }

        public function set lb_point_A1(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932360lb_point_A1;
            if (_local_2 !== _arg_1)
            {
                this._1975932360lb_point_A1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_A1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get label3():Label
        {
            return (this._1110417473label3);
        }

        [Bindable(event="propertyChange")]
        public function get label5():Label
        {
            return (this._1110417471label5);
        }

        [Bindable(event="propertyChange")]
        public function get label6():Label
        {
            return (this._1110417470label6);
        }

        [Bindable(event="propertyChange")]
        public function get label7():Label
        {
            return (this._1110417469label7);
        }

        public function ___MoJinActPanel_Button4_click(_arg_1:MouseEvent):void
        {
            getLuckyBox(1);
        }

        [Bindable(event="propertyChange")]
        public function get label4():Label
        {
            return (this._1110417472label4);
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_A1():Label
        {
            return (this._1975932360lb_point_A1);
        }

        [Bindable(event="propertyChange")]
        public function get label8():Label
        {
            return (this._1110417468label8);
        }

        [Bindable(event="propertyChange")]
        public function get label2():Label
        {
            return (this._1110417474label2);
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
        public function get lb_num_CC2():Label
        {
            return (this._427914800lb_num_CC2);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_CC3():Label
        {
            return (this._427914799lb_num_CC3);
        }

        private function _MoJinActPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MOJINACT[0];
            _local_1 = Language.MOJINACT[1];
            _local_1 = Language.MOJINACT[2];
            _local_1 = ResManager.getIconUrl(4130220000933);
            _local_1 = ResManager.getIconUrl(4130220000935);
            _local_1 = ResManager.getIconUrl(4130220000939);
            _local_1 = ResManager.getIconUrl(4130220000925);
            _local_1 = ResManager.getIconUrl(4130220000924);
            _local_1 = ResManager.getIconUrl(4130220000936);
            _local_1 = ResManager.getIconUrl(4130220000940);
            _local_1 = ResManager.getIconUrl(4130220000930);
            _local_1 = ResManager.getIconUrl(4130220000931);
            _local_1 = ResManager.getIconUrl(4130220000932);
            _local_1 = ResManager.getIconUrl(4130220000937);
            _local_1 = ResManager.getIconUrl(4130220000941);
            _local_1 = ResManager.getIconUrl(4130220000926);
            _local_1 = ResManager.getIconUrl(4130220000927);
            _local_1 = ResManager.getIconUrl(4130220000928);
            _local_1 = ResManager.getIconUrl(4130220000929);
            _local_1 = ResManager.getIconUrl(4130220000934);
            _local_1 = ResManager.getIconUrl(4130220000925);
            _local_1 = ResManager.getIconUrl(4130220000924);
            _local_1 = ResManager.getIconUrl(4130220000930);
            _local_1 = ResManager.getIconUrl(4130220000931);
            _local_1 = ResManager.getIconUrl(4130220000932);
            _local_1 = ResManager.getIconUrl(4130220000926);
            _local_1 = ResManager.getIconUrl(4130220000927);
            _local_1 = ResManager.getIconUrl(4130220000928);
            _local_1 = ResManager.getIconUrl(4130220000929);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initMoJinActData", null);
        }

        public function set lb_num_BB2(_arg_1:Label):void
        {
            var _local_2:Object = this._427915792lb_num_BB2;
            if (_local_2 !== _arg_1)
            {
                this._427915792lb_num_BB2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_BB2", _local_2, _arg_1));
            };
        }

        public function ___MoJinActPanel_Button12_click(_arg_1:MouseEvent):void
        {
            exchangeChip(23);
        }

        public function set lb_num_BB0(_arg_1:Label):void
        {
            var _local_2:Object = this._427915794lb_num_BB0;
            if (_local_2 !== _arg_1)
            {
                this._427915794lb_num_BB0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_num_BB0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_CC0():Label
        {
            return (this._427914802lb_num_CC0);
        }

        [Bindable(event="propertyChange")]
        public function get label9():Label
        {
            return (this._1110417467label9);
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_B2():Label
        {
            return (this._1975932392lb_point_B2);
        }

        public function ___MoJinActPanel_Button1_click(_arg_1:MouseEvent):void
        {
            getLuckyBox(0);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_BB0():Label
        {
            return (this._427915794lb_num_BB0);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_BB1():Label
        {
            return (this._427915793lb_num_BB1);
        }

        public function ___MoJinActPanel_Button9_click(_arg_1:MouseEvent):void
        {
            exchangeChip(20);
        }

        public function set lb_point_B2(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932392lb_point_B2;
            if (_local_2 !== _arg_1)
            {
                this._1975932392lb_point_B2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_B2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_A0():Label
        {
            return (this._1975932359lb_point_A0);
        }

        [Bindable(event="propertyChange")]
        public function get lb_point_B0():Label
        {
            return (this._1975932390lb_point_B0);
        }

        [Bindable(event="propertyChange")]
        public function get lb_num_BB2():Label
        {
            return (this._427915792lb_num_BB2);
        }

        public function set lb_point_B0(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932390lb_point_B0;
            if (_local_2 !== _arg_1)
            {
                this._1975932390lb_point_B0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_B0", _local_2, _arg_1));
            };
        }

        public function set lb_point_B1(_arg_1:Label):void
        {
            var _local_2:Object = this._1975932391lb_point_B1;
            if (_local_2 !== _arg_1)
            {
                this._1975932391lb_point_B1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_point_B1", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

