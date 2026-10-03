// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.LottoPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.containers.HBox;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.effects.Glow;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.MultiLineButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.game.config.Language;
    import mx.utils.ObjectUtil;
    import flash.utils.setTimeout;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.comp.Slot;
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

    public class LottoPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3236049img4:Image;
        private var _881418178tabBar:HBox;
        private var _2113292177slot3_9:ItemSlot;
        private var _2113295066slot0_3:ItemSlot;
        private var _1087607829slot1_10:ItemSlot;
        private var _2113294106slot1_2:ItemSlot;
        private var _1087607825slot1_14:ItemSlot;
        private var _3034455btn3:BasicGlowButton;
        private var _100348227info1:LinkTextArea;
        private var _2113293145slot2_2:ItemSlot;
        private var _1087548245slot3_12:ItemSlot;
        private var _1087548241slot3_16:ItemSlot;
        private var _2113292184slot3_2:ItemSlot;
        private var _207684226glowEffect:Glow;
        private var _3236048img3:Image;
        private var _2113295062slot0_7:ItemSlot;
        private var _1087637619slot0_11:ItemSlot;
        private var _1087637615slot0_15:ItemSlot;
        private var flashPlayType:int;
        public var _LottoPanel_BoxLabel1:BoxLabel;
        private var _2113294102slot1_6:ItemSlot;
        private var _2113294099slot1_9:ItemSlot;
        private var _3034454btn2:BasicGlowButton;
        private var _456972407bestAward0:LinkTextArea;
        private var _2113293139slot2_8:ItemSlot;
        private var _1087578035slot2_13:ItemSlot;
        private var _2113293141slot2_6:ItemSlot;
        private var _1087578031slot2_17:ItemSlot;
        private var _100348228info2:LinkTextArea;
        private var _2113295067slot0_2:ItemSlot;
        private var _2113292178slot3_8:ItemSlot;
        private var _2113292180slot3_6:ItemSlot;
        private var _2113294107slot1_1:ItemSlot;
        private var _3236047img2:Image;
        private var _1087607828slot1_11:ItemSlot;
        private var _1087607824slot1_15:ItemSlot;
        private var _2113293146slot2_1:ItemSlot;
        private var _3034453btn1:BasicGlowButton;
        private var _1087548244slot3_13:ItemSlot;
        private var _2113292185slot3_1:ItemSlot;
        private var _1087548240slot3_17:ItemSlot;
        private var _100348229info3:LinkTextArea;
        private var _2113295063slot0_6:ItemSlot;
        private var _3236046img1:Image;
        private var _2113294103slot1_5:ItemSlot;
        private var _1087637618slot0_12:ItemSlot;
        private var _1087637614slot0_16:ItemSlot;
        private var _2113293142slot2_5:ItemSlot;
        private var _3034452btn0:BasicGlowButton;
        public var _LottoPanel_BasicGlowButton6:BasicGlowButton;
        public var _LottoPanel_BasicGlowButton7:BasicGlowButton;
        public var _LottoPanel_BasicGlowButton8:BasicGlowButton;
        private var _1666736608lottoBagBtn:BasicGlowButton;
        private var _2113295068slot0_1:ItemSlot;
        private var _2113292179slot3_7:ItemSlot;
        private var _1087578034slot2_14:ItemSlot;
        private var _2113292181slot3_5:ItemSlot;
        private var _1087578038slot2_10:ItemSlot;
        private var _836523086vStack:ViewStack;
        private var _2113294108slot1_0:ItemSlot;
        private var _2113293147slot2_0:ItemSlot;
        public var _LottoPanel_Image3:Image;
        public var _LottoPanel_Image5:Image;
        public var _LottoPanel_Image7:Image;
        public var _LottoPanel_Image1:Image;
        private var _1087607827slot1_12:ItemSlot;
        private var _1087607823slot1_16:ItemSlot;
        private var _2113292186slot3_0:ItemSlot;
        private var _456972409bestAward2:LinkTextArea;
        private var _94078750lottoBagLength:BasicTxtButton;
        private var _1087548247slot3_10:ItemSlot;
        private var _2113295064slot0_5:ItemSlot;
        private var _1087548243slot3_14:ItemSlot;
        private var _2113294104slot1_4:ItemSlot;
        private var _81207RL1:RoundedLabel;
        private var _2113293143slot2_4:ItemSlot;
        private var _1087637617slot0_13:ItemSlot;
        private var _1087637613slot0_17:ItemSlot;
        private var _2113295069slot0_0:ItemSlot;
        private var _1087637620slot0_10:ItemSlot;
        private var wishDelayFlag:Boolean = true;
        private var _2113292182slot3_4:ItemSlot;
        public var _LottoPanel_BasicTxtButton1:BasicTxtButton;
        public var _LottoPanel_BasicTxtButton2:BasicTxtButton;
        private var _1087578033slot2_15:ItemSlot;
        private var _456972410bestAward3:LinkTextArea;
        private var _2113295060slot0_9:ItemSlot;
        private var _1087578037slot2_11:ItemSlot;
        private var _81208RL2:RoundedLabel;
        public var _LottoPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2113294100slot1_8:ItemSlot;
        private var _1491390272myLotto:LinkTextArea;
        private var _1087607826slot1_13:ItemSlot;
        private var _1087607822slot1_17:ItemSlot;
        private var _100348230info4:LinkTextArea;
        private var _2113295065slot0_4:ItemSlot;
        private var _2113294105slot1_3:ItemSlot;
        private var _1087548246slot3_11:ItemSlot;
        private var _1087548242slot3_15:ItemSlot;
        private var _2113293144slot2_3:ItemSlot;
        private var _1735837999superLotto:LinkTextArea;
        private var _456972408bestAward1:LinkTextArea;
        public var _LottoPanel_MultiLineButton2:MultiLineButton;
        public var _LottoPanel_MultiLineButton3:MultiLineButton;
        public var _LottoPanel_MultiLineButton4:MultiLineButton;
        public var _LottoPanel_MultiLineButton5:MultiLineButton;
        public var _LottoPanel_MultiLineButton6:MultiLineButton;
        public var _LottoPanel_MultiLineButton7:MultiLineButton;
        public var _LottoPanel_MultiLineButton8:MultiLineButton;
        public var _LottoPanel_MultiLineButton9:MultiLineButton;
        private var _1538251469freeWish:MultiLineButton;
        private var _2113292183slot3_3:ItemSlot;
        private var _1087637616slot0_14:ItemSlot;
        private var _2113295061slot0_8:ItemSlot;
        private var _1087578032slot2_16:ItemSlot;
        private var _2113294101slot1_7:ItemSlot;
        private var _1087578036slot2_12:ItemSlot;
        private var _2113293138slot2_9:ItemSlot;
        private var _2113293140slot2_7:ItemSlot;
        public var _LottoPanel_MultiLineButton10:MultiLineButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":600,
                    "height":424,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_LottoPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"tabBar",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":39,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn0",
                                    "events":{"click":"__btn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":70
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn3",
                                    "events":{"click":"__btn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":70,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn1",
                                    "events":{"click":"__btn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":70,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn2",
                                    "events":{"click":"__btn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":70,
                                            "visible":false
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
                                "x":15,
                                "y":60,
                                "width":570,
                                "height":340,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vStack",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":25,
                                            "width":380,
                                            "height":300,
                                            "styleName":"",
                                            "selectedIndex":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "label":"View 1",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_LottoPanel_Image1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":5,
                                                                    "y":5,
                                                                    "percentWidth":100,
                                                                    "height":295,
                                                                    "alpha":0.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"info1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundColor = 0;
                                                                this.backgroundAlpha = 0.5;
                                                                this.borderStyle = "none";
                                                                this.top = "10";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "selectable":false,
                                                                    "x":10,
                                                                    "width":360,
                                                                    "percentHeight":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":20,
                                                                    "y":90,
                                                                    "width":110,
                                                                    "height":110,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
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
                                                                    "x":139,
                                                                    "y":93,
                                                                    "styleName":"CSSBorder",
                                                                    "width":102,
                                                                    "height":102,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":1,
                                                                                "y":1
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
                                                                    "x":250,
                                                                    "y":90,
                                                                    "width":110,
                                                                    "height":110,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_16",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot0_17",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"bestAward0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":37,
                                                                    "y":200,
                                                                    "height":25,
                                                                    "width":300
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"freeWish",
                                                            "events":{"click":"__freeWish_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishOneTime",
                                                                    "x":140,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
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
                                                        "label":"View 2",
                                                        "percentWidth":100,
                                                        "height":295,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_LottoPanel_Image3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":380,
                                                                    "height":290,
                                                                    "alpha":0.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"info2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundColor = 0;
                                                                this.backgroundAlpha = 0.5;
                                                                this.borderStyle = "none";
                                                                this.top = "10";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "selectable":false,
                                                                    "x":10,
                                                                    "width":360,
                                                                    "percentHeight":26
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":20,
                                                                    "y":90,
                                                                    "width":110,
                                                                    "height":110,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false,
                                                                                "height":28
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
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
                                                                    "x":138,
                                                                    "y":92,
                                                                    "width":102,
                                                                    "height":102,
                                                                    "styleName":"CSSBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":1,
                                                                                "y":1
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
                                                                    "x":250,
                                                                    "y":90,
                                                                    "width":110,
                                                                    "height":110,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_16",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1_17",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"bestAward1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":37,
                                                                    "y":200,
                                                                    "width":333,
                                                                    "height":25
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton2",
                                                            "events":{"click":"___LottoPanel_MultiLineButton2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishOneTime",
                                                                    "x":32,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton3",
                                                            "events":{"click":"___LottoPanel_MultiLineButton3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishFiveTime",
                                                                    "x":140,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton4",
                                                            "events":{"click":"___LottoPanel_MultiLineButton4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishTenTime",
                                                                    "x":248,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
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
                                                        "label":"View 3",
                                                        "percentWidth":100,
                                                        "height":295,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_LottoPanel_Image5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":380,
                                                                    "height":290,
                                                                    "alpha":0.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"info3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundColor = 0;
                                                                this.backgroundAlpha = 0.5;
                                                                this.borderStyle = "none";
                                                                this.top = "10";
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "selectable":false,
                                                                    "x":10,
                                                                    "width":360,
                                                                    "percentHeight":26
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":20,
                                                                    "y":90,
                                                                    "width":110,
                                                                    "height":110,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
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
                                                                    "x":138,
                                                                    "y":92,
                                                                    "width":102,
                                                                    "height":102,
                                                                    "styleName":"CSSBorder",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":1,
                                                                                "y":1
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
                                                                    "x":250,
                                                                    "y":90,
                                                                    "width":110,
                                                                    "height":110,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_16",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2_17",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"bestAward2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":37,
                                                                    "y":200,
                                                                    "height":25,
                                                                    "width":333
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton5",
                                                            "events":{"click":"___LottoPanel_MultiLineButton5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishOneTime",
                                                                    "x":32,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton6",
                                                            "events":{"click":"___LottoPanel_MultiLineButton6_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishFiveTime",
                                                                    "x":140,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton7",
                                                            "events":{"click":"___LottoPanel_MultiLineButton7_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishTenTime",
                                                                    "x":248,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
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
                                                        "label":"View 4",
                                                        "percentWidth":100,
                                                        "height":295,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_LottoPanel_Image7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":380,
                                                                    "height":295,
                                                                    "alpha":0.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"info4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundColor = 0;
                                                                this.backgroundAlpha = 0.5;
                                                                this.borderStyle = "none";
                                                                this.top = "10";
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "editable":false,
                                                                    "selectable":false,
                                                                    "x":10,
                                                                    "width":360,
                                                                    "percentHeight":26
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":20,
                                                                    "y":90,
                                                                    "width":110,
                                                                    "height":110,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_0",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
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
                                                                    "x":138,
                                                                    "y":92,
                                                                    "width":102,
                                                                    "height":102,
                                                                    "styleName":"CSSBorder",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":1,
                                                                                "y":1
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
                                                                    "x":250,
                                                                    "y":90,
                                                                    "width":110,
                                                                    "height":110,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":2,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":38,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_16",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":38,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3_17",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":74,
                                                                                "y":74,
                                                                                "movable":false,
                                                                                "mouseEnabled":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"bestAward3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"",
                                                                    "x":37,
                                                                    "y":200,
                                                                    "height":25,
                                                                    "width":350
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton8",
                                                            "events":{"click":"___LottoPanel_MultiLineButton8_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishOneTime",
                                                                    "x":32,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton9",
                                                            "events":{"click":"___LottoPanel_MultiLineButton9_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishFiveTime",
                                                                    "x":140,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":MultiLineButton,
                                                            "id":"_LottoPanel_MultiLineButton10",
                                                            "events":{"click":"___LottoPanel_MultiLineButton10_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"WishTenTime",
                                                                    "x":248,
                                                                    "y":225,
                                                                    "width":100,
                                                                    "height":60
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_LottoPanel_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":11,
                                            "width":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BoxLabel,
                                    "id":"_LottoPanel_BoxLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":60,
                                            "x":80,
                                            "y":11
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"GoldUnlock",
                                            "x":145,
                                            "y":11,
                                            "mouseEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_LottoPanel_BasicTxtButton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":200,
                                            "y":11,
                                            "width":65
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"lottoBagLength",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":11,
                                            "width":60
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"lottoBagBtn",
                                    "events":{"click":"__lottoBagBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":310,
                                            "y":10,
                                            "width":83
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_LottoPanel_BasicGlowButton6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":440,
                                            "y":10,
                                            "width":80,
                                            "mouseEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":400,
                                            "y":30,
                                            "width":160,
                                            "height":130,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":LinkTextArea,
                                                "id":"myLotto",
                                                "events":{"valueCommit":"__myLotto_valueCommit"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "5";
                                                    this.top = "5";
                                                    this.right = "5";
                                                    this.bottom = "5";
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selectable":false,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"auto"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_LottoPanel_BasicGlowButton7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "x":440,
                                            "y":175,
                                            "width":80,
                                            "mouseEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":400,
                                            "y":195,
                                            "width":160,
                                            "height":130,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":LinkTextArea,
                                                "id":"superLotto",
                                                "events":{"valueCommit":"__superLotto_valueCommit"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.top = "10";
                                                    this.right = "10";
                                                    this.bottom = "10";
                                                    this.borderStyle = "none";
                                                    this.backgroundAlpha = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "htmlText":"",
                                                        "selectable":false,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"auto"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"RL1",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":115,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"RL2",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":13,
                                            "visible":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_LottoPanel_BasicGlowButton8",
                        "events":{"click":"___LottoPanel_BasicGlowButton8_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "x":510,
                                "y":35
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var lottoAward:Array = new Array();
        private var highestAwardArr:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LottoPanel()
        {
            mx_internal::_document = this;
            this.width = 600;
            this.height = 424;
            this.styleName = "StandardContent";
            _LottoPanel_Glow1_i();
            this.addEventListener("creationComplete", ___LottoPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LottoPanel._watcherSetupUtil = _arg_1;
        }


        private function flashStop(_arg_1:int):void
        {
            if (_arg_1 == 1)
            {
                img1.source = ResManager.sincereWishPicture;
            }
            else
            {
                if (_arg_1 == 2)
                {
                    img2.source = ResManager.candleWishPicture;
                }
                else
                {
                    if (_arg_1 == 3)
                    {
                        img3.source = ResManager.paperCraneWishPicture;
                    }
                    else
                    {
                        if (_arg_1 == 4)
                        {
                            img4.source = ResManager.meteorWishPicture;
                        };
                    };
                };
            };
        }

        public function onGetLottoData(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            if (_arg_1)
            {
                lottoAward = _arg_1.lottoAward;
                highestAwardArr = _arg_1.highestAwardArr;
                _local_2 = 0;
                while (_local_2 < 4)
                {
                    _local_3 = 0;
                    while (_local_3 < 18)
                    {
                        _local_4 = lottoAward[_local_2][_local_3];
                        _local_5 = _core.data.gameData[GamePredef.TBL_PLAN][_local_4];
                        if (_local_5)
                        {
                            this[((("slot" + _local_2) + "_") + _local_3)].type = _local_5.ti;
                            this[((("slot" + _local_2) + "_") + _local_3)].giid = _local_5.ii;
                            this[((("slot" + _local_2) + "_") + _local_3)].stackNum = _local_5.n;
                            this[((("slot" + _local_2) + "_") + _local_3)].slotData = _local_5;
                            _local_6 = _core.data.getGameData(_local_5.ti, _local_5.ii);
                            if (_local_6)
                            {
                                if (_local_6.color)
                                {
                                    this[((("slot" + _local_2) + "_") + _local_3)].setStyleName(_local_6.color);
                                }
                                else
                                {
                                    if (_local_5.ti == GamePredef.TBL_CREATURE)
                                    {
                                        this[((("slot" + _local_2) + "_") + _local_3)].setStyleName(_core.basic.colorByGrowRate(_local_5.q));
                                    };
                                };
                            };
                        };
                        _local_3++;
                    };
                    _local_2++;
                };
                _local_2 = 0;
                while (_local_2 < highestAwardArr.length)
                {
                    _local_7 = highestAwardArr[_local_2];
                    superLottoShow(_local_7);
                    _local_2++;
                };
                bestAwardShow(lottoAward);
            };
        }

        public function ___LottoPanel_MultiLineButton10_click(_arg_1:MouseEvent):void
        {
            doWish(3, 10);
        }

        [Bindable(event="propertyChange")]
        public function get tabBar():HBox
        {
            return (this._881418178tabBar);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_11():ItemSlot
        {
            return (this._1087578037slot2_11);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_12():ItemSlot
        {
            return (this._1087578036slot2_12);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_13():ItemSlot
        {
            return (this._1087578035slot2_13);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_14():ItemSlot
        {
            return (this._1087578034slot2_14);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_15():ItemSlot
        {
            return (this._1087578033slot2_15);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_16():ItemSlot
        {
            return (this._1087578032slot2_16);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_10():ItemSlot
        {
            return (this._1087578038slot2_10);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_17():ItemSlot
        {
            return (this._1087578031slot2_17);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_1():ItemSlot
        {
            return (this._2113292185slot3_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_2():ItemSlot
        {
            return (this._2113292184slot3_2);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_4():ItemSlot
        {
            return (this._2113292182slot3_4);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_5():ItemSlot
        {
            return (this._2113292181slot3_5);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_6():ItemSlot
        {
            return (this._2113292180slot3_6);
        }

        private function callMessageChangable():void
        {
            var _local_1:Timer = new Timer(5000, 0);
            _local_1.addEventListener(TimerEvent.TIMER, setMessageChangable);
            _local_1.start();
        }

        [Bindable(event="propertyChange")]
        public function get slot3_8():ItemSlot
        {
            return (this._2113292178slot3_8);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_9():ItemSlot
        {
            return (this._2113292177slot3_9);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_7():ItemSlot
        {
            return (this._2113292179slot3_7);
        }

        private function _LottoPanel_Glow1_i():Glow
        {
            var _local_1:Glow = new Glow();
            glowEffect = _local_1;
            _local_1.repeatCount = 100000;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 1;
            _local_1.blurXFrom = 0;
            _local_1.blurXTo = 10;
            _local_1.blurYFrom = 0;
            _local_1.blurYTo = 10;
            _local_1.color = 0xFFFF00;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get bestAward0():LinkTextArea
        {
            return (this._456972407bestAward0);
        }

        [Bindable(event="propertyChange")]
        public function get bestAward1():LinkTextArea
        {
            return (this._456972408bestAward1);
        }

        [Bindable(event="propertyChange")]
        public function get bestAward2():LinkTextArea
        {
            return (this._456972409bestAward2);
        }

        public function __btn3_click(_arg_1:MouseEvent):void
        {
            tabClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get bestAward3():LinkTextArea
        {
            return (this._456972410bestAward3);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_0():ItemSlot
        {
            return (this._2113292186slot3_0);
        }

        public function set slot2_11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087578037slot2_11;
            if (_local_2 !== _arg_1)
            {
                this._1087578037slot2_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_11", _local_2, _arg_1));
            };
        }

        public function set slot2_12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087578036slot2_12;
            if (_local_2 !== _arg_1)
            {
                this._1087578036slot2_12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_12", _local_2, _arg_1));
            };
        }

        public function set slot2_13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087578035slot2_13;
            if (_local_2 !== _arg_1)
            {
                this._1087578035slot2_13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_13", _local_2, _arg_1));
            };
        }

        public function set slot2_10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087578038slot2_10;
            if (_local_2 !== _arg_1)
            {
                this._1087578038slot2_10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_10", _local_2, _arg_1));
            };
        }

        public function set slot2_17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087578031slot2_17;
            if (_local_2 !== _arg_1)
            {
                this._1087578031slot2_17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_17", _local_2, _arg_1));
            };
        }

        public function set slot2_14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087578034slot2_14;
            if (_local_2 !== _arg_1)
            {
                this._1087578034slot2_14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2_0():ItemSlot
        {
            return (this._2113293147slot2_0);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_1():ItemSlot
        {
            return (this._2113293146slot2_1);
        }

        public function set slot2_16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087578032slot2_16;
            if (_local_2 !== _arg_1)
            {
                this._1087578032slot2_16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_16", _local_2, _arg_1));
            };
        }

        public function ___LottoPanel_MultiLineButton6_click(_arg_1:MouseEvent):void
        {
            doWish(2, 5);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_4():ItemSlot
        {
            return (this._2113293143slot2_4);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_6():ItemSlot
        {
            return (this._2113293141slot2_6);
        }

        public function set slot2_15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087578033slot2_15;
            if (_local_2 !== _arg_1)
            {
                this._1087578033slot2_15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_15", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2_2():ItemSlot
        {
            return (this._2113293145slot2_2);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_3():ItemSlot
        {
            return (this._2113293144slot2_3);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_10():ItemSlot
        {
            return (this._1087548247slot3_10);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_5():ItemSlot
        {
            return (this._2113293142slot2_5);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_12():ItemSlot
        {
            return (this._1087548245slot3_12);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_7():ItemSlot
        {
            return (this._2113293140slot2_7);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_9():ItemSlot
        {
            return (this._2113293138slot2_9);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_16():ItemSlot
        {
            return (this._1087548241slot3_16);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_17():ItemSlot
        {
            return (this._1087548240slot3_17);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_11():ItemSlot
        {
            return (this._1087548246slot3_11);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_13():ItemSlot
        {
            return (this._1087548244slot3_13);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_8():ItemSlot
        {
            return (this._2113293139slot2_8);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_15():ItemSlot
        {
            return (this._1087548242slot3_15);
        }

        [Bindable(event="propertyChange")]
        public function get slot3_14():ItemSlot
        {
            return (this._1087548243slot3_14);
        }

        [Bindable(event="propertyChange")]
        public function get img1():Image
        {
            return (this._3236046img1);
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

        public function set slot3_3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292183slot3_3;
            if (_local_2 !== _arg_1)
            {
                this._2113292183slot3_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_3", _local_2, _arg_1));
            };
        }

        public function set slot3_0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292186slot3_0;
            if (_local_2 !== _arg_1)
            {
                this._2113292186slot3_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_0", _local_2, _arg_1));
            };
        }

        public function set slot3_4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292182slot3_4;
            if (_local_2 !== _arg_1)
            {
                this._2113292182slot3_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_4", _local_2, _arg_1));
            };
        }

        public function set slot3_1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292185slot3_1;
            if (_local_2 !== _arg_1)
            {
                this._2113292185slot3_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_1", _local_2, _arg_1));
            };
        }

        public function set slot3_5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292181slot3_5;
            if (_local_2 !== _arg_1)
            {
                this._2113292181slot3_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_5", _local_2, _arg_1));
            };
        }

        public function set slot3_2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292184slot3_2;
            if (_local_2 !== _arg_1)
            {
                this._2113292184slot3_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img4():Image
        {
            return (this._3236049img4);
        }

        public function set slot3_7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292179slot3_7;
            if (_local_2 !== _arg_1)
            {
                this._2113292179slot3_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot3_3():ItemSlot
        {
            return (this._2113292183slot3_3);
        }

        public function set slot3_9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292177slot3_9;
            if (_local_2 !== _arg_1)
            {
                this._2113292177slot3_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_9", _local_2, _arg_1));
            };
        }

        public function set slot3_6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292180slot3_6;
            if (_local_2 !== _arg_1)
            {
                this._2113292180slot3_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_6", _local_2, _arg_1));
            };
        }

        public function set slot3_8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113292178slot3_8;
            if (_local_2 !== _arg_1)
            {
                this._2113292178slot3_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1_0():ItemSlot
        {
            return (this._2113294108slot1_0);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_1():ItemSlot
        {
            return (this._2113294107slot1_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_2():ItemSlot
        {
            return (this._2113294106slot1_2);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_4():ItemSlot
        {
            return (this._2113294104slot1_4);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_5():ItemSlot
        {
            return (this._2113294103slot1_5);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_6():ItemSlot
        {
            return (this._2113294102slot1_6);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_7():ItemSlot
        {
            return (this._2113294101slot1_7);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_9():ItemSlot
        {
            return (this._2113294099slot1_9);
        }

        public function set tabBar(_arg_1:HBox):void
        {
            var _local_2:Object = this._881418178tabBar;
            if (_local_2 !== _arg_1)
            {
                this._881418178tabBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBar", _local_2, _arg_1));
            };
        }

        public function set bestAward1(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._456972408bestAward1;
            if (_local_2 !== _arg_1)
            {
                this._456972408bestAward1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bestAward1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lottoBagLength():BasicTxtButton
        {
            return (this._94078750lottoBagLength);
        }

        public function set bestAward2(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._456972409bestAward2;
            if (_local_2 !== _arg_1)
            {
                this._456972409bestAward2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bestAward2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1_8():ItemSlot
        {
            return (this._2113294100slot1_8);
        }

        public function set bestAward3(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._456972410bestAward3;
            if (_local_2 !== _arg_1)
            {
                this._456972410bestAward3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bestAward3", _local_2, _arg_1));
            };
        }

        public function set bestAward0(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._456972407bestAward0;
            if (_local_2 !== _arg_1)
            {
                this._456972407bestAward0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bestAward0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1_3():ItemSlot
        {
            return (this._2113294105slot1_3);
        }

        public function onLottoByClient(_arg_1:Object):*
        {
            if (_arg_1)
            {
                flashPlay(flashPlayType);
            };
        }

        private function init():void
        {
            tabClick(0);
            info1.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            info2.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            info3.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            info4.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            bestAward0.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            bestAward1.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            bestAward2.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            bestAward3.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            myLotto.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            superLotto.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _core.remote.call("getLottoData", new Responder(onGetLottoData), null);
            if (Number(_core.player.lottoBagLength) > 0)
            {
                glowEffect.play([lottoBagBtn]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot0_1():ItemSlot
        {
            return (this._2113295068slot0_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_2():ItemSlot
        {
            return (this._2113295067slot0_2);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_3():ItemSlot
        {
            return (this._2113295066slot0_3);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_4():ItemSlot
        {
            return (this._2113295065slot0_4);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_5():ItemSlot
        {
            return (this._2113295064slot0_5);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_6():ItemSlot
        {
            return (this._2113295063slot0_6);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_9():ItemSlot
        {
            return (this._2113295060slot0_9);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_7():ItemSlot
        {
            return (this._2113295062slot0_7);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_0():ItemSlot
        {
            return (this._2113295069slot0_0);
        }

        [Bindable(event="propertyChange")]
        public function get freeWish():MultiLineButton
        {
            return (this._1538251469freeWish);
        }

        [Bindable(event="propertyChange")]
        public function get RL1():RoundedLabel
        {
            return (this._81207RL1);
        }

        public function showLottoBlueMsg(_arg_1:String):void
        {
            var _local_2:* = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[7]) + "'>") + TextUtil.decode(_arg_1)) + "</font><br/>");
            if (myLotto != null)
            {
                myLotto.htmlText = (myLotto.htmlText + _local_2);
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot0_8():ItemSlot
        {
            return (this._2113295061slot0_8);
        }

        public function __btn2_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        [Bindable(event="propertyChange")]
        public function get info3():LinkTextArea
        {
            return (this._100348229info3);
        }

        [Bindable(event="propertyChange")]
        public function get RL2():RoundedLabel
        {
            return (this._81208RL2);
        }

        [Bindable(event="propertyChange")]
        public function get info1():LinkTextArea
        {
            return (this._100348227info1);
        }

        [Bindable(event="propertyChange")]
        public function get info2():LinkTextArea
        {
            return (this._100348228info2);
        }

        public function set slot2_1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293146slot2_1;
            if (_local_2 !== _arg_1)
            {
                this._2113293146slot2_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get info4():LinkTextArea
        {
            return (this._100348230info4);
        }

        public function set slot2_2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293145slot2_2;
            if (_local_2 !== _arg_1)
            {
                this._2113293145slot2_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_2", _local_2, _arg_1));
            };
        }

        public function set slot2_0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293147slot2_0;
            if (_local_2 !== _arg_1)
            {
                this._2113293147slot2_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_0", _local_2, _arg_1));
            };
        }

        public function set slot2_4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293143slot2_4;
            if (_local_2 !== _arg_1)
            {
                this._2113293143slot2_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn1():BasicGlowButton
        {
            return (this._3034453btn1);
        }

        [Bindable(event="propertyChange")]
        public function get btn2():BasicGlowButton
        {
            return (this._3034454btn2);
        }

        [Bindable(event="propertyChange")]
        public function get btn3():BasicGlowButton
        {
            return (this._3034455btn3);
        }

        public function set slot3_10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087548247slot3_10;
            if (_local_2 !== _arg_1)
            {
                this._1087548247slot3_10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_10", _local_2, _arg_1));
            };
        }

        public function set slot2_8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293139slot2_8;
            if (_local_2 !== _arg_1)
            {
                this._2113293139slot2_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_8", _local_2, _arg_1));
            };
        }

        public function set slot2_9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293138slot2_9;
            if (_local_2 !== _arg_1)
            {
                this._2113293138slot2_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_9", _local_2, _arg_1));
            };
        }

        public function set slot2_6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293141slot2_6;
            if (_local_2 !== _arg_1)
            {
                this._2113293141slot2_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_6", _local_2, _arg_1));
            };
        }

        public function set slot3_16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087548241slot3_16;
            if (_local_2 !== _arg_1)
            {
                this._1087548241slot3_16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_16", _local_2, _arg_1));
            };
        }

        public function set slot2_3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293144slot2_3;
            if (_local_2 !== _arg_1)
            {
                this._2113293144slot2_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_3", _local_2, _arg_1));
            };
        }

        public function set slot3_17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087548240slot3_17;
            if (_local_2 !== _arg_1)
            {
                this._1087548240slot3_17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_17", _local_2, _arg_1));
            };
        }

        public function set slot3_14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087548243slot3_14;
            if (_local_2 !== _arg_1)
            {
                this._1087548243slot3_14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn0():BasicGlowButton
        {
            return (this._3034452btn0);
        }

        public function set slot3_12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087548245slot3_12;
            if (_local_2 !== _arg_1)
            {
                this._1087548245slot3_12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_12", _local_2, _arg_1));
            };
        }

        public function ___LottoPanel_MultiLineButton5_click(_arg_1:MouseEvent):void
        {
            doWish(2, 1);
        }

        public function set slot3_15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087548242slot3_15;
            if (_local_2 !== _arg_1)
            {
                this._1087548242slot3_15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_15", _local_2, _arg_1));
            };
        }

        public function superLottoShow(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:String;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:* = "";
            if (((_arg_1.p) && (_arg_1.p > 10)))
            {
                _local_3 = _core.data.getGameData(_arg_1.ti, _arg_1.ii);
                if (!_local_3)
                {
                    return;
                };
                if (((!(_local_3.color)) || (_local_3.color < 0)))
                {
                    _local_3.color = 0;
                };
                _local_2 = Language.NOTICE_INFO[10];
                if (!_local_2)
                {
                    return;
                };
                _local_2 = _local_2.replace("{name}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.c) + "|") + _arg_1.name) + "|0|0|0]")));
                if (_arg_1.ti == GamePredef.TBL_EQUIPT_TEMPLATE)
                {
                    if (!_arg_1.cl)
                    {
                        if (_local_3.color > 0)
                        {
                            _arg_1.cl = _local_3.color;
                        }
                        else
                        {
                            _arg_1.cl = 0;
                        };
                    };
                    _local_5 = _core.data.gameData[_arg_1.ti][_arg_1.ii];
                    if (_local_5.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
                    {
                        _local_6 = ((Number(_arg_1.q) * 10) + 6);
                        _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + _local_6) + "]")));
                    }
                    else
                    {
                        _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + 0) + "]")));
                    };
                }
                else
                {
                    if (_arg_1.ti == GamePredef.TBL_ITEM_TEMPLATE)
                    {
                        if (!_arg_1.cl)
                        {
                            if (_local_3.color > 0)
                            {
                                _arg_1.cl = _local_3.color;
                            }
                            else
                            {
                                _arg_1.cl = 0;
                            };
                        };
                        _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ITEM_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + 0) + "]")));
                    }
                    else
                    {
                        if (_arg_1.ti == GamePredef.TBL_CREATURE)
                        {
                            _local_7 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(_arg_1.q)]) + "'>[") + _local_3.name) + "]</font>");
                            _local_2 = _local_2.replace("{item}", _local_7);
                        };
                    };
                };
                _local_2 = _local_2.replace("{num}", _arg_1.n);
                _local_4 = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[6]) + "'>") + TextUtil.decode(_local_2)) + "</font><br/>");
                if (superLotto)
                {
                    superLotto.htmlText = (superLotto.htmlText + _local_4);
                };
            };
        }

        public function set slot2_7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293140slot2_7;
            if (_local_2 !== _arg_1)
            {
                this._2113293140slot2_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_7", _local_2, _arg_1));
            };
        }

        private function bestAwardShow(_arg_1:Array):void
        {
            var _local_4:int;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:String;
            var _local_2:Number = Math.round((Math.random() * 17));
            var _local_3:int;
            while (_local_3 < 4)
            {
                _local_4 = _arg_1[_local_3][_local_2];
                _local_5 = _core.data.gameData[GamePredef.TBL_PLAN][_local_4];
                if (_local_5)
                {
                    _local_6 = "";
                    _local_7 = ObjectUtil.copy(_core.data.getGameData(_local_5.ti, _local_5.ii));
                    if (!_local_7)
                    {
                        return;
                    };
                    if (((!(_local_7.color)) || (_local_7.color < 0)))
                    {
                        _local_7.color = 0;
                    };
                    _local_6 = Language.NOTICE_INFO[1];
                    if (!_local_6)
                    {
                        return;
                    };
                    if (_local_5.ti == GamePredef.TBL_EQUIPT_TEMPLATE)
                    {
                        _local_6 = _local_6.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _local_5.ii) + "|") + _local_7.name) + "|") + _local_7.color) + "|") + 0) + "|") + 0) + "]")));
                    }
                    else
                    {
                        if (_local_5.ti == GamePredef.TBL_ITEM_TEMPLATE)
                        {
                            _local_6 = _local_6.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ITEM_TEMPLATE]) + "|") + _local_5.ii) + "|") + _local_7.name) + "|") + _local_7.color) + "|") + 0) + "|") + 0) + "]")));
                        }
                        else
                        {
                            if (_local_5.ti == GamePredef.TBL_CREATURE)
                            {
                                _local_9 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(_local_5.q)]) + "'>[") + _local_7.name) + "]</font>");
                                _local_6 = _local_6.replace("{item}", _local_9);
                            };
                        };
                    };
                    _local_6 = _local_6.replace("{action}", (("<font color='#FA5B05'>" + Language.LOTTO_PANEL_U[(_local_3 + 1)]) + "</font>"));
                    _local_8 = TextUtil.decode(_local_6);
                };
                this[("bestAward" + _local_3)].htmlText = (("<font color='#FFFFFF' size='14'><b>" + _local_8) + "</b></font>");
                _local_3++;
            };
            setTimeout(bestAwardShow, 3000, _arg_1);
        }

        public function __superLotto_valueCommit(_arg_1:FlexEvent):void
        {
            superLotto.verticalScrollPosition = superLotto.maxVerticalScrollPosition;
        }

        [Bindable(event="propertyChange")]
        public function get glowEffect():Glow
        {
            return (this._207684226glowEffect);
        }

        public function set slot2_5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113293142slot2_5;
            if (_local_2 !== _arg_1)
            {
                this._2113293142slot2_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_5", _local_2, _arg_1));
            };
        }

        public function set slot3_13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087548244slot3_13;
            if (_local_2 !== _arg_1)
            {
                this._1087548244slot3_13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_13", _local_2, _arg_1));
            };
        }

        public function set slot3_11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087548246slot3_11;
            if (_local_2 !== _arg_1)
            {
                this._1087548246slot3_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3_11", _local_2, _arg_1));
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

        public function set img2(_arg_1:Image):void
        {
            var _local_2:Object = this._3236047img2;
            if (_local_2 !== _arg_1)
            {
                this._3236047img2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2", _local_2, _arg_1));
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

        public function set img3(_arg_1:Image):void
        {
            var _local_2:Object = this._3236048img3;
            if (_local_2 !== _arg_1)
            {
                this._3236048img3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img3", _local_2, _arg_1));
            };
        }

        public function set superLotto(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1735837999superLotto;
            if (_local_2 !== _arg_1)
            {
                this._1735837999superLotto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "superLotto", _local_2, _arg_1));
            };
        }

        public function set slot1_0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294108slot1_0;
            if (_local_2 !== _arg_1)
            {
                this._2113294108slot1_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_0", _local_2, _arg_1));
            };
        }

        public function set slot1_1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294107slot1_1;
            if (_local_2 !== _arg_1)
            {
                this._2113294107slot1_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_1", _local_2, _arg_1));
            };
        }

        public function set lottoBagLength(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._94078750lottoBagLength;
            if (_local_2 !== _arg_1)
            {
                this._94078750lottoBagLength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lottoBagLength", _local_2, _arg_1));
            };
        }

        public function set slot1_3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294105slot1_3;
            if (_local_2 !== _arg_1)
            {
                this._2113294105slot1_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_3", _local_2, _arg_1));
            };
        }

        public function set slot1_5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294103slot1_5;
            if (_local_2 !== _arg_1)
            {
                this._2113294103slot1_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_5", _local_2, _arg_1));
            };
        }

        public function set slot1_6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294102slot1_6;
            if (_local_2 !== _arg_1)
            {
                this._2113294102slot1_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_6", _local_2, _arg_1));
            };
        }

        public function set slot1_7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294101slot1_7;
            if (_local_2 !== _arg_1)
            {
                this._2113294101slot1_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_7", _local_2, _arg_1));
            };
        }

        public function set slot1_4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294104slot1_4;
            if (_local_2 !== _arg_1)
            {
                this._2113294104slot1_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_4", _local_2, _arg_1));
            };
        }

        public function set slot1_8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294100slot1_8;
            if (_local_2 !== _arg_1)
            {
                this._2113294100slot1_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_8", _local_2, _arg_1));
            };
        }

        public function set slot1_9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294099slot1_9;
            if (_local_2 !== _arg_1)
            {
                this._2113294099slot1_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_9", _local_2, _arg_1));
            };
        }

        public function set slot1_2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113294106slot1_2;
            if (_local_2 !== _arg_1)
            {
                this._2113294106slot1_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lottoBagBtn():BasicGlowButton
        {
            return (this._1666736608lottoBagBtn);
        }

        public function __btn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        public function ___LottoPanel_MultiLineButton4_click(_arg_1:MouseEvent):void
        {
            doWish(1, 10);
        }

        public function set slot0_0(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295069slot0_0;
            if (_local_2 !== _arg_1)
            {
                this._2113295069slot0_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_0", _local_2, _arg_1));
            };
        }

        public function set slot0_2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295067slot0_2;
            if (_local_2 !== _arg_1)
            {
                this._2113295067slot0_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_2", _local_2, _arg_1));
            };
        }

        public function set slot0_4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295065slot0_4;
            if (_local_2 !== _arg_1)
            {
                this._2113295065slot0_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_4", _local_2, _arg_1));
            };
        }

        public function set slot0_1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295068slot0_1;
            if (_local_2 !== _arg_1)
            {
                this._2113295068slot0_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_1", _local_2, _arg_1));
            };
        }

        public function set slot0_5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295064slot0_5;
            if (_local_2 !== _arg_1)
            {
                this._2113295064slot0_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_5", _local_2, _arg_1));
            };
        }

        public function set slot0_6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295063slot0_6;
            if (_local_2 !== _arg_1)
            {
                this._2113295063slot0_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_6", _local_2, _arg_1));
            };
        }

        public function set slot0_3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295066slot0_3;
            if (_local_2 !== _arg_1)
            {
                this._2113295066slot0_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_3", _local_2, _arg_1));
            };
        }

        public function set slot0_8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295061slot0_8;
            if (_local_2 !== _arg_1)
            {
                this._2113295061slot0_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_8", _local_2, _arg_1));
            };
        }

        public function set slot0_9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295060slot0_9;
            if (_local_2 !== _arg_1)
            {
                this._2113295060slot0_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_9", _local_2, _arg_1));
            };
        }

        public function set slot0_7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295062slot0_7;
            if (_local_2 !== _arg_1)
            {
                this._2113295062slot0_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_7", _local_2, _arg_1));
            };
        }

        public function set freeWish(_arg_1:MultiLineButton):void
        {
            var _local_2:Object = this._1538251469freeWish;
            if (_local_2 !== _arg_1)
            {
                this._1538251469freeWish = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "freeWish", _local_2, _arg_1));
            };
        }

        public function setMessageChangable(_arg_1:TimerEvent):void
        {
            RL1.visible = (!(RL1.visible));
            RL2.visible = (!(RL2.visible));
        }

        public function ___LottoPanel_MultiLineButton9_click(_arg_1:MouseEvent):void
        {
            doWish(3, 5);
        }

        public function set RL1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._81207RL1;
            if (_local_2 !== _arg_1)
            {
                this._81207RL1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL1", _local_2, _arg_1));
            };
        }

        public function set RL2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._81208RL2;
            if (_local_2 !== _arg_1)
            {
                this._81208RL2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL2", _local_2, _arg_1));
            };
        }

        public function set myLotto(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1491390272myLotto;
            if (_local_2 !== _arg_1)
            {
                this._1491390272myLotto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLotto", _local_2, _arg_1));
            };
        }

        public function set info1(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._100348227info1;
            if (_local_2 !== _arg_1)
            {
                this._100348227info1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info1", _local_2, _arg_1));
            };
        }

        public function __lottoBagBtn_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_LOTTO_BAG);
        }

        public function set info3(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._100348229info3;
            if (_local_2 !== _arg_1)
            {
                this._100348229info3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info3", _local_2, _arg_1));
            };
        }

        public function set info4(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._100348230info4;
            if (_local_2 !== _arg_1)
            {
                this._100348230info4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info4", _local_2, _arg_1));
            };
        }

        public function set info2(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._100348228info2;
            if (_local_2 !== _arg_1)
            {
                this._100348228info2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info2", _local_2, _arg_1));
            };
        }

        public function set btn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        public function set btn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034455btn3;
            if (_local_2 !== _arg_1)
            {
                this._3034455btn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn3", _local_2, _arg_1));
            };
        }

        public function set btn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034452btn0;
            if (_local_2 !== _arg_1)
            {
                this._3034452btn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn0", _local_2, _arg_1));
            };
        }

        public function set btn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        public function __btn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get superLotto():LinkTextArea
        {
            return (this._1735837999superLotto);
        }

        public function ___LottoPanel_MultiLineButton3_click(_arg_1:MouseEvent):void
        {
            doWish(1, 5);
        }

        private function tabClick(_arg_1:int):void
        {
            vStack.selectedIndex = 0;
            this["btn0"].selected = true;
        }

        public function set glowEffect(_arg_1:Glow):void
        {
            var _local_2:Object = this._207684226glowEffect;
            if (_local_2 !== _arg_1)
            {
                this._207684226glowEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local_2, _arg_1));
            };
        }

        public function set slot0_10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087637620slot0_10;
            if (_local_2 !== _arg_1)
            {
                this._1087637620slot0_10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_10", _local_2, _arg_1));
            };
        }

        public function set slot0_11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087637619slot0_11;
            if (_local_2 !== _arg_1)
            {
                this._1087637619slot0_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_11", _local_2, _arg_1));
            };
        }

        public function set slot0_13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087637617slot0_13;
            if (_local_2 !== _arg_1)
            {
                this._1087637617slot0_13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_13", _local_2, _arg_1));
            };
        }

        public function set slot0_14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087637616slot0_14;
            if (_local_2 !== _arg_1)
            {
                this._1087637616slot0_14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_14", _local_2, _arg_1));
            };
        }

        public function set slot0_15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087637615slot0_15;
            if (_local_2 !== _arg_1)
            {
                this._1087637615slot0_15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_15", _local_2, _arg_1));
            };
        }

        public function set slot0_16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087637614slot0_16;
            if (_local_2 !== _arg_1)
            {
                this._1087637614slot0_16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_16", _local_2, _arg_1));
            };
        }

        public function ___LottoPanel_MultiLineButton8_click(_arg_1:MouseEvent):void
        {
            doWish(3, 1);
        }

        public function set slot0_17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087637613slot0_17;
            if (_local_2 !== _arg_1)
            {
                this._1087637613slot0_17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_17", _local_2, _arg_1));
            };
        }

        public function ___LottoPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get myLotto():LinkTextArea
        {
            return (this._1491390272myLotto);
        }

        private function _LottoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.LOTTO_PANEL_U[0];
            _local_1 = Language.LOTTO_PANEL_U[0];
            _local_1 = Language.LOTTO_PANEL_U[4];
            _local_1 = Language.LOTTO_PANEL_U[2];
            _local_1 = Language.LOTTO_PANEL_U[3];
            _local_1 = ResManager.sincereBG;
            _local_1 = Language.LOTTO_PANEL_U[16];
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = ResManager.sincereWishPicture;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Language.LOTTO_PANEL_U[13];
            _local_1 = ResManager.candleBG;
            _local_1 = Language.LOTTO_PANEL_U[17];
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = ResManager.candleWishPicture;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Language.LOTTO_PANEL_U[7];
            _local_1 = Language.LOTTO_PANEL_U[8];
            _local_1 = Language.LOTTO_PANEL_U[9];
            _local_1 = ResManager.paperCraneBG;
            _local_1 = Language.LOTTO_PANEL_U[18];
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = ResManager.paperCraneWishPicture;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Language.LOTTO_PANEL_U[10];
            _local_1 = Language.LOTTO_PANEL_U[11];
            _local_1 = Language.LOTTO_PANEL_U[12];
            _local_1 = ResManager.meteorBG;
            _local_1 = Language.LOTTO_PANEL_U[19];
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = ResManager.meteorWishPicture;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Language.LOTTO_PANEL_U[13];
            _local_1 = Language.LOTTO_PANEL_U[14];
            _local_1 = Language.LOTTO_PANEL_U[15];
            _local_1 = Language.LOTTO_PANEL_U[5];
            _local_1 = _core.player.gold;
            _local_1 = Language.LOTTO_PANEL_U[6];
            _local_1 = (_core.player.lottoBagLength + "/500");
            _local_1 = Language.LOTTO_PANEL_U[23];
            _local_1 = Language.LOTTO_PANEL_U[24];
            _local_1 = Language.LOTTO_PANEL_U[25];
            _local_1 = Language.LOTTO_PANEL_U[29];
            _local_1 = Language.LOTTO_PANEL_U[30];
            _local_1 = Language.LOTTO_PANEL_U[26];
        }

        private function flashPlay(_arg_1:int):void
        {
            if (_arg_1 == 1)
            {
                img1.source = ResManager.sincereWishFlash;
            }
            else
            {
                if (_arg_1 == 2)
                {
                    img2.source = ResManager.candleWishFlash;
                }
                else
                {
                    if (_arg_1 == 3)
                    {
                        img3.source = ResManager.paperCraneWishFlash;
                    }
                    else
                    {
                        if (_arg_1 == 4)
                        {
                            img4.source = ResManager.meteorWishFlash;
                        };
                    };
                };
            };
            setTimeout(flashStop, 2000, _arg_1);
        }

        public function set slot0_12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087637618slot0_12;
            if (_local_2 !== _arg_1)
            {
                this._1087637618slot0_12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot0_12", _local_2, _arg_1));
            };
        }

        public function __freeWish_click(_arg_1:MouseEvent):void
        {
            doWish(1, 10);
        }

        public function set vStack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._836523086vStack;
            if (_local_2 !== _arg_1)
            {
                this._836523086vStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vStack", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot0_10():ItemSlot
        {
            return (this._1087637620slot0_10);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_11():ItemSlot
        {
            return (this._1087637619slot0_11);
        }

        override public function initialize():void
        {
            var target:LottoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LottoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_LottoPanelWatcherSetupUtil");
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
        public function get slot0_15():ItemSlot
        {
            return (this._1087637615slot0_15);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_16():ItemSlot
        {
            return (this._1087637614slot0_16);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_12():ItemSlot
        {
            return (this._1087637618slot0_12);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_17():ItemSlot
        {
            return (this._1087637613slot0_17);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_13():ItemSlot
        {
            return (this._1087637617slot0_13);
        }

        public function ___LottoPanel_MultiLineButton2_click(_arg_1:MouseEvent):void
        {
            doWish(1, 1);
        }

        [Bindable(event="propertyChange")]
        public function get slot0_14():ItemSlot
        {
            return (this._1087637616slot0_14);
        }

        public function __myLotto_valueCommit(_arg_1:FlexEvent):void
        {
            myLotto.verticalScrollPosition = myLotto.maxVerticalScrollPosition;
        }

        [Bindable(event="propertyChange")]
        public function get vStack():ViewStack
        {
            return (this._836523086vStack);
        }

        public function set lottoBagBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1666736608lottoBagBtn;
            if (_local_2 !== _arg_1)
            {
                this._1666736608lottoBagBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lottoBagBtn", _local_2, _arg_1));
            };
        }

        private function doWish(type:int, num:int):void
        {
            var lottoObj:Object;
            var setWishDelay:Function = function ():void
            {
                wishDelayFlag = true;
            };
            if (wishDelayFlag)
            {
                lottoObj = {
                    "type":type,
                    "num":num
                };
                flashPlayType = (type + 1);
                if (lottoObj)
                {
                    _core.remote.call("lottoByClient", new Responder(onLottoByClient), lottoObj);
                    wishDelayFlag = false;
                    setTimeout(setWishDelay, 1000);
                };
            }
            else
            {
                _core.sysMidNote(Language.LOTTO_PANEL_U[28]);
            };
        }

        public function set slot1_11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087607828slot1_11;
            if (_local_2 !== _arg_1)
            {
                this._1087607828slot1_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_11", _local_2, _arg_1));
            };
        }

        public function set slot1_13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087607826slot1_13;
            if (_local_2 !== _arg_1)
            {
                this._1087607826slot1_13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_13", _local_2, _arg_1));
            };
        }

        public function set slot1_10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087607829slot1_10;
            if (_local_2 !== _arg_1)
            {
                this._1087607829slot1_10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_10", _local_2, _arg_1));
            };
        }

        public function set slot1_14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087607825slot1_14;
            if (_local_2 !== _arg_1)
            {
                this._1087607825slot1_14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_14", _local_2, _arg_1));
            };
        }

        public function set slot1_15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087607824slot1_15;
            if (_local_2 !== _arg_1)
            {
                this._1087607824slot1_15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_15", _local_2, _arg_1));
            };
        }

        public function set slot1_12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087607827slot1_12;
            if (_local_2 !== _arg_1)
            {
                this._1087607827slot1_12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_12", _local_2, _arg_1));
            };
        }

        public function set slot1_16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087607823slot1_16;
            if (_local_2 !== _arg_1)
            {
                this._1087607823slot1_16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_16", _local_2, _arg_1));
            };
        }

        public function ___LottoPanel_BasicGlowButton8_click(_arg_1:MouseEvent):void
        {
            _core.deal();
        }

        public function set slot1_17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1087607822slot1_17;
            if (_local_2 !== _arg_1)
            {
                this._1087607822slot1_17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_17", _local_2, _arg_1));
            };
        }

        private function _LottoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_LottoPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn0.label = _arg_1;
            }, "btn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn3.label = _arg_1;
            }, "btn3.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn1.label = _arg_1;
            }, "btn1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn2.label = _arg_1;
            }, "btn2.label");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.sincereBG);
            }, function (_arg_1:Object):void
            {
                _LottoPanel_Image1.source = _arg_1;
            }, "_LottoPanel_Image1.source");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info1.text = _arg_1;
            }, "info1.text");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_0.slotType = _arg_1;
            }, "slot0_0.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_1.slotType = _arg_1;
            }, "slot0_1.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_2.slotType = _arg_1;
            }, "slot0_2.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_3.slotType = _arg_1;
            }, "slot0_3.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_4.slotType = _arg_1;
            }, "slot0_4.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_5.slotType = _arg_1;
            }, "slot0_5.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_6.slotType = _arg_1;
            }, "slot0_6.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_7.slotType = _arg_1;
            }, "slot0_7.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_8.slotType = _arg_1;
            }, "slot0_8.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.sincereWishPicture);
            }, function (_arg_1:Object):void
            {
                img1.source = _arg_1;
            }, "img1.source");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_9.slotType = _arg_1;
            }, "slot0_9.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_10.slotType = _arg_1;
            }, "slot0_10.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_11.slotType = _arg_1;
            }, "slot0_11.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_12.slotType = _arg_1;
            }, "slot0_12.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_13.slotType = _arg_1;
            }, "slot0_13.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_14.slotType = _arg_1;
            }, "slot0_14.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_15.slotType = _arg_1;
            }, "slot0_15.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_16.slotType = _arg_1;
            }, "slot0_16.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot0_17.slotType = _arg_1;
            }, "slot0_17.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                freeWish.label = _arg_1;
            }, "freeWish.label");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.candleBG);
            }, function (_arg_1:Object):void
            {
                _LottoPanel_Image3.source = _arg_1;
            }, "_LottoPanel_Image3.source");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info2.text = _arg_1;
            }, "info2.text");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_0.slotType = _arg_1;
            }, "slot1_0.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_1.slotType = _arg_1;
            }, "slot1_1.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_2.slotType = _arg_1;
            }, "slot1_2.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_3.slotType = _arg_1;
            }, "slot1_3.slotType");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_4.slotType = _arg_1;
            }, "slot1_4.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_5.slotType = _arg_1;
            }, "slot1_5.slotType");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_6.slotType = _arg_1;
            }, "slot1_6.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_7.slotType = _arg_1;
            }, "slot1_7.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_8.slotType = _arg_1;
            }, "slot1_8.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.candleWishPicture);
            }, function (_arg_1:Object):void
            {
                img2.source = _arg_1;
            }, "img2.source");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_9.slotType = _arg_1;
            }, "slot1_9.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_10.slotType = _arg_1;
            }, "slot1_10.slotType");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_11.slotType = _arg_1;
            }, "slot1_11.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_12.slotType = _arg_1;
            }, "slot1_12.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_13.slotType = _arg_1;
            }, "slot1_13.slotType");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_14.slotType = _arg_1;
            }, "slot1_14.slotType");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_15.slotType = _arg_1;
            }, "slot1_15.slotType");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_16.slotType = _arg_1;
            }, "slot1_16.slotType");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot1_17.slotType = _arg_1;
            }, "slot1_17.slotType");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton2.label = _arg_1;
            }, "_LottoPanel_MultiLineButton2.label");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton3.label = _arg_1;
            }, "_LottoPanel_MultiLineButton3.label");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton4.label = _arg_1;
            }, "_LottoPanel_MultiLineButton4.label");
            result[50] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.paperCraneBG);
            }, function (_arg_1:Object):void
            {
                _LottoPanel_Image5.source = _arg_1;
            }, "_LottoPanel_Image5.source");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info3.text = _arg_1;
            }, "info3.text");
            result[52] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_0.slotType = _arg_1;
            }, "slot2_0.slotType");
            result[53] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_1.slotType = _arg_1;
            }, "slot2_1.slotType");
            result[54] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_2.slotType = _arg_1;
            }, "slot2_2.slotType");
            result[55] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_3.slotType = _arg_1;
            }, "slot2_3.slotType");
            result[56] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_4.slotType = _arg_1;
            }, "slot2_4.slotType");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_5.slotType = _arg_1;
            }, "slot2_5.slotType");
            result[58] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_6.slotType = _arg_1;
            }, "slot2_6.slotType");
            result[59] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_7.slotType = _arg_1;
            }, "slot2_7.slotType");
            result[60] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_8.slotType = _arg_1;
            }, "slot2_8.slotType");
            result[61] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.paperCraneWishPicture);
            }, function (_arg_1:Object):void
            {
                img3.source = _arg_1;
            }, "img3.source");
            result[62] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_9.slotType = _arg_1;
            }, "slot2_9.slotType");
            result[63] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_10.slotType = _arg_1;
            }, "slot2_10.slotType");
            result[64] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_11.slotType = _arg_1;
            }, "slot2_11.slotType");
            result[65] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_12.slotType = _arg_1;
            }, "slot2_12.slotType");
            result[66] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_13.slotType = _arg_1;
            }, "slot2_13.slotType");
            result[67] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_14.slotType = _arg_1;
            }, "slot2_14.slotType");
            result[68] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_15.slotType = _arg_1;
            }, "slot2_15.slotType");
            result[69] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_16.slotType = _arg_1;
            }, "slot2_16.slotType");
            result[70] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot2_17.slotType = _arg_1;
            }, "slot2_17.slotType");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton5.label = _arg_1;
            }, "_LottoPanel_MultiLineButton5.label");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton6.label = _arg_1;
            }, "_LottoPanel_MultiLineButton6.label");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton7.label = _arg_1;
            }, "_LottoPanel_MultiLineButton7.label");
            result[74] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.meteorBG);
            }, function (_arg_1:Object):void
            {
                _LottoPanel_Image7.source = _arg_1;
            }, "_LottoPanel_Image7.source");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info4.text = _arg_1;
            }, "info4.text");
            result[76] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_0.slotType = _arg_1;
            }, "slot3_0.slotType");
            result[77] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_1.slotType = _arg_1;
            }, "slot3_1.slotType");
            result[78] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_2.slotType = _arg_1;
            }, "slot3_2.slotType");
            result[79] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_3.slotType = _arg_1;
            }, "slot3_3.slotType");
            result[80] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_4.slotType = _arg_1;
            }, "slot3_4.slotType");
            result[81] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_5.slotType = _arg_1;
            }, "slot3_5.slotType");
            result[82] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_6.slotType = _arg_1;
            }, "slot3_6.slotType");
            result[83] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_7.slotType = _arg_1;
            }, "slot3_7.slotType");
            result[84] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_8.slotType = _arg_1;
            }, "slot3_8.slotType");
            result[85] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.meteorWishPicture);
            }, function (_arg_1:Object):void
            {
                img4.source = _arg_1;
            }, "img4.source");
            result[86] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_9.slotType = _arg_1;
            }, "slot3_9.slotType");
            result[87] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_10.slotType = _arg_1;
            }, "slot3_10.slotType");
            result[88] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_11.slotType = _arg_1;
            }, "slot3_11.slotType");
            result[89] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_12.slotType = _arg_1;
            }, "slot3_12.slotType");
            result[90] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_13.slotType = _arg_1;
            }, "slot3_13.slotType");
            result[91] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_14.slotType = _arg_1;
            }, "slot3_14.slotType");
            result[92] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_15.slotType = _arg_1;
            }, "slot3_15.slotType");
            result[93] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_16.slotType = _arg_1;
            }, "slot3_16.slotType");
            result[94] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slot3_17.slotType = _arg_1;
            }, "slot3_17.slotType");
            result[95] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton8.label = _arg_1;
            }, "_LottoPanel_MultiLineButton8.label");
            result[96] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton9.label = _arg_1;
            }, "_LottoPanel_MultiLineButton9.label");
            result[97] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_MultiLineButton10.label = _arg_1;
            }, "_LottoPanel_MultiLineButton10.label");
            result[98] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_BasicTxtButton1.text = _arg_1;
            }, "_LottoPanel_BasicTxtButton1.text");
            result[99] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.gold;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_BoxLabel1.text = _arg_1;
            }, "_LottoPanel_BoxLabel1.text");
            result[100] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_BasicTxtButton2.text = _arg_1;
            }, "_LottoPanel_BasicTxtButton2.text");
            result[101] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (_core.player.lottoBagLength + "/500");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lottoBagLength.label = _arg_1;
            }, "lottoBagLength.label");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lottoBagBtn.label = _arg_1;
            }, "lottoBagBtn.label");
            result[103] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_BasicGlowButton6.label = _arg_1;
            }, "_LottoPanel_BasicGlowButton6.label");
            result[104] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_BasicGlowButton7.label = _arg_1;
            }, "_LottoPanel_BasicGlowButton7.label");
            result[105] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                RL1.text = _arg_1;
            }, "RL1.text");
            result[106] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                RL2.text = _arg_1;
            }, "RL2.text");
            result[107] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTO_PANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LottoPanel_BasicGlowButton8.label = _arg_1;
            }, "_LottoPanel_BasicGlowButton8.label");
            result[108] = binding;
            return (result);
        }

        public function ___LottoPanel_MultiLineButton7_click(_arg_1:MouseEvent):void
        {
            doWish(2, 10);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_11():ItemSlot
        {
            return (this._1087607828slot1_11);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_12():ItemSlot
        {
            return (this._1087607827slot1_12);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_13():ItemSlot
        {
            return (this._1087607826slot1_13);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_14():ItemSlot
        {
            return (this._1087607825slot1_14);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_15():ItemSlot
        {
            return (this._1087607824slot1_15);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_16():ItemSlot
        {
            return (this._1087607823slot1_16);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_17():ItemSlot
        {
            return (this._1087607822slot1_17);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_10():ItemSlot
        {
            return (this._1087607829slot1_10);
        }


    }
}//package com.qeedoo.ui.view.compDragable

