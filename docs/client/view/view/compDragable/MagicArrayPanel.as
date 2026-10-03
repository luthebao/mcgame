// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MagicArrayPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.ScrollTextArrCanvas;
    import flash.display.Loader;
    import mx.controls.LinkButton;
    import mx.controls.Image;
    import mx.controls.Alert;
    import flash.display.MovieClip;
    import mx.core.UIComponent;
    import flash.net.URLRequest;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.FlexEvent;
    import com.adobe.crypto.MD5;
    import mx.managers.PopUpManager;
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

    public class MagicArrayPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1835236411petMagicReduceHurtCanvas:Canvas;
        private var _3773vs:ViewStack;
        private var _1193955590idTab4:BasicGlowButton;
        private var _1302109880petPhyReduceHurtMyEleText:LinkTextArea;
        private var _893312071stExp5:ScrollTextArrCanvas;
        private var _1233972742phyReduceHurtGoldBtn:BasicGlowButton;
        private var _1706338480petPhyReduceHurtRankText:LinkTextArea;
        private var _1103319170woodReduceHurtElementBtn:BasicGlowButton;
        private var _1516359216petMagicReduceHurtReqEleText:LinkTextArea;
        public var loadLanse:Loader;
        private var _599959252petPhyReduceHurtEleText:LinkTextArea;
        private var _601952177petPhyReduceHurtCanvas:Canvas;
        private var _1989642392petMagicReduceHurtReqGoldText:LinkTextArea;
        private var _300338507goldReduceHurtElementBtn:BasicGlowButton;
        private var _1193955589idTab5:BasicGlowButton;
        private var MAX_LEVEL:* = 30;
        public var loadWood:Loader;
        private var _804680996phyReduceHurtEffText:LinkTextArea;
        public var loadFense:Loader;
        public var _MagicArrayPanel_LinkButton1:LinkButton;
        public var _MagicArrayPanel_LinkButton2:LinkButton;
        public var _MagicArrayPanel_LinkButton3:LinkButton;
        public var _MagicArrayPanel_LinkButton4:LinkButton;
        public var _MagicArrayPanel_LinkButton5:LinkButton;
        public var _MagicArrayPanel_LinkButton6:LinkButton;
        public var _MagicArrayPanel_LinkButton7:LinkButton;
        public var _MagicArrayPanel_LinkButton8:LinkButton;
        public var loadHuangse:Loader;
        private var _893312070stExp6:ScrollTextArrCanvas;
        private var _1803959407magicReduceHurtText:LinkTextArea;
        private var _978655064backGround6:Image;
        private var _138284824lightReduceHurtReqEleText:LinkTextArea;
        private var _1985222045magicReduceHurtMyEleText:LinkTextArea;
        private var _helpAlert:Alert;
        private var _1193955594idTab0:BasicGlowButton;
        private var _1556042287magicReduceHurtReqEleText:LinkTextArea;
        private var _978655067backGround3:Image;
        private var tabPageNum:int = 8;
        public var magicReduceHurtMC:MovieClip;
        private var _893312075stExp1:ScrollTextArrCanvas;
        private var _1040898045phyReduceHurtReqEleText:LinkTextArea;
        private var _1912296839darkReduceHurtEffText:LinkTextArea;
        private var _1193955588idTab6:BasicGlowButton;
        public var _MagicArrayPanel_LinkTextArea11:LinkTextArea;
        private var _2113589391phyReduceHurtRankText:LinkTextArea;
        private var _1787091320darkReduceHurtReqEleText:LinkTextArea;
        private var _246228835woodReduceHurtMyEleText:LinkTextArea;
        private var _893312069stExp7:ScrollTextArrCanvas;
        private var _1621003374goldReduceHurtMyGoldText:LinkTextArea;
        private var _1562233527phyReduceHurtMyEleText:LinkTextArea;
        public var _MagicArrayPanel_LinkTextArea20:LinkTextArea;
        public var loadDark:Loader;
        public var _MagicArrayPanel_LinkTextArea29:LinkTextArea;
        public var darkReduceHurtMC:MovieClip;
        private var _1079573529lightReduceHurtEffText:LinkTextArea;
        private var _2062404132lightReduceHurtMyGoldText:LinkTextArea;
        public var _MagicArrayPanel_LinkTextArea38:LinkTextArea;
        private var _681470533magicReduceHurtRankText:LinkTextArea;
        private var _1327457233petMagicReduceHurtEffText:LinkTextArea;
        private var _2078291939darkReduceHurtCanvas:Canvas;
        public var _MagicArrayPanel_LinkTextArea2:LinkTextArea;
        public var _MagicArrayPanel_LinkTextArea47:LinkTextArea;
        public var petMagicReduceHurtMC:MovieClip;
        public var _MagicArrayPanel_LinkTextArea56:LinkTextArea;
        private var _1824876009woodReduceHurtReqGoldText:LinkTextArea;
        private var _1566999580petPhyReduceHurtReqEleText:LinkTextArea;
        private var _2082795036petPhyReduceHurtText:LinkTextArea;
        private var _1193955593idTab1:BasicGlowButton;
        private var _678323210goldReduceHurtMyEleText:LinkTextArea;
        public var _MagicArrayPanel_LinkTextArea65:LinkTextArea;
        private var _893312074stExp2:ScrollTextArrCanvas;
        private var _1193955587idTab7:BasicGlowButton;
        private var _1587580880magicReduceHurtEffText:LinkTextArea;
        private var _11611768darkReduceHurtText:LinkTextArea;
        private var _2083148224darkReduceHurtEleText:LinkTextArea;
        private var _893312068stExp8:ScrollTextArrCanvas;
        private var _1270306245woodReduceHurtMyGoldText:LinkTextArea;
        private var _1100541743woodReduceHurtReqEleText:LinkTextArea;
        public var enhanceHurtMC:MovieClip;
        public var woodReduceHurtMC:MovieClip;
        private var _429107867petPhyReduceHurtEffText:LinkTextArea;
        private var _2059682592lightReduceHurtReqGoldText:LinkTextArea;
        private var _1954021976petPhyReduceHurtProcess:UIComponent;
        private var _978655062backGround8:Image;
        private var _1298263913woodReduceHurtEleText:LinkTextArea;
        public var loadGold:Loader;
        private var _1576618803goldReduceHurtCanvas:Canvas;
        private var _978655065backGround5:Image;
        private var _883221263phyReduceHurtMyGoldText:LinkTextArea;
        private var _1038120618phyReduceHurtElementBtn:BasicGlowButton;
        private var _279213533goldReduceHurtEffText:LinkTextArea;
        private var _978655068backGround2:Image;
        private var _1789868747darkReduceHurtElementBtn:BasicGlowButton;
        public var urlSwf:URLRequest;
        private var _62666771magicReduceHurtProcess:UIComponent;
        private var _1193955592idTab2:BasicGlowButton;
        private var _2052479974magicReduceHurtCanvas:Canvas;
        private var resCode:String = "3130090000059";
        private var _1234476311magicReduceHurtReqGoldText:LinkTextArea;
        private var _135247979phyReduceHurtReqGoldText:LinkTextArea;
        private var _445340580lightReduceHurtProcess:UIComponent;
        private var _197456876petMagicReduceHurtProcess:UIComponent;
        private var _893312073stExp3:ScrollTextArrCanvas;
        private var _407760092petMagicReduceHurtMyGoldText:LinkTextArea;
        private var _711196505petMagicReduceHurtGoldBtn:BasicGlowButton;
        private var _451072858magicReduceHurtGoldBtn:BasicGlowButton;
        private var _2120853712petMagicReduceHurtText:LinkTextArea;
        private var _440556356darkReduceHurtRankText:LinkTextArea;
        private var _303115934goldReduceHurtReqEleText:LinkTextArea;
        private var _1207572068petMagicReduceHurtRankText:LinkTextArea;
        public var phyReduceHurtMC:MovieClip;
        private var _344016719darkReduceHurtGoldBtn:BasicGlowButton;
        private var _1354581422goldReduceHurtRankText:LinkTextArea;
        private var _1564222153petPhyReduceHurtElementBtn:BasicGlowButton;
        private var _112861726goldReduceHurtText:LinkTextArea;
        private var _1977100025goldReduceHurtGoldBtn:BasicGlowButton;
        public var lightReduceHurtMC:MovieClip;
        private var _1558819714magicReduceHurtElementBtn:BasicGlowButton;
        private var _633829611phyReduceHurtEleText:LinkTextArea;
        public var _MagicArrayPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _141062251lightReduceHurtElementBtn:BasicGlowButton;
        private var _908722144lightReduceHurtEleText:LinkTextArea;
        private var _2113111836lightReduceHurtRankText:LinkTextArea;
        private var _959080209lightReduceHurtGoldBtn:BasicGlowButton;
        private var _664069096lightReduceHurtText:LinkTextArea;
        private var _357119728petPhyReduceHurtMyGoldText:LinkTextArea;
        private var _554014612lightReduceHurtMyEleText:LinkTextArea;
        private var _720233113phyReduceHurtProcess:UIComponent;
        private var _583756668darkReduceHurtMyGoldText:LinkTextArea;
        private var _1886650060darkReduceHurtMyEleText:LinkTextArea;
        public var petEnhanceHurtMC:MovieClip;
        public var loadLvse:Loader;
        private var _814805701magicReduceHurtMyGoldText:LinkTextArea;
        private var _1193955591idTab3:BasicGlowButton;
        private var _1127412528woodReduceHurtEffText:LinkTextArea;
        private var _1633076416darkReduceHurtReqGoldText:LinkTextArea;
        private var _893312072stExp4:ScrollTextArrCanvas;
        private var _1827205691petPhyReduceHurtGoldBtn:BasicGlowButton;
        private var _1128901030woodReduceHurtGoldBtn:BasicGlowButton;
        private var _1642640659woodReduceHurtProcess:UIComponent;
        private var _200671555phyReduceHurtText:LinkTextArea;
        public var goldReduceHurtMC:MovieClip;
        private var _1804127642goldReduceHurtProcess:UIComponent;
        private var _1878946491woodReduceHurtRankText:LinkTextArea;
        private var _735473620petPhyReduceHurtReqGoldText:LinkTextArea;
        private var _1289043331lightReduceHurtCanvas:Canvas;
        private var _1416729495magicReduceHurtEleText:LinkTextArea;
        private var _417752721woodReduceHurtText:LinkTextArea;
        private var _1439023652petMagicReduceHurtMyEleText:LinkTextArea;
        private var _978655063backGround7:Image;
        private var _1156605848petMagicReduceHurtEleText:LinkTextArea;
        private var _857756348darkReduceHurtProcess:UIComponent;
        public var loadLight:Loader;
        private var _978655066backGround4:Image;
        private var _1513581789petMagicReduceHurtElementBtn:BasicGlowButton;
        private var _450064918goldReduceHurtEleText:LinkTextArea;
        private var _1261160982goldReduceHurtReqGoldText:LinkTextArea;
        private var _978655069backGround1:Image;
        public var petPhyReduceHurtMC:MovieClip;
        private var _918846482phyReduceHurtCanvas:Canvas;
        private var _1775878426woodReduceHurtCanvas:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":587,
                    "height":524,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MagicArrayPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 0;
                                        this.left = "15";
                                        this.top = "40";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HTabWrapper",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTab0",
                                                "events":{"click":"__idTab0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab",
                                                        "selected":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTab1",
                                                "events":{"click":"__idTab1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTab2",
                                                "events":{"click":"__idTab2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTab3",
                                                "events":{"click":"__idTab3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTab4",
                                                "events":{"click":"__idTab4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTab5",
                                                "events":{"click":"__idTab5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTab6",
                                                "events":{"click":"__idTab6_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTab7",
                                                "events":{"click":"__idTab7_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vs",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "65";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"phyReduceHurtCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"backGround1",
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
                                                            "type":UIComponent,
                                                            "id":"phyReduceHurtProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ScrollTextArrCanvas,
                                                            "id":"stExp1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":265
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"phyReduceHurtText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_MagicArrayPanel_LinkTextArea2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":40,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"phyReduceHurtEffText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":70,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"phyReduceHurtRankText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":100,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"phyReduceHurtEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":400,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"phyReduceHurtGoldBtn",
                                                            "events":{"click":"__phyReduceHurtGoldBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"phyReduceHurtElementBtn",
                                                            "events":{"click":"__phyReduceHurtElementBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"phyReduceHurtMyGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"phyReduceHurtReqGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"phyReduceHurtMyEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"phyReduceHurtReqEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_MagicArrayPanel_LinkButton1",
                                                            "events":{"click":"___MagicArrayPanel_LinkButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFE600;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":415,
                                                                    "y":30,
                                                                    "width":78
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"petPhyReduceHurtCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"backGround2",
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
                                                            "type":UIComponent,
                                                            "id":"petPhyReduceHurtProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ScrollTextArrCanvas,
                                                            "id":"stExp2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":265
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petPhyReduceHurtText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_MagicArrayPanel_LinkTextArea11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":40,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petPhyReduceHurtEffText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":70,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petPhyReduceHurtRankText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":100,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petPhyReduceHurtEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":400,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"petPhyReduceHurtGoldBtn",
                                                            "events":{"click":"__petPhyReduceHurtGoldBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"petPhyReduceHurtElementBtn",
                                                            "events":{"click":"__petPhyReduceHurtElementBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petPhyReduceHurtMyGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petPhyReduceHurtReqGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petPhyReduceHurtMyEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petPhyReduceHurtReqEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_MagicArrayPanel_LinkButton2",
                                                            "events":{"click":"___MagicArrayPanel_LinkButton2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFE600;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":415,
                                                                    "y":30,
                                                                    "width":78
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"magicReduceHurtCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"backGround3",
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
                                                            "type":UIComponent,
                                                            "id":"magicReduceHurtProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ScrollTextArrCanvas,
                                                            "id":"stExp3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":265
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"magicReduceHurtText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_MagicArrayPanel_LinkTextArea20",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":40,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"magicReduceHurtEffText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":70,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"magicReduceHurtRankText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":100,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"magicReduceHurtEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":400,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"magicReduceHurtGoldBtn",
                                                            "events":{"click":"__magicReduceHurtGoldBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"magicReduceHurtElementBtn",
                                                            "events":{"click":"__magicReduceHurtElementBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"magicReduceHurtMyGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"magicReduceHurtReqGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"magicReduceHurtMyEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"magicReduceHurtReqEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_MagicArrayPanel_LinkButton3",
                                                            "events":{"click":"___MagicArrayPanel_LinkButton3_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFE600;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":415,
                                                                    "y":30,
                                                                    "width":78
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"petMagicReduceHurtCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"backGround4",
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
                                                            "type":UIComponent,
                                                            "id":"petMagicReduceHurtProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ScrollTextArrCanvas,
                                                            "id":"stExp4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":265
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petMagicReduceHurtText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_MagicArrayPanel_LinkTextArea29",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":40,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petMagicReduceHurtEffText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":70,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petMagicReduceHurtRankText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":100,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petMagicReduceHurtEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":400,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"petMagicReduceHurtGoldBtn",
                                                            "events":{"click":"__petMagicReduceHurtGoldBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"petMagicReduceHurtElementBtn",
                                                            "events":{"click":"__petMagicReduceHurtElementBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petMagicReduceHurtMyGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petMagicReduceHurtReqGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petMagicReduceHurtMyEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"petMagicReduceHurtReqEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_MagicArrayPanel_LinkButton4",
                                                            "events":{"click":"___MagicArrayPanel_LinkButton4_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFE600;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":415,
                                                                    "y":30,
                                                                    "width":78
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"goldReduceHurtCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"backGround5",
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
                                                            "type":UIComponent,
                                                            "id":"goldReduceHurtProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ScrollTextArrCanvas,
                                                            "id":"stExp5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":265
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"goldReduceHurtText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_MagicArrayPanel_LinkTextArea38",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":40,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"goldReduceHurtEffText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":70,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"goldReduceHurtRankText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":100,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"goldReduceHurtEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":400,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"goldReduceHurtGoldBtn",
                                                            "events":{"click":"__goldReduceHurtGoldBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"goldReduceHurtElementBtn",
                                                            "events":{"click":"__goldReduceHurtElementBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"goldReduceHurtMyGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"goldReduceHurtReqGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"goldReduceHurtMyEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"goldReduceHurtReqEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_MagicArrayPanel_LinkButton5",
                                                            "events":{"click":"___MagicArrayPanel_LinkButton5_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFE600;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":415,
                                                                    "y":30,
                                                                    "width":78
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"woodReduceHurtCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"backGround6",
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
                                                            "type":UIComponent,
                                                            "id":"woodReduceHurtProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ScrollTextArrCanvas,
                                                            "id":"stExp6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":265
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"woodReduceHurtText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_MagicArrayPanel_LinkTextArea47",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":40,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"woodReduceHurtEffText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":70,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"woodReduceHurtRankText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":100,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"woodReduceHurtEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":400,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"woodReduceHurtGoldBtn",
                                                            "events":{"click":"__woodReduceHurtGoldBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"woodReduceHurtElementBtn",
                                                            "events":{"click":"__woodReduceHurtElementBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"woodReduceHurtMyGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"woodReduceHurtReqGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"woodReduceHurtMyEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"woodReduceHurtReqEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_MagicArrayPanel_LinkButton6",
                                                            "events":{"click":"___MagicArrayPanel_LinkButton6_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFE600;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":415,
                                                                    "y":30,
                                                                    "width":78
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"lightReduceHurtCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"backGround7",
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
                                                            "type":UIComponent,
                                                            "id":"lightReduceHurtProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ScrollTextArrCanvas,
                                                            "id":"stExp7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":265
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"lightReduceHurtText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_MagicArrayPanel_LinkTextArea56",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":40,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"lightReduceHurtEffText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":70,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"lightReduceHurtRankText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":100,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"lightReduceHurtEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":400,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lightReduceHurtGoldBtn",
                                                            "events":{"click":"__lightReduceHurtGoldBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"lightReduceHurtElementBtn",
                                                            "events":{"click":"__lightReduceHurtElementBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"lightReduceHurtMyGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"lightReduceHurtReqGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"lightReduceHurtMyEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"lightReduceHurtReqEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_MagicArrayPanel_LinkButton7",
                                                            "events":{"click":"___MagicArrayPanel_LinkButton7_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFE600;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":415,
                                                                    "y":30,
                                                                    "width":78
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"darkReduceHurtCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"backGround8",
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
                                                            "type":UIComponent,
                                                            "id":"darkReduceHurtProcess",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":33,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "visible":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ScrollTextArrCanvas,
                                                            "id":"stExp8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":265
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"darkReduceHurtText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":200
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_MagicArrayPanel_LinkTextArea65",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":40,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"darkReduceHurtEffText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":70,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"darkReduceHurtRankText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":22,
                                                                    "y":100,
                                                                    "height":25,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"darkReduceHurtEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":400,
                                                                    "y":10,
                                                                    "height":25,
                                                                    "width":165
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"darkReduceHurtGoldBtn",
                                                            "events":{"click":"__darkReduceHurtGoldBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalRed",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"darkReduceHurtElementBtn",
                                                            "events":{"click":"__darkReduceHurtElementBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "80";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "labelPlacement":"bottom",
                                                                    "width":100,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"darkReduceHurtMyGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"darkReduceHurtReqGoldText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "167";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"darkReduceHurtMyEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "30";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"darkReduceHurtReqEleText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.bottom = "55";
                                                                this.left = "307";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_MagicArrayPanel_LinkButton8",
                                                            "events":{"click":"___MagicArrayPanel_LinkButton8_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFE600;
                                                                this.textDecoration = "underline";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":415,
                                                                    "y":30,
                                                                    "width":78
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
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MagicArrayPanel()
        {
            mx_internal::_document = this;
            this.width = 587;
            this.height = 524;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MagicArrayPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MagicArrayPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get phyReduceHurtReqEleText():LinkTextArea
        {
            return (this._1040898045phyReduceHurtReqEleText);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtProcess():UIComponent
        {
            return (this._62666771magicReduceHurtProcess);
        }

        public function set phyReduceHurtReqEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1040898045phyReduceHurtReqEleText;
            if (_local_2 !== _arg_1)
            {
                this._1040898045phyReduceHurtReqEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtReqEleText", _local_2, _arg_1));
            };
        }

        public function set magicReduceHurtProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._62666771magicReduceHurtProcess;
            if (_local_2 !== _arg_1)
            {
                this._62666771magicReduceHurtProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtMyEleText():LinkTextArea
        {
            return (this._678323210goldReduceHurtMyEleText);
        }

        public function set phyReduceHurtGoldBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1233972742phyReduceHurtGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._1233972742phyReduceHurtGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtGoldBtn", _local_2, _arg_1));
            };
        }

        public function set goldReduceHurtMyEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._678323210goldReduceHurtMyEleText;
            if (_local_2 !== _arg_1)
            {
                this._678323210goldReduceHurtMyEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtMyEleText", _local_2, _arg_1));
            };
        }

        private function loadCompleteLight(_arg_1:Event):void
        {
            var _local_2:Class = (loadLight.contentLoaderInfo.applicationDomain.getDefinition("guangzhen") as Class);
            lightReduceHurtMC = (new (_local_2)() as MovieClip);
            lightReduceHurtProcess.addChild(lightReduceHurtMC);
            lightReduceHurtMC.gotoAndStop(0);
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtText():LinkTextArea
        {
            return (this._664069096lightReduceHurtText);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtCanvas():Canvas
        {
            return (this._2052479974magicReduceHurtCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtEleText():LinkTextArea
        {
            return (this._908722144lightReduceHurtEleText);
        }

        public function set goldReduceHurtEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._450064918goldReduceHurtEleText;
            if (_local_2 !== _arg_1)
            {
                this._450064918goldReduceHurtEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtEleText", _local_2, _arg_1));
            };
        }

        public function set lightReduceHurtText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._664069096lightReduceHurtText;
            if (_local_2 !== _arg_1)
            {
                this._664069096lightReduceHurtText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtEffText():LinkTextArea
        {
            return (this._1327457233petMagicReduceHurtEffText);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtEffText():LinkTextArea
        {
            return (this._1587580880magicReduceHurtEffText);
        }

        public function set goldReduceHurtReqGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1261160982goldReduceHurtReqGoldText;
            if (_local_2 !== _arg_1)
            {
                this._1261160982goldReduceHurtReqGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtReqGoldText", _local_2, _arg_1));
            };
        }

        public function set lightReduceHurtEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._908722144lightReduceHurtEleText;
            if (_local_2 !== _arg_1)
            {
                this._908722144lightReduceHurtEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtEleText", _local_2, _arg_1));
            };
        }

        public function __magicReduceHurtGoldBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(3, true);
        }

        public function set lightReduceHurtMyGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._2062404132lightReduceHurtMyGoldText;
            if (_local_2 !== _arg_1)
            {
                this._2062404132lightReduceHurtMyGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtMyGoldText", _local_2, _arg_1));
            };
        }

        private function loadCompleteDark(_arg_1:Event):void
        {
            var _local_2:Class = (loadDark.contentLoaderInfo.applicationDomain.getDefinition("zise") as Class);
            darkReduceHurtMC = (new (_local_2)() as MovieClip);
            darkReduceHurtProcess.addChild(darkReduceHurtMC);
            darkReduceHurtMC.gotoAndStop(0);
        }

        public function set magicReduceHurtCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._2052479974magicReduceHurtCanvas;
            if (_local_2 !== _arg_1)
            {
                this._2052479974magicReduceHurtCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtCanvas():Canvas
        {
            return (this._1835236411petMagicReduceHurtCanvas);
        }

        public function __petPhyReduceHurtElementBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(2, false);
        }

        public function set magicReduceHurtEffText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1587580880magicReduceHurtEffText;
            if (_local_2 !== _arg_1)
            {
                this._1587580880magicReduceHurtEffText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtEffText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtEleText():LinkTextArea
        {
            return (this._1156605848petMagicReduceHurtEleText);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtEleText():LinkTextArea
        {
            return (this._1416729495magicReduceHurtEleText);
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtElementBtn():BasicGlowButton
        {
            return (this._141062251lightReduceHurtElementBtn);
        }

        public function set magicReduceHurtReqEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1556042287magicReduceHurtReqEleText;
            if (_local_2 !== _arg_1)
            {
                this._1556042287magicReduceHurtReqEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtReqEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtMyGoldText():LinkTextArea
        {
            return (this._1621003374goldReduceHurtMyGoldText);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtText():LinkTextArea
        {
            return (this._1803959407magicReduceHurtText);
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtCanvas():Canvas
        {
            return (this._601952177petPhyReduceHurtCanvas);
        }

        public function set petMagicReduceHurtCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1835236411petMagicReduceHurtCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1835236411petMagicReduceHurtCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtCanvas", _local_2, _arg_1));
            };
        }

        public function __goldReduceHurtGoldBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(5, true);
        }

        public function set woodReduceHurtMyGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1270306245woodReduceHurtMyGoldText;
            if (_local_2 !== _arg_1)
            {
                this._1270306245woodReduceHurtMyGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtMyGoldText", _local_2, _arg_1));
            };
        }

        public function set petMagicReduceHurtEffText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1327457233petMagicReduceHurtEffText;
            if (_local_2 !== _arg_1)
            {
                this._1327457233petMagicReduceHurtEffText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtEffText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtElementBtn():BasicGlowButton
        {
            return (this._1103319170woodReduceHurtElementBtn);
        }

        public function ___MagicArrayPanel_LinkButton3_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtMyGoldText():LinkTextArea
        {
            return (this._583756668darkReduceHurtMyGoldText);
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtRankText():LinkTextArea
        {
            return (this._2113589391phyReduceHurtRankText);
        }

        public function __darkReduceHurtGoldBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(8, true);
        }

        private function loadMagicSwf():void
        {
            loadLanse = new Loader();
            urlSwf = new URLRequest(ResManager.getResUrl(2060090400038));
            loadLanse.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteLanse);
            loadLanse.load(urlSwf);
            loadFense = new Loader();
            urlSwf = new URLRequest(ResManager.getResUrl(2060090400034));
            loadFense.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteFense);
            loadFense.load(urlSwf);
            loadLvse = new Loader();
            urlSwf = new URLRequest(ResManager.getResUrl(2060090400037));
            loadLvse.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteLvse);
            loadLvse.load(urlSwf);
            loadHuangse = new Loader();
            urlSwf = new URLRequest(ResManager.getResUrl(2060090400036));
            loadHuangse.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHuangse);
            loadHuangse.load(urlSwf);
            loadGold = new Loader();
            urlSwf = new URLRequest(ResManager.getResUrl(2060090400035));
            loadGold.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteGold);
            loadGold.load(urlSwf);
            loadWood = new Loader();
            urlSwf = new URLRequest(ResManager.getResUrl(2060090400093));
            loadWood.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteWood);
            loadWood.load(urlSwf);
            loadLight = new Loader();
            urlSwf = new URLRequest(ResManager.getResUrl(2060090400094));
            loadLight.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteLight);
            loadLight.load(urlSwf);
            loadDark = new Loader();
            urlSwf = new URLRequest(ResManager.getResUrl(2060090400039));
            loadDark.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteDark);
            loadDark.load(urlSwf);
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtMyEleText():LinkTextArea
        {
            return (this._246228835woodReduceHurtMyEleText);
        }

        public function __idTab3_click(_arg_1:MouseEvent):void
        {
            setTab(3);
        }

        [Bindable(event="propertyChange")]
        public function get backGround1():Image
        {
            return (this._978655069backGround1);
        }

        [Bindable(event="propertyChange")]
        public function get backGround2():Image
        {
            return (this._978655068backGround2);
        }

        [Bindable(event="propertyChange")]
        public function get backGround3():Image
        {
            return (this._978655067backGround3);
        }

        [Bindable(event="propertyChange")]
        public function get backGround5():Image
        {
            return (this._978655065backGround5);
        }

        [Bindable(event="propertyChange")]
        public function get backGround6():Image
        {
            return (this._978655064backGround6);
        }

        [Bindable(event="propertyChange")]
        public function get backGround8():Image
        {
            return (this._978655062backGround8);
        }

        private function loadCompleteLanse(_arg_1:Event):void
        {
            var _local_2:Class = (loadLanse.contentLoaderInfo.applicationDomain.getDefinition("lanse") as Class);
            phyReduceHurtMC = (new (_local_2)() as MovieClip);
            phyReduceHurtProcess.addChild(phyReduceHurtMC);
            phyReduceHurtMC.gotoAndStop(0);
        }

        [Bindable(event="propertyChange")]
        public function get backGround4():Image
        {
            return (this._978655066backGround4);
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtGoldBtn():BasicGlowButton
        {
            return (this._344016719darkReduceHurtGoldBtn);
        }

        public function set woodReduceHurtGoldBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1128901030woodReduceHurtGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._1128901030woodReduceHurtGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtGoldBtn", _local_2, _arg_1));
            };
        }

        public function set petPhyReduceHurtCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._601952177petPhyReduceHurtCanvas;
            if (_local_2 !== _arg_1)
            {
                this._601952177petPhyReduceHurtCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtCanvas", _local_2, _arg_1));
            };
        }

        public function set petPhyReduceHurtProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._1954021976petPhyReduceHurtProcess;
            if (_local_2 !== _arg_1)
            {
                this._1954021976petPhyReduceHurtProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get backGround7():Image
        {
            return (this._978655063backGround7);
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtRankText():LinkTextArea
        {
            return (this._1706338480petPhyReduceHurtRankText);
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtReqGoldText():LinkTextArea
        {
            return (this._1633076416darkReduceHurtReqGoldText);
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtCanvas():Canvas
        {
            return (this._1576618803goldReduceHurtCanvas);
        }

        public function ___MagicArrayPanel_LinkButton8_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set petMagicReduceHurtEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1156605848petMagicReduceHurtEleText;
            if (_local_2 !== _arg_1)
            {
                this._1156605848petMagicReduceHurtEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtEleText", _local_2, _arg_1));
            };
        }

        public function set magicReduceHurtEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1416729495magicReduceHurtEleText;
            if (_local_2 !== _arg_1)
            {
                this._1416729495magicReduceHurtEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtEleText", _local_2, _arg_1));
            };
        }

        public function __lightReduceHurtElementBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(7, false);
        }

        public function set lightReduceHurtElementBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._141062251lightReduceHurtElementBtn;
            if (_local_2 !== _arg_1)
            {
                this._141062251lightReduceHurtElementBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtElementBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtText():LinkTextArea
        {
            return (this._2120853712petMagicReduceHurtText);
        }

        public function set goldReduceHurtMyGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1621003374goldReduceHurtMyGoldText;
            if (_local_2 !== _arg_1)
            {
                this._1621003374goldReduceHurtMyGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtMyGoldText", _local_2, _arg_1));
            };
        }

        public function set magicReduceHurtText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1803959407magicReduceHurtText;
            if (_local_2 !== _arg_1)
            {
                this._1803959407magicReduceHurtText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtText", _local_2, _arg_1));
            };
        }

        public function updatePraView(_arg_1:Object):*
        {
            var _local_2:Number;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Number;
            if (!_arg_1)
            {
                return;
            };
            if ((((((_arg_1.praType == null) || (_arg_1.buff == null)) || (_arg_1.exp == null)) || (_arg_1.elementNum == null)) || (_arg_1.goldNum == null)))
            {
                return;
            };
            if (_arg_1.praType == 1)
            {
                this.backGround1.source = ResManager.getIconUrl(parseInt(resCode));
                phyReduceHurtText.htmlText = Language.MAGIC_ARRAY_PANEL_U[7].toString().replace("{level}", Number(_arg_1.buff));
                _local_2 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_DEF_EFFECT[Number(_arg_1.buff)] / 100).toFixed(2));
                if (Number(_arg_1.buff) < MAX_LEVEL)
                {
                    _local_5 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_DEF_EFFECT[(Number(_arg_1.buff) + 1)] / 100).toFixed(2));
                    phyReduceHurtEffText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2) + Language.MAGIC_ARRAY_PANEL_U[9].toString().replace("{nextPercent}", _local_5));
                    phyReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                }
                else
                {
                    phyReduceHurtText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[7].toString().replace("{level}", Number(_arg_1.buff)) + Language.MAGIC_ARRAY_PANEL_U[29].toString());
                    phyReduceHurtEffText.htmlText = Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2);
                    phyReduceHurtRankText.visible = false;
                };
                _local_3 = 0;
                _local_4 = 0;
                if (_arg_1.buff == 0)
                {
                    _local_3 = _arg_1.exp;
                    _local_4 = GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)];
                }
                else
                {
                    if (_arg_1.buff < MAX_LEVEL)
                    {
                        _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                        _local_4 = (GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)] - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                    }
                    else
                    {
                        _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                        _local_4 = _local_3;
                    };
                };
                if (_arg_1.buff < MAX_LEVEL)
                {
                    phyReduceHurtEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[12].toString().replace("{currentExp}", _local_3).replace("{requireExp}", _local_4);
                }
                else
                {
                    phyReduceHurtEleText.visible = false;
                };
                phyReduceHurtMyGoldText.htmlText = Language.MAGIC_ARRAY_PANEL_U[15].toString().replace("{num}", _arg_1.goldNum);
                phyReduceHurtMyEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[17].toString().replace("{num}", _arg_1.elementNum);
                setProcess(1, _local_3, _local_4);
                if (((stExp1) && (_arg_1.addExp)))
                {
                    if (Boolean(_arg_1.critMulit))
                    {
                        stExp1.setValue(_arg_1.addExp, Language.MAGIC_ARRAY_PANEL_U[32], Language.MAGIC_ARRAY_PANEL_U[33]);
                    }
                    else
                    {
                        stExp1.setValue(_arg_1.addExp, "", Language.MAGIC_ARRAY_PANEL_U[33]);
                    };
                };
            }
            else
            {
                if (_arg_1.praType == 2)
                {
                    this.backGround2.source = ResManager.getIconUrl(parseInt(resCode));
                    petPhyReduceHurtText.htmlText = Language.MAGIC_ARRAY_PANEL_U[21].toString().replace("{level}", Number(_arg_1.buff));
                    _local_2 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_DEF_EFFECT[Number(_arg_1.buff)] / 100).toFixed(2));
                    if (Number(_arg_1.buff) < MAX_LEVEL)
                    {
                        _local_5 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_DEF_EFFECT[(Number(_arg_1.buff) + 1)] / 100).toFixed(2));
                        petPhyReduceHurtEffText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2) + Language.MAGIC_ARRAY_PANEL_U[9].toString().replace("{nextPercent}", _local_5));
                        petPhyReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                    }
                    else
                    {
                        petPhyReduceHurtText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[21].toString().replace("{level}", Number(_arg_1.buff)) + Language.MAGIC_ARRAY_PANEL_U[29].toString());
                        petPhyReduceHurtEffText.htmlText = Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2);
                        petPhyReduceHurtRankText.visible = false;
                    };
                    petPhyReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                    _local_3 = 0;
                    _local_4 = 0;
                    if (_arg_1.buff == 0)
                    {
                        _local_3 = _arg_1.exp;
                        _local_4 = GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)];
                    }
                    else
                    {
                        if (_arg_1.buff < MAX_LEVEL)
                        {
                            _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                            _local_4 = (GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)] - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                        }
                        else
                        {
                            _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                            _local_4 = _local_3;
                        };
                    };
                    if (_arg_1.buff < MAX_LEVEL)
                    {
                        petPhyReduceHurtEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[12].toString().replace("{currentExp}", _local_3).replace("{requireExp}", _local_4);
                    }
                    else
                    {
                        petPhyReduceHurtEleText.visible = false;
                    };
                    petPhyReduceHurtMyGoldText.htmlText = Language.MAGIC_ARRAY_PANEL_U[15].toString().replace("{num}", _arg_1.goldNum);
                    petPhyReduceHurtMyEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[17].toString().replace("{num}", _arg_1.elementNum);
                    setProcess(2, _local_3, _local_4);
                    if (((stExp2) && (_arg_1.addExp)))
                    {
                        if (Boolean(_arg_1.critMulit))
                        {
                            stExp2.setValue(_arg_1.addExp, Language.MAGIC_ARRAY_PANEL_U[32], Language.MAGIC_ARRAY_PANEL_U[33]);
                        }
                        else
                        {
                            stExp2.setValue(_arg_1.addExp, "", Language.MAGIC_ARRAY_PANEL_U[33]);
                        };
                    };
                }
                else
                {
                    if (_arg_1.praType == 3)
                    {
                        this.backGround3.source = ResManager.getIconUrl(parseInt(resCode));
                        magicReduceHurtText.htmlText = Language.MAGIC_ARRAY_PANEL_U[19].toString().replace("{level}", Number(_arg_1.buff));
                        _local_2 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_DEF_EFFECT[Number(_arg_1.buff)] / 100).toFixed(2));
                        if (Number(_arg_1.buff) < MAX_LEVEL)
                        {
                            _local_5 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_DEF_EFFECT[(Number(_arg_1.buff) + 1)] / 100).toFixed(2));
                            magicReduceHurtEffText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2) + Language.MAGIC_ARRAY_PANEL_U[9].toString().replace("{nextPercent}", _local_5));
                            magicReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                        }
                        else
                        {
                            magicReduceHurtText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[19].toString().replace("{level}", Number(_arg_1.buff)) + Language.MAGIC_ARRAY_PANEL_U[29].toString());
                            magicReduceHurtEffText.htmlText = Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2);
                            magicReduceHurtRankText.visible = false;
                        };
                        magicReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                        _local_3 = 0;
                        _local_4 = 0;
                        if (_arg_1.buff == 0)
                        {
                            _local_3 = _arg_1.exp;
                            _local_4 = GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)];
                        }
                        else
                        {
                            if (_arg_1.buff < MAX_LEVEL)
                            {
                                _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                _local_4 = (GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)] - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                            }
                            else
                            {
                                _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                _local_4 = _local_3;
                            };
                        };
                        if (_arg_1.buff < MAX_LEVEL)
                        {
                            magicReduceHurtEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[12].toString().replace("{currentExp}", _local_3).replace("{requireExp}", _local_4);
                        }
                        else
                        {
                            magicReduceHurtEleText.visible = false;
                        };
                        magicReduceHurtMyGoldText.htmlText = Language.MAGIC_ARRAY_PANEL_U[15].toString().replace("{num}", _arg_1.goldNum);
                        magicReduceHurtMyEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[17].toString().replace("{num}", _arg_1.elementNum);
                        setProcess(3, _local_3, _local_4);
                        if (((stExp3) && (_arg_1.addExp)))
                        {
                            if (Boolean(_arg_1.critMulit))
                            {
                                stExp3.setValue(_arg_1.addExp, Language.MAGIC_ARRAY_PANEL_U[32], Language.MAGIC_ARRAY_PANEL_U[33]);
                            }
                            else
                            {
                                stExp3.setValue(_arg_1.addExp, "", Language.MAGIC_ARRAY_PANEL_U[33]);
                            };
                        };
                    }
                    else
                    {
                        if (_arg_1.praType == 4)
                        {
                            this.backGround4.source = ResManager.getIconUrl(parseInt(resCode));
                            petMagicReduceHurtText.htmlText = Language.MAGIC_ARRAY_PANEL_U[23].toString().replace("{level}", Number(_arg_1.buff));
                            _local_2 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_DEF_EFFECT[Number(_arg_1.buff)] / 100).toFixed(2));
                            if (Number(_arg_1.buff) < MAX_LEVEL)
                            {
                                _local_5 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_DEF_EFFECT[(Number(_arg_1.buff) + 1)] / 100).toFixed(2));
                                petMagicReduceHurtEffText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2) + Language.MAGIC_ARRAY_PANEL_U[9].toString().replace("{nextPercent}", _local_5));
                                petMagicReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                            }
                            else
                            {
                                petMagicReduceHurtText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[23].toString().replace("{level}", Number(_arg_1.buff)) + Language.MAGIC_ARRAY_PANEL_U[29].toString());
                                petMagicReduceHurtEffText.htmlText = Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2);
                                petMagicReduceHurtRankText.visible = false;
                            };
                            petMagicReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                            _local_3 = 0;
                            _local_4 = 0;
                            if (_arg_1.buff == 0)
                            {
                                _local_3 = _arg_1.exp;
                                _local_4 = GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)];
                            }
                            else
                            {
                                if (_arg_1.buff < MAX_LEVEL)
                                {
                                    _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                    _local_4 = (GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)] - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                }
                                else
                                {
                                    _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                    _local_4 = _local_3;
                                };
                            };
                            if (_arg_1.buff < MAX_LEVEL)
                            {
                                petMagicReduceHurtEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[12].toString().replace("{currentExp}", _local_3).replace("{requireExp}", _local_4);
                            }
                            else
                            {
                                petMagicReduceHurtEleText.visible = false;
                            };
                            petMagicReduceHurtMyGoldText.htmlText = Language.MAGIC_ARRAY_PANEL_U[15].toString().replace("{num}", _arg_1.goldNum);
                            petMagicReduceHurtMyEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[17].toString().replace("{num}", _arg_1.elementNum);
                            setProcess(4, _local_3, _local_4);
                            if (((stExp4) && (_arg_1.addExp)))
                            {
                                if (Boolean(_arg_1.critMulit))
                                {
                                    stExp4.setValue(_arg_1.addExp, Language.MAGIC_ARRAY_PANEL_U[32], Language.MAGIC_ARRAY_PANEL_U[33]);
                                }
                                else
                                {
                                    stExp4.setValue(_arg_1.addExp, "", Language.MAGIC_ARRAY_PANEL_U[33]);
                                };
                            };
                        }
                        else
                        {
                            if (_arg_1.praType == 5)
                            {
                                this.backGround5.source = ResManager.getIconUrl(parseInt(resCode));
                                goldReduceHurtText.htmlText = Language.MAGIC_ARRAY_PANEL_U[35].toString().replace("{level}", Number(_arg_1.buff));
                                _local_2 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_ATK_EFFECT[Number(_arg_1.buff)] / 100).toFixed(2));
                                if (Number(_arg_1.buff) < MAX_LEVEL)
                                {
                                    _local_5 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_ATK_EFFECT[(Number(_arg_1.buff) + 1)] / 100).toFixed(2));
                                    goldReduceHurtEffText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2) + Language.MAGIC_ARRAY_PANEL_U[9].toString().replace("{nextPercent}", _local_5));
                                    goldReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                                }
                                else
                                {
                                    goldReduceHurtText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[35].toString().replace("{level}", Number(_arg_1.buff)) + Language.MAGIC_ARRAY_PANEL_U[29].toString());
                                    goldReduceHurtEffText.htmlText = Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2);
                                    goldReduceHurtRankText.visible = false;
                                };
                                _local_3 = 0;
                                _local_4 = 0;
                                if (_arg_1.buff == 0)
                                {
                                    _local_3 = _arg_1.exp;
                                    _local_4 = GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)];
                                }
                                else
                                {
                                    if (_arg_1.buff < MAX_LEVEL)
                                    {
                                        _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                        _local_4 = (GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)] - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                    }
                                    else
                                    {
                                        _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                        _local_4 = _local_3;
                                    };
                                };
                                if (_arg_1.buff < MAX_LEVEL)
                                {
                                    goldReduceHurtEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[12].toString().replace("{currentExp}", _local_3).replace("{requireExp}", _local_4);
                                }
                                else
                                {
                                    goldReduceHurtEleText.visible = false;
                                };
                                goldReduceHurtMyGoldText.htmlText = Language.MAGIC_ARRAY_PANEL_U[15].toString().replace("{num}", _arg_1.goldNum);
                                goldReduceHurtMyEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _arg_1.elementNum);
                                setProcess(5, _local_3, _local_4);
                                if (((stExp5) && (_arg_1.addExp)))
                                {
                                    if (Boolean(_arg_1.critMulit))
                                    {
                                        stExp5.setValue(_arg_1.addExp, Language.MAGIC_ARRAY_PANEL_U[32], Language.MAGIC_ARRAY_PANEL_U[33]);
                                    }
                                    else
                                    {
                                        stExp5.setValue(_arg_1.addExp, "", Language.MAGIC_ARRAY_PANEL_U[33]);
                                    };
                                };
                            }
                            else
                            {
                                if (_arg_1.praType == 6)
                                {
                                    this.backGround6.source = ResManager.getIconUrl(parseInt(resCode));
                                    woodReduceHurtText.htmlText = Language.MAGIC_ARRAY_PANEL_U[36].toString().replace("{level}", Number(_arg_1.buff));
                                    _local_2 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_ATK_EFFECT[Number(_arg_1.buff)] / 100).toFixed(2));
                                    if (Number(_arg_1.buff) < MAX_LEVEL)
                                    {
                                        _local_5 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_ATK_EFFECT[(Number(_arg_1.buff) + 1)] / 100).toFixed(2));
                                        woodReduceHurtEffText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2) + Language.MAGIC_ARRAY_PANEL_U[9].toString().replace("{nextPercent}", _local_5));
                                        woodReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                                    }
                                    else
                                    {
                                        woodReduceHurtText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[36].toString().replace("{level}", Number(_arg_1.buff)) + Language.MAGIC_ARRAY_PANEL_U[29].toString());
                                        woodReduceHurtEffText.htmlText = Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2);
                                        woodReduceHurtRankText.visible = false;
                                    };
                                    woodReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                                    _local_3 = 0;
                                    _local_4 = 0;
                                    if (_arg_1.buff == 0)
                                    {
                                        _local_3 = _arg_1.exp;
                                        _local_4 = GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)];
                                    }
                                    else
                                    {
                                        if (_arg_1.buff < MAX_LEVEL)
                                        {
                                            _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                            _local_4 = (GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)] - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                        }
                                        else
                                        {
                                            _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                            _local_4 = _local_3;
                                        };
                                    };
                                    if (_arg_1.buff < MAX_LEVEL)
                                    {
                                        woodReduceHurtEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[12].toString().replace("{currentExp}", _local_3).replace("{requireExp}", _local_4);
                                    }
                                    else
                                    {
                                        woodReduceHurtEleText.visible = false;
                                    };
                                    woodReduceHurtMyGoldText.htmlText = Language.MAGIC_ARRAY_PANEL_U[15].toString().replace("{num}", _arg_1.goldNum);
                                    woodReduceHurtMyEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _arg_1.elementNum);
                                    setProcess(6, _local_3, _local_4);
                                    if (((stExp6) && (_arg_1.addExp)))
                                    {
                                        if (Boolean(_arg_1.critMulit))
                                        {
                                            stExp6.setValue(_arg_1.addExp, Language.MAGIC_ARRAY_PANEL_U[32], Language.MAGIC_ARRAY_PANEL_U[33]);
                                        }
                                        else
                                        {
                                            stExp6.setValue(_arg_1.addExp, "", Language.MAGIC_ARRAY_PANEL_U[33]);
                                        };
                                    };
                                }
                                else
                                {
                                    if (_arg_1.praType == 7)
                                    {
                                        this.backGround7.source = ResManager.getIconUrl(parseInt(resCode));
                                        lightReduceHurtText.htmlText = Language.MAGIC_ARRAY_PANEL_U[27].toString().replace("{level}", Number(_arg_1.buff));
                                        _local_2 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_SPD_EFFECT[Number(_arg_1.buff)] / 100).toFixed(2));
                                        if (Number(_arg_1.buff) < MAX_LEVEL)
                                        {
                                            _local_5 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_SPD_EFFECT[(Number(_arg_1.buff) + 1)] / 100).toFixed(2));
                                            lightReduceHurtEffText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2) + Language.MAGIC_ARRAY_PANEL_U[9].toString().replace("{nextPercent}", _local_5));
                                            lightReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                                        }
                                        else
                                        {
                                            lightReduceHurtText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[27].toString().replace("{level}", Number(_arg_1.buff)) + Language.MAGIC_ARRAY_PANEL_U[29].toString());
                                            lightReduceHurtEffText.htmlText = Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2);
                                            lightReduceHurtRankText.visible = false;
                                        };
                                        lightReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                                        _local_3 = 0;
                                        _local_4 = 0;
                                        if (_arg_1.buff == 0)
                                        {
                                            _local_3 = _arg_1.exp;
                                            _local_4 = GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)];
                                        }
                                        else
                                        {
                                            if (_arg_1.buff < MAX_LEVEL)
                                            {
                                                _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                                _local_4 = (GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)] - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                            }
                                            else
                                            {
                                                _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                                _local_4 = _local_3;
                                            };
                                        };
                                        if (_arg_1.buff < MAX_LEVEL)
                                        {
                                            lightReduceHurtEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[12].toString().replace("{currentExp}", _local_3).replace("{requireExp}", _local_4);
                                        }
                                        else
                                        {
                                            lightReduceHurtEleText.visible = false;
                                        };
                                        lightReduceHurtMyGoldText.htmlText = Language.MAGIC_ARRAY_PANEL_U[15].toString().replace("{num}", _arg_1.goldNum);
                                        lightReduceHurtMyEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _arg_1.elementNum);
                                        setProcess(7, _local_3, _local_4);
                                        if (((stExp7) && (_arg_1.addExp)))
                                        {
                                            if (Boolean(_arg_1.critMulit))
                                            {
                                                stExp7.setValue(_arg_1.addExp, Language.MAGIC_ARRAY_PANEL_U[32], Language.MAGIC_ARRAY_PANEL_U[33]);
                                            }
                                            else
                                            {
                                                stExp7.setValue(_arg_1.addExp, "", Language.MAGIC_ARRAY_PANEL_U[33]);
                                            };
                                        };
                                    }
                                    else
                                    {
                                        if (_arg_1.praType == 8)
                                        {
                                            this.backGround8.source = ResManager.getIconUrl(parseInt(resCode));
                                            darkReduceHurtText.htmlText = Language.MAGIC_ARRAY_PANEL_U[25].toString().replace("{level}", Number(_arg_1.buff));
                                            _local_2 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_SPD_EFFECT[Number(_arg_1.buff)] / 100).toFixed(2));
                                            if (Number(_arg_1.buff) < MAX_LEVEL)
                                            {
                                                _local_5 = Number((GamePredef.PLAYER_PARBUFF_LEVEL_SPD_EFFECT[(Number(_arg_1.buff) + 1)] / 100).toFixed(2));
                                                darkReduceHurtEffText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2) + Language.MAGIC_ARRAY_PANEL_U[9].toString().replace("{nextPercent}", _local_5));
                                                darkReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                                            }
                                            else
                                            {
                                                darkReduceHurtText.htmlText = (Language.MAGIC_ARRAY_PANEL_U[25].toString().replace("{level}", Number(_arg_1.buff)) + Language.MAGIC_ARRAY_PANEL_U[29].toString());
                                                darkReduceHurtEffText.htmlText = Language.MAGIC_ARRAY_PANEL_U[8].toString().replace("{currentPercent}", _local_2);
                                                darkReduceHurtRankText.visible = false;
                                            };
                                            darkReduceHurtRankText.htmlText = Language.MAGIC_ARRAY_PANEL_U[11].toString().replace("{rank}", Language.PLAYER_RELEVEL_TITLE_U[GamePredef.PLAYER_PARBUFF_LEVEL_LIMIT[Number(_arg_1.buff)]]);
                                            _local_3 = 0;
                                            _local_4 = 0;
                                            if (_arg_1.buff == 0)
                                            {
                                                _local_3 = _arg_1.exp;
                                                _local_4 = GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)];
                                            }
                                            else
                                            {
                                                if (_arg_1.buff < MAX_LEVEL)
                                                {
                                                    _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                                    _local_4 = (GamePredef.PLAYER_PARBUFF_LEVEL_EXP[Number(_arg_1.buff)] - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                                }
                                                else
                                                {
                                                    _local_3 = (_arg_1.exp - GamePredef.PLAYER_PARBUFF_LEVEL_EXP[(Number(_arg_1.buff) - 1)]);
                                                    _local_4 = _local_3;
                                                };
                                            };
                                            if (_arg_1.buff < MAX_LEVEL)
                                            {
                                                darkReduceHurtEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[12].toString().replace("{currentExp}", _local_3).replace("{requireExp}", _local_4);
                                            }
                                            else
                                            {
                                                darkReduceHurtEleText.visible = false;
                                            };
                                            darkReduceHurtMyGoldText.htmlText = Language.MAGIC_ARRAY_PANEL_U[15].toString().replace("{num}", _arg_1.goldNum);
                                            darkReduceHurtMyEleText.htmlText = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _arg_1.elementNum);
                                            setProcess(8, _local_3, _local_4);
                                            if (((stExp8) && (_arg_1.addExp)))
                                            {
                                                if (Boolean(_arg_1.critMulit))
                                                {
                                                    stExp8.setValue(_arg_1.addExp, Language.MAGIC_ARRAY_PANEL_U[32], Language.MAGIC_ARRAY_PANEL_U[33]);
                                                }
                                                else
                                                {
                                                    stExp8.setValue(_arg_1.addExp, "", Language.MAGIC_ARRAY_PANEL_U[33]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtRankText():LinkTextArea
        {
            return (this._2113111836lightReduceHurtRankText);
        }

        public function set darkReduceHurtText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._11611768darkReduceHurtText;
            if (_local_2 !== _arg_1)
            {
                this._11611768darkReduceHurtText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtMyGoldText():LinkTextArea
        {
            return (this._407760092petMagicReduceHurtMyGoldText);
        }

        public function showPanel():void
        {
            this.visible = true;
            _core.remote.call("getMagicArrayData", new Responder(onGetMagicArrayData), (vs.selectedIndex + 1));
        }

        public function set woodReduceHurtElementBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1103319170woodReduceHurtElementBtn;
            if (_local_2 !== _arg_1)
            {
                this._1103319170woodReduceHurtElementBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtElementBtn", _local_2, _arg_1));
            };
        }

        public function set darkReduceHurtMyGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._583756668darkReduceHurtMyGoldText;
            if (_local_2 !== _arg_1)
            {
                this._583756668darkReduceHurtMyGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtMyGoldText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtGoldBtn():BasicGlowButton
        {
            return (this._1977100025goldReduceHurtGoldBtn);
        }

        public function set phyReduceHurtRankText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._2113589391phyReduceHurtRankText;
            if (_local_2 !== _arg_1)
            {
                this._2113589391phyReduceHurtRankText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtRankText", _local_2, _arg_1));
            };
        }

        private function _MagicArrayPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MagicArrayPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTab0.label = _arg_1;
            }, "idTab0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTab1.label = _arg_1;
            }, "idTab1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTab2.label = _arg_1;
            }, "idTab2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTab3.label = _arg_1;
            }, "idTab3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTab4.label = _arg_1;
            }, "idTab4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTab5.label = _arg_1;
            }, "idTab5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTab6.label = _arg_1;
            }, "idTab6.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTab7.label = _arg_1;
            }, "idTab7.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtText.htmlText = _arg_1;
            }, "phyReduceHurtText.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkTextArea2.htmlText = _arg_1;
            }, "_MagicArrayPanel_LinkTextArea2.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtEffText.htmlText = _arg_1;
            }, "phyReduceHurtEffText.htmlText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtRankText.htmlText = _arg_1;
            }, "phyReduceHurtRankText.htmlText");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtEleText.htmlText = _arg_1;
            }, "phyReduceHurtEleText.htmlText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtGoldBtn.label = _arg_1;
            }, "phyReduceHurtGoldBtn.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtElementBtn.label = _arg_1;
            }, "phyReduceHurtElementBtn.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtMyGoldText.htmlText = _arg_1;
            }, "phyReduceHurtMyGoldText.htmlText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtReqGoldText.htmlText = _arg_1;
            }, "phyReduceHurtReqGoldText.htmlText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtMyEleText.htmlText = _arg_1;
            }, "phyReduceHurtMyEleText.htmlText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                phyReduceHurtReqEleText.htmlText = _arg_1;
            }, "phyReduceHurtReqEleText.htmlText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkButton1.label = _arg_1;
            }, "_MagicArrayPanel_LinkButton1.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtText.htmlText = _arg_1;
            }, "petPhyReduceHurtText.htmlText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkTextArea11.htmlText = _arg_1;
            }, "_MagicArrayPanel_LinkTextArea11.htmlText");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtEffText.htmlText = _arg_1;
            }, "petPhyReduceHurtEffText.htmlText");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtRankText.htmlText = _arg_1;
            }, "petPhyReduceHurtRankText.htmlText");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtEleText.htmlText = _arg_1;
            }, "petPhyReduceHurtEleText.htmlText");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtGoldBtn.label = _arg_1;
            }, "petPhyReduceHurtGoldBtn.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtElementBtn.label = _arg_1;
            }, "petPhyReduceHurtElementBtn.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtMyGoldText.htmlText = _arg_1;
            }, "petPhyReduceHurtMyGoldText.htmlText");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtReqGoldText.htmlText = _arg_1;
            }, "petPhyReduceHurtReqGoldText.htmlText");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtMyEleText.htmlText = _arg_1;
            }, "petPhyReduceHurtMyEleText.htmlText");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petPhyReduceHurtReqEleText.htmlText = _arg_1;
            }, "petPhyReduceHurtReqEleText.htmlText");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkButton2.label = _arg_1;
            }, "_MagicArrayPanel_LinkButton2.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtText.htmlText = _arg_1;
            }, "magicReduceHurtText.htmlText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkTextArea20.htmlText = _arg_1;
            }, "_MagicArrayPanel_LinkTextArea20.htmlText");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtEffText.htmlText = _arg_1;
            }, "magicReduceHurtEffText.htmlText");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtRankText.htmlText = _arg_1;
            }, "magicReduceHurtRankText.htmlText");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtEleText.htmlText = _arg_1;
            }, "magicReduceHurtEleText.htmlText");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtGoldBtn.label = _arg_1;
            }, "magicReduceHurtGoldBtn.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtElementBtn.label = _arg_1;
            }, "magicReduceHurtElementBtn.label");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtMyGoldText.htmlText = _arg_1;
            }, "magicReduceHurtMyGoldText.htmlText");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtReqGoldText.htmlText = _arg_1;
            }, "magicReduceHurtReqGoldText.htmlText");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtMyEleText.htmlText = _arg_1;
            }, "magicReduceHurtMyEleText.htmlText");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicReduceHurtReqEleText.htmlText = _arg_1;
            }, "magicReduceHurtReqEleText.htmlText");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkButton3.label = _arg_1;
            }, "_MagicArrayPanel_LinkButton3.label");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtText.htmlText = _arg_1;
            }, "petMagicReduceHurtText.htmlText");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkTextArea29.htmlText = _arg_1;
            }, "_MagicArrayPanel_LinkTextArea29.htmlText");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtEffText.htmlText = _arg_1;
            }, "petMagicReduceHurtEffText.htmlText");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtRankText.htmlText = _arg_1;
            }, "petMagicReduceHurtRankText.htmlText");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtEleText.htmlText = _arg_1;
            }, "petMagicReduceHurtEleText.htmlText");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtGoldBtn.label = _arg_1;
            }, "petMagicReduceHurtGoldBtn.label");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtElementBtn.label = _arg_1;
            }, "petMagicReduceHurtElementBtn.label");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtMyGoldText.htmlText = _arg_1;
            }, "petMagicReduceHurtMyGoldText.htmlText");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtReqGoldText.htmlText = _arg_1;
            }, "petMagicReduceHurtReqGoldText.htmlText");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtMyEleText.htmlText = _arg_1;
            }, "petMagicReduceHurtMyEleText.htmlText");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petMagicReduceHurtReqEleText.htmlText = _arg_1;
            }, "petMagicReduceHurtReqEleText.htmlText");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkButton4.label = _arg_1;
            }, "_MagicArrayPanel_LinkButton4.label");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtText.htmlText = _arg_1;
            }, "goldReduceHurtText.htmlText");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkTextArea38.htmlText = _arg_1;
            }, "_MagicArrayPanel_LinkTextArea38.htmlText");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtEffText.htmlText = _arg_1;
            }, "goldReduceHurtEffText.htmlText");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtRankText.htmlText = _arg_1;
            }, "goldReduceHurtRankText.htmlText");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtEleText.htmlText = _arg_1;
            }, "goldReduceHurtEleText.htmlText");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtGoldBtn.label = _arg_1;
            }, "goldReduceHurtGoldBtn.label");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtElementBtn.label = _arg_1;
            }, "goldReduceHurtElementBtn.label");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtMyGoldText.htmlText = _arg_1;
            }, "goldReduceHurtMyGoldText.htmlText");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtReqGoldText.htmlText = _arg_1;
            }, "goldReduceHurtReqGoldText.htmlText");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _core.player.yijieElement);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtMyEleText.htmlText = _arg_1;
            }, "goldReduceHurtMyEleText.htmlText");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldReduceHurtReqEleText.htmlText = _arg_1;
            }, "goldReduceHurtReqEleText.htmlText");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkButton5.label = _arg_1;
            }, "_MagicArrayPanel_LinkButton5.label");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtText.htmlText = _arg_1;
            }, "woodReduceHurtText.htmlText");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkTextArea47.htmlText = _arg_1;
            }, "_MagicArrayPanel_LinkTextArea47.htmlText");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtEffText.htmlText = _arg_1;
            }, "woodReduceHurtEffText.htmlText");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtRankText.htmlText = _arg_1;
            }, "woodReduceHurtRankText.htmlText");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtEleText.htmlText = _arg_1;
            }, "woodReduceHurtEleText.htmlText");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtGoldBtn.label = _arg_1;
            }, "woodReduceHurtGoldBtn.label");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtElementBtn.label = _arg_1;
            }, "woodReduceHurtElementBtn.label");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtMyGoldText.htmlText = _arg_1;
            }, "woodReduceHurtMyGoldText.htmlText");
            result[76] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtReqGoldText.htmlText = _arg_1;
            }, "woodReduceHurtReqGoldText.htmlText");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _core.player.yijieElement);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtMyEleText.htmlText = _arg_1;
            }, "woodReduceHurtMyEleText.htmlText");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                woodReduceHurtReqEleText.htmlText = _arg_1;
            }, "woodReduceHurtReqEleText.htmlText");
            result[79] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkButton6.label = _arg_1;
            }, "_MagicArrayPanel_LinkButton6.label");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtText.htmlText = _arg_1;
            }, "lightReduceHurtText.htmlText");
            result[81] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkTextArea56.htmlText = _arg_1;
            }, "_MagicArrayPanel_LinkTextArea56.htmlText");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtEffText.htmlText = _arg_1;
            }, "lightReduceHurtEffText.htmlText");
            result[83] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtRankText.htmlText = _arg_1;
            }, "lightReduceHurtRankText.htmlText");
            result[84] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtEleText.htmlText = _arg_1;
            }, "lightReduceHurtEleText.htmlText");
            result[85] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtGoldBtn.label = _arg_1;
            }, "lightReduceHurtGoldBtn.label");
            result[86] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtElementBtn.label = _arg_1;
            }, "lightReduceHurtElementBtn.label");
            result[87] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtMyGoldText.htmlText = _arg_1;
            }, "lightReduceHurtMyGoldText.htmlText");
            result[88] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtReqGoldText.htmlText = _arg_1;
            }, "lightReduceHurtReqGoldText.htmlText");
            result[89] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _core.player.yijieElement);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtMyEleText.htmlText = _arg_1;
            }, "lightReduceHurtMyEleText.htmlText");
            result[90] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lightReduceHurtReqEleText.htmlText = _arg_1;
            }, "lightReduceHurtReqEleText.htmlText");
            result[91] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkButton7.label = _arg_1;
            }, "_MagicArrayPanel_LinkButton7.label");
            result[92] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtText.htmlText = _arg_1;
            }, "darkReduceHurtText.htmlText");
            result[93] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkTextArea65.htmlText = _arg_1;
            }, "_MagicArrayPanel_LinkTextArea65.htmlText");
            result[94] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtEffText.htmlText = _arg_1;
            }, "darkReduceHurtEffText.htmlText");
            result[95] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtRankText.htmlText = _arg_1;
            }, "darkReduceHurtRankText.htmlText");
            result[96] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtEleText.htmlText = _arg_1;
            }, "darkReduceHurtEleText.htmlText");
            result[97] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtGoldBtn.label = _arg_1;
            }, "darkReduceHurtGoldBtn.label");
            result[98] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtElementBtn.label = _arg_1;
            }, "darkReduceHurtElementBtn.label");
            result[99] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtMyGoldText.htmlText = _arg_1;
            }, "darkReduceHurtMyGoldText.htmlText");
            result[100] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtReqGoldText.htmlText = _arg_1;
            }, "darkReduceHurtReqGoldText.htmlText");
            result[101] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _core.player.yijieElement);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtMyEleText.htmlText = _arg_1;
            }, "darkReduceHurtMyEleText.htmlText");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                darkReduceHurtReqEleText.htmlText = _arg_1;
            }, "darkReduceHurtReqEleText.htmlText");
            result[103] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_ARRAY_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicArrayPanel_LinkButton8.label = _arg_1;
            }, "_MagicArrayPanel_LinkButton8.label");
            result[104] = binding;
            return (result);
        }

        public function set phyReduceHurtProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._720233113phyReduceHurtProcess;
            if (_local_2 !== _arg_1)
            {
                this._720233113phyReduceHurtProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtMyEleText():LinkTextArea
        {
            return (this._1886650060darkReduceHurtMyEleText);
        }

        public function set petPhyReduceHurtEffText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._429107867petPhyReduceHurtEffText;
            if (_local_2 !== _arg_1)
            {
                this._429107867petPhyReduceHurtEffText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtEffText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtElementBtn():BasicGlowButton
        {
            return (this._1564222153petPhyReduceHurtElementBtn);
        }

        private function loadCompleteFense(_arg_1:Event):void
        {
            var _local_2:Class = (loadFense.contentLoaderInfo.applicationDomain.getDefinition("fense") as Class);
            magicReduceHurtMC = (new (_local_2)() as MovieClip);
            magicReduceHurtProcess.addChild(magicReduceHurtMC);
            magicReduceHurtMC.gotoAndStop(0);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtMyGoldText():LinkTextArea
        {
            return (this._814805701magicReduceHurtMyGoldText);
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtCanvas():Canvas
        {
            return (this._1775878426woodReduceHurtCanvas);
        }

        private function loadCompleteGold(_arg_1:Event):void
        {
            var _local_2:Class = (loadGold.contentLoaderInfo.applicationDomain.getDefinition("hongse") as Class);
            goldReduceHurtMC = (new (_local_2)() as MovieClip);
            goldReduceHurtProcess.addChild(goldReduceHurtMC);
            goldReduceHurtMC.gotoAndStop(0);
        }

        public function set woodReduceHurtMyEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._246228835woodReduceHurtMyEleText;
            if (_local_2 !== _arg_1)
            {
                this._246228835woodReduceHurtMyEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtMyEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtText():LinkTextArea
        {
            return (this._200671555phyReduceHurtText);
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtProcess():UIComponent
        {
            return (this._857756348darkReduceHurtProcess);
        }

        public function set backGround2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._978655068backGround2;
            if (_local_2 !== _arg_1)
            {
                this._978655068backGround2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGround2", _local_2, _arg_1));
            };
        }

        public function ___MagicArrayPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set backGround3(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._978655067backGround3;
            if (_local_2 !== _arg_1)
            {
                this._978655067backGround3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGround3", _local_2, _arg_1));
            };
        }

        public function set backGround1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._978655069backGround1;
            if (_local_2 !== _arg_1)
            {
                this._978655069backGround1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGround1", _local_2, _arg_1));
            };
        }

        public function set backGround5(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._978655065backGround5;
            if (_local_2 !== _arg_1)
            {
                this._978655065backGround5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGround5", _local_2, _arg_1));
            };
        }

        public function __petMagicReduceHurtElementBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(4, false);
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtElementBtn():BasicGlowButton
        {
            return (this._1038120618phyReduceHurtElementBtn);
        }

        public function set backGround6(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._978655064backGround6;
            if (_local_2 !== _arg_1)
            {
                this._978655064backGround6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGround6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtMyEleText():LinkTextArea
        {
            return (this._1562233527phyReduceHurtMyEleText);
        }

        public function set backGround7(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._978655063backGround7;
            if (_local_2 !== _arg_1)
            {
                this._978655063backGround7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGround7", _local_2, _arg_1));
            };
        }

        public function set backGround4(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._978655066backGround4;
            if (_local_2 !== _arg_1)
            {
                this._978655066backGround4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGround4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtMyEleText():LinkTextArea
        {
            return (this._1302109880petPhyReduceHurtMyEleText);
        }

        public function set darkReduceHurtGoldBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._344016719darkReduceHurtGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._344016719darkReduceHurtGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtGoldBtn", _local_2, _arg_1));
            };
        }

        public function set backGround8(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._978655062backGround8;
            if (_local_2 !== _arg_1)
            {
                this._978655062backGround8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGround8", _local_2, _arg_1));
            };
        }

        public function __petMagicReduceHurtGoldBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(4, true);
        }

        public function set petPhyReduceHurtRankText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1706338480petPhyReduceHurtRankText;
            if (_local_2 !== _arg_1)
            {
                this._1706338480petPhyReduceHurtRankText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtRankText", _local_2, _arg_1));
            };
        }

        public function __idTab2_click(_arg_1:MouseEvent):void
        {
            setTab(2);
        }

        public function set goldReduceHurtElementBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._300338507goldReduceHurtElementBtn;
            if (_local_2 !== _arg_1)
            {
                this._300338507goldReduceHurtElementBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtElementBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtText():LinkTextArea
        {
            return (this._417752721woodReduceHurtText);
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtReqEleText():LinkTextArea
        {
            return (this._303115934goldReduceHurtReqEleText);
        }

        public function set woodReduceHurtRankText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1878946491woodReduceHurtRankText;
            if (_local_2 !== _arg_1)
            {
                this._1878946491woodReduceHurtRankText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtRankText", _local_2, _arg_1));
            };
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        public function __phyReduceHurtElementBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(1, false);
        }

        public function set darkReduceHurtReqGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1633076416darkReduceHurtReqGoldText;
            if (_local_2 !== _arg_1)
            {
                this._1633076416darkReduceHurtReqGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtReqGoldText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtCanvas():Canvas
        {
            return (this._1289043331lightReduceHurtCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtEffText():LinkTextArea
        {
            return (this._1912296839darkReduceHurtEffText);
        }

        public function ___MagicArrayPanel_LinkButton7_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtReqEleText():LinkTextArea
        {
            return (this._1787091320darkReduceHurtReqEleText);
        }

        public function set darkReduceHurtElementBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1789868747darkReduceHurtElementBtn;
            if (_local_2 !== _arg_1)
            {
                this._1789868747darkReduceHurtElementBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtElementBtn", _local_2, _arg_1));
            };
        }

        public function set goldReduceHurtCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1576618803goldReduceHurtCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1576618803goldReduceHurtCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtRankText():LinkTextArea
        {
            return (this._1207572068petMagicReduceHurtRankText);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtMyEleText():LinkTextArea
        {
            return (this._1985222045magicReduceHurtMyEleText);
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtProcess():UIComponent
        {
            return (this._1804127642goldReduceHurtProcess);
        }

        public function __idTab7_click(_arg_1:MouseEvent):void
        {
            setTab(7);
        }

        public function set petMagicReduceHurtText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._2120853712petMagicReduceHurtText;
            if (_local_2 !== _arg_1)
            {
                this._2120853712petMagicReduceHurtText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtText", _local_2, _arg_1));
            };
        }

        public function set petPhyReduceHurtEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._599959252petPhyReduceHurtEleText;
            if (_local_2 !== _arg_1)
            {
                this._599959252petPhyReduceHurtEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtRankText():LinkTextArea
        {
            return (this._1354581422goldReduceHurtRankText);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtRankText():LinkTextArea
        {
            return (this._681470533magicReduceHurtRankText);
        }

        private function _MagicArrayPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[0];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[1];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[2];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[3];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[4];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[41];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[42];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[6];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[5];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[7];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[10];
            _local_1 = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[11];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[12];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[13];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[14];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[15];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[16];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[17];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[18];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[30];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[21];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[22];
            _local_1 = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[11];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[12];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[13];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[14];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[15];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[16];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[17];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[18];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[30];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[19];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[20];
            _local_1 = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[11];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[12];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[13];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[14];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[15];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[16];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[17];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[18];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[30];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[23];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[24];
            _local_1 = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[11];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[12];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[13];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[14];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[15];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[16];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[17];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[18];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[30];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[35];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[37];
            _local_1 = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[11];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[12];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[13];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[14];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[15];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[16];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _core.player.yijieElement);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[44];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[30];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[36];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[38];
            _local_1 = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[11];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[12];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[13];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[14];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[15];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[16];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _core.player.yijieElement);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[44];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[30];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[28];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[39];
            _local_1 = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[11];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[12];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[13];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[14];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[15];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[16];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _core.player.yijieElement);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[44];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[30];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[25];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[40];
            _local_1 = (Language.MAGIC_ARRAY_PANEL_U[8] + Language.MAGIC_ARRAY_PANEL_U[9]);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[11];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[12];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[13];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[14];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[15];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[16];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[43].toString().replace("{num}", _core.player.yijieElement);
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[44];
            _local_1 = Language.MAGIC_ARRAY_PANEL_U[30];
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtEleText():LinkTextArea
        {
            return (this._2083148224darkReduceHurtEleText);
        }

        public function set lightReduceHurtRankText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._2113111836lightReduceHurtRankText;
            if (_local_2 !== _arg_1)
            {
                this._2113111836lightReduceHurtRankText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtRankText", _local_2, _arg_1));
            };
        }

        public function set petMagicReduceHurtMyGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._407760092petMagicReduceHurtMyGoldText;
            if (_local_2 !== _arg_1)
            {
                this._407760092petMagicReduceHurtMyGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtMyGoldText", _local_2, _arg_1));
            };
        }

        public function set magicReduceHurtReqGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1234476311magicReduceHurtReqGoldText;
            if (_local_2 !== _arg_1)
            {
                this._1234476311magicReduceHurtReqGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtReqGoldText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtGoldBtn():BasicGlowButton
        {
            return (this._1827205691petPhyReduceHurtGoldBtn);
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtReqEleText():LinkTextArea
        {
            return (this._1516359216petMagicReduceHurtReqEleText);
        }

        public function set phyReduceHurtEffText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._804680996phyReduceHurtEffText;
            if (_local_2 !== _arg_1)
            {
                this._804680996phyReduceHurtEffText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtEffText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtEffText():LinkTextArea
        {
            return (this._279213533goldReduceHurtEffText);
        }

        public function set petPhyReduceHurtMyGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._357119728petPhyReduceHurtMyGoldText;
            if (_local_2 !== _arg_1)
            {
                this._357119728petPhyReduceHurtMyGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtMyGoldText", _local_2, _arg_1));
            };
        }

        public function set woodReduceHurtProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._1642640659woodReduceHurtProcess;
            if (_local_2 !== _arg_1)
            {
                this._1642640659woodReduceHurtProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtMyEleText():LinkTextArea
        {
            return (this._1439023652petMagicReduceHurtMyEleText);
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtText():LinkTextArea
        {
            return (this._2082795036petPhyReduceHurtText);
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtText():LinkTextArea
        {
            return (this._112861726goldReduceHurtText);
        }

        public function set idTab0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1193955594idTab0;
            if (_local_2 !== _arg_1)
            {
                this._1193955594idTab0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTab0", _local_2, _arg_1));
            };
        }

        public function set idTab1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1193955593idTab1;
            if (_local_2 !== _arg_1)
            {
                this._1193955593idTab1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTab1", _local_2, _arg_1));
            };
        }

        public function __phyReduceHurtGoldBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(1, true);
        }

        public function set idTab2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1193955592idTab2;
            if (_local_2 !== _arg_1)
            {
                this._1193955592idTab2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTab2", _local_2, _arg_1));
            };
        }

        public function set idTab4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1193955590idTab4;
            if (_local_2 !== _arg_1)
            {
                this._1193955590idTab4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTab4", _local_2, _arg_1));
            };
        }

        public function set idTab5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1193955589idTab5;
            if (_local_2 !== _arg_1)
            {
                this._1193955589idTab5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTab5", _local_2, _arg_1));
            };
        }

        public function set idTab6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1193955588idTab6;
            if (_local_2 !== _arg_1)
            {
                this._1193955588idTab6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTab6", _local_2, _arg_1));
            };
        }

        public function set idTab7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1193955587idTab7;
            if (_local_2 !== _arg_1)
            {
                this._1193955587idTab7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTab7", _local_2, _arg_1));
            };
        }

        public function set idTab3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1193955591idTab3;
            if (_local_2 !== _arg_1)
            {
                this._1193955591idTab3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTab3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtGoldBtn():BasicGlowButton
        {
            return (this._1233972742phyReduceHurtGoldBtn);
        }

        public function ___MagicArrayPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtReqGoldText():LinkTextArea
        {
            return (this._1824876009woodReduceHurtReqGoldText);
        }

        public function set goldReduceHurtGoldBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1977100025goldReduceHurtGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._1977100025goldReduceHurtGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtGoldBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtEleText():LinkTextArea
        {
            return (this._450064918goldReduceHurtEleText);
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtReqGoldText():LinkTextArea
        {
            return (this._1261160982goldReduceHurtReqGoldText);
        }

        public function set phyReduceHurtMyGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._883221263phyReduceHurtMyGoldText;
            if (_local_2 !== _arg_1)
            {
                this._883221263phyReduceHurtMyGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtMyGoldText", _local_2, _arg_1));
            };
        }

        public function __idTab1_click(_arg_1:MouseEvent):void
        {
            setTab(1);
        }

        public function set lightReduceHurtGoldBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._959080209lightReduceHurtGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._959080209lightReduceHurtGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtGoldBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtMyGoldText():LinkTextArea
        {
            return (this._2062404132lightReduceHurtMyGoldText);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtReqEleText():LinkTextArea
        {
            return (this._1556042287magicReduceHurtReqEleText);
        }

        public function set lightReduceHurtReqEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._138284824lightReduceHurtReqEleText;
            if (_local_2 !== _arg_1)
            {
                this._138284824lightReduceHurtReqEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtReqEleText", _local_2, _arg_1));
            };
        }

        public function set woodReduceHurtCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1775878426woodReduceHurtCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1775878426woodReduceHurtCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtCanvas", _local_2, _arg_1));
            };
        }

        private function loadCompleteLvse(_arg_1:Event):void
        {
            var _local_2:Class = (loadLvse.contentLoaderInfo.applicationDomain.getDefinition("lvse") as Class);
            petMagicReduceHurtMC = (new (_local_2)() as MovieClip);
            petMagicReduceHurtProcess.addChild(petMagicReduceHurtMC);
            petMagicReduceHurtMC.gotoAndStop(0);
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtMyGoldText():LinkTextArea
        {
            return (this._1270306245woodReduceHurtMyGoldText);
        }

        public function ___MagicArrayPanel_LinkButton6_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set lightReduceHurtReqGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._2059682592lightReduceHurtReqGoldText;
            if (_local_2 !== _arg_1)
            {
                this._2059682592lightReduceHurtReqGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtReqGoldText", _local_2, _arg_1));
            };
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            var _local_2:BagPanel;
            var _local_3:Boolean;
            if (_arg_1)
            {
                _local_2 = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                _local_3 = _local_2.goldLockFlag;
                if (((!(_local_3 == false)) && (_local_2)))
                {
                    _local_2.goldLockFlag = false;
                };
            };
        }

        public function set petMagicReduceHurtElementBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1513581789petMagicReduceHurtElementBtn;
            if (_local_2 !== _arg_1)
            {
                this._1513581789petMagicReduceHurtElementBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtElementBtn", _local_2, _arg_1));
            };
        }

        public function set phyReduceHurtEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._633829611phyReduceHurtEleText;
            if (_local_2 !== _arg_1)
            {
                this._633829611phyReduceHurtEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtProcess():UIComponent
        {
            return (this._1954021976petPhyReduceHurtProcess);
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtGoldBtn():BasicGlowButton
        {
            return (this._1128901030woodReduceHurtGoldBtn);
        }

        public function set woodReduceHurtEffText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1127412528woodReduceHurtEffText;
            if (_local_2 !== _arg_1)
            {
                this._1127412528woodReduceHurtEffText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtEffText", _local_2, _arg_1));
            };
        }

        public function set darkReduceHurtMyEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1886650060darkReduceHurtMyEleText;
            if (_local_2 !== _arg_1)
            {
                this._1886650060darkReduceHurtMyEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtMyEleText", _local_2, _arg_1));
            };
        }

        public function __idTab6_click(_arg_1:MouseEvent):void
        {
            setTab(6);
        }

        public function set petPhyReduceHurtElementBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1564222153petPhyReduceHurtElementBtn;
            if (_local_2 !== _arg_1)
            {
                this._1564222153petPhyReduceHurtElementBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtElementBtn", _local_2, _arg_1));
            };
        }

        public function set magicReduceHurtMyGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._814805701magicReduceHurtMyGoldText;
            if (_local_2 !== _arg_1)
            {
                this._814805701magicReduceHurtMyGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtMyGoldText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtText():LinkTextArea
        {
            return (this._11611768darkReduceHurtText);
        }

        public function set woodReduceHurtReqEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1100541743woodReduceHurtReqEleText;
            if (_local_2 !== _arg_1)
            {
                this._1100541743woodReduceHurtReqEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtReqEleText", _local_2, _arg_1));
            };
        }

        public function set phyReduceHurtText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._200671555phyReduceHurtText;
            if (_local_2 !== _arg_1)
            {
                this._200671555phyReduceHurtText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtText", _local_2, _arg_1));
            };
        }

        public function set darkReduceHurtProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._857756348darkReduceHurtProcess;
            if (_local_2 !== _arg_1)
            {
                this._857756348darkReduceHurtProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtProcess", _local_2, _arg_1));
            };
        }

        public function set darkReduceHurtRankText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._440556356darkReduceHurtRankText;
            if (_local_2 !== _arg_1)
            {
                this._440556356darkReduceHurtRankText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtRankText", _local_2, _arg_1));
            };
        }

        public function set petPhyReduceHurtMyEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1302109880petPhyReduceHurtMyEleText;
            if (_local_2 !== _arg_1)
            {
                this._1302109880petPhyReduceHurtMyEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtMyEleText", _local_2, _arg_1));
            };
        }

        public function set phyReduceHurtMyEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1562233527phyReduceHurtMyEleText;
            if (_local_2 !== _arg_1)
            {
                this._1562233527phyReduceHurtMyEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtMyEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtEffText():LinkTextArea
        {
            return (this._429107867petPhyReduceHurtEffText);
        }

        public function __magicReduceHurtElementBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(3, false);
        }

        public function set phyReduceHurtElementBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1038120618phyReduceHurtElementBtn;
            if (_local_2 !== _arg_1)
            {
                this._1038120618phyReduceHurtElementBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtElementBtn", _local_2, _arg_1));
            };
        }

        public function set petMagicReduceHurtGoldBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._711196505petMagicReduceHurtGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._711196505petMagicReduceHurtGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtGoldBtn", _local_2, _arg_1));
            };
        }

        public function __petPhyReduceHurtGoldBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(2, true);
        }

        [Bindable(event="propertyChange")]
        public function get goldReduceHurtElementBtn():BasicGlowButton
        {
            return (this._300338507goldReduceHurtElementBtn);
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        public function __lightReduceHurtGoldBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(7, true);
        }

        public function set magicReduceHurtGoldBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._451072858magicReduceHurtGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._451072858magicReduceHurtGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtGoldBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtProcess():UIComponent
        {
            return (this._720233113phyReduceHurtProcess);
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtElementBtn():BasicGlowButton
        {
            return (this._1789868747darkReduceHurtElementBtn);
        }

        public function set woodReduceHurtEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1298263913woodReduceHurtEleText;
            if (_local_2 !== _arg_1)
            {
                this._1298263913woodReduceHurtEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtEleText():LinkTextArea
        {
            return (this._599959252petPhyReduceHurtEleText);
        }

        public function set petMagicReduceHurtReqGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1989642392petMagicReduceHurtReqGoldText;
            if (_local_2 !== _arg_1)
            {
                this._1989642392petMagicReduceHurtReqGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtReqGoldText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtRankText():LinkTextArea
        {
            return (this._1878946491woodReduceHurtRankText);
        }

        public function set woodReduceHurtText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._417752721woodReduceHurtText;
            if (_local_2 !== _arg_1)
            {
                this._417752721woodReduceHurtText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtText", _local_2, _arg_1));
            };
        }

        public function __idTab0_click(_arg_1:MouseEvent):void
        {
            setTab(0);
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtEffText():LinkTextArea
        {
            return (this._804680996phyReduceHurtEffText);
        }

        public function set goldReduceHurtReqEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._303115934goldReduceHurtReqEleText;
            if (_local_2 !== _arg_1)
            {
                this._303115934goldReduceHurtReqEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtReqEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtReqGoldText():LinkTextArea
        {
            return (this._1234476311magicReduceHurtReqGoldText);
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtProcess():UIComponent
        {
            return (this._1642640659woodReduceHurtProcess);
        }

        public function ___MagicArrayPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function __darkReduceHurtElementBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(8, false);
        }

        [Bindable(event="propertyChange")]
        public function get idTab0():BasicGlowButton
        {
            return (this._1193955594idTab0);
        }

        public function set darkReduceHurtReqEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1787091320darkReduceHurtReqEleText;
            if (_local_2 !== _arg_1)
            {
                this._1787091320darkReduceHurtReqEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtReqEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idTab4():BasicGlowButton
        {
            return (this._1193955590idTab4);
        }

        [Bindable(event="propertyChange")]
        public function get idTab5():BasicGlowButton
        {
            return (this._1193955589idTab5);
        }

        [Bindable(event="propertyChange")]
        public function get idTab6():BasicGlowButton
        {
            return (this._1193955588idTab6);
        }

        [Bindable(event="propertyChange")]
        public function get idTab7():BasicGlowButton
        {
            return (this._1193955587idTab7);
        }

        [Bindable(event="propertyChange")]
        public function get idTab2():BasicGlowButton
        {
            return (this._1193955592idTab2);
        }

        [Bindable(event="propertyChange")]
        public function get idTab3():BasicGlowButton
        {
            return (this._1193955591idTab3);
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtMyGoldText():LinkTextArea
        {
            return (this._357119728petPhyReduceHurtMyGoldText);
        }

        public function set darkReduceHurtEffText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1912296839darkReduceHurtEffText;
            if (_local_2 !== _arg_1)
            {
                this._1912296839darkReduceHurtEffText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtEffText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idTab1():BasicGlowButton
        {
            return (this._1193955593idTab1);
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtGoldBtn():BasicGlowButton
        {
            return (this._959080209lightReduceHurtGoldBtn);
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtReqEleText():LinkTextArea
        {
            return (this._138284824lightReduceHurtReqEleText);
        }

        public function ___MagicArrayPanel_LinkButton5_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set magicReduceHurtElementBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1558819714magicReduceHurtElementBtn;
            if (_local_2 !== _arg_1)
            {
                this._1558819714magicReduceHurtElementBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtElementBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtReqGoldText():LinkTextArea
        {
            return (this._2059682592lightReduceHurtReqGoldText);
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtMyGoldText():LinkTextArea
        {
            return (this._883221263phyReduceHurtMyGoldText);
        }

        public function set lightReduceHurtCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1289043331lightReduceHurtCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1289043331lightReduceHurtCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtElementBtn():BasicGlowButton
        {
            return (this._1513581789petMagicReduceHurtElementBtn);
        }

        public function set lightReduceHurtMyEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._554014612lightReduceHurtMyEleText;
            if (_local_2 !== _arg_1)
            {
                this._554014612lightReduceHurtMyEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtMyEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtEffText():LinkTextArea
        {
            return (this._1127412528woodReduceHurtEffText);
        }

        public function set phyReduceHurtReqGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._135247979phyReduceHurtReqGoldText;
            if (_local_2 !== _arg_1)
            {
                this._135247979phyReduceHurtReqGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtReqGoldText", _local_2, _arg_1));
            };
        }

        public function __idTab5_click(_arg_1:MouseEvent):void
        {
            setTab(5);
        }

        public function set goldReduceHurtProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._1804127642goldReduceHurtProcess;
            if (_local_2 !== _arg_1)
            {
                this._1804127642goldReduceHurtProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtReqEleText():LinkTextArea
        {
            return (this._1100541743woodReduceHurtReqEleText);
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtEleText():LinkTextArea
        {
            return (this._633829611phyReduceHurtEleText);
        }

        public function set petMagicReduceHurtRankText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1207572068petMagicReduceHurtRankText;
            if (_local_2 !== _arg_1)
            {
                this._1207572068petMagicReduceHurtRankText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtRankText", _local_2, _arg_1));
            };
        }

        public function set lightReduceHurtProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._445340580lightReduceHurtProcess;
            if (_local_2 !== _arg_1)
            {
                this._445340580lightReduceHurtProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtRankText():LinkTextArea
        {
            return (this._440556356darkReduceHurtRankText);
        }

        public function set magicReduceHurtMyEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1985222045magicReduceHurtMyEleText;
            if (_local_2 !== _arg_1)
            {
                this._1985222045magicReduceHurtMyEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtMyEleText", _local_2, _arg_1));
            };
        }

        public function onGetMagicArrayData(_arg_1:Object):void
        {
            updatePraView(_arg_1);
            var _local_2:Number = Number(_arg_1.praType);
            if (_local_2 == 1)
            {
                vs.selectedChild = phyReduceHurtCanvas;
            }
            else
            {
                if (_local_2 == 2)
                {
                    vs.selectedChild = petPhyReduceHurtCanvas;
                }
                else
                {
                    if (_local_2 == 3)
                    {
                        vs.selectedChild = magicReduceHurtCanvas;
                    }
                    else
                    {
                        if (_local_2 == 4)
                        {
                            vs.selectedChild = petMagicReduceHurtCanvas;
                        }
                        else
                        {
                            if (_local_2 == 5)
                            {
                                vs.selectedChild = goldReduceHurtCanvas;
                            }
                            else
                            {
                                if (_local_2 == 6)
                                {
                                    vs.selectedChild = woodReduceHurtCanvas;
                                }
                                else
                                {
                                    if (_local_2 == 7)
                                    {
                                        vs.selectedChild = lightReduceHurtCanvas;
                                    }
                                    else
                                    {
                                        if (_local_2 == 8)
                                        {
                                            vs.selectedChild = darkReduceHurtCanvas;
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtGoldBtn():BasicGlowButton
        {
            return (this._711196505petMagicReduceHurtGoldBtn);
        }

        public function set goldReduceHurtRankText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1354581422goldReduceHurtRankText;
            if (_local_2 !== _arg_1)
            {
                this._1354581422goldReduceHurtRankText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtRankText", _local_2, _arg_1));
            };
        }

        public function __goldReduceHurtElementBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(5, false);
        }

        [Bindable(event="propertyChange")]
        public function get magicReduceHurtGoldBtn():BasicGlowButton
        {
            return (this._451072858magicReduceHurtGoldBtn);
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtReqGoldText():LinkTextArea
        {
            return (this._1989642392petMagicReduceHurtReqGoldText);
        }

        [Bindable(event="propertyChange")]
        public function get woodReduceHurtEleText():LinkTextArea
        {
            return (this._1298263913woodReduceHurtEleText);
        }

        public function set stExp1(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._893312075stExp1;
            if (_local_2 !== _arg_1)
            {
                this._893312075stExp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp1", _local_2, _arg_1));
            };
        }

        public function set stExp2(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._893312074stExp2;
            if (_local_2 !== _arg_1)
            {
                this._893312074stExp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp2", _local_2, _arg_1));
            };
        }

        public function set stExp6(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._893312070stExp6;
            if (_local_2 !== _arg_1)
            {
                this._893312070stExp6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp6", _local_2, _arg_1));
            };
        }

        public function set stExp3(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._893312073stExp3;
            if (_local_2 !== _arg_1)
            {
                this._893312073stExp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp3", _local_2, _arg_1));
            };
        }

        public function set magicReduceHurtRankText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._681470533magicReduceHurtRankText;
            if (_local_2 !== _arg_1)
            {
                this._681470533magicReduceHurtRankText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicReduceHurtRankText", _local_2, _arg_1));
            };
        }

        public function set stExp4(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._893312072stExp4;
            if (_local_2 !== _arg_1)
            {
                this._893312072stExp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp4", _local_2, _arg_1));
            };
        }

        public function set stExp8(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._893312068stExp8;
            if (_local_2 !== _arg_1)
            {
                this._893312068stExp8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp8", _local_2, _arg_1));
            };
        }

        public function set stExp5(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._893312071stExp5;
            if (_local_2 !== _arg_1)
            {
                this._893312071stExp5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp5", _local_2, _arg_1));
            };
        }

        public function set stExp7(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._893312069stExp7;
            if (_local_2 !== _arg_1)
            {
                this._893312069stExp7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp7", _local_2, _arg_1));
            };
        }

        private function loadCompleteHuangse(_arg_1:Event):void
        {
            var _local_2:Class = (loadHuangse.contentLoaderInfo.applicationDomain.getDefinition("huangse") as Class);
            petPhyReduceHurtMC = (new (_local_2)() as MovieClip);
            petPhyReduceHurtProcess.addChild(petPhyReduceHurtMC);
            petPhyReduceHurtMC.gotoAndStop(0);
        }

        public function addPracticeExp(praType:Number, isGold:Boolean):*
        {
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var gfunc:Function;
            if (isGold)
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                goldLockFlag = bagPanel.goldLockFlag;
                if (((goldLockFlag) || (!(bagPanel))))
                {
                    _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                    gfunc = function (_arg_1:String):void
                    {
                        _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                    return;
                };
            };
            _core.remote.call("addPracticeExp", null, praType, isGold);
        }

        public function set darkReduceHurtEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._2083148224darkReduceHurtEleText;
            if (_local_2 !== _arg_1)
            {
                this._2083148224darkReduceHurtEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtEleText", _local_2, _arg_1));
            };
        }

        private function loadCompleteWood(_arg_1:Event):void
        {
            var _local_2:Class = (loadWood.contentLoaderInfo.applicationDomain.getDefinition("muzhen") as Class);
            woodReduceHurtMC = (new (_local_2)() as MovieClip);
            woodReduceHurtProcess.addChild(woodReduceHurtMC);
            woodReduceHurtMC.gotoAndStop(0);
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.MAGIC_ARRAY_PANEL_U[31].toString();
            _helpAlert = Alert.show(_local_1, Language.MAGIC_ARRAY_PANEL_U[31].toString(), Alert.YES, null, null);
        }

        override public function initialize():void
        {
            var target:MagicArrayPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MagicArrayPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MagicArrayPanelWatcherSetupUtil");
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
        public function get magicReduceHurtElementBtn():BasicGlowButton
        {
            return (this._1558819714magicReduceHurtElementBtn);
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtReqGoldText():LinkTextArea
        {
            return (this._135247979phyReduceHurtReqGoldText);
        }

        public function __woodReduceHurtElementBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(6, false);
        }

        public function set petPhyReduceHurtGoldBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1827205691petPhyReduceHurtGoldBtn;
            if (_local_2 !== _arg_1)
            {
                this._1827205691petPhyReduceHurtGoldBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtGoldBtn", _local_2, _arg_1));
            };
        }

        public function __woodReduceHurtGoldBtn_click(_arg_1:MouseEvent):void
        {
            addPracticeExp(6, true);
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtMyEleText():LinkTextArea
        {
            return (this._554014612lightReduceHurtMyEleText);
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtProcess():UIComponent
        {
            return (this._445340580lightReduceHurtProcess);
        }

        private function setProcess(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int = int(int(((100 * _arg_2) / _arg_3)));
            if (_arg_1 == 1)
            {
                if (((_local_4 >= 0) && (_local_4 <= 100)))
                {
                    if (phyReduceHurtMC)
                    {
                        phyReduceHurtMC.gotoAndStop(_local_4);
                    };
                };
            }
            else
            {
                if (_arg_1 == 2)
                {
                    if (((_local_4 >= 0) && (_local_4 <= 100)))
                    {
                        if (petPhyReduceHurtMC)
                        {
                            petPhyReduceHurtMC.gotoAndStop(_local_4);
                        };
                    };
                }
                else
                {
                    if (_arg_1 == 3)
                    {
                        if (((_local_4 >= 0) && (_local_4 <= 100)))
                        {
                            if (magicReduceHurtMC)
                            {
                                magicReduceHurtMC.gotoAndStop(_local_4);
                            };
                        };
                    }
                    else
                    {
                        if (_arg_1 == 4)
                        {
                            if (((_local_4 >= 0) && (_local_4 <= 100)))
                            {
                                if (petMagicReduceHurtMC)
                                {
                                    petMagicReduceHurtMC.gotoAndStop(_local_4);
                                };
                            };
                        }
                        else
                        {
                            if (_arg_1 == 5)
                            {
                                if (((_local_4 >= 0) && (_local_4 <= 100)))
                                {
                                    if (goldReduceHurtMC)
                                    {
                                        goldReduceHurtMC.gotoAndStop(_local_4);
                                    };
                                };
                            }
                            else
                            {
                                if (_arg_1 == 6)
                                {
                                    if (((_local_4 >= 0) && (_local_4 <= 100)))
                                    {
                                        if (woodReduceHurtMC)
                                        {
                                            woodReduceHurtMC.gotoAndStop(_local_4);
                                        };
                                    };
                                }
                                else
                                {
                                    if (_arg_1 == 7)
                                    {
                                        if (((_local_4 >= 0) && (_local_4 <= 100)))
                                        {
                                            if (lightReduceHurtMC)
                                            {
                                                lightReduceHurtMC.gotoAndStop(_local_4);
                                            };
                                        };
                                    }
                                    else
                                    {
                                        if (_arg_1 == 8)
                                        {
                                            if (((_local_4 >= 0) && (_local_4 <= 100)))
                                            {
                                                if (darkReduceHurtMC)
                                                {
                                                    darkReduceHurtMC.gotoAndStop(_local_4);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function set petMagicReduceHurtReqEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1516359216petMagicReduceHurtReqEleText;
            if (_local_2 !== _arg_1)
            {
                this._1516359216petMagicReduceHurtReqEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtReqEleText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stExp1():ScrollTextArrCanvas
        {
            return (this._893312075stExp1);
        }

        public function set petMagicReduceHurtMyEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1439023652petMagicReduceHurtMyEleText;
            if (_local_2 !== _arg_1)
            {
                this._1439023652petMagicReduceHurtMyEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtMyEleText", _local_2, _arg_1));
            };
        }

        public function set goldReduceHurtEffText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._279213533goldReduceHurtEffText;
            if (_local_2 !== _arg_1)
            {
                this._279213533goldReduceHurtEffText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtEffText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stExp7():ScrollTextArrCanvas
        {
            return (this._893312069stExp7);
        }

        [Bindable(event="propertyChange")]
        public function get stExp8():ScrollTextArrCanvas
        {
            return (this._893312068stExp8);
        }

        [Bindable(event="propertyChange")]
        public function get stExp4():ScrollTextArrCanvas
        {
            return (this._893312072stExp4);
        }

        public function set petPhyReduceHurtReqGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._735473620petPhyReduceHurtReqGoldText;
            if (_local_2 !== _arg_1)
            {
                this._735473620petPhyReduceHurtReqGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtReqGoldText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stExp6():ScrollTextArrCanvas
        {
            return (this._893312070stExp6);
        }

        public function set goldReduceHurtText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._112861726goldReduceHurtText;
            if (_local_2 !== _arg_1)
            {
                this._112861726goldReduceHurtText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldReduceHurtText", _local_2, _arg_1));
            };
        }

        public function set darkReduceHurtCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._2078291939darkReduceHurtCanvas;
            if (_local_2 !== _arg_1)
            {
                this._2078291939darkReduceHurtCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkReduceHurtCanvas", _local_2, _arg_1));
            };
        }

        public function set petPhyReduceHurtReqEleText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1566999580petPhyReduceHurtReqEleText;
            if (_local_2 !== _arg_1)
            {
                this._1566999580petPhyReduceHurtReqEleText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtReqEleText", _local_2, _arg_1));
            };
        }

        public function ___MagicArrayPanel_LinkButton4_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set lightReduceHurtEffText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1079573529lightReduceHurtEffText;
            if (_local_2 !== _arg_1)
            {
                this._1079573529lightReduceHurtEffText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightReduceHurtEffText", _local_2, _arg_1));
            };
        }

        public function set petPhyReduceHurtText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._2082795036petPhyReduceHurtText;
            if (_local_2 !== _arg_1)
            {
                this._2082795036petPhyReduceHurtText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPhyReduceHurtText", _local_2, _arg_1));
            };
        }

        public function setTab(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < tabPageNum)
            {
                this[("idTab" + _local_2)].selected = false;
                _local_2++;
            };
            this[("idTab" + _arg_1)].selected = true;
            _core.remote.call("getMagicArrayData", new Responder(onGetMagicArrayData), (_arg_1 + 1));
        }

        override public function initView():void
        {
            loadMagicSwf();
        }

        public function set petMagicReduceHurtProcess(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._197456876petMagicReduceHurtProcess;
            if (_local_2 !== _arg_1)
            {
                this._197456876petMagicReduceHurtProcess = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petMagicReduceHurtProcess", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stExp3():ScrollTextArrCanvas
        {
            return (this._893312073stExp3);
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtReqGoldText():LinkTextArea
        {
            return (this._735473620petPhyReduceHurtReqGoldText);
        }

        public function set phyReduceHurtCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._918846482phyReduceHurtCanvas;
            if (_local_2 !== _arg_1)
            {
                this._918846482phyReduceHurtCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "phyReduceHurtCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get darkReduceHurtCanvas():Canvas
        {
            return (this._2078291939darkReduceHurtCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get petPhyReduceHurtReqEleText():LinkTextArea
        {
            return (this._1566999580petPhyReduceHurtReqEleText);
        }

        [Bindable(event="propertyChange")]
        public function get stExp5():ScrollTextArrCanvas
        {
            return (this._893312071stExp5);
        }

        [Bindable(event="propertyChange")]
        public function get lightReduceHurtEffText():LinkTextArea
        {
            return (this._1079573529lightReduceHurtEffText);
        }

        [Bindable(event="propertyChange")]
        public function get phyReduceHurtCanvas():Canvas
        {
            return (this._918846482phyReduceHurtCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get stExp2():ScrollTextArrCanvas
        {
            return (this._893312074stExp2);
        }

        [Bindable(event="propertyChange")]
        public function get petMagicReduceHurtProcess():UIComponent
        {
            return (this._197456876petMagicReduceHurtProcess);
        }

        public function __idTab4_click(_arg_1:MouseEvent):void
        {
            setTab(4);
        }

        public function set woodReduceHurtReqGoldText(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1824876009woodReduceHurtReqGoldText;
            if (_local_2 !== _arg_1)
            {
                this._1824876009woodReduceHurtReqGoldText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "woodReduceHurtReqGoldText", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

