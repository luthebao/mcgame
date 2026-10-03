// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CharactorInfoPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import flash.display.MovieClip;
    import com.qeedoo.ui.view.comp.ItemSlotChaInfo;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.Button;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.TextArea;
    import mx.core.UIComponent;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.setTimeout;
    import mx.controls.Alert;
    import com.qeedoo.game.utils.LinkEncode;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import flash.events.Event;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import flash.net.Responder;
    import mx.core.IUITextField;
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

    public class CharactorInfoPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1520845170BtnInviteGuild:BasicDelayButton;
        private var _189045043chivalTxt:RoundedLabel;
        private var _cid:Number;
        private var maxMc:MovieClip;
        private var _1295475194equip6:ItemSlotChaInfo;
        private var _756552959newNameLB:BasicTxtButton;
        private var _2098207823btnTrack:Button;
        private var _1548752592charPmImg:Image;
        private var _739034253charImg:Image;
        public var _CharactorInfoPanel_BasicTxtButton2:BasicTxtButton;
        public var _CharactorInfoPanel_BasicTxtButton3:BasicTxtButton;
        public var _CharactorInfoPanel_BasicTxtButton4:BasicTxtButton;
        public var _CharactorInfoPanel_BasicTxtButton5:BasicTxtButton;
        public var _CharactorInfoPanel_BasicTxtButton6:BasicTxtButton;
        private var _206189300btnSeek:Button;
        private var _1890927552islotMain:ItemSlot;
        private var _3553393tbn1:BasicGlowButton;
        public var _CharactorInfoPanel_BasicTxtButton7:BasicTxtButton;
        private var _1179373780islot3:ItemSlot;
        private var _1205539178infoClass:RoundedLabel;
        private var _obj:Object;
        private var _1295475191equip9:ItemSlotChaInfo;
        private var _1209508837infoGuild:RoundedLabel;
        private var _1295475199equip1:ItemSlotChaInfo;
        private var _111185pop:RoundedLabel;
        private var _114581tab:ViewStack;
        private var _106706549pkTxt:RoundedLabel;
        private var _1505025456equip11:ItemSlotChaInfo;
        private var _177753177infoName:RoundedLabel;
        private var _2081143Btn3:BasicGlowButton;
        private var _1295475196equip4:ItemSlotChaInfo;
        public var _CharactorInfoPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1505025425equip21:ItemSlotChaInfo;
        private var _1505025454equip13:ItemSlotChaInfo;
        private var _1179373782islot1:ItemSlot;
        private var _1179373779islot4:ItemSlot;
        private var _1295447866starActiveInfo:TextArea;
        private var _1295475193equip7:ItemSlotChaInfo;
        private var _1516339456_tbnEnabled:Boolean = true;
        private var _2081142Btn2:BasicGlowButton;
        private var _108274547rbImg:Image;
        public var equipActiveList:Object;
        private var _1295475198equip2:ItemSlotChaInfo;
        private var _1295475195equip5:ItemSlotChaInfo;
        private var _808946632makerActiveInfo:TextArea;
        private var _344051672btnAchieveWatching:BasicGlowButton;
        private var _224866005stoneSealWatching:BasicGlowButton;
        private var _1505025457equip10:ItemSlotChaInfo;
        private var _1179373778islot5:ItemSlot;
        private var _1662853568elemUIC:UIComponent;
        private var _2081141Btn1:BasicGlowButton;
        private var _150170562btnDelPop:Button;
        public var _CharactorInfoPanel_Canvas1:Canvas;
        public var _CharactorInfoPanel_Canvas3:Canvas;
        public var _CharactorInfoPanel_Canvas4:Canvas;
        public var _CharactorInfoPanel_Canvas5:Canvas;
        private var mc:MovieClip;
        private var _1179373781islot2:ItemSlot;
        public var _CharactorInfoPanel_Image1:Image;
        private var maskMc:MovieClip;
        private var _1295475192equip8:ItemSlotChaInfo;
        private var _117350830gmLabel:Label;
        private var _1505025455equip12:ItemSlotChaInfo;
        private var _3553394tbn2:BasicGlowButton;
        private var _1132481262tb_chival:BasicTxtButton;
        private var _63121260btnAddPop:Button;
        private var _1545773492charNGImg:Image;
        private var _795125073wanted:Label;
        private var _1295475197equip3:ItemSlotChaInfo;
        private var _1213662070infoLevel:RoundedLabel;
        private var _1505025424equip22:ItemSlotChaInfo;
        private var _1505025453equip14:ItemSlotChaInfo;
        private var _1221167690infoTitle:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_CharactorInfoPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"_CharactorInfoPanel_Canvas1",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":370,
                                "y":35,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":151.5,
                                            "height":148,
                                            "styleName":"CSSBorder",
                                            "y":5,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"infoName",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "-1";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":2,
                                                        "width":104.5,
                                                        "text":"",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"infoClass",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":20,
                                                        "width":104,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"infoLevel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":38,
                                                        "width":104,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"infoGuild",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":56,
                                                        "text":"",
                                                        "width":104
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"infoTitle",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":74,
                                                        "width":104,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"newNameLB",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":2,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorInfoPanel_BasicTxtButton2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":20,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorInfoPanel_BasicTxtButton3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":38,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorInfoPanel_BasicTxtButton4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":56,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorInfoPanel_BasicTxtButton5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":74,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"pkTxt",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":46,
                                                        "y":92,
                                                        "width":102,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"pop",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":46,
                                                        "y":110,
                                                        "width":102,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"chivalTxt",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":46,
                                                        "y":128,
                                                        "width":102,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorInfoPanel_BasicTxtButton6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":92,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_CharactorInfoPanel_BasicTxtButton7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":110,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"tb_chival",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":128,
                                                        "width":38,
                                                        "height":18
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tbn1",
                                    "events":{"click":"__tbn1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":158.3,
                                            "styleName":"HorizontalTab"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tbn2",
                                    "events":{"click":"__tbn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":40,
                                            "y":158.3,
                                            "styleName":"HorizontalTab"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"tab",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "5";
                                        this.right = "5";
                                        this.bottom = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":188,
                                            "tabEnabled":false,
                                            "styleName":"TabNavPlayer",
                                            "creationPolicy":"all",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_CharactorInfoPanel_Canvas3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentHeight":100,
                                                        "visible":true,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":UIComponent,
                                                            "id":"elemUIC",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":92,
                                                                    "y":9,
                                                                    "width":80,
                                                                    "height":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.top = "5";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":77});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":48,
                                                                    "y":113
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":41});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":113});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.bottom = "5";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "48";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":113,
                                                                    "x":190
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "5";
                                                                this.right = "5";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":77});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":41});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                                this.bottom = "5";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":113});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "5";
                                                                this.right = "48";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"x":190});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"x":48});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip21",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":48,
                                                                    "y":77
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotChaInfo,
                                                            "id":"equip22",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "48";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":77});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"makerActiveInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selectable":false,
                                                                    "x":39,
                                                                    "y":7,
                                                                    "width":68,
                                                                    "height":60,
                                                                    "editable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"starActiveInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selectable":false,
                                                                    "x":159,
                                                                    "y":6,
                                                                    "width":68,
                                                                    "height":60,
                                                                    "editable":false
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_CharactorInfoPanel_Canvas4",
                                                "events":{"show":"___CharactorInfoPanel_Canvas4_show"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentHeight":100,
                                                        "percentWidth":100,
                                                        "visible":true,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_CharactorInfoPanel_Image1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":188,
                                                                    "height":189,
                                                                    "y":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"islotMain",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":80,
                                                                    "slotType":4,
                                                                    "x":112.5,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"islot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":18,
                                                                    "slotType":4,
                                                                    "x":66,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"islot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":18,
                                                                    "slotType":4,
                                                                    "x":156,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"islot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":103,
                                                                    "slotType":4,
                                                                    "x":183,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"islot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":153,
                                                                    "slotType":4,
                                                                    "x":112,
                                                                    "styleName":"TransparentSlot"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"islot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":103,
                                                                    "slotType":4,
                                                                    "x":45,
                                                                    "styleName":"TransparentSlot"
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
                                    "id":"charImg",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":130,
                                            "width":100,
                                            "x":5,
                                            "y":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"charPmImg",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":20,
                                            "width":24,
                                            "x":5,
                                            "y":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"charNGImg",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":25,
                                            "width":25,
                                            "x":5,
                                            "y":27
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"rbImg",
                                    "events":{"click":"__rbImg_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":45,
                                            "width":40,
                                            "x":65,
                                            "y":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"gmLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 7601921;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":73,
                                            "y":10,
                                            "text":"[GM]"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_CharactorInfoPanel_Canvas5",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 0xFFFFFF;
                                        this.backgroundAlpha = 0.5;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":135,
                                            "width":100,
                                            "height":18,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnAddPop",
                                                "events":{"click":"__btnAddPop_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":66,
                                                        "y":3,
                                                        "styleName":"BtnFlower",
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnDelPop",
                                                "events":{"click":"__btnDelPop_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":83,
                                                        "y":3,
                                                        "styleName":"BtnEgg",
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnSeek",
                                                "events":{"click":"__btnSeek_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12,
                                                        "styleName":"BtnGlass"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnTrack",
                                                "events":{"click":"__btnTrack_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":49,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12,
                                                        "styleName":"BtnSword"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"wanted",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16711937;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":-2,
                                                        "y":3,
                                                        "text":"[Wanted]"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnAchieveWatching",
                                    "events":{"click":"__btnAchieveWatching_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":181,
                                            "styleName":"BtnStdRed",
                                            "width":80,
                                            "y":158
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"stoneSealWatching",
                                    "events":{"click":"__stoneSealWatching_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "styleName":"BtnStdRed",
                                            "width":80,
                                            "y":158
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"Btn1",
                        "events":{"click":"__Btn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "styleName":"BtnStdRed",
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"BtnInviteGuild",
                        "events":{"click":"__BtnInviteGuild_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":97,
                                "styleName":"BtnStdRed",
                                "clickDelay":5000,
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"Btn2",
                        "events":{"click":"__Btn2_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":180,
                                "styleName":"BtnStdGreen",
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"Btn3",
                        "events":{"click":"__Btn3_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "15";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdBlue",
                                "width":50
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var element:Class = CharactorInfoPanel_element;
        private var newGradeLevel:Array = ["", "Nhập Môn", "Bậc Thầy", "Siêu Phàm"];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CharactorInfoPanel()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 450;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CharactorInfoPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get equip1():ItemSlotChaInfo
        {
            return (this._1295475199equip1);
        }

        [Bindable(event="propertyChange")]
        public function get equip3():ItemSlotChaInfo
        {
            return (this._1295475197equip3);
        }

        [Bindable(event="propertyChange")]
        public function get equip5():ItemSlotChaInfo
        {
            return (this._1295475195equip5);
        }

        public function set equip4(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475196equip4;
            if (_local_2 !== _arg_1)
            {
                this._1295475196equip4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip4", _local_2, _arg_1));
            };
        }

        public function ___CharactorInfoPanel_Canvas4_show(_arg_1:FlexEvent):void
        {
            updateGodEquipt();
        }

        public function set equip5(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475195equip5;
            if (_local_2 !== _arg_1)
            {
                this._1295475195equip5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip5", _local_2, _arg_1));
            };
        }

        private function useTrack():void
        {
            _core.remote.useTrack(_obj.data.name);
        }

        public function set equip6(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475194equip6;
            if (_local_2 !== _arg_1)
            {
                this._1295475194equip6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip6", _local_2, _arg_1));
            };
        }

        public function set equip3(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475197equip3;
            if (_local_2 !== _arg_1)
            {
                this._1295475197equip3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get equip7():ItemSlotChaInfo
        {
            return (this._1295475193equip7);
        }

        [Bindable(event="propertyChange")]
        public function get equip8():ItemSlotChaInfo
        {
            return (this._1295475192equip8);
        }

        public function set equip8(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475192equip8;
            if (_local_2 !== _arg_1)
            {
                this._1295475192equip8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip8", _local_2, _arg_1));
            };
        }

        public function set equip1(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475199equip1;
            if (_local_2 !== _arg_1)
            {
                this._1295475199equip1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip1", _local_2, _arg_1));
            };
        }

        public function set equip9(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475191equip9;
            if (_local_2 !== _arg_1)
            {
                this._1295475191equip9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip9", _local_2, _arg_1));
            };
        }

        public function set equip2(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475198equip2;
            if (_local_2 !== _arg_1)
            {
                this._1295475198equip2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get equip6():ItemSlotChaInfo
        {
            return (this._1295475194equip6);
        }

        [Bindable(event="propertyChange")]
        public function get equip9():ItemSlotChaInfo
        {
            return (this._1295475191equip9);
        }

        public function __tbn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        private function _CharactorInfoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHARACTORINFOPANEL_U[4];
            _local_1 = Language.CHARACTORINFOPANEL_S[46];
            _local_1 = Language.CHARACTORINFOPANEL_U[5];
            _local_1 = Language.CHARACTORINFOPANEL_U[6];
            _local_1 = Language.CHARACTORINFOPANEL_U[7];
            _local_1 = Language.CHARACTORINFOPANEL_U[9];
            _local_1 = Language.CHARACTORINFOPANEL_U[10];
            _local_1 = Language.CHARACTORPANEL_U[35];
            _local_1 = Language.CHARACTORPANEL_S[37];
            _local_1 = Language.CHARACTORPANEL_U[36];
            _local_1 = Language.CHARACTORPANEL_S[38];
            _local_1 = Language.CHARACTORPANEL_U[37];
            _local_1 = Language.CHARACTORPANEL_U[44];
            _local_1 = Language.CHARACTORPANEL_U[45];
            _local_1 = Language.CHARACTORINFOPANEL_S[50];
            _local_1 = Language.CHARACTORINFOPANEL_S[17];
            _local_1 = Language.CHARACTORINFOPANEL_S[18];
            _local_1 = Language.CHARACTORINFOPANEL_S[19];
            _local_1 = Language.CHARACTORINFOPANEL_S[20];
            _local_1 = Language.CHARACTORINFOPANEL_S[21];
            _local_1 = Language.CHARACTORINFOPANEL_S[22];
            _local_1 = Language.CHARACTORINFOPANEL_S[23];
            _local_1 = Language.CHARACTORINFOPANEL_S[24];
            _local_1 = Language.CHARACTORINFOPANEL_S[25];
            _local_1 = Language.CHARACTORINFOPANEL_S[26];
            _local_1 = Language.CHARACTORINFOPANEL_S[27];
            _local_1 = Language.CHARACTORINFOPANEL_S[28];
            _local_1 = Language.CHARACTORINFOPANEL_S[45];
            _local_1 = Language.CHARACTORINFOPANEL_S[51];
            _local_1 = Language.CHARACTORINFOPANEL_S[53];
            _local_1 = Language.CHARACTORINFOPANEL_S[54];
            _local_1 = Language.CHARACTORPANEL_S[24];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.CHARACTORPANEL_S[26];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.CHARACTORPANEL_U[32];
            _local_1 = ResManager.TOTEM_MAGIC_WEAPON;
            _local_1 = Language.CHARACTORPANEL_U[33];
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "1");
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "2");
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "3");
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "4");
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = (Language.CHARACTORPANEL_U[34] + "5");
            _local_1 = [GamePredef.TBL_EQUIPT_INSTANCE];
            _local_1 = this._tbnEnabled;
            _local_1 = Language.CHARACTORINFOPANEL_S[33];
            _local_1 = Language.CHARACTORINFOPANEL_S[34];
            _local_1 = Language.CHARACTORINFOPANEL_S[35];
            _local_1 = Language.CHARACTORINFOPANEL_S[36];
            _local_1 = Language.CHARACTORINFOPANEL_S[37];
            _local_1 = this._tbnEnabled;
            _local_1 = Language.CHARACTORINFOPANEL_U[12];
            _local_1 = Language.CHARACTORINFOPANEL_U[13];
            _local_1 = this._tbnEnabled;
            _local_1 = Language.CHARACTORINFOPANEL_U[0];
            _local_1 = this._tbnEnabled;
            _local_1 = Language.CHARACTORINFOPANEL_U[1];
            _local_1 = Language.CHARACTORINFOPANEL_U[2];
            _local_1 = this._tbnEnabled;
            _local_1 = Language.CHARACTORINFOPANEL_U[3];
        }

        [Bindable(event="propertyChange")]
        public function get equip2():ItemSlotChaInfo
        {
            return (this._1295475198equip2);
        }

        public function __Btn1_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get equip4():ItemSlotChaInfo
        {
            return (this._1295475196equip4);
        }

        public function onData(_arg_1:Object):void
        {
            _obj = _arg_1;
            if (_obj)
            {
                initView();
                visible = true;
                tab.selectedIndex = 0;
                tbn1.selected = true;
                tbn2.selected = false;
            }
            else
            {
                visible = false;
            };
        }

        private function set _tbnEnabled(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1516339456_tbnEnabled;
            if (_local_2 !== _arg_1)
            {
                this._1516339456_tbnEnabled = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_tbnEnabled", _local_2, _arg_1));
            };
        }

        public function set equip7(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1295475193equip7;
            if (_local_2 !== _arg_1)
            {
                this._1295475193equip7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnAchieveWatching():BasicGlowButton
        {
            return (this._344051672btnAchieveWatching);
        }

        private function infoClear():void
        {
            if (!initialized)
            {
                return;
            };
            infoName.text = "";
            infoLevel.text = "";
            infoClass.text = "";
            var _local_1:int = GamePredef.SLOT_SID_EQUIP[0];
            while (_local_1 <= 14)
            {
                this[("equip" + _local_1)].clean();
                _local_1++;
            };
            this[("equip" + GamePredef.SLOT_SID_DRESS)].clean();
            this[("equip" + GamePredef.SLOT_SID_WING)].clean();
        }

        public function set newNameLB(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._756552959newNameLB;
            if (_local_2 !== _arg_1)
            {
                this._756552959newNameLB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newNameLB", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnTrack():Button
        {
            return (this._2098207823btnTrack);
        }

        [Bindable(event="propertyChange")]
        public function get equip12():ItemSlotChaInfo
        {
            return (this._1505025455equip12);
        }

        [Bindable(event="propertyChange")]
        public function get equip13():ItemSlotChaInfo
        {
            return (this._1505025454equip13);
        }

        [Bindable(event="propertyChange")]
        public function get equip14():ItemSlotChaInfo
        {
            return (this._1505025453equip14);
        }

        public function set islot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1179373782islot1;
            if (_local_2 !== _arg_1)
            {
                this._1179373782islot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "islot1", _local_2, _arg_1));
            };
        }

        public function onShowChaInfo(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:Number;
            var _local_6:String;
            var _local_7:Object;
            var _local_8:int;
            var _local_9:int;
            if (_arg_1)
            {
                equipActiveList = _arg_1.equipActiveList;
                newNameLB.toolTip = ("cid:" + _arg_1.data.id);
                infoName.text = _arg_1.data.name;
                _local_2 = _core.basic.expToLevel(_arg_1.data.exp);
                infoLevel.text = _local_2.toString();
                infoClass.text = (GamePredef.CLASS_LEVEL[_arg_1.data.cl] + _core.getClassName(_arg_1.data.classId));
                infoTitle.text = "";
                if (_arg_1.data.t > 0)
                {
                    _local_7 = _core.data.getGameData(GamePredef.TBL_TITLE, _arg_1.data.t);
                    if (_local_7)
                    {
                        infoTitle.text = _local_7.n;
                    };
                };
                _local_3 = ((int(_arg_1.data.honor) >= 0) ? _arg_1.data.honor : 0);
                pkTxt.text = _local_3.toString();
                _local_4 = ((int(_arg_1.data.chival) >= 0) ? _arg_1.data.chival : 0);
                chivalTxt.text = _local_4.toString();
                tb_chival.toolTip = ((_core.basic.expToLevel(_arg_1.data.exp) < 40) ? Language.CHARACTORINFOPANEL_S[42] : Language.CHARACTORINFOPANEL_S[43]);
                pop.text = _arg_1.data.pop;
                infoGuild.text = _arg_1.guild;
                if (infoGuild.text == Language.CHARACTORINFOPANEL_S[39])
                {
                    this.BtnInviteGuild.enabled = true;
                }
                else
                {
                    this.BtnInviteGuild.enabled = false;
                };
                gmLabel.visible = (_arg_1.data.gmLevel > 0);
                wanted.visible = (_arg_1.data.honor < 0);
                _local_5 = (Math.floor(_arg_1.data.imgCode) + 200000);
                charImg.source = ResManager.getIconUrl(_local_5);
                charPmImg.visible = false;
                charNGImg.visible = false;
                if (((_arg_1.data.expRe) && (_arg_1.data.expRe > 0)))
                {
                    _local_8 = _core.basic.expReToLevelRe(_arg_1.data.expRe);
                    this.rbImg.visible = true;
                    this.rbImg.source = ResManager[("ICON_REBIRTH_" + _arg_1.data.classId)];
                    this.rbImg.toolTip = (this.rbImg.toolTip = ((((((((((Language.PLAYER_RELEVEL_TITLE_U[_local_8]) ? Language.PLAYER_RELEVEL_TITLE_U[_local_8] : Language.PLAYER_RELEVEL_TITLE_U[Language.PLAYER_RELEVEL_TITLE_U.length]) + "\n") + Language.GAMEPREDEF_S[53]) + ":") + _arg_1.data.expRe) + "/") + GamePredef.PLAYER_RELEVEL_EXP[_local_8]) + "\n") + Language.CHARACTORPANEL_S[83]));
                }
                else
                {
                    this.rbImg.visible = false;
                };
                if (((_arg_1.pmLevel) && (Number(_arg_1.pmLevel) > 0)))
                {
                    if (ResManager[("PM_ZUAN" + _arg_1.pmLevel)])
                    {
                        charPmImg.source = ResManager[("PM_ZUAN" + _arg_1.pmLevel)];
                        charPmImg.visible = true;
                    };
                };
                if (int(_arg_1.newGrade) > 0)
                {
                    if (ResManager[("NEW_GRADE" + int(_arg_1.newGrade))])
                    {
                        charNGImg.visible = true;
                        charNGImg.source = ResManager[("NEW_GRADE" + int(_arg_1.newGrade))];
                        charNGImg.toolTip = ((newGradeLevel[_arg_1.newGrade] + "的") + _core.getClassName(_arg_1.data.classId));
                    }
                    else
                    {
                        charNGImg.visible = false;
                        charNGImg.toolTip = "";
                        charNGImg.source = "";
                    };
                }
                else
                {
                    charNGImg.visible = false;
                    charNGImg.toolTip = "";
                    charNGImg.source = "";
                };
                if (_arg_1.equiptList)
                {
                    _local_9 = GamePredef.SLOT_SID_EQUIP[0];
                    while (_local_9 <= GamePredef.SLOT_SID_EQUIP[1])
                    {
                        if (((_arg_1.equiptList[_local_9]) && (((_local_9 <= 14) || (_local_9 == GamePredef.SLOT_SID_DRESS)) || (_local_9 == GamePredef.SLOT_SID_WING))))
                        {
                            this[("equip" + _local_9)].type = _arg_1.equiptList[_local_9].type;
                            this[("equip" + _local_9)].giid = _arg_1.equiptList[_local_9].itemId;
                            this[("equip" + _local_9)].stackNum = _arg_1.equiptList[_local_9].stackNum;
                        };
                        _local_9++;
                    };
                };
                _arg_1.ee = Number(_arg_1.ee);
                _arg_1.en = Number(_arg_1.en);
                _arg_1.ef = Boolean(_arg_1.ef);
                mc.gotoAndStop((1 + _arg_1.ee));
                maskMc.gotoAndStop((1 + _arg_1.en));
                maxMc.visible = _arg_1.ef;
                elemUIC.toolTip = (Language.CHARACTORINFOPANEL_S[3] + GamePredef.ELEMENT_INFO[_arg_1.ee]);
                _local_6 = Language.CHARACTORINFOPANEL_S[4];
                if (_arg_1.en < 4)
                {
                    _local_6 = Language.CHARACTORINFOPANEL_S[4];
                }
                else
                {
                    if (((_arg_1.en >= 4) && (_arg_1.en < 9)))
                    {
                        _local_6 = Language.CHARACTORINFOPANEL_S[5];
                    }
                    else
                    {
                        if (((_arg_1.en >= 9) && (_arg_1.en < 13)))
                        {
                            _local_6 = Language.CHARACTORINFOPANEL_S[6];
                        };
                    };
                };
                if (_arg_1.ef)
                {
                    _local_6 = Language.CHARACTORINFOPANEL_S[44];
                };
                elemUIC.toolTip = (elemUIC.toolTip + (Language.CHARACTORINFOPANEL_S[7] + _local_6));
                if (((_arg_1.makerActive) && (_arg_1.qualityType > 0)))
                {
                    makerActiveInfo.text = (Language.CHARACTORPANEL_S[25] + "\n");
                    if (_arg_1.qualityType == 10)
                    {
                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "10%\n"));
                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "2%\n"));
                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "2%"));
                    }
                    else
                    {
                        if (_arg_1.qualityType == 11)
                        {
                            makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "10%\n"));
                            makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "5%\n"));
                            makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "5%"));
                        }
                        else
                        {
                            if (_arg_1.qualityType == 15)
                            {
                                makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "16%\n"));
                                makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "8%\n"));
                                makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "8%"));
                            }
                            else
                            {
                                if (_arg_1.qualityType == 16)
                                {
                                    makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "30%\n"));
                                    makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "15%\n"));
                                    makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "15%"));
                                }
                                else
                                {
                                    if (_arg_1.qualityType == 20)
                                    {
                                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[348] + "40%\n"));
                                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[349] + "20%\n"));
                                        makerActiveInfo.text = (makerActiveInfo.text + (Language.GAMEPREDEF_S[350] + "20%"));
                                    };
                                };
                            };
                        };
                    };
                    makerActiveInfo.visible = true;
                }
                else
                {
                    makerActiveInfo.visible = false;
                };
                if (_arg_1.starType > 0)
                {
                    starActiveInfo.text = (Language.CHARACTORPANEL_S[27] + "\n");
                    if (_arg_1.starType == 8)
                    {
                        starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[348] + "10%\n"));
                        starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[349] + "5%\n"));
                        starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[350] + "5%"));
                    }
                    else
                    {
                        if (_arg_1.starType == 9)
                        {
                            starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[348] + "20%\n"));
                            starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[349] + "10%\n"));
                            starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[350] + "10%"));
                        }
                        else
                        {
                            if (_arg_1.starType == 10)
                            {
                                starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[348] + "30%\n"));
                                starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[349] + "15%\n"));
                                starActiveInfo.text = (starActiveInfo.text + (Language.GAMEPREDEF_S[350] + "15%"));
                            };
                        };
                    };
                    starActiveInfo.visible = true;
                }
                else
                {
                    starActiveInfo.visible = false;
                };
            }
            else
            {
                visible = false;
                _core.sysMidNote(Language.CHARACTORINFOPANEL_S[8]);
            };
        }

        public function set btnAchieveWatching(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._344051672btnAchieveWatching;
            if (_local_2 !== _arg_1)
            {
                this._344051672btnAchieveWatching = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAchieveWatching", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get elemUIC():UIComponent
        {
            return (this._1662853568elemUIC);
        }

        [Bindable(event="propertyChange")]
        public function get infoName():RoundedLabel
        {
            return (this._177753177infoName);
        }

        [Bindable(event="propertyChange")]
        public function get equip11():ItemSlotChaInfo
        {
            return (this._1505025456equip11);
        }

        public function set islot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1179373779islot4;
            if (_local_2 !== _arg_1)
            {
                this._1179373779islot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "islot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoTitle():RoundedLabel
        {
            return (this._1221167690infoTitle);
        }

        public function set chivalTxt(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._189045043chivalTxt;
            if (_local_2 !== _arg_1)
            {
                this._189045043chivalTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chivalTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get equip10():ItemSlotChaInfo
        {
            return (this._1505025457equip10);
        }

        [Bindable(event="propertyChange")]
        public function get pop():RoundedLabel
        {
            return (this._111185pop);
        }

        public function set islot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1179373778islot5;
            if (_local_2 !== _arg_1)
            {
                this._1179373778islot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "islot5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get islotMain():ItemSlot
        {
            return (this._1890927552islotMain);
        }

        [Bindable(event="propertyChange")]
        public function get equip21():ItemSlotChaInfo
        {
            return (this._1505025425equip21);
        }

        public function refreshLater():void
        {
            setTimeout(initView, 500);
        }

        public function set islot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1179373781islot2;
            if (_local_2 !== _arg_1)
            {
                this._1179373781islot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "islot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tbn2():BasicGlowButton
        {
            return (this._3553394tbn2);
        }

        public function set islot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1179373780islot3;
            if (_local_2 !== _arg_1)
            {
                this._1179373780islot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "islot3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get equip22():ItemSlotChaInfo
        {
            return (this._1505025424equip22);
        }

        [Bindable(event="propertyChange")]
        public function get pkTxt():RoundedLabel
        {
            return (this._106706549pkTxt);
        }

        public function set makerActiveInfo(_arg_1:TextArea):void
        {
            var _local_2:Object = this._808946632makerActiveInfo;
            if (_local_2 !== _arg_1)
            {
                this._808946632makerActiveInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makerActiveInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tbn1():BasicGlowButton
        {
            return (this._3553393tbn1);
        }

        [Bindable(event="propertyChange")]
        public function get makerActiveInfo():TextArea
        {
            return (this._808946632makerActiveInfo);
        }

        [Bindable(event="propertyChange")]
        public function get charImg():Image
        {
            return (this._739034253charImg);
        }

        [Bindable(event="propertyChange")]
        public function get BtnInviteGuild():BasicDelayButton
        {
            return (this._1520845170BtnInviteGuild);
        }

        public function __BtnInviteGuild_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __btnAchieveWatching_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set infoTitle(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1221167690infoTitle;
            if (_local_2 !== _arg_1)
            {
                this._1221167690infoTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoTitle", _local_2, _arg_1));
            };
        }

        public function __btnSeek_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set btnTrack(_arg_1:Button):void
        {
            var _local_2:Object = this._2098207823btnTrack;
            if (_local_2 !== _arg_1)
            {
                this._2098207823btnTrack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnTrack", _local_2, _arg_1));
            };
        }

        private function useSeek():void
        {
            _core.remote.useSeek(_obj.data.name);
        }

        public function __Btn3_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function clickHandler(_arg_1:Event):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:*;
            var _local_10:String;
            var _local_11:*;
            var _local_12:InputPanel;
            var _local_13:InputPanel;
            var _local_2:Button = Button(_arg_1.currentTarget);
            switch (_local_2.id)
            {
                case "BtnInviteGuild":
                    _local_3 = int(infoLevel.text);
                    if (_core.player.guild == null)
                    {
                        Alert.show(Language.INVITEGUILD_S[0], Language.INVITEGUILD_S[1], Alert.OK);
                    }
                    else
                    {
                        if (_local_3 < 30)
                        {
                            Alert.show(Language.CHARACTORINFOPANEL_U[11], "", Alert.OK);
                        }
                        else
                        {
                            _local_9 = _obj.data.name;
                            _local_10 = LinkEncode.encode(GamePredef.TBL_CHARACTOR, _cid, _local_9);
                            _local_11 = Language.INVITEGUILD_S[2].replace("{targetPlayer}", _local_10);
                            _core.sysMidNote(_local_11);
                            _core.remote.inviteToMyGuild(_cid);
                        };
                    };
                    return;
                case "btnAchieveWatching":
                    _local_4 = _core.view.getUI(ViewManager.PANEL_ACHIEVE_WATCHING);
                    if (_local_4)
                    {
                        _local_4.updateViewByData(_obj.achLog, {}, _obj.totalAchPoint, _obj.data.name);
                    };
                    return;
                case "Btn3":
                    _core.remote.groupInvite(_cid);
                    return;
                case "Btn2":
                    ChatPanelUtil.createChatPanel(_cid);
                    return;
                case "Btn1":
                    _core.addFriend(_obj.data.name);
                    return;
                case "btnAddPop":
                    _local_5 = _core.hasFlowerNum();
                    if (_local_5 > 0)
                    {
                        _local_12 = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
                        _local_12.showInputNum(Language.CHARACTORINFOPANEL_S[9], "", useFlower, 1, 1, _local_5);
                    }
                    else
                    {
                        _core.sysMidNote(Language.CHARACTORINFOPANEL_S[10]);
                    };
                    return;
                case "btnDelPop":
                    _local_6 = _core.hasEggNum();
                    if (_local_6 > 0)
                    {
                        _local_13 = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
                        _local_13.showInputNum(Language.CHARACTORINFOPANEL_S[11], "", useEgg, 1, 1, _local_6);
                    }
                    else
                    {
                        _core.sysMidNote(Language.CHARACTORINFOPANEL_S[12]);
                    };
                    return;
                case "btnSeek":
                    _local_7 = _core.hasSeekNum();
                    if (_local_7 > 0)
                    {
                        useSeek();
                    }
                    else
                    {
                        _core.sysMidNote(Language.CHARACTORINFOPANEL_S[13]);
                    };
                    return;
                case "btnTrack":
                    _local_8 = _core.hasTrackNum();
                    if (_local_8 > 0)
                    {
                        useTrack();
                    }
                    else
                    {
                        _core.sysMidNote(Language.CHARACTORINFOPANEL_S[14]);
                    };
                    return;
                case "stoneSealWatching":
                    _local_4 = _core.view.getUI(ViewManager.PANEL_STONE_SEAL);
                    if ((((!(_local_4)) || (!(_obj))) || (!(_obj.sealStone))))
                    {
                        _core.sysMidNote(Language.CHARACTORINFOPANEL_S[55]);
                        return;
                    };
                    _local_4.onGetWatchData(_obj.sealStone);
                    return;
            };
        }

        public function set equip13(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1505025454equip13;
            if (_local_2 !== _arg_1)
            {
                this._1505025454equip13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip13", _local_2, _arg_1));
            };
        }

        public function set equip10(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1505025457equip10;
            if (_local_2 !== _arg_1)
            {
                this._1505025457equip10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip10", _local_2, _arg_1));
            };
        }

        public function set equip11(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1505025456equip11;
            if (_local_2 !== _arg_1)
            {
                this._1505025456equip11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip11", _local_2, _arg_1));
            };
        }

        public function set equip12(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1505025455equip12;
            if (_local_2 !== _arg_1)
            {
                this._1505025455equip12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip12", _local_2, _arg_1));
            };
        }

        public function set elemUIC(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._1662853568elemUIC;
            if (_local_2 !== _arg_1)
            {
                this._1662853568elemUIC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elemUIC", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wanted():Label
        {
            return (this._795125073wanted);
        }

        public function set pop(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._111185pop;
            if (_local_2 !== _arg_1)
            {
                this._111185pop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pop", _local_2, _arg_1));
            };
        }

        public function set infoName(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._177753177infoName;
            if (_local_2 !== _arg_1)
            {
                this._177753177infoName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoName", _local_2, _arg_1));
            };
        }

        public function set equip14(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1505025453equip14;
            if (_local_2 !== _arg_1)
            {
                this._1505025453equip14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip14", _local_2, _arg_1));
            };
        }

        public function set islotMain(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1890927552islotMain;
            if (_local_2 !== _arg_1)
            {
                this._1890927552islotMain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "islotMain", _local_2, _arg_1));
            };
        }

        private function useFlower(_arg_1:int):void
        {
            if (_arg_1 <= 0)
            {
                return;
            };
            if (_core.hasFlowerNum() >= _arg_1)
            {
                _core.remote.addPopNum(_obj.data.name, _arg_1);
                _obj.data.pop = (Number(_obj.data.pop) + _arg_1);
                onShowChaInfo(_obj);
            }
            else
            {
                _core.sysMidNote(Language.CHARACTORINFOPANEL_S[16]);
            };
        }

        public function set infoClass(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1205539178infoClass;
            if (_local_2 !== _arg_1)
            {
                this._1205539178infoClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoClass", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get starActiveInfo():TextArea
        {
            return (this._1295447866starActiveInfo);
        }

        [Bindable(event="propertyChange")]
        public function get charPmImg():Image
        {
            return (this._1548752592charPmImg);
        }

        public function set btnAddPop(_arg_1:Button):void
        {
            var _local_2:Object = this._63121260btnAddPop;
            if (_local_2 !== _arg_1)
            {
                this._63121260btnAddPop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAddPop", _local_2, _arg_1));
            };
        }

        public function set equip21(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1505025425equip21;
            if (_local_2 !== _arg_1)
            {
                this._1505025425equip21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip21", _local_2, _arg_1));
            };
        }

        public function set equip22(_arg_1:ItemSlotChaInfo):void
        {
            var _local_2:Object = this._1505025424equip22;
            if (_local_2 !== _arg_1)
            {
                this._1505025424equip22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equip22", _local_2, _arg_1));
            };
        }

        public function set tbn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3553393tbn1;
            if (_local_2 !== _arg_1)
            {
                this._3553393tbn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tbn1", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (!visible)
            {
                infoClear();
            };
        }

        public function set rbImg(_arg_1:Image):void
        {
            var _local_2:Object = this._108274547rbImg;
            if (_local_2 !== _arg_1)
            {
                this._108274547rbImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rbImg", _local_2, _arg_1));
            };
        }

        public function set Btn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2081141Btn1;
            if (_local_2 !== _arg_1)
            {
                this._2081141Btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Btn1", _local_2, _arg_1));
            };
        }

        public function set Btn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2081142Btn2;
            if (_local_2 !== _arg_1)
            {
                this._2081142Btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Btn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stoneSealWatching():BasicGlowButton
        {
            return (this._224866005stoneSealWatching);
        }

        public function set Btn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2081143Btn3;
            if (_local_2 !== _arg_1)
            {
                this._2081143Btn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Btn3", _local_2, _arg_1));
            };
        }

        public function __btnDelPop_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set infoLevel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1213662070infoLevel;
            if (_local_2 !== _arg_1)
            {
                this._1213662070infoLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnSeek():Button
        {
            return (this._206189300btnSeek);
        }

        [Bindable(event="propertyChange")]
        public function get tb_chival():BasicTxtButton
        {
            return (this._1132481262tb_chival);
        }

        public function set pkTxt(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._106706549pkTxt;
            if (_local_2 !== _arg_1)
            {
                this._106706549pkTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pkTxt", _local_2, _arg_1));
            };
        }

        private function useEgg(_arg_1:int):void
        {
            if (_arg_1 <= 0)
            {
                return;
            };
            if (_core.hasEggNum() >= _arg_1)
            {
                _core.remote.delPopNum(_obj.data.name, _arg_1);
                _obj.data.pop = (_obj.data.pop - _arg_1);
                onShowChaInfo(_obj);
            }
            else
            {
                _core.sysMidNote(Language.CHARACTORINFOPANEL_S[15]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get newNameLB():BasicTxtButton
        {
            return (this._756552959newNameLB);
        }

        public function set tbn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3553394tbn2;
            if (_local_2 !== _arg_1)
            {
                this._3553394tbn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tbn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _tbnEnabled():Boolean
        {
            return (this._1516339456_tbnEnabled);
        }

        public function __btnAddPop_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function updateGodEquipt():void
        {
            if (_obj.equiptList[15] != null)
            {
                islotMain.giid = _obj.equiptList[15].itemId;
                islotMain.type = _obj.equiptList[15].type;
                islotMain.stackNum = _obj.equiptList[15].stackNum;
                islotMain.slotData = _obj.equiptList[15];
            }
            else
            {
                islotMain.clean();
            };
            var _local_1:int = 1;
            var _local_2:int = 16;
            while (_local_2 < 21)
            {
                if (_obj.equiptList[_local_2] != null)
                {
                    this[("islot" + _local_1)].giid = _obj.equiptList[_local_2].itemId;
                    this[("islot" + _local_1)].type = _obj.equiptList[_local_2].type;
                    this[("islot" + _local_1)].stackNum = _obj.equiptList[_local_2].stackNum;
                    this[("islot" + _local_1)].slotData = _obj.equiptList[_local_2];
                }
                else
                {
                    this[("islot" + _local_1)].clean();
                };
                _local_1++;
                _local_2++;
            };
        }

        private function addElement():void
        {
            if (!mc)
            {
                mc = new ((element as Class))();
                elemUIC.addChild(mc);
                maskMc = MovieClip(mc.getChildByName("maskMC"));
                maxMc = MovieClip(mc.getChildByName("maxMc"));
                mc.gotoAndStop(1);
                maskMc.gotoAndStop(1);
                maxMc.visible = false;
            };
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

        [Bindable(event="propertyChange")]
        public function get islot1():ItemSlot
        {
            return (this._1179373782islot1);
        }

        public function set BtnInviteGuild(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1520845170BtnInviteGuild;
            if (_local_2 !== _arg_1)
            {
                this._1520845170BtnInviteGuild = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "BtnInviteGuild", _local_2, _arg_1));
            };
        }

        private function _CharactorInfoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_CharactorInfoPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_Canvas1.label = _arg_1;
            }, "_CharactorInfoPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                newNameLB.label = _arg_1;
            }, "newNameLB.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTxtButton2.label = _arg_1;
            }, "_CharactorInfoPanel_BasicTxtButton2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTxtButton3.label = _arg_1;
            }, "_CharactorInfoPanel_BasicTxtButton3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTxtButton4.label = _arg_1;
            }, "_CharactorInfoPanel_BasicTxtButton4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTxtButton5.label = _arg_1;
            }, "_CharactorInfoPanel_BasicTxtButton5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTxtButton6.label = _arg_1;
            }, "_CharactorInfoPanel_BasicTxtButton6.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTxtButton6.toolTip = _arg_1;
            }, "_CharactorInfoPanel_BasicTxtButton6.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTxtButton7.label = _arg_1;
            }, "_CharactorInfoPanel_BasicTxtButton7.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_BasicTxtButton7.toolTip = _arg_1;
            }, "_CharactorInfoPanel_BasicTxtButton7.toolTip");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tb_chival.label = _arg_1;
            }, "tb_chival.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tbn1.label = _arg_1;
            }, "tbn1.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tbn2.label = _arg_1;
            }, "tbn2.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_Canvas3.label = _arg_1;
            }, "_CharactorInfoPanel_Canvas3.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip1.text = _arg_1;
            }, "equip1.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip2.text = _arg_1;
            }, "equip2.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip3.text = _arg_1;
            }, "equip3.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip4.text = _arg_1;
            }, "equip4.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip5.text = _arg_1;
            }, "equip5.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip6.text = _arg_1;
            }, "equip6.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip7.text = _arg_1;
            }, "equip7.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip8.text = _arg_1;
            }, "equip8.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip9.text = _arg_1;
            }, "equip9.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip10.text = _arg_1;
            }, "equip10.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip11.text = _arg_1;
            }, "equip11.text");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip12.text = _arg_1;
            }, "equip12.text");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip13.text = _arg_1;
            }, "equip13.text");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip14.text = _arg_1;
            }, "equip14.text");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip21.text = _arg_1;
            }, "equip21.text");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                equip22.text = _arg_1;
            }, "equip22.text");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makerActiveInfo.toolTip = _arg_1;
            }, "makerActiveInfo.toolTip");
            result[31] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                makerActiveInfo.filters = _arg_1;
            }, "makerActiveInfo.filters");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                starActiveInfo.toolTip = _arg_1;
            }, "starActiveInfo.toolTip");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                starActiveInfo.filters = _arg_1;
            }, "starActiveInfo.filters");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CharactorInfoPanel_Canvas4.label = _arg_1;
            }, "_CharactorInfoPanel_Canvas4.label");
            result[35] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_MAGIC_WEAPON);
            }, function (_arg_1:Object):void
            {
                _CharactorInfoPanel_Image1.source = _arg_1;
            }, "_CharactorInfoPanel_Image1.source");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                islotMain.text = _arg_1;
            }, "islotMain.text");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                islotMain.acceptType = _arg_1;
            }, "islotMain.acceptType");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.CHARACTORPANEL_U[34] + "1");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                islot1.text = _arg_1;
            }, "islot1.text");
            result[39] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                islot1.acceptType = _arg_1;
            }, "islot1.acceptType");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.CHARACTORPANEL_U[34] + "2");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                islot2.text = _arg_1;
            }, "islot2.text");
            result[41] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                islot2.acceptType = _arg_1;
            }, "islot2.acceptType");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.CHARACTORPANEL_U[34] + "3");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                islot3.text = _arg_1;
            }, "islot3.text");
            result[43] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                islot3.acceptType = _arg_1;
            }, "islot3.acceptType");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.CHARACTORPANEL_U[34] + "4");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                islot4.text = _arg_1;
            }, "islot4.text");
            result[45] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                islot4.acceptType = _arg_1;
            }, "islot4.acceptType");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.CHARACTORPANEL_U[34] + "5");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                islot5.text = _arg_1;
            }, "islot5.text");
            result[47] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_EQUIPT_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                islot5.acceptType = _arg_1;
            }, "islot5.acceptType");
            result[48] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._tbnEnabled);
            }, function (_arg_1:Boolean):void
            {
                _CharactorInfoPanel_Canvas5.visible = _arg_1;
            }, "_CharactorInfoPanel_Canvas5.visible");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAddPop.toolTip = _arg_1;
            }, "btnAddPop.toolTip");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnDelPop.toolTip = _arg_1;
            }, "btnDelPop.toolTip");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnSeek.toolTip = _arg_1;
            }, "btnSeek.toolTip");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnTrack.toolTip = _arg_1;
            }, "btnTrack.toolTip");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wanted.toolTip = _arg_1;
            }, "wanted.toolTip");
            result[54] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._tbnEnabled);
            }, function (_arg_1:Boolean):void
            {
                btnAchieveWatching.enabled = _arg_1;
            }, "btnAchieveWatching.enabled");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAchieveWatching.label = _arg_1;
            }, "btnAchieveWatching.label");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                stoneSealWatching.label = _arg_1;
            }, "stoneSealWatching.label");
            result[57] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._tbnEnabled);
            }, function (_arg_1:Boolean):void
            {
                Btn1.enabled = _arg_1;
            }, "Btn1.enabled");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                Btn1.label = _arg_1;
            }, "Btn1.label");
            result[59] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._tbnEnabled);
            }, function (_arg_1:Boolean):void
            {
                BtnInviteGuild.enabled = _arg_1;
            }, "BtnInviteGuild.enabled");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                BtnInviteGuild.label = _arg_1;
            }, "BtnInviteGuild.label");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                Btn2.label = _arg_1;
            }, "Btn2.label");
            result[62] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._tbnEnabled);
            }, function (_arg_1:Boolean):void
            {
                Btn3.enabled = _arg_1;
            }, "Btn3.enabled");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                Btn3.label = _arg_1;
            }, "Btn3.label");
            result[64] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get islot5():ItemSlot
        {
            return (this._1179373778islot5);
        }

        public function set tab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._114581tab;
            if (_local_2 !== _arg_1)
            {
                this._114581tab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get islot2():ItemSlot
        {
            return (this._1179373781islot2);
        }

        [Bindable(event="propertyChange")]
        public function get islot4():ItemSlot
        {
            return (this._1179373779islot4);
        }

        [Bindable(event="propertyChange")]
        public function get chivalTxt():RoundedLabel
        {
            return (this._189045043chivalTxt);
        }

        [Bindable(event="propertyChange")]
        public function get islot3():ItemSlot
        {
            return (this._1179373780islot3);
        }

        private function tabBtnClick(_arg_1:int):void
        {
            tab.selectedIndex = _arg_1;
            this.tbn1.selected = false;
            this.tbn2.selected = false;
            this[("tbn" + (_arg_1 + 1))].selected = true;
        }

        public function enableUI():void
        {
            this._tbnEnabled = true;
        }

        public function __tbn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        public function __Btn2_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function useTransport(_arg_1:int):void
        {
            _core.remote.useTransport(_arg_1, false);
        }

        public function set wanted(_arg_1:Label):void
        {
            var _local_2:Object = this._795125073wanted;
            if (_local_2 !== _arg_1)
            {
                this._795125073wanted = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wanted", _local_2, _arg_1));
            };
        }

        public function set charNGImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1545773492charNGImg;
            if (_local_2 !== _arg_1)
            {
                this._1545773492charNGImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charNGImg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoClass():RoundedLabel
        {
            return (this._1205539178infoClass);
        }

        public function set gmLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._117350830gmLabel;
            if (_local_2 !== _arg_1)
            {
                this._117350830gmLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gmLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnAddPop():Button
        {
            return (this._63121260btnAddPop);
        }

        [Bindable(event="propertyChange")]
        public function get rbImg():Image
        {
            return (this._108274547rbImg);
        }

        [Bindable(event="propertyChange")]
        public function get Btn1():BasicGlowButton
        {
            return (this._2081141Btn1);
        }

        [Bindable(event="propertyChange")]
        public function get Btn2():BasicGlowButton
        {
            return (this._2081142Btn2);
        }

        [Bindable(event="propertyChange")]
        public function get Btn3():BasicGlowButton
        {
            return (this._2081143Btn3);
        }

        public function disableUI():void
        {
            this._tbnEnabled = false;
        }

        [Bindable(event="propertyChange")]
        public function get infoLevel():RoundedLabel
        {
            return (this._1213662070infoLevel);
        }

        public function set btnDelPop(_arg_1:Button):void
        {
            var _local_2:Object = this._150170562btnDelPop;
            if (_local_2 !== _arg_1)
            {
                this._150170562btnDelPop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnDelPop", _local_2, _arg_1));
            };
        }

        public function __btnTrack_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set starActiveInfo(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1295447866starActiveInfo;
            if (_local_2 !== _arg_1)
            {
                this._1295447866starActiveInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starActiveInfo", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:CharactorInfoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CharactorInfoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CharactorInfoPanelWatcherSetupUtil");
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

        public function set charPmImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1548752592charPmImg;
            if (_local_2 !== _arg_1)
            {
                this._1548752592charPmImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charPmImg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        public function set stoneSealWatching(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._224866005stoneSealWatching;
            if (_local_2 !== _arg_1)
            {
                this._224866005stoneSealWatching = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneSealWatching", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get gmLabel():Label
        {
            return (this._117350830gmLabel);
        }

        public function showChaInfo(_arg_1:Number):void
        {
            _cid = _arg_1;
            if (_cid > 0)
            {
                _core.remote.call("showChaInfo", new Responder(onData), _cid);
            };
        }

        [Bindable(event="propertyChange")]
        public function get charNGImg():Image
        {
            return (this._1545773492charNGImg);
        }

        public function __stoneSealWatching_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnDelPop():Button
        {
            return (this._150170562btnDelPop);
        }

        public function set infoGuild(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1209508837infoGuild;
            if (_local_2 !== _arg_1)
            {
                this._1209508837infoGuild = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoGuild", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            addElement();
            onShowChaInfo(_obj);
        }

        public function __rbImg_click(_arg_1:MouseEvent):void
        {
            showRebirthDetail();
        }

        public function showRebirthDetail():void
        {
            var _local_4:Alert;
            var _local_1:* = (((("<font color='#fffa7a' >" + Language.CHARACTORPANEL_S[82]) + "      ") + Language.GAMEPREDEF_S[53]) + "</font>\n<font color='#ffffff'>");
            var _local_2:int = (Language.PLAYER_RELEVEL_TITLE_U.length - 1);
            while (_local_2 > 0)
            {
                _local_1 = (_local_1 + Language.PLAYER_RELEVEL_TITLE_U[_local_2]);
                if (Language.PLAYER_RELEVEL_TITLE_U[_local_2].toString().length > 2)
                {
                    _local_1 = (_local_1 + "    ");
                }
                else
                {
                    _local_1 = (_local_1 + "      ");
                };
                _local_1 = (_local_1 + (GamePredef.PLAYER_RELEVEL_EXP[(_local_2 - 1)] + "\n"));
                _local_2--;
            };
            _local_1 = (_local_1 + "</font>");
            var _local_3:String = _local_1.replace(/<font(.*?)>/g, "");
            _local_3 = _local_3.replace(/<\/font>/g, "");
            _local_4 = Alert.show(_local_3, "", Alert.YES, null, null);
            var _local_5:IUITextField = _local_4.mx_internal::alertForm.mx_internal::textField;
            _local_5.htmlText = _local_1;
            _local_5.filters = GamePredef.FILTER_TEXT1;
        }

        public function set btnSeek(_arg_1:Button):void
        {
            var _local_2:Object = this._206189300btnSeek;
            if (_local_2 !== _arg_1)
            {
                this._206189300btnSeek = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnSeek", _local_2, _arg_1));
            };
        }

        public function set tb_chival(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1132481262tb_chival;
            if (_local_2 !== _arg_1)
            {
                this._1132481262tb_chival = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tb_chival", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoGuild():RoundedLabel
        {
            return (this._1209508837infoGuild);
        }


    }
}//package com.qeedoo.ui.view.compDragable

