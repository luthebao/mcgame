// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetGuardPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.FilterButton;
    import com.qeedoo.ui.view.comp.GuardSlot;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.LinkButton;
    import mx.controls.Label;
    import mx.controls.Alert;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.managers.PopUpManager;
    import flash.utils.getDefinitionByName;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
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

    public class PetGuardPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const NUM_PER_PAGE:int = 15;
        private var _3236049img4:Image;
        private var _1554141554tabBtn5:FilterButton;
        private var _1524336983mypet15:GuardSlot;
        private var _1059206491mypet8:GuardSlot;
        private var _133022078firstTile:Tile;
        private var _839841136upBtn1:BasicGlowButton;
        public var _PetGuardPanel_LinkButton1:LinkButton;
        private var _1524336979mypet11:GuardSlot;
        private var _1524336981mypet13:GuardSlot;
        private var _888265549syText:Label;
        private var _1059206496mypet3:GuardSlot;
        private var _1554141559tabBtn0:FilterButton;
        private var _alert:Alert;
        public var _PetGuardPanel_Label10:Label;
        private var _505171264openBtn2:BasicGlowButton;
        private var _3236048img3:Image;
        private var _3437301pet4:GuardSlot;
        private var _505171262openBtn4:BasicGlowButton;
        private var _975883165nameAddText:Label;
        private var _1004478879petBagStack:ViewStack;
        private var _1338233730showCombine:IntroText;
        private var _696938215hasText:Label;
        private var _1554141557tabBtn2:FilterButton;
        private var Max_lev:int = 5;
        private var _1007683640pTitle:BasicTitleCanvas;
        private var _454209194mainBackImag:Image;
        public var firstTimeFlag:Boolean = true;
        private var _1059206493mypet6:GuardSlot;
        private var _1059206490mypet9:GuardSlot;
        private var _69272810levText:Label;
        private var _3437299pet2:GuardSlot;
        private var _1059206498mypet1:GuardSlot;
        private var _1554141555tabBtn4:FilterButton;
        private var _3236047img2:Image;
        private var _3437300pet3:GuardSlot;
        private var _1059206495mypet4:GuardSlot;
        private var _petList:Object;
        private var _helpAlert:Alert;
        private var _993660112propText:Label;
        private var _1524336982mypet14:GuardSlot;
        private var _1059206492mypet7:GuardSlot;
        private var _3437298pet1:GuardSlot;
        public var _PetGuardPanel_Label5:Label;
        public var _PetGuardPanel_Label6:Label;
        public var _PetGuardPanel_Label7:Label;
        public var _PetGuardPanel_Label8:Label;
        private var _1524336978mypet10:GuardSlot;
        private var _865666787needText:Label;
        private var _1524336980mypet12:GuardSlot;
        private var _3236046img1:Image;
        private var _505171265openBtn1:BasicGlowButton;
        private var _1969543397titleWrapper:Canvas;
        private var _1554141558tabBtn1:FilterButton;
        private var _505171263openBtn3:BasicGlowButton;
        private var petColor:Number = -1;
        private var _103655853magic:Image;
        private var _1059206497mypet2:GuardSlot;
        private var _607339634pageSelector:PageSelector;
        private var _1554141556tabBtn3:FilterButton;
        private var _3437297pet0:GuardSlot;
        private var _1059206494mypet5:GuardSlot;
        private var _3236045img0:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":640,
                    "height":520,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pTitle",
                        "events":{"creationComplete":"__pTitle_creationComplete"}
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "37";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "width":620,
                                "height":460,
                                "x":11,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"mainBackImag",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":3,
                                            "width":614,
                                            "height":453
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"magic",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":202,
                                            "y":217,
                                            "width":1250,
                                            "height":650
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_PetGuardPanel_LinkButton1",
                                    "events":{"click":"___PetGuardPanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.textDecoration = "underline";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":15
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"syText",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":126,
                                            "y":253,
                                            "width":200
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"levText",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":388,
                                            "width":84
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"propText",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":409
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "height":60,
                                            "y":379,
                                            "width":149,
                                            "x":15,
                                            "horizontalScrollPolicy":"off"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"tabBtn5",
                        "events":{"click":"__tabBtn5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "x":422,
                                "y":47,
                                "width":40,
                                "height":20,
                                "selected":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "x":460,
                                "y":47,
                                "width":25,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "x":484,
                                "y":47,
                                "width":25,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"tabBtn2",
                        "events":{"click":"__tabBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "x":507,
                                "y":47,
                                "width":25,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"tabBtn3",
                        "events":{"click":"__tabBtn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "x":530,
                                "y":47,
                                "width":25,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"tabBtn4",
                        "events":{"click":"__tabBtn4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "x":553,
                                "y":47,
                                "width":25,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"petBagStack",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":413,
                                "y":67,
                                "width":210,
                                "height":170,
                                "creationPolicy":"all",
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":210,
                                            "height":170,
                                            "x":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"firstTile",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 10;
                                                    this.paddingTop = 10;
                                                    this.verticalGap = 4;
                                                    this.horizontalGap = 3;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":3,
                                                        "y":3,
                                                        "width":203,
                                                        "height":130,
                                                        "direction":"horizontal",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "styleName":"TileSlot",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":GuardSlot,
                                                            "id":"mypet15",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "7";
                                                    this.horizontalCenter = "0";
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
                                "label":"Hornor",
                                "y":240,
                                "width":210,
                                "height":250,
                                "x":413,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"titleWrapper",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":15,
                                            "y":9,
                                            "styleName":"StandardTitle",
                                            "width":190,
                                            "x":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"nameAddText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xF9F900;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":8,
                                            "width":153,
                                            "x":29
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HRule,
                                    "stylesFactory":function ():void
                                    {
                                        this.themeColor = 40447;
                                        this.strokeColor = 847355;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":21,
                                            "y":33,
                                            "width":170
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":200,
                                            "y":43,
                                            "width":190,
                                            "x":10,
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"showCombine",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":181,
                                                        "x":4,
                                                        "height":200
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":65,
                                "height":65,
                                "x":180,
                                "y":220
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":GuardSlot,
                        "id":"pet0",
                        "events":{"click":"__pet0_click"},
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":195,
                                "y":232,
                                "acceptable":true,
                                "sid":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":65,
                                "height":65,
                                "x":180,
                                "y":64
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":GuardSlot,
                        "id":"pet1",
                        "events":{"click":"__pet1_click"},
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":195,
                                "y":80,
                                "acceptable":true,
                                "sid":1
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"openBtn1",
                        "events":{"click":"__openBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":130,
                                "styleName":"BtnStdRed",
                                "x":188,
                                "width":51
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":65,
                                "height":65,
                                "x":333,
                                "y":220
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":GuardSlot,
                        "id":"pet2",
                        "events":{"click":"__pet2_click"},
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":348,
                                "y":236,
                                "acceptable":true,
                                "sid":2
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"openBtn2",
                        "events":{"click":"__openBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":286,
                                "styleName":"BtnStdRed",
                                "x":342,
                                "width":51
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":65,
                                "height":65,
                                "x":180,
                                "y":367
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":GuardSlot,
                        "id":"pet3",
                        "events":{"click":"__pet3_click"},
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":195,
                                "y":382,
                                "acceptable":true,
                                "sid":3
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"openBtn3",
                        "events":{"click":"__openBtn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":432,
                                "styleName":"BtnStdRed",
                                "x":188,
                                "width":51
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":65,
                                "height":65,
                                "x":28,
                                "y":220
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":GuardSlot,
                        "id":"pet4",
                        "events":{"click":"__pet4_click"},
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":43,
                                "y":236,
                                "acceptable":true,
                                "sid":4
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"openBtn4",
                        "events":{"click":"__openBtn4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":286,
                                "styleName":"BtnStdRed",
                                "x":35,
                                "width":51
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PetGuardPanel_Label5",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "right";
                            this.color = 0xF9F900;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":425,
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PetGuardPanel_Label6",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "right";
                            this.color = 0xF9F900;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":445,
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PetGuardPanel_Label7",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "right";
                            this.color = 0xF9F900;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":299,
                                "y":405,
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PetGuardPanel_Label8",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":261,
                                "y":425,
                                "width":105
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"needText",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "left";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":355,
                                "y":425,
                                "width":80,
                                "text":""
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_PetGuardPanel_Label10",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.color = 0xFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":260,
                                "y":445,
                                "width":105
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"hasText",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "left";
                            this.color = 0xFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":355,
                                "y":445,
                                "width":78
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"upBtn1",
                        "events":{"click":"__upBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":465,
                                "styleName":"BtnStdRed",
                                "x":305,
                                "width":51
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var PET_GUARD_SID:Object = {
            "1":{
                "p0":"1",
                "p1":"2",
                "p2":"3",
                "p3":"4",
                "p4":"5"
            },
            "2":{
                "p0":"1",
                "p1":"2",
                "p2":"3",
                "p3":"4",
                "p4":"5"
            },
            "3":{
                "p0":"1",
                "p1":"2",
                "p2":"3",
                "p3":"4",
                "p4":"5"
            },
            "4":{
                "p0":"1",
                "p1":"2",
                "p2":"3",
                "p3":"4",
                "p4":"5"
            }
        };
        private var PET_GUARD_ADD:Object = {
            "1":{
                "num":75,
                "gold":7500,
                "per":0
            },
            "2":{
                "num":150,
                "gold":15000,
                "per":3
            },
            "3":{
                "num":250,
                "gold":25000,
                "per":8
            },
            "4":{
                "num":380,
                "gold":38000,
                "per":15
            },
            "5":{
                "num":0,
                "gold":0,
                "per":25
            }
        };
        private var PET_GUARD_INDEX_SID:Object = {
            "11":{
                "1":{
                    "val":0,
                    "per":0.0016
                },
                "2":{
                    "val":0,
                    "per":0.08
                },
                "3":{
                    "val":0,
                    "per":0.4
                },
                "4":{
                    "val":0,
                    "per":2
                },
                "5":{
                    "val":0,
                    "per":10
                }
            },
            "21":{
                "1":{
                    "val":0,
                    "per":0.0016
                },
                "2":{
                    "val":0,
                    "per":0.08
                },
                "3":{
                    "val":0,
                    "per":0.4
                },
                "4":{
                    "val":0,
                    "per":2
                },
                "5":{
                    "val":0,
                    "per":10
                }
            },
            "31":{
                "1":{
                    "val":0,
                    "per":0.0016
                },
                "2":{
                    "val":0,
                    "per":0.08
                },
                "3":{
                    "val":0,
                    "per":0.4
                },
                "4":{
                    "val":0,
                    "per":2
                },
                "5":{
                    "val":0,
                    "per":10
                }
            },
            "41":{
                "1":{
                    "val":0,
                    "per":0.0016
                },
                "2":{
                    "val":0,
                    "per":0.08
                },
                "3":{
                    "val":0,
                    "per":0.4
                },
                "4":{
                    "val":0,
                    "per":2
                },
                "5":{
                    "val":0,
                    "per":10
                }
            }
        };
        private var PET_GUARD_MAX_PROP:* = {
            "6":"58836.0938",
            "4":"21036.0938",
            "7":"58836.0938",
            "5":"16838.7188",
            "59":"11.8125%",
            "62":"11.8125%",
            "60":"11.8125%",
            "63":"11.8125%",
            "1":"84036.0938",
            "71":"0.5316",
            "11":"12600",
            "14":"8.4656",
            "31":"21.0656",
            "72":"25.0031",
            "61":"8.4656",
            "13":"21.0656"
        };
        private var petGuardObj:* = {
            "lvData":{},
            "petData":{}
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetGuardPanel()
        {
            mx_internal::_document = this;
            this.width = 640;
            this.height = 520;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetGuardPanel._watcherSetupUtil = _arg_1;
        }


        public function onGetPetGuardData(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1)
            {
                petGuardObj["lvData"] = _arg_1["lvData"];
                petGuardObj["petData"] = _arg_1["petData"];
                _local_2 = petGuardObj["lvData"][0];
                magic.source = ResManager.getResUrl((2080130106015 + _local_2));
                initPetManager();
                onInitPropText();
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

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        public function openGuardPanel():void
        {
            initView();
            visible = true;
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function set propText(_arg_1:Label):void
        {
            var _local_2:Object = this._993660112propText;
            if (_local_2 !== _arg_1)
            {
                this._993660112propText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText", _local_2, _arg_1));
            };
        }

        public function __pet3_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(3);
        }

        public function __openBtn3_click(_arg_1:MouseEvent):void
        {
            openGuardInSide(3);
        }

        public function set titleWrapper(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1969543397titleWrapper;
            if (_local_2 !== _arg_1)
            {
                this._1969543397titleWrapper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleWrapper", _local_2, _arg_1));
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        private function openGuardInSide(_arg_1:Number):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_PETGUARDINSIDE);
            if (_local_2)
            {
                _local_2.openGuardInSidePanel(_arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get nameAddText():Label
        {
            return (this._975883165nameAddText);
        }

        private function clearPage():void
        {
            var _local_1:int = 1;
            while (_local_1 <= NUM_PER_PAGE)
            {
                this[("mypet" + _local_1)].clean();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():FilterButton
        {
            return (this._1554141559tabBtn0);
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
        public function get upBtn1():BasicGlowButton
        {
            return (this._839841136upBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():FilterButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn5():FilterButton
        {
            return (this._1554141554tabBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get mypet1():GuardSlot
        {
            return (this._1059206498mypet1);
        }

        [Bindable(event="propertyChange")]
        public function get mypet2():GuardSlot
        {
            return (this._1059206497mypet2);
        }

        public function __pet0_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(0);
        }

        public function set mypet10(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1524336978mypet10;
            if (_local_2 !== _arg_1)
            {
                this._1524336978mypet10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mypet8():GuardSlot
        {
            return (this._1059206491mypet8);
        }

        public function set mypet11(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1524336979mypet11;
            if (_local_2 !== _arg_1)
            {
                this._1524336979mypet11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mypet3():GuardSlot
        {
            return (this._1059206496mypet3);
        }

        [Bindable(event="propertyChange")]
        public function get mypet7():GuardSlot
        {
            return (this._1059206492mypet7);
        }

        public function set mypet14(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1524336982mypet14;
            if (_local_2 !== _arg_1)
            {
                this._1524336982mypet14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mypet9():GuardSlot
        {
            return (this._1059206490mypet9);
        }

        [Bindable(event="propertyChange")]
        public function get mainBackImag():Image
        {
            return (this._454209194mainBackImag);
        }

        [Bindable(event="propertyChange")]
        public function get mypet6():GuardSlot
        {
            return (this._1059206493mypet6);
        }

        public function set mypet15(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1524336983mypet15;
            if (_local_2 !== _arg_1)
            {
                this._1524336983mypet15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet15", _local_2, _arg_1));
            };
        }

        public function __tabBtn5_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(5);
        }

        public function set mypet13(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1524336981mypet13;
            if (_local_2 !== _arg_1)
            {
                this._1524336981mypet13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get openBtn1():BasicGlowButton
        {
            return (this._505171265openBtn1);
        }

        public function set mypet12(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1524336980mypet12;
            if (_local_2 !== _arg_1)
            {
                this._1524336980mypet12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get openBtn3():BasicGlowButton
        {
            return (this._505171263openBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get mypet4():GuardSlot
        {
            return (this._1059206495mypet4);
        }

        private function initPetManager():void
        {
            firstTimeFlag = false;
            if (petColor == -1)
            {
                tabBtnClick(5);
            }
            else
            {
                tabBtnClick(petColor);
            };
            levText.text = ("Lv" + petGuardObj["lvData"][0]);
            propText.text = Language.PANEL_PETGUARD[11].replace("{num}", PET_GUARD_ADD[petGuardObj["lvData"][0]]["per"]);
            needText.text = PET_GUARD_ADD[petGuardObj["lvData"][0]]["num"];
            if (petGuardObj["lvData"][0] >= 5)
            {
                upBtn1.enabled = false;
            }
            else
            {
                upBtn1.enabled = true;
            };
            var _local_1:Number = (Number(4130220000811) + Number(petGuardObj["lvData"][0]));
            var _local_2:* = 0;
            while (_local_2 < 5)
            {
                this[("img" + _local_2)].source = ResManager.getIconUrl(_local_1);
                _local_2++;
            };
            if (((petGuardObj["petData"][0]) && (petGuardObj["petData"][0] > 0)))
            {
                syText.visible = false;
            }
            else
            {
                syText.visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get openBtn2():BasicGlowButton
        {
            return (this._505171264openBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get openBtn4():BasicGlowButton
        {
            return (this._505171262openBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get syText():Label
        {
            return (this._888265549syText);
        }

        [Bindable(event="propertyChange")]
        public function get img0():Image
        {
            return (this._3236045img0);
        }

        [Bindable(event="propertyChange")]
        public function get img2():Image
        {
            return (this._3236047img2);
        }

        [Bindable(event="propertyChange")]
        public function get img3():Image
        {
            return (this._3236048img3);
        }

        [Bindable(event="propertyChange")]
        public function get img4():Image
        {
            return (this._3236049img4);
        }

        [Bindable(event="propertyChange")]
        public function get img1():Image
        {
            return (this._3236046img1);
        }

        public function petInit(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:*;
            firstTimeFlag = false;
            for each (_local_2 in _arg_1)
            {
                if (_local_2)
                {
                    for (_local_3 in _local_2.data)
                    {
                        _local_2[_local_3] = _local_2.data[_local_3];
                    };
                };
                _local_2.creatureData = _core.data.getGameData(GamePredef.TBL_CREATURE, _local_2.data.tid);
                delete _local_2.data;
            };
            _core.player.petList = _arg_1;
            _core.remote.call("getPetGuardData", new Responder(onGetPetGuardData));
        }

        public function resetPetBagSlot(_arg_1:int):*
        {
            if (((petGuardObj["petData"][_arg_1]) && (Number(petGuardObj["petData"][_arg_1]) > 0)))
            {
                _core.remote.call("putDownPet", null, _arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get needText():Label
        {
            return (this._865666787needText);
        }

        [Bindable(event="propertyChange")]
        public function get hasText():Label
        {
            return (this._696938215hasText);
        }

        private function onInitGuardPet():void
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_1:* = 0;
            while (_local_1 <= 4)
            {
                this[("pet" + _local_1)].clean();
                if (((petGuardObj["petData"][_local_1]) && (petGuardObj["petData"][_local_1] > 0)))
                {
                    for each (_local_2 in _core.player.petList)
                    {
                        if (_local_2)
                        {
                            _local_3 = _core.getTemplateData(GamePredef.TBL_CREATURE, _local_2.tid, false);
                            if (!(((!(_local_3)) || (!(Number(_local_3.classIds) == 10))) || (Number(_local_3.useLv) < 50)))
                            {
                                if (Number(_local_2.id) == Number(petGuardObj["petData"][_local_1]))
                                {
                                    this[("pet" + _local_1)].type = GamePredef.TBL_PET;
                                    this[("pet" + _local_1)].slotData = _local_2;
                                    this[("pet" + _local_1)].stackNum = 1;
                                    this[("pet" + _local_1)].giid = _local_2.id;
                                    break;
                                };
                            };
                        };
                    };
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get levText():Label
        {
            return (this._69272810levText);
        }

        public function ___PetGuardPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function __pTitle_creationComplete(_arg_1:FlexEvent):void
        {
            addSlotEventListener();
        }

        [Bindable(event="propertyChange")]
        public function get pet0():GuardSlot
        {
            return (this._3437297pet0);
        }

        [Bindable(event="propertyChange")]
        public function get pet1():GuardSlot
        {
            return (this._3437298pet1);
        }

        public function set nameAddText(_arg_1:Label):void
        {
            var _local_2:Object = this._975883165nameAddText;
            if (_local_2 !== _arg_1)
            {
                this._975883165nameAddText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameAddText", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        [Bindable(event="propertyChange")]
        public function get pet4():GuardSlot
        {
            return (this._3437301pet4);
        }

        [Bindable(event="propertyChange")]
        public function get mypet5():GuardSlot
        {
            return (this._1059206494mypet5);
        }

        public function __upBtn1_click(_arg_1:MouseEvent):void
        {
            upOutGuardSid();
        }

        private function getPetColor(_arg_1:Number):int
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:int;
            for each (_local_2 in _core.player.petList)
            {
                if (_local_2)
                {
                    _local_3 = _core.getTemplateData(GamePredef.TBL_CREATURE, _local_2.tid, false);
                    if (!(((!(_local_3)) || (!(Number(_local_3.classIds) == 10))) || (Number(_local_3.useLv) < 50)))
                    {
                        if (_local_2.id == _arg_1)
                        {
                            _local_4 = _core.basic.colorByGrowRate(_local_2.growRate);
                            return (_local_4);
                        };
                    };
                };
            };
            return (-1);
        }

        [Bindable(event="propertyChange")]
        public function get pet3():GuardSlot
        {
            return (this._3437300pet3);
        }

        [Bindable(event="propertyChange")]
        public function get pet2():GuardSlot
        {
            return (this._3437299pet2);
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

        public function set tabBtn0(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set showCombine(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1338233730showCombine;
            if (_local_2 !== _arg_1)
            {
                this._1338233730showCombine = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine", _local_2, _arg_1));
            };
        }

        private function _PetGuardPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pTitle.text = _arg_1;
            }, "pTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000810")));
            }, function (_arg_1:Object):void
            {
                mainBackImag.source = _arg_1;
            }, "mainBackImag.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardPanel_LinkButton1.label = _arg_1;
            }, "_PetGuardPanel_LinkButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                syText.filters = _arg_1;
            }, "syText.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                syText.text = _arg_1;
            }, "syText.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                levText.text = _arg_1;
            }, "levText.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propText.text = _arg_1;
            }, "propText.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn5.label = _arg_1;
            }, "tabBtn5.label");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn5.filters = _arg_1;
            }, "tabBtn5.filters");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn0.filters = _arg_1;
            }, "tabBtn0.filters");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn1.filters = _arg_1;
            }, "tabBtn1.filters");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn2.filters = _arg_1;
            }, "tabBtn2.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn3.filters = _arg_1;
            }, "tabBtn3.filters");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tabBtn4.filters = _arg_1;
            }, "tabBtn4.filters");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet1.slotType = _arg_1;
            }, "mypet1.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet2.slotType = _arg_1;
            }, "mypet2.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet3.slotType = _arg_1;
            }, "mypet3.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet4.slotType = _arg_1;
            }, "mypet4.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet5.slotType = _arg_1;
            }, "mypet5.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet6.slotType = _arg_1;
            }, "mypet6.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet7.slotType = _arg_1;
            }, "mypet7.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet8.slotType = _arg_1;
            }, "mypet8.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet9.slotType = _arg_1;
            }, "mypet9.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet10.slotType = _arg_1;
            }, "mypet10.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet11.slotType = _arg_1;
            }, "mypet11.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet12.slotType = _arg_1;
            }, "mypet12.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet13.slotType = _arg_1;
            }, "mypet13.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet14.slotType = _arg_1;
            }, "mypet14.slotType");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                mypet15.slotType = _arg_1;
            }, "mypet15.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                nameAddText.filters = _arg_1;
            }, "nameAddText.filters");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nameAddText.text = _arg_1;
            }, "nameAddText.text");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet0.slotType = _arg_1;
            }, "pet0.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet1.slotType = _arg_1;
            }, "pet1.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn1.label = _arg_1;
            }, "openBtn1.label");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet2.slotType = _arg_1;
            }, "pet2.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn2.label = _arg_1;
            }, "openBtn2.label");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet3.slotType = _arg_1;
            }, "pet3.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn3.label = _arg_1;
            }, "openBtn3.label");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet4.slotType = _arg_1;
            }, "pet4.slotType");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn4.label = _arg_1;
            }, "openBtn4.label");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardPanel_Label5.text = _arg_1;
            }, "_PetGuardPanel_Label5.text");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardPanel_Label6.text = _arg_1;
            }, "_PetGuardPanel_Label6.text");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardPanel_Label7.text = _arg_1;
            }, "_PetGuardPanel_Label7.text");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardPanel_Label8.text = _arg_1;
            }, "_PetGuardPanel_Label8.text");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardPanel_Label10.text = _arg_1;
            }, "_PetGuardPanel_Label10.text");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.petguardout;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                hasText.text = _arg_1;
            }, "hasText.text");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn1.label = _arg_1;
            }, "upBtn1.label");
            result[51] = binding;
            return (result);
        }

        private function _PetGuardPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PANEL_PETGUARD[1];
            _local_1 = ResManager.getIconUrl(parseInt("4130220000810"));
            _local_1 = Language.PANEL_PETGUARD[19];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.PANEL_PETGUARD[20];
            _local_1 = Language.PANEL_PETGUARD[7];
            _local_1 = Language.PANEL_PETGUARD[7];
            _local_1 = Language.PANEL_PETGUARD[12];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PANEL_PETGUARD[13];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PANEL_PETGUARD[14];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PANEL_PETGUARD[15];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PANEL_PETGUARD[16];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PANEL_PETGUARD[17];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.PANEL_PETGUARD[2];
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Language.PANEL_PETGUARD[9];
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Language.PANEL_PETGUARD[9];
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Language.PANEL_PETGUARD[9];
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Language.PANEL_PETGUARD[9];
            _local_1 = Language.PANEL_PETGUARD[3];
            _local_1 = Language.PANEL_PETGUARD[4];
            _local_1 = Language.PANEL_PETGUARD[5];
            _local_1 = Language.PANEL_PETGUARD[6];
            _local_1 = Language.PANEL_PETGUARD[7];
            _local_1 = _core.player.petguardout;
            _local_1 = Language.PANEL_PETGUARD[8];
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

        public function set tabBtn3(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        public function set upBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._839841136upBtn1;
            if (_local_2 !== _arg_1)
            {
                this._839841136upBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get titleWrapper():Canvas
        {
            return (this._1969543397titleWrapper);
        }

        public function __openBtn2_click(_arg_1:MouseEvent):void
        {
            openGuardInSide(2);
        }

        public function __pet2_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(2);
        }

        public function set mypet1(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206498mypet1;
            if (_local_2 !== _arg_1)
            {
                this._1059206498mypet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet1", _local_2, _arg_1));
            };
        }

        public function set mypet2(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206497mypet2;
            if (_local_2 !== _arg_1)
            {
                this._1059206497mypet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propText():Label
        {
            return (this._993660112propText);
        }

        private function tabBtnClick(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 <= 5)
            {
                if (_local_2 == _arg_1)
                {
                    this[("tabBtn" + _local_2)].selected = true;
                    petColor = ((_arg_1 < 5) ? (4 - _arg_1) : 5);
                }
                else
                {
                    this[("tabBtn" + _local_2)].selected = false;
                };
                _local_2++;
            };
            petFresh();
        }

        public function set mypet4(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206495mypet4;
            if (_local_2 !== _arg_1)
            {
                this._1059206495mypet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet4", _local_2, _arg_1));
            };
        }

        public function set mypet6(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206493mypet6;
            if (_local_2 !== _arg_1)
            {
                this._1059206493mypet6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet6", _local_2, _arg_1));
            };
        }

        public function set mypet3(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206496mypet3;
            if (_local_2 !== _arg_1)
            {
                this._1059206496mypet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet3", _local_2, _arg_1));
            };
        }

        public function set mypet7(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206492mypet7;
            if (_local_2 !== _arg_1)
            {
                this._1059206492mypet7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet7", _local_2, _arg_1));
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        public function set mypet5(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206494mypet5;
            if (_local_2 !== _arg_1)
            {
                this._1059206494mypet5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet5", _local_2, _arg_1));
            };
        }

        public function set mypet9(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206490mypet9;
            if (_local_2 !== _arg_1)
            {
                this._1059206490mypet9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet9", _local_2, _arg_1));
            };
        }

        public function set petBagStack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1004478879petBagStack;
            if (_local_2 !== _arg_1)
            {
                this._1004478879petBagStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petBagStack", _local_2, _arg_1));
            };
        }

        public function petFresh():void
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:Boolean;
            var _local_5:*;
            var _local_6:int;
            _petList = _core.player.petList;
            var _local_1:Array = [];
            if (_core.player.petList)
            {
                for each (_local_2 in _core.player.petList)
                {
                    if (_local_2)
                    {
                        if (petColor >= 0)
                        {
                            _local_6 = _core.basic.colorByGrowRate(_local_2.growRate);
                            if (((!(petColor == 5)) && (!(_local_6 == petColor)))) continue;
                        };
                        _local_3 = _core.getTemplateData(GamePredef.TBL_CREATURE, _local_2.tid, false);
                        if (!(((!(_local_3)) || (!(Number(_local_3.classIds) == 10))) || (Number(_local_3.useLv) < 50)))
                        {
                            _local_4 = false;
                            for (_local_5 in petGuardObj["petData"])
                            {
                                if (Number(_local_2.id) == Number(petGuardObj["petData"][_local_5]))
                                {
                                    _local_4 = true;
                                    break;
                                };
                            };
                            if (!_local_4)
                            {
                                _local_1.push(_local_2);
                            };
                        };
                    };
                };
            };
            _local_1.sortOn(["tid", "growRate"], [(Array.DESCENDING | Array.NUMERIC), (Array.DESCENDING | Array.NUMERIC)]);
            _petList = _local_1;
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(_petList.length, NUM_PER_PAGE);
            onInitGuardPet();
        }

        public function set mypet8(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._1059206491mypet8;
            if (_local_2 !== _arg_1)
            {
                this._1059206491mypet8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mypet8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mypet11():GuardSlot
        {
            return (this._1524336979mypet11);
        }

        [Bindable(event="propertyChange")]
        public function get mypet13():GuardSlot
        {
            return (this._1524336981mypet13);
        }

        [Bindable(event="propertyChange")]
        public function get mypet14():GuardSlot
        {
            return (this._1524336982mypet14);
        }

        [Bindable(event="propertyChange")]
        public function get mypet15():GuardSlot
        {
            return (this._1524336983mypet15);
        }

        [Bindable(event="propertyChange")]
        public function get mypet10():GuardSlot
        {
            return (this._1524336978mypet10);
        }

        public function set magic(_arg_1:Image):void
        {
            var _local_2:Object = this._103655853magic;
            if (_local_2 !== _arg_1)
            {
                this._103655853magic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magic", _local_2, _arg_1));
            };
        }

        public function set syText(_arg_1:Label):void
        {
            var _local_2:Object = this._888265549syText;
            if (_local_2 !== _arg_1)
            {
                this._888265549syText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "syText", _local_2, _arg_1));
            };
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

        private function addSlotEventListener():void
        {
            var _local_1:int;
            while (_local_1 <= 4)
            {
                _local_1++;
            };
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

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(4);
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

        [Bindable(event="propertyChange")]
        public function get firstTile():Tile
        {
            return (this._133022078firstTile);
        }

        [Bindable(event="propertyChange")]
        public function get mypet12():GuardSlot
        {
            return (this._1524336980mypet12);
        }

        public function set openBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._505171263openBtn3;
            if (_local_2 !== _arg_1)
            {
                this._505171263openBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn3", _local_2, _arg_1));
            };
        }

        public function set openBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._505171265openBtn1;
            if (_local_2 !== _arg_1)
            {
                this._505171265openBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.PANEL_PETGUARD[21].toString();
            _helpAlert = Alert.show(_local_1, Language.PANEL_PETGUARD[19].toString(), Alert.YES, null, null);
        }

        override public function initialize():void
        {
            var target:PetGuardPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetGuardPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetGuardPanelWatcherSetupUtil");
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
        public function get showCombine():IntroText
        {
            return (this._1338233730showCombine);
        }

        public function set openBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._505171262openBtn4;
            if (_local_2 !== _arg_1)
            {
                this._505171262openBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn4", _local_2, _arg_1));
            };
        }

        public function set img0(_arg_1:Image):void
        {
            var _local_2:Object = this._3236045img0;
            if (_local_2 !== _arg_1)
            {
                this._3236045img0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img0", _local_2, _arg_1));
            };
        }

        public function set img1(_arg_1:Image):void
        {
            var _local_2:Object = this._3236046img1;
            if (_local_2 !== _arg_1)
            {
                this._3236046img1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img1", _local_2, _arg_1));
            };
        }

        public function __pet4_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(4);
        }

        public function set img3(_arg_1:Image):void
        {
            var _local_2:Object = this._3236048img3;
            if (_local_2 !== _arg_1)
            {
                this._3236048img3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img3", _local_2, _arg_1));
            };
        }

        public function set img4(_arg_1:Image):void
        {
            var _local_2:Object = this._3236049img4;
            if (_local_2 !== _arg_1)
            {
                this._3236049img4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img4", _local_2, _arg_1));
            };
        }

        public function set img2(_arg_1:Image):void
        {
            var _local_2:Object = this._3236047img2;
            if (_local_2 !== _arg_1)
            {
                this._3236047img2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petBagStack():ViewStack
        {
            return (this._1004478879petBagStack);
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

        public function __openBtn4_click(_arg_1:MouseEvent):void
        {
            openGuardInSide(4);
        }

        [Bindable(event="propertyChange")]
        public function get magic():Image
        {
            return (this._103655853magic);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        public function set openBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._505171264openBtn2;
            if (_local_2 !== _arg_1)
            {
                this._505171264openBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn2", _local_2, _arg_1));
            };
        }

        public function upOutGuardSid():void
        {
            var ct:int;
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var gfunc:Function;
            var handler:Function;
            var str:String;
            var lev:int = petGuardObj["lvData"][0];
            if (lev >= 5)
            {
                return;
            };
            ct = 2;
            if (PET_GUARD_ADD[lev]["num"] > _core.player.petguardout)
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
                ct = 1;
            };
            if (ct == 1)
            {
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("upGuardSid", null, 0, ct);
                    };
                };
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                str = Language.PANEL_PETGUARD[18].toString().replace("{num}", PET_GUARD_ADD[lev]["gold"]);
                _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                return;
            };
            _core.remote.call("upGuardSid", null, 0, ct);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 - 1) + _arg_1);
                this[("mypet" + _local_4)].type = GamePredef.TBL_PET;
                this[("mypet" + _local_4)].slotData = _petList[_local_3];
                this[("mypet" + _local_4)].stackNum = 1;
                this[("mypet" + _local_4)].giid = _petList[_local_3].id;
                _local_4++;
            };
        }

        public function set needText(_arg_1:Label):void
        {
            var _local_2:Object = this._865666787needText;
            if (_local_2 !== _arg_1)
            {
                this._865666787needText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needText", _local_2, _arg_1));
            };
        }

        public function set hasText(_arg_1:Label):void
        {
            var _local_2:Object = this._696938215hasText;
            if (_local_2 !== _arg_1)
            {
                this._696938215hasText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hasText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pTitle():BasicTitleCanvas
        {
            return (this._1007683640pTitle);
        }

        public function set levText(_arg_1:Label):void
        {
            var _local_2:Object = this._69272810levText;
            if (_local_2 !== _arg_1)
            {
                this._69272810levText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levText", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (!_core.player.petList)
            {
                _core.remote.call("initViewPetMngP", new Responder(petInit));
            }
            else
            {
                _core.remote.call("getPetGuardData", null);
            };
        }

        private function getProp(_arg_1:Object):String
        {
            var _local_5:*;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            if (!_arg_1)
            {
                return ("");
            };
            var _local_2:* = "";
            var _local_3:Number = (Number(_arg_1["sid"]) * 10);
            var _local_4:Number = 0;
            _local_5 = 1;
            while (_local_5 <= 5)
            {
                _local_7 = (_local_3 + _local_5);
                if (((petGuardObj["petData"][_local_7]) && (petGuardObj["petData"][_local_7] > 0)))
                {
                    _local_8 = getPetColor(petGuardObj["petData"][_local_7]);
                    if (_local_8 != -1)
                    {
                        _local_4 = (Number(_local_4) + Number(PET_GUARD_INDEX_SID[(_local_3 + 1)][(_local_8 + 1)]["per"]));
                    };
                };
                _local_5++;
            };
            var _local_6:Number = 0;
            if (((petGuardObj["petData"][_arg_1["sid"]]) && (petGuardObj["petData"][_arg_1["sid"]] > 0)))
            {
                _local_8 = getPetColor(petGuardObj["petData"][_arg_1["sid"]]);
                if (_local_8 != -1)
                {
                    _local_6 = (Number(_local_6) + Number(PET_GUARD_SID[_arg_1["sid"]][("p" + _local_8)]));
                };
            };
            _local_5 = 1;
            while (_local_5 <= 4)
            {
                _local_9 = PET_GUARD_ADD[petGuardObj["lvData"][0]]["per"];
                _local_10 = _arg_1[("propVal" + _local_5)];
                _local_10 = ((((_local_10 / 10000) * (1 + (_local_4 / 100))) * (1 + (_local_9 / 100))) * (1 + (_local_6 / 100)));
                _local_11 = ((4 * (Number(_arg_1["sid"]) - 1)) + _local_5);
                if (((((_arg_1[("prop" + _local_5)] == 59) || (_arg_1[("prop" + _local_5)] == 60)) || (_arg_1[("prop" + _local_5)] == 62)) || (_arg_1[("prop" + _local_5)] == 63)))
                {
                    _local_2 = (((((((_local_2 + "<font color='#F9F900'>") + Language.TIP_MONSTER_H[_arg_1[("prop" + _local_5)]]) + "</font>\n") + Number((_local_10 * 100)).toFixed(4)) + "%<font color='#00FF00'>/") + PET_GUARD_MAX_PROP[_arg_1[("prop" + _local_5)]]) + "</font>\n");
                }
                else
                {
                    _local_2 = (((((((_local_2 + "<font color='#F9F900'>") + Language.TIP_MONSTER_H[_arg_1[("prop" + _local_5)]]) + "</font>\n") + _local_10.toFixed(4)) + "<font color='#00FF00'>/") + PET_GUARD_MAX_PROP[_arg_1[("prop" + _local_5)]]) + "</font>\n");
                };
                _local_5++;
            };
            return (_local_2);
        }

        public function __pet1_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(1);
        }

        private function onInitPropText():void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:Object;
            showCombine.htmlText = "";
            var _local_1:* = "";
            var _local_2:* = 1;
            while (_local_2 <= 4)
            {
                _local_3 = petGuardObj["lvData"][_local_2];
                for each (_local_5 in _core.data.gameDataIndex[GamePredef.TBL_PET_GUARD][_local_2])
                {
                    if (Number(_local_5.lev) == _local_3)
                    {
                        _local_4 = _local_5;
                        break;
                    };
                };
                _local_1 = (_local_1 + getProp(_local_4));
                _local_2++;
            };
            showCombine.htmlText = _local_1;
        }

        public function set pet1(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437298pet1;
            if (_local_2 !== _arg_1)
            {
                this._3437298pet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet1", _local_2, _arg_1));
            };
        }

        public function set pet2(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437299pet2;
            if (_local_2 !== _arg_1)
            {
                this._3437299pet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet2", _local_2, _arg_1));
            };
        }

        public function __openBtn1_click(_arg_1:MouseEvent):void
        {
            openGuardInSide(1);
        }

        public function set pet0(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437297pet0;
            if (_local_2 !== _arg_1)
            {
                this._3437297pet0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet0", _local_2, _arg_1));
            };
        }

        public function set pet4(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437301pet4;
            if (_local_2 !== _arg_1)
            {
                this._3437301pet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet4", _local_2, _arg_1));
            };
        }

        public function set pet3(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437300pet3;
            if (_local_2 !== _arg_1)
            {
                this._3437300pet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet3", _local_2, _arg_1));
            };
        }

        private function tabDownClick(_arg_1:int):void
        {
        }


    }
}//package com.qeedoo.ui.view.compDragable

