// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WarSpritePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Image;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.WarSpriteCvs;
    import com.qeedoo.ui.view.comp.WarSpritePropCvs;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.HRule;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.net.Responder;
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

    public class WarSpritePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1584105757viewStack:ViewStack;
        public var _WarSpritePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1732854918propImage2:Image;
        private var _2028382812nexPropLB6:Label;
        private var _1636655372wspCvs8:WarSpriteCvs;
        private var _994150443propCvs2:WarSpritePropCvs;
        private var _3079444defy:Label;
        private var _3336hp:Label;
        private var _1097149777resiCri:Label;
        private var _348077955resiDefy:Label;
        public var _WarSpritePanel_Image1:Image;
        private var _1636655368wspCvs4:WarSpriteCvs;
        private var _1636655370wspCvs6:WarSpriteCvs;
        private var _167079959needBattleStone:Label;
        private var _826363685curPropLB4:Label;
        private var _312196812fHurtAdd:Label;
        private var _2028382807nexPropLB1:Label;
        private var _1629148965needStoneLB:Label;
        private var _853619950classLB:Label;
        private var _1636655366wspCvs2:WarSpriteCvs;
        private var _2028382810nexPropLB4:Label;
        private var _data:Object;
        private var _1923861410showImage:Image;
        private var _826363688curPropLB1:Label;
        private var _1732854916propImage4:Image;
        private var _1315327687starBtn1:Button;
        private var _1315327689starBtn3:Button;
        private var _2120452681starBtn10:Button;
        private var _98778cri:Label;
        private var _1315327690starBtn4:Button;
        private var _1732854919propImage1:Image;
        private var _1315327692starBtn6:Button;
        private var _1315327694starBtn8:Button;
        private var _826363683curPropLB6:Label;
        private var _1732854914propImage6:Image;
        private var _994150444propCvs1:WarSpritePropCvs;
        private var _1088674105fHurtRedu:Label;
        private var _826363686curPropLB3:Label;
        private var _96929att:Label;
        private var _109641799speed:Label;
        private var _1636655369wspCvs5:WarSpriteCvs;
        private var _1636655371wspCvs7:WarSpriteCvs;
        private var _2028382808nexPropLB2:Label;
        private var _lvlIndex:Number = 1;
        public var _WarSpritePanel_Label16:Label;
        public var _WarSpritePanel_Label17:Label;
        private var _460854394fMHurtRedu:Label;
        private var _1732854917propImage3:Image;
        private var _2028382811nexPropLB5:Label;
        private var _14849899fMHurtAdd:Label;
        private var _1636655367wspCvs3:WarSpriteCvs;
        public var _WarSpritePanel_Label30:Label;
        private var _803559802pageTab:HButtonTab;
        public var _WarSpritePanel_Label33:Label;
        public var _WarSpritePanel_LinkButton1:LinkButton;
        public var _WarSpritePanel_LinkButton2:LinkButton;
        private var _2131644526levelLbl:Label;
        private var _826363684curPropLB5:Label;
        private var _1315327688starBtn2:Button;
        private var _1636655365wspCvs1:WarSpriteCvs;
        private var _1213341072nameImage:Image;
        private var _1315327691starBtn5:Button;
        private var _1732854915propImage5:Image;
        private var _1315327693starBtn7:Button;
        public var _WarSpritePanel_Label2:Label;
        public var _WarSpritePanel_Image10:Image;
        public var _WarSpritePanel_Image11:Image;
        private var _1315327695starBtn9:Button;
        private var _826363687curPropLB2:Label;
        private var _99333def:Label;
        private var _2028382809nexPropLB3:Label;
        private var _claIndex:Number = 1;
        private var _cid:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":650,
                    "height":525,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_WarSpritePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":19,
                                "y":36,
                                "selectedIndex":0,
                                "tabWidth":150
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewStack",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":11,
                                "y":60,
                                "width":630,
                                "height":440,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_WarSpritePanel_Image1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "0";
                                                    this.top = "0";
                                                    this.bottom = "0";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "x":9,
                                                        "y":10,
                                                        "width":398,
                                                        "height":307,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"nameImage",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"showImage",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "0";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___WarSpritePanel_Button1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "4";
                                                                this.verticalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"WspPageSelLeft"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___WarSpritePanel_Button2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "4";
                                                                this.verticalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"WspPageSelRight"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"levelLbl",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":283});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"CanvasBorder",
                                                        "x":412,
                                                        "y":8,
                                                        "width":210,
                                                        "height":425,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WarSpritePanel_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":5});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"curPropLB1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":59,
                                                                    "y":48
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nexPropLB1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":48
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HRule,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":1,
                                                                    "width":175,
                                                                    "y":76
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"curPropLB2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":59,
                                                                    "y":103
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nexPropLB2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":103
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HRule,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":1,
                                                                    "width":175,
                                                                    "y":131
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"curPropLB3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":59,
                                                                    "y":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nexPropLB3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HRule,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":1,
                                                                    "width":175,
                                                                    "y":186
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"curPropLB4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":59,
                                                                    "y":213
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nexPropLB4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":213
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HRule,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":1,
                                                                    "width":175,
                                                                    "y":241
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"curPropLB5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":59,
                                                                    "y":268
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nexPropLB5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":268
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HRule,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":1,
                                                                    "width":175,
                                                                    "y":296
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"curPropLB6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":59,
                                                                    "y":323
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"nexPropLB6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":323
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HRule,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":1,
                                                                    "width":175,
                                                                    "y":351
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"needStoneLB",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":357});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WarSpritePanel_Label16",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":376});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_WarSpritePanel_LinkButton1",
                                                            "events":{"click":"___WarSpritePanel_LinkButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "80";
                                                                this.color = 0xFFFFFF;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":376});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "events":{"click":"___WarSpritePanel_BasicGlowButton1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "label":"Tăng cấp",
                                                                    "x":44,
                                                                    "y":398
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "events":{"click":"___WarSpritePanel_BasicGlowButton2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "label":"Dùng Vàng",
                                                                    "x":114,
                                                                    "y":398
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"propImage1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":28
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"propImage2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":82
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"propImage3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":135
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"propImage4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":192
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"propImage5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":244
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"propImage6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":302
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
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"CanvasBorder",
                                                        "x":8,
                                                        "y":313,
                                                        "width":400,
                                                        "height":120,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WarSpritePanel_Label17",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":6,
                                                                    "y":4
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"hp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":6,
                                                                    "y":24
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"att",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":116,
                                                                    "y":24
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"def",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":249,
                                                                    "y":24
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"speed",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":6,
                                                                    "y":48
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"cri",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":116,
                                                                    "y":48
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"resiCri",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":249,
                                                                    "y":48
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"defy",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":6,
                                                                    "y":72
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"resiDefy",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":6,
                                                                    "y":96
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"fHurtAdd",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":116,
                                                                    "y":72
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"fMHurtAdd",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":116,
                                                                    "y":96
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"fHurtRedu",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":249,
                                                                    "y":72
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"fMHurtRedu",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":249,
                                                                    "y":96
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
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_WarSpritePanel_Image10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "0";
                                                    this.top = "0";
                                                    this.bottom = "0";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "x":9,
                                                        "y":10,
                                                        "width":165,
                                                        "height":420,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "0";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "verticalScrollPolicy":"auto",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "width":165,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":WarSpriteCvs,
                                                                        "id":"wspCvs1",
                                                                        "events":{"click":"__wspCvs1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":10});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":1,
                                                                                "width":110,
                                                                                "y":78
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":WarSpriteCvs,
                                                                        "id":"wspCvs2",
                                                                        "events":{"click":"__wspCvs2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":83});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":1,
                                                                                "width":110,
                                                                                "y":151
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":WarSpriteCvs,
                                                                        "id":"wspCvs3",
                                                                        "events":{"click":"__wspCvs3_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":156});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":1,
                                                                                "width":110,
                                                                                "y":224
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":WarSpriteCvs,
                                                                        "id":"wspCvs4",
                                                                        "events":{"click":"__wspCvs4_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":229});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":1,
                                                                                "width":110,
                                                                                "y":297
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":WarSpriteCvs,
                                                                        "id":"wspCvs5",
                                                                        "events":{"click":"__wspCvs5_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":302});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":1,
                                                                                "width":110,
                                                                                "y":370
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":WarSpriteCvs,
                                                                        "id":"wspCvs6",
                                                                        "events":{"click":"__wspCvs6_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":375});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":1,
                                                                                "width":110,
                                                                                "y":443
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":WarSpriteCvs,
                                                                        "id":"wspCvs7",
                                                                        "events":{"click":"__wspCvs7_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":448});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":1,
                                                                                "width":110,
                                                                                "y":516
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":WarSpriteCvs,
                                                                        "id":"wspCvs8",
                                                                        "events":{"click":"__wspCvs8_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-8";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":521});
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
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "x":175,
                                                        "y":10,
                                                        "width":446,
                                                        "height":427,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WarSpritePanel_Label30",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":35,
                                                                    "text":"Cấp hiện tại"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"classLB",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":54});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 0;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "height":26,
                                                                    "y":86,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false,
                                                                                "styleName":"starActive"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"starBtn10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseChildren":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WarSpritePropCvs,
                                                            "id":"propCvs1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "x":19,
                                                                    "y":141,
                                                                    "kind":1
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_WarSpritePanel_Image11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":171});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WarSpritePropCvs,
                                                            "id":"propCvs2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "x":271,
                                                                    "y":141,
                                                                    "kind":2
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"needBattleStone",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":328,
                                                                    "text":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WarSpritePanel_Label33",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":351});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_WarSpritePanel_LinkButton2",
                                                            "events":{"click":"___WarSpritePanel_LinkButton2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "180";
                                                                this.color = 0xFFFFFF;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":351});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "events":{"click":"___WarSpritePanel_BasicGlowButton3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "label":"Tăng cấp",
                                                                    "x":144,
                                                                    "y":379
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "events":{"click":"___WarSpritePanel_BasicGlowButton4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "label":"Dùng Vàng",
                                                                    "x":241,
                                                                    "y":379
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
        });
        private var _core:Core = Core.getInstance();
        private const SHOW_URL:Object = {
            "1":4130220000674,
            "2":4130220000675,
            "3":4130220000676,
            "4":4130220000677,
            "5":4130220000678,
            "6":4130220000679,
            "7":4130220000693,
            "8":4130220000694
        };
        private const SHOW_NAME_ICON_URL:Object = {
            "1":4130220000874,
            "2":4130220000875,
            "3":4130220000876,
            "4":4130220000877,
            "5":4130220000878,
            "6":4130220000879,
            "7":4130220000893,
            "8":4130220000894
        };
        private const PROP_ICON_URL:Object = {
            "1":4130220000680,
            "4":4130220000681,
            "6":4130220000682,
            "11":4130220000683,
            "13":4130220000684,
            "14":4130220000690,
            "31":4130220000685,
            "61":4130220000691,
            "59":4130220000688,
            "60":4130220000689,
            "62":4130220000686,
            "63":4130220000687
        };
        private const CLASS_ICON_URL:Array = [4130220000774, 4130220000775, 4130220000776, 4130220000777, 4130220000778, 4130220000779, 4130220000793, 4130220000794];
        private const CLASS_STRING:Array = [Language.WAR_SPRITE[11], Language.WAR_SPRITE[12], Language.WAR_SPRITE[13], Language.WAR_SPRITE[14], Language.WAR_SPRITE[15], Language.WAR_SPRITE[16], Language.WAR_SPRITE[23], Language.WAR_SPRITE[24]];
        private const TOTAL_PROP_TYPE_STR:Object = {
            "1":"hp",
            "4":"att",
            "6":"def",
            "11":"speed",
            "13":"cri",
            "14":"defy",
            "31":"resiCri",
            "61":"resiDefy",
            "59":"fHurtRedu",
            "60":"fMHurtRedu",
            "62":"fHurtAdd",
            "63":"fMHurtAdd"
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WarSpritePanel()
        {
            mx_internal::_document = this;
            this.width = 650;
            this.height = 525;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WarSpritePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get def():Label
        {
            return (this._99333def);
        }

        public function set def(_arg_1:Label):void
        {
            var _local_2:Object = this._99333def;
            if (_local_2 !== _arg_1)
            {
                this._99333def = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "def", _local_2, _arg_1));
            };
        }

        public function set hp(_arg_1:Label):void
        {
            var _local_2:Object = this._3336hp;
            if (_local_2 !== _arg_1)
            {
                this._3336hp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hp", _local_2, _arg_1));
            };
        }

        public function set wspCvs5(_arg_1:WarSpriteCvs):void
        {
            var _local_2:Object = this._1636655369wspCvs5;
            if (_local_2 !== _arg_1)
            {
                this._1636655369wspCvs5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wspCvs5", _local_2, _arg_1));
            };
        }

        public function set wspCvs2(_arg_1:WarSpriteCvs):void
        {
            var _local_2:Object = this._1636655366wspCvs2;
            if (_local_2 !== _arg_1)
            {
                this._1636655366wspCvs2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wspCvs2", _local_2, _arg_1));
            };
        }

        public function set wspCvs6(_arg_1:WarSpriteCvs):void
        {
            var _local_2:Object = this._1636655370wspCvs6;
            if (_local_2 !== _arg_1)
            {
                this._1636655370wspCvs6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wspCvs6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needBattleStone():Label
        {
            return (this._167079959needBattleStone);
        }

        public function set wspCvs8(_arg_1:WarSpriteCvs):void
        {
            var _local_2:Object = this._1636655372wspCvs8;
            if (_local_2 !== _arg_1)
            {
                this._1636655372wspCvs8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wspCvs8", _local_2, _arg_1));
            };
        }

        public function set wspCvs1(_arg_1:WarSpriteCvs):void
        {
            var _local_2:Object = this._1636655365wspCvs1;
            if (_local_2 !== _arg_1)
            {
                this._1636655365wspCvs1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wspCvs1", _local_2, _arg_1));
            };
        }

        public function set wspCvs3(_arg_1:WarSpriteCvs):void
        {
            var _local_2:Object = this._1636655367wspCvs3;
            if (_local_2 !== _arg_1)
            {
                this._1636655367wspCvs3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wspCvs3", _local_2, _arg_1));
            };
        }

        public function set wspCvs4(_arg_1:WarSpriteCvs):void
        {
            var _local_2:Object = this._1636655368wspCvs4;
            if (_local_2 !== _arg_1)
            {
                this._1636655368wspCvs4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wspCvs4", _local_2, _arg_1));
            };
        }

        public function set wspCvs7(_arg_1:WarSpriteCvs):void
        {
            var _local_2:Object = this._1636655371wspCvs7;
            if (_local_2 !== _arg_1)
            {
                this._1636655371wspCvs7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wspCvs7", _local_2, _arg_1));
            };
        }

        public function set defy(_arg_1:Label):void
        {
            var _local_2:Object = this._3079444defy;
            if (_local_2 !== _arg_1)
            {
                this._3079444defy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "defy", _local_2, _arg_1));
            };
        }

        private function addWarSprite():void
        {
            _core.remote.call("addWarSprite", null, _lvlIndex);
        }

        public function set needBattleStone(_arg_1:Label):void
        {
            var _local_2:Object = this._167079959needBattleStone;
            if (_local_2 !== _arg_1)
            {
                this._167079959needBattleStone = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needBattleStone", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get speed():Label
        {
            return (this._109641799speed);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn10():Button
        {
            return (this._2120452681starBtn10);
        }

        public function __wspCvs6_click(_arg_1:MouseEvent):void
        {
            battleSpriteClick(6);
        }

        public function set needStoneLB(_arg_1:Label):void
        {
            var _local_2:Object = this._1629148965needStoneLB;
            if (_local_2 !== _arg_1)
            {
                this._1629148965needStoneLB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needStoneLB", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nexPropLB1():Label
        {
            return (this._2028382807nexPropLB1);
        }

        [Bindable(event="propertyChange")]
        public function get nexPropLB2():Label
        {
            return (this._2028382808nexPropLB2);
        }

        [Bindable(event="propertyChange")]
        public function get nexPropLB4():Label
        {
            return (this._2028382810nexPropLB4);
        }

        private function addBattleSpriteGold():void
        {
            var bObj:Object = _data["bObj"];
            var bid:Number = Number(bObj[_claIndex]);
            var bMeta:Object = GameData.d[GamePredef.TBL_WAR_SPRITE][bid];
            var gold:Number = Number(bMeta["costGold"]);
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("addBattleSpriteGold", null, _claIndex);
                };
            };
            Alert.show(Language.WAR_SPRITE[25].toString().replace("{num}", gold), "", (Alert.YES | Alert.NO), null, func);
        }

        public function ___WarSpritePanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            helpInfo2();
        }

        [Bindable(event="propertyChange")]
        public function get nexPropLB5():Label
        {
            return (this._2028382811nexPropLB5);
        }

        [Bindable(event="propertyChange")]
        public function get nexPropLB6():Label
        {
            return (this._2028382812nexPropLB6);
        }

        [Bindable(event="propertyChange")]
        public function get showImage():Image
        {
            return (this._1923861410showImage);
        }

        public function __wspCvs3_click(_arg_1:MouseEvent):void
        {
            battleSpriteClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get nexPropLB3():Label
        {
            return (this._2028382809nexPropLB3);
        }

        public function set fHurtRedu(_arg_1:Label):void
        {
            var _local_2:Object = this._1088674105fHurtRedu;
            if (_local_2 !== _arg_1)
            {
                this._1088674105fHurtRedu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fHurtRedu", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get fMHurtRedu():Label
        {
            return (this._460854394fMHurtRedu);
        }

        [Bindable(event="propertyChange")]
        public function get resiDefy():Label
        {
            return (this._348077955resiDefy);
        }

        public function ___WarSpritePanel_Button1_click(_arg_1:MouseEvent):void
        {
            onPageSelect(1);
        }

        private function helpInfo2():void
        {
            var _local_1:String = Language.PRS_PANEL[46].toString();
            Alert.show(_local_1);
        }

        private function _WarSpritePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WarSpritePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_WarSpritePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTab.filters = _arg_1;
            }, "pageTab.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.WAR_SPRITE[1]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStack.selectedIndex = _arg_1;
            }, "viewStack.selectedIndex");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000673));
            }, function (_arg_1:Object):void
            {
                _WarSpritePanel_Image1.source = _arg_1;
            }, "_WarSpritePanel_Image1.source");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                levelLbl.filters = _arg_1;
            }, "levelLbl.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WarSpritePanel_Label2.text = _arg_1;
            }, "_WarSpritePanel_Label2.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _WarSpritePanel_Label2.filters = _arg_1;
            }, "_WarSpritePanel_Label2.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curPropLB1.filters = _arg_1;
            }, "curPropLB1.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexPropLB1.filters = _arg_1;
            }, "nexPropLB1.filters");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curPropLB2.filters = _arg_1;
            }, "curPropLB2.filters");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexPropLB2.filters = _arg_1;
            }, "nexPropLB2.filters");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curPropLB3.filters = _arg_1;
            }, "curPropLB3.filters");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexPropLB3.filters = _arg_1;
            }, "nexPropLB3.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curPropLB4.filters = _arg_1;
            }, "curPropLB4.filters");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexPropLB4.filters = _arg_1;
            }, "nexPropLB4.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curPropLB5.filters = _arg_1;
            }, "curPropLB5.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexPropLB5.filters = _arg_1;
            }, "nexPropLB5.filters");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curPropLB6.filters = _arg_1;
            }, "curPropLB6.filters");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexPropLB6.filters = _arg_1;
            }, "nexPropLB6.filters");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                needStoneLB.filters = _arg_1;
            }, "needStoneLB.filters");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE[10].toString().replace("{num}", _core.player.warSprite);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WarSpritePanel_Label16.text = _arg_1;
            }, "_WarSpritePanel_Label16.text");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _WarSpritePanel_Label16.filters = _arg_1;
            }, "_WarSpritePanel_Label16.filters");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRS_PANEL[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WarSpritePanel_LinkButton1.label = _arg_1;
            }, "_WarSpritePanel_LinkButton1.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WarSpritePanel_Label17.text = _arg_1;
            }, "_WarSpritePanel_Label17.text");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _WarSpritePanel_Label17.filters = _arg_1;
            }, "_WarSpritePanel_Label17.filters");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[1].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                hp.text = _arg_1;
            }, "hp.text");
            result[26] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                hp.filters = _arg_1;
            }, "hp.filters");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[4].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                att.text = _arg_1;
            }, "att.text");
            result[28] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                att.filters = _arg_1;
            }, "att.filters");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[6].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                def.text = _arg_1;
            }, "def.text");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                def.filters = _arg_1;
            }, "def.filters");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[11].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                speed.text = _arg_1;
            }, "speed.text");
            result[32] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                speed.filters = _arg_1;
            }, "speed.filters");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[13].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cri.text = _arg_1;
            }, "cri.text");
            result[34] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                cri.filters = _arg_1;
            }, "cri.filters");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[31].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                resiCri.text = _arg_1;
            }, "resiCri.text");
            result[36] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                resiCri.filters = _arg_1;
            }, "resiCri.filters");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[14].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                defy.text = _arg_1;
            }, "defy.text");
            result[38] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                defy.filters = _arg_1;
            }, "defy.filters");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[61].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                resiDefy.text = _arg_1;
            }, "resiDefy.text");
            result[40] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                resiDefy.filters = _arg_1;
            }, "resiDefy.filters");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[62].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fHurtAdd.text = _arg_1;
            }, "fHurtAdd.text");
            result[42] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                fHurtAdd.filters = _arg_1;
            }, "fHurtAdd.filters");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[63].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fMHurtAdd.text = _arg_1;
            }, "fMHurtAdd.text");
            result[44] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                fMHurtAdd.filters = _arg_1;
            }, "fMHurtAdd.filters");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[59].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fHurtRedu.text = _arg_1;
            }, "fHurtRedu.text");
            result[46] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                fHurtRedu.filters = _arg_1;
            }, "fHurtRedu.filters");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE_PROP_TOTAL[60].toString().repeater("{num}", 0);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fMHurtRedu.text = _arg_1;
            }, "fMHurtRedu.text");
            result[48] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                fMHurtRedu.filters = _arg_1;
            }, "fMHurtRedu.filters");
            result[49] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000673));
            }, function (_arg_1:Object):void
            {
                _WarSpritePanel_Image10.source = _arg_1;
            }, "_WarSpritePanel_Image10.source");
            result[50] = binding;
            binding = new Binding(this, function ():Number
            {
                return (CLASS_ICON_URL[0]);
            }, function (_arg_1:Number):void
            {
                wspCvs1.resCode = _arg_1;
            }, "wspCvs1.resCode");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = CLASS_STRING[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wspCvs1.wspName = _arg_1;
            }, "wspCvs1.wspName");
            result[52] = binding;
            binding = new Binding(this, function ():Number
            {
                return (CLASS_ICON_URL[1]);
            }, function (_arg_1:Number):void
            {
                wspCvs2.resCode = _arg_1;
            }, "wspCvs2.resCode");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = CLASS_STRING[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wspCvs2.wspName = _arg_1;
            }, "wspCvs2.wspName");
            result[54] = binding;
            binding = new Binding(this, function ():Number
            {
                return (CLASS_ICON_URL[2]);
            }, function (_arg_1:Number):void
            {
                wspCvs3.resCode = _arg_1;
            }, "wspCvs3.resCode");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = CLASS_STRING[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wspCvs3.wspName = _arg_1;
            }, "wspCvs3.wspName");
            result[56] = binding;
            binding = new Binding(this, function ():Number
            {
                return (CLASS_ICON_URL[3]);
            }, function (_arg_1:Number):void
            {
                wspCvs4.resCode = _arg_1;
            }, "wspCvs4.resCode");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = CLASS_STRING[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wspCvs4.wspName = _arg_1;
            }, "wspCvs4.wspName");
            result[58] = binding;
            binding = new Binding(this, function ():Number
            {
                return (CLASS_ICON_URL[4]);
            }, function (_arg_1:Number):void
            {
                wspCvs5.resCode = _arg_1;
            }, "wspCvs5.resCode");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = CLASS_STRING[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wspCvs5.wspName = _arg_1;
            }, "wspCvs5.wspName");
            result[60] = binding;
            binding = new Binding(this, function ():Number
            {
                return (CLASS_ICON_URL[5]);
            }, function (_arg_1:Number):void
            {
                wspCvs6.resCode = _arg_1;
            }, "wspCvs6.resCode");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = CLASS_STRING[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wspCvs6.wspName = _arg_1;
            }, "wspCvs6.wspName");
            result[62] = binding;
            binding = new Binding(this, function ():Number
            {
                return (CLASS_ICON_URL[6]);
            }, function (_arg_1:Number):void
            {
                wspCvs7.resCode = _arg_1;
            }, "wspCvs7.resCode");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = CLASS_STRING[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wspCvs7.wspName = _arg_1;
            }, "wspCvs7.wspName");
            result[64] = binding;
            binding = new Binding(this, function ():Number
            {
                return (CLASS_ICON_URL[7]);
            }, function (_arg_1:Number):void
            {
                wspCvs8.resCode = _arg_1;
            }, "wspCvs8.resCode");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = CLASS_STRING[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wspCvs8.wspName = _arg_1;
            }, "wspCvs8.wspName");
            result[66] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _WarSpritePanel_Label30.filters = _arg_1;
            }, "_WarSpritePanel_Label30.filters");
            result[67] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                classLB.filters = _arg_1;
            }, "classLB.filters");
            result[68] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000692));
            }, function (_arg_1:Object):void
            {
                _WarSpritePanel_Image11.source = _arg_1;
            }, "_WarSpritePanel_Image11.source");
            result[69] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                needBattleStone.filters = _arg_1;
            }, "needBattleStone.filters");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAR_SPRITE[18].toString().replace("{num}", _core.player.battleSprite);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WarSpritePanel_Label33.text = _arg_1;
            }, "_WarSpritePanel_Label33.text");
            result[71] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _WarSpritePanel_Label33.filters = _arg_1;
            }, "_WarSpritePanel_Label33.filters");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRS_PANEL[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WarSpritePanel_LinkButton2.label = _arg_1;
            }, "_WarSpritePanel_LinkButton2.label");
            result[73] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        public function set speed(_arg_1:Label):void
        {
            var _local_2:Object = this._109641799speed;
            if (_local_2 !== _arg_1)
            {
                this._109641799speed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "speed", _local_2, _arg_1));
            };
        }

        public function ___WarSpritePanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            addWarSpriteGold();
        }

        public function set starBtn10(_arg_1:Button):void
        {
            var _local_2:Object = this._2120452681starBtn10;
            if (_local_2 !== _arg_1)
            {
                this._2120452681starBtn10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get att():Label
        {
            return (this._96929att);
        }

        public function set resiCri(_arg_1:Label):void
        {
            var _local_2:Object = this._1097149777resiCri;
            if (_local_2 !== _arg_1)
            {
                this._1097149777resiCri = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resiCri", _local_2, _arg_1));
            };
        }

        private function addWarSpriteGold():void
        {
            var wObj:Object = _data["wObj"];
            var wid:Number = Number(wObj[_lvlIndex]);
            var wMeta:Object = GameData.d[GamePredef.TBL_WAR_SPRITE][wid];
            var gold:Number = Number(wMeta["costGold"]);
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("addWarSpriteGold", null, _lvlIndex);
                };
            };
            Alert.show(Language.WAR_SPRITE[25].toString().replace("{num}", gold), "", (Alert.YES | Alert.NO), null, func);
        }

        public function set nexPropLB1(_arg_1:Label):void
        {
            var _local_2:Object = this._2028382807nexPropLB1;
            if (_local_2 !== _arg_1)
            {
                this._2028382807nexPropLB1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexPropLB1", _local_2, _arg_1));
            };
        }

        public function set nexPropLB2(_arg_1:Label):void
        {
            var _local_2:Object = this._2028382808nexPropLB2;
            if (_local_2 !== _arg_1)
            {
                this._2028382808nexPropLB2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexPropLB2", _local_2, _arg_1));
            };
        }

        public function set nexPropLB4(_arg_1:Label):void
        {
            var _local_2:Object = this._2028382810nexPropLB4;
            if (_local_2 !== _arg_1)
            {
                this._2028382810nexPropLB4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexPropLB4", _local_2, _arg_1));
            };
        }

        public function __wspCvs8_click(_arg_1:MouseEvent):void
        {
            battleSpriteClick(8);
        }

        public function set nexPropLB6(_arg_1:Label):void
        {
            var _local_2:Object = this._2028382812nexPropLB6;
            if (_local_2 !== _arg_1)
            {
                this._2028382812nexPropLB6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexPropLB6", _local_2, _arg_1));
            };
        }

        public function set nexPropLB3(_arg_1:Label):void
        {
            var _local_2:Object = this._2028382809nexPropLB3;
            if (_local_2 !== _arg_1)
            {
                this._2028382809nexPropLB3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexPropLB3", _local_2, _arg_1));
            };
        }

        public function set showImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1923861410showImage;
            if (_local_2 !== _arg_1)
            {
                this._1923861410showImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showImage", _local_2, _arg_1));
            };
        }

        public function set nexPropLB5(_arg_1:Label):void
        {
            var _local_2:Object = this._2028382811nexPropLB5;
            if (_local_2 !== _arg_1)
            {
                this._2028382811nexPropLB5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexPropLB5", _local_2, _arg_1));
            };
        }

        private function _WarSpritePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WAR_SPRITE[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE[1];
            _local_1 = pageTab.selectedIndex;
            _local_1 = ResManager.getIconUrl(4130220000673);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE[2];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE[10].toString().replace("{num}", _core.player.warSprite);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PRS_PANEL[47];
            _local_1 = Language.WAR_SPRITE[3];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[1].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[4].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[6].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[11].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[13].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[31].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[14].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[61].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[62].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[63].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[59].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE_PROP_TOTAL[60].toString().repeater("{num}", 0);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ResManager.getIconUrl(4130220000673);
            _local_1 = CLASS_ICON_URL[0];
            _local_1 = CLASS_STRING[0];
            _local_1 = CLASS_ICON_URL[1];
            _local_1 = CLASS_STRING[1];
            _local_1 = CLASS_ICON_URL[2];
            _local_1 = CLASS_STRING[2];
            _local_1 = CLASS_ICON_URL[3];
            _local_1 = CLASS_STRING[3];
            _local_1 = CLASS_ICON_URL[4];
            _local_1 = CLASS_STRING[4];
            _local_1 = CLASS_ICON_URL[5];
            _local_1 = CLASS_STRING[5];
            _local_1 = CLASS_ICON_URL[6];
            _local_1 = CLASS_STRING[6];
            _local_1 = CLASS_ICON_URL[7];
            _local_1 = CLASS_STRING[7];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ResManager.getIconUrl(4130220000692);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.WAR_SPRITE[18].toString().replace("{num}", _core.player.battleSprite);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PRS_PANEL[42];
        }

        [Bindable(event="propertyChange")]
        public function get starBtn3():Button
        {
            return (this._1315327689starBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn4():Button
        {
            return (this._1315327690starBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn7():Button
        {
            return (this._1315327693starBtn7);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn1():Button
        {
            return (this._1315327687starBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn2():Button
        {
            return (this._1315327688starBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get fHurtAdd():Label
        {
            return (this._312196812fHurtAdd);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn8():Button
        {
            return (this._1315327694starBtn8);
        }

        [Bindable(event="propertyChange")]
        public function get curPropLB2():Label
        {
            return (this._826363687curPropLB2);
        }

        [Bindable(event="propertyChange")]
        public function get curPropLB3():Label
        {
            return (this._826363686curPropLB3);
        }

        [Bindable(event="propertyChange")]
        public function get curPropLB5():Label
        {
            return (this._826363684curPropLB5);
        }

        [Bindable(event="propertyChange")]
        public function get curPropLB6():Label
        {
            return (this._826363683curPropLB6);
        }

        private function addBattleSprite():void
        {
            _core.remote.call("addBattleSprite", null, _claIndex);
        }

        [Bindable(event="propertyChange")]
        public function get curPropLB4():Label
        {
            return (this._826363685curPropLB4);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn5():Button
        {
            return (this._1315327691starBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn6():Button
        {
            return (this._1315327692starBtn6);
        }

        public function set fMHurtAdd(_arg_1:Label):void
        {
            var _local_2:Object = this._14849899fMHurtAdd;
            if (_local_2 !== _arg_1)
            {
                this._14849899fMHurtAdd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fMHurtAdd", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        [Bindable(event="propertyChange")]
        public function get curPropLB1():Label
        {
            return (this._826363688curPropLB1);
        }

        [Bindable(event="propertyChange")]
        public function get starBtn9():Button
        {
            return (this._1315327695starBtn9);
        }

        public function __wspCvs5_click(_arg_1:MouseEvent):void
        {
            battleSpriteClick(5);
        }

        public function set fMHurtRedu(_arg_1:Label):void
        {
            var _local_2:Object = this._460854394fMHurtRedu;
            if (_local_2 !== _arg_1)
            {
                this._460854394fMHurtRedu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fMHurtRedu", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get classLB():Label
        {
            return (this._853619950classLB);
        }

        public function set propImage3(_arg_1:Image):void
        {
            var _local_2:Object = this._1732854917propImage3;
            if (_local_2 !== _arg_1)
            {
                this._1732854917propImage3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propImage3", _local_2, _arg_1));
            };
        }

        public function set propImage1(_arg_1:Image):void
        {
            var _local_2:Object = this._1732854919propImage1;
            if (_local_2 !== _arg_1)
            {
                this._1732854919propImage1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propImage1", _local_2, _arg_1));
            };
        }

        public function set propImage2(_arg_1:Image):void
        {
            var _local_2:Object = this._1732854918propImage2;
            if (_local_2 !== _arg_1)
            {
                this._1732854918propImage2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propImage2", _local_2, _arg_1));
            };
        }

        public function set propImage4(_arg_1:Image):void
        {
            var _local_2:Object = this._1732854916propImage4;
            if (_local_2 !== _arg_1)
            {
                this._1732854916propImage4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propImage4", _local_2, _arg_1));
            };
        }

        public function set propImage5(_arg_1:Image):void
        {
            var _local_2:Object = this._1732854915propImage5;
            if (_local_2 !== _arg_1)
            {
                this._1732854915propImage5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propImage5", _local_2, _arg_1));
            };
        }

        public function set propImage6(_arg_1:Image):void
        {
            var _local_2:Object = this._1732854914propImage6;
            if (_local_2 !== _arg_1)
            {
                this._1732854914propImage6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propImage6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wspCvs1():WarSpriteCvs
        {
            return (this._1636655365wspCvs1);
        }

        [Bindable(event="propertyChange")]
        public function get wspCvs2():WarSpriteCvs
        {
            return (this._1636655366wspCvs2);
        }

        [Bindable(event="propertyChange")]
        public function get hp():Label
        {
            return (this._3336hp);
        }

        public function set resiDefy(_arg_1:Label):void
        {
            var _local_2:Object = this._348077955resiDefy;
            if (_local_2 !== _arg_1)
            {
                this._348077955resiDefy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resiDefy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wspCvs6():WarSpriteCvs
        {
            return (this._1636655370wspCvs6);
        }

        [Bindable(event="propertyChange")]
        public function get wspCvs7():WarSpriteCvs
        {
            return (this._1636655371wspCvs7);
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

        [Bindable(event="propertyChange")]
        public function get wspCvs4():WarSpriteCvs
        {
            return (this._1636655368wspCvs4);
        }

        [Bindable(event="propertyChange")]
        public function get wspCvs5():WarSpriteCvs
        {
            return (this._1636655369wspCvs5);
        }

        [Bindable(event="propertyChange")]
        public function get wspCvs8():WarSpriteCvs
        {
            return (this._1636655372wspCvs8);
        }

        public function showPanel():void
        {
            this.show();
            if (!initialized)
            {
                callLater(showPanel);
                return;
            };
            if (!ToolKit.isEqual(_cid, _core.cid))
            {
                _cid = _core.cid;
                _lvlIndex = 1;
                _claIndex = 1;
                _core.remote.call("getSpWarData", new Responder(updateWarSpritePanel));
            }
            else
            {
                show();
            };
        }

        public function ___WarSpritePanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            addBattleSpriteGold();
        }

        [Bindable(event="propertyChange")]
        public function get wspCvs3():WarSpriteCvs
        {
            return (this._1636655367wspCvs3);
        }

        [Bindable(event="propertyChange")]
        public function get defy():Label
        {
            return (this._3079444defy);
        }

        public function set levelLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._2131644526levelLbl;
            if (_local_2 !== _arg_1)
            {
                this._2131644526levelLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLbl", _local_2, _arg_1));
            };
        }

        public function ___WarSpritePanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set nameImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1213341072nameImage;
            if (_local_2 !== _arg_1)
            {
                this._1213341072nameImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameImage", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needStoneLB():Label
        {
            return (this._1629148965needStoneLB);
        }

        [Bindable(event="propertyChange")]
        public function get fHurtRedu():Label
        {
            return (this._1088674105fHurtRedu);
        }

        public function __wspCvs2_click(_arg_1:MouseEvent):void
        {
            battleSpriteClick(2);
        }

        public function set att(_arg_1:Label):void
        {
            var _local_2:Object = this._96929att;
            if (_local_2 !== _arg_1)
            {
                this._96929att = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "att", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get resiCri():Label
        {
            return (this._1097149777resiCri);
        }

        public function ___WarSpritePanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            addWarSprite();
        }

        public function updateWarSpritePanel(_arg_1:Object):void
        {
            var _local_16:Image;
            var _local_17:Label;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Label;
            _data = _arg_1;
            var _local_2:Number = Number(_arg_1["wObj"][_lvlIndex]);
            var _local_3:Object = GameData.d[GamePredef.TBL_WAR_SPRITE][_local_2];
            var _local_4:Number = Number(_local_3["level"]);
            var _local_5:Number = Number(_local_3["nextId"]);
            var _local_6:Object = GameData.d[GamePredef.TBL_WAR_SPRITE][_local_5];
            var _local_7:Number = Number(_arg_1["bObj"][_claIndex]);
            var _local_8:Object = GameData.d[GamePredef.TBL_WAR_SPRITE][_local_7];
            var _local_9:Number = Number(_local_8["nextId"]);
            nameImage.source = ResManager.getIconUrl(SHOW_NAME_ICON_URL[_lvlIndex]);
            showImage.source = ResManager.getIconUrl(SHOW_URL[_lvlIndex]);
            levelLbl.htmlText = Language.WAR_SPRITE[8].toString().replace("{num}", _local_4);
            var _local_10:int = 1;
            var _local_11:int = 1;
            while (_local_11 <= 6)
            {
                _local_16 = (this[("propImage" + _local_11)] as Image);
                _local_17 = (this[("curPropLB" + _local_11)] as Label);
                _local_18 = Number(_local_3[("pT" + _local_10)]);
                _local_19 = Number(_local_3[("pN" + _local_10)]);
                if (_local_18)
                {
                    if (((_local_18 == 5) || (_local_18 == 7)))
                    {
                        _local_18 = Number(_local_3[("pT" + ++_local_10)]);
                        _local_19 = Number(_local_3[("pN" + _local_10)]);
                        _local_16.source = ResManager.getIconUrl(PROP_ICON_URL[_local_18]);
                        if (((((((_local_18 == 1) || (_local_18 == 4)) || (_local_18 == 5)) || (_local_18 == 6)) || (_local_18 == 7)) || (_local_18 == 11)))
                        {
                            _local_17.text = ("+" + _local_19);
                        }
                        else
                        {
                            if (((((_local_18 == 13) || (_local_18 == 14)) || (_local_18 == 61)) || (_local_18 == 31)))
                            {
                                _local_17.text = ("+" + (_local_19 / 10000));
                            }
                            else
                            {
                                _local_17.text = (("+" + (_local_19 / 100)) + "%");
                            };
                        };
                        _local_10++;
                    }
                    else
                    {
                        _local_16.source = ResManager.getIconUrl(PROP_ICON_URL[_local_18]);
                        if (((((((_local_18 == 1) || (_local_18 == 4)) || (_local_18 == 5)) || (_local_18 == 6)) || (_local_18 == 7)) || (_local_18 == 11)))
                        {
                            _local_17.text = ("+" + _local_19);
                        }
                        else
                        {
                            if (((((_local_18 == 13) || (_local_18 == 14)) || (_local_18 == 61)) || (_local_18 == 31)))
                            {
                                _local_17.text = ("+" + (_local_19 / 10000));
                            }
                            else
                            {
                                _local_17.text = (("+" + (_local_19 / 100)) + "%");
                            };
                        };
                        _local_10++;
                    };
                };
                _local_11++;
            };
            var _local_12:int = 1;
            var _local_13:int = 1;
            while (_local_13 <= 6)
            {
                _local_20 = (this[("nexPropLB" + _local_13)] as Label);
                if (_local_6)
                {
                    _local_18 = Number(_local_6[("pT" + _local_12)]);
                    _local_19 = Number(_local_6[("pN" + _local_12)]);
                    if (_local_18)
                    {
                        if (((_local_18 == 5) || (_local_18 == 7)))
                        {
                            _local_18 = Number(_local_6[("pT" + ++_local_12)]);
                            _local_19 = Number(_local_6[("pN" + _local_12)]);
                            if (((((((_local_18 == 1) || (_local_18 == 4)) || (_local_18 == 5)) || (_local_18 == 6)) || (_local_18 == 7)) || (_local_18 == 11)))
                            {
                                _local_20.text = (("(Cấp sau:+" + _local_19) + ")");
                            }
                            else
                            {
                                if (((((_local_18 == 13) || (_local_18 == 14)) || (_local_18 == 61)) || (_local_18 == 31)))
                                {
                                    _local_20.text = (("(Cấp sau:+" + (_local_19 / 10000)) + ")");
                                }
                                else
                                {
                                    _local_20.text = (("(Cấp sau:+" + (_local_19 / 100)) + "%)");
                                };
                            };
                            _local_12++;
                        }
                        else
                        {
                            if (((((((_local_18 == 1) || (_local_18 == 4)) || (_local_18 == 5)) || (_local_18 == 6)) || (_local_18 == 7)) || (_local_18 == 11)))
                            {
                                _local_20.text = (("(Cấp sau:+" + _local_19) + ")");
                            }
                            else
                            {
                                if (((((_local_18 == 13) || (_local_18 == 14)) || (_local_18 == 61)) || (_local_18 == 31)))
                                {
                                    _local_20.text = (("(Cấp sau:+" + (_local_19 / 10000)) + ")");
                                }
                                else
                                {
                                    _local_20.text = (("(Cấp sau:+" + (_local_19 / 100)) + "%)");
                                };
                            };
                            _local_12++;
                        };
                    };
                }
                else
                {
                    _local_20.text = "Đã Max Cấp";
                };
                _local_13++;
            };
            needStoneLB.text = Language.WAR_SPRITE[9].toString().replace("{num}", _local_3["costNum"]);
            var _local_14:int = 1;
            while (_local_14 <= 8)
            {
                (this[("wspCvs" + _local_14)] as WarSpriteCvs).wspId = Number(_arg_1["wObj"][_local_14]);
                (this[("wspCvs" + _local_14)] as WarSpriteCvs).updateView();
                _local_14++;
            };
            classLB.text = Language.WAR_SPRITE[5].toString().replace("{num}", _local_8["level"]);
            var _local_15:int = 1;
            while (_local_15 <= 10)
            {
                if (_local_15 <= Number(_local_8["level"]))
                {
                    (this[("starBtn" + _local_15)] as Button).styleName = "starActive";
                }
                else
                {
                    (this[("starBtn" + _local_15)] as Button).styleName = "starNotActive";
                };
                _local_15++;
            };
            propCvs1.updateView(_local_7);
            propCvs2.updateView(_local_9);
            needBattleStone.text = Language.WAR_SPRITE[17].toString().replace("{num}", _local_8["costNum"]);
            _core.remote.call("getWSPBuffList", new Responder(onUpdateTotalPropCvs));
        }

        [Bindable(event="propertyChange")]
        public function get fMHurtAdd():Label
        {
            return (this._14849899fMHurtAdd);
        }

        public function __wspCvs7_click(_arg_1:MouseEvent):void
        {
            battleSpriteClick(7);
        }

        [Bindable(event="propertyChange")]
        public function get propImage1():Image
        {
            return (this._1732854919propImage1);
        }

        [Bindable(event="propertyChange")]
        public function get propImage2():Image
        {
            return (this._1732854918propImage2);
        }

        [Bindable(event="propertyChange")]
        public function get propImage3():Image
        {
            return (this._1732854917propImage3);
        }

        [Bindable(event="propertyChange")]
        public function get propImage6():Image
        {
            return (this._1732854914propImage6);
        }

        [Bindable(event="propertyChange")]
        public function get propImage4():Image
        {
            return (this._1732854916propImage4);
        }

        [Bindable(event="propertyChange")]
        public function get propImage5():Image
        {
            return (this._1732854915propImage5);
        }

        private function helpInfo():void
        {
            var _local_1:String = Language.PRS_PANEL[45].toString();
            Alert.show(_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get levelLbl():Label
        {
            return (this._2131644526levelLbl);
        }

        override public function initialize():void
        {
            var target:WarSpritePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WarSpritePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WarSpritePanelWatcherSetupUtil");
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

        public function set starBtn3(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327689starBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1315327689starBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn3", _local_2, _arg_1));
            };
        }

        public function set starBtn7(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327693starBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1315327693starBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn7", _local_2, _arg_1));
            };
        }

        public function set starBtn9(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327695starBtn9;
            if (_local_2 !== _arg_1)
            {
                this._1315327695starBtn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn9", _local_2, _arg_1));
            };
        }

        public function set starBtn4(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327690starBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1315327690starBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn4", _local_2, _arg_1));
            };
        }

        public function set starBtn5(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327691starBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1315327691starBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn5", _local_2, _arg_1));
            };
        }

        public function set starBtn1(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327687starBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1315327687starBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn1", _local_2, _arg_1));
            };
        }

        public function set fHurtAdd(_arg_1:Label):void
        {
            var _local_2:Object = this._312196812fHurtAdd;
            if (_local_2 !== _arg_1)
            {
                this._312196812fHurtAdd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fHurtAdd", _local_2, _arg_1));
            };
        }

        private function onPageSelect(_arg_1:int):void
        {
            var _local_2:int = (8 + _lvlIndex);
            if (_arg_1 == 1)
            {
                _local_2--;
                _lvlIndex = (_local_2 % 8);
                if (_lvlIndex == 0)
                {
                    _lvlIndex = 8;
                };
            }
            else
            {
                _lvlIndex = (++_local_2 % 8);
                if (_lvlIndex == 0)
                {
                    _lvlIndex = 8;
                };
            };
            updateWarSpritePanel(_data);
        }

        public function set propCvs1(_arg_1:WarSpritePropCvs):void
        {
            var _local_2:Object = this._994150444propCvs1;
            if (_local_2 !== _arg_1)
            {
                this._994150444propCvs1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propCvs1", _local_2, _arg_1));
            };
        }

        public function set cri(_arg_1:Label):void
        {
            var _local_2:Object = this._98778cri;
            if (_local_2 !== _arg_1)
            {
                this._98778cri = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cri", _local_2, _arg_1));
            };
        }

        public function set curPropLB1(_arg_1:Label):void
        {
            var _local_2:Object = this._826363688curPropLB1;
            if (_local_2 !== _arg_1)
            {
                this._826363688curPropLB1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPropLB1", _local_2, _arg_1));
            };
        }

        public function __wspCvs4_click(_arg_1:MouseEvent):void
        {
            battleSpriteClick(4);
        }

        public function set curPropLB2(_arg_1:Label):void
        {
            var _local_2:Object = this._826363687curPropLB2;
            if (_local_2 !== _arg_1)
            {
                this._826363687curPropLB2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPropLB2", _local_2, _arg_1));
            };
        }

        public function set curPropLB6(_arg_1:Label):void
        {
            var _local_2:Object = this._826363683curPropLB6;
            if (_local_2 !== _arg_1)
            {
                this._826363683curPropLB6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPropLB6", _local_2, _arg_1));
            };
        }

        public function set curPropLB3(_arg_1:Label):void
        {
            var _local_2:Object = this._826363686curPropLB3;
            if (_local_2 !== _arg_1)
            {
                this._826363686curPropLB3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPropLB3", _local_2, _arg_1));
            };
        }

        public function set starBtn8(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327694starBtn8;
            if (_local_2 !== _arg_1)
            {
                this._1315327694starBtn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn8", _local_2, _arg_1));
            };
        }

        public function set curPropLB5(_arg_1:Label):void
        {
            var _local_2:Object = this._826363684curPropLB5;
            if (_local_2 !== _arg_1)
            {
                this._826363684curPropLB5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPropLB5", _local_2, _arg_1));
            };
        }

        public function ___WarSpritePanel_Button2_click(_arg_1:MouseEvent):void
        {
            onPageSelect(2);
        }

        private function onUpdateTotalPropCvs(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:Number;
            var _local_4:int;
            var _local_5:String;
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                _local_4 = int(_local_2);
                _local_5 = TOTAL_PROP_TYPE_STR[int(_local_2)];
                switch (int(_local_2))
                {
                    case 5:
                    case 7:
                        break;
                    case 1:
                    case 4:
                    case 6:
                    case 11:
                        _local_3 = Math.floor(_local_3);
                        (this[_local_5] as Label).text = Language.WAR_SPRITE_PROP_TOTAL[int(_local_2)].toString().replace("{num}", _local_3);
                        break;
                    case 13:
                    case 14:
                    case 31:
                    case 61:
                        _local_3 = (Math.floor((_local_3 / 100)) / 100);
                        (this[_local_5] as Label).text = Language.WAR_SPRITE_PROP_TOTAL[int(_local_2)].toString().replace("{num}", _local_3);
                        break;
                    case 59:
                    case 60:
                    case 62:
                    case 63:
                        _local_3 = (Math.floor(_local_3) / 100);
                        (this[_local_5] as Label).text = Language.WAR_SPRITE_PROP_TOTAL[int(_local_2)].toString().replace("{num}", _local_3);
                        break;
                };
            };
        }

        public function set propCvs2(_arg_1:WarSpritePropCvs):void
        {
            var _local_2:Object = this._994150443propCvs2;
            if (_local_2 !== _arg_1)
            {
                this._994150443propCvs2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propCvs2", _local_2, _arg_1));
            };
        }

        public function set curPropLB4(_arg_1:Label):void
        {
            var _local_2:Object = this._826363685curPropLB4;
            if (_local_2 !== _arg_1)
            {
                this._826363685curPropLB4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPropLB4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nameImage():Image
        {
            return (this._1213341072nameImage);
        }

        public function set viewStack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1584105757viewStack;
            if (_local_2 !== _arg_1)
            {
                this._1584105757viewStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStack", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propCvs1():WarSpritePropCvs
        {
            return (this._994150444propCvs1);
        }

        public function set starBtn2(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327688starBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1315327688starBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn2", _local_2, _arg_1));
            };
        }

        public function ___WarSpritePanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            addBattleSprite();
        }

        public function set classLB(_arg_1:Label):void
        {
            var _local_2:Object = this._853619950classLB;
            if (_local_2 !== _arg_1)
            {
                this._853619950classLB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classLB", _local_2, _arg_1));
            };
        }

        public function set starBtn6(_arg_1:Button):void
        {
            var _local_2:Object = this._1315327692starBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1315327692starBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starBtn6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cri():Label
        {
            return (this._98778cri);
        }

        [Bindable(event="propertyChange")]
        public function get propCvs2():WarSpritePropCvs
        {
            return (this._994150443propCvs2);
        }

        private function battleSpriteClick(_arg_1:int):void
        {
            var _local_2:int = 1;
            while (_local_2 <= 8)
            {
                if (_local_2 == _arg_1)
                {
                    (this[("wspCvs" + _local_2)] as WarSpriteCvs).selected = true;
                }
                else
                {
                    (this[("wspCvs" + _local_2)] as WarSpriteCvs).selected = false;
                };
                (this[("wspCvs" + _local_2)] as WarSpriteCvs).updateView();
                _local_2++;
            };
            _claIndex = _arg_1;
            var _local_3:Number = Number(_data["bObj"][_arg_1]);
            var _local_4:Object = GameData.d[GamePredef.TBL_WAR_SPRITE][_local_3];
            var _local_5:Number = Number(_local_4["nextId"]);
            classLB.text = Language.WAR_SPRITE[5].toString().replace("{num}", _local_4["level"]);
            var _local_6:int = 1;
            while (_local_6 <= 10)
            {
                if (_local_6 <= Number(_local_4["level"]))
                {
                    (this[("starBtn" + _local_6)] as Button).styleName = "starActive";
                }
                else
                {
                    (this[("starBtn" + _local_6)] as Button).styleName = "starNotActive";
                };
                _local_6++;
            };
            propCvs1.updateView(_local_3);
            propCvs2.updateView(_local_5);
            needBattleStone.text = Language.WAR_SPRITE[17].toString().replace("{num}", _local_4["costNum"]);
        }

        public function __wspCvs1_click(_arg_1:MouseEvent):void
        {
            battleSpriteClick(1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

