// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AstrologicPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import mx.controls.TextArea;
    import mx.controls.Image;
    import flash.display.Loader;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.ScrollTextArrCanvas;
    import mx.controls.Alert;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.display.MovieClip;
    import mx.core.UIComponent;
    import com.qeedoo.effects.EnterFrameMove;
    import com.qeedoo.effects.AlphaResize;
    import mx.managers.PopUpManager;
    import flash.events.TextEvent;
    import com.qeedoo.ui.utils.StringBuffer;
    import flash.net.URLRequest;
    import mx.core.IUITextField;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.ui.utils.LinkEventUtil;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
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

    public class AstrologicPanel extends DragableCanvas implements IBindingClient 
    {

        private static const RECORD_LENGTH:int = 12;
        private static const PICK_AWARD:int = 12;
        private static const FREE_REFRESH_TIMES:int = 10;
        private static const FREE_PICK_TIMES:int = 12;
        private static const PACKAGE_NAME_LINE_LENGTH_MAX:int = 15;
        private static const FORMULA_TEMPLE:String = ((((("1: p00 + p01 =\n" + "2: p10 + p11 =\n") + "3: p20 + p21 + p22 =\n") + "4: p30 + p31 + p32 =\n") + "5: p40 + p41 + p42 + p43 =\n") + "6: p50 + p51 + p52 + p53 =");
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _newStars:Object;
        private var _1913453667canvas51111:Canvas;
        private var _677424794formula:TextArea;
        private var _109757473star3:Image;
        private var loader:Loader;
        private var _1497985491myStar1:Image;
        private var _1405038217award4:Image;
        private var _383327001astrologicTitle:BasicTitleCanvas;
        private var _1405038220award1:Image;
        private var _1491692172soulLabNum:RoundedLabel;
        private var _103157108look3:BasicDelayButton;
        private var _3015911back:Image;
        private var _892485645star12:Image;
        private var _103157105look0:BasicDelayButton;
        private var _1334727168recordsList:TextArea;
        private var _877021016textUp:ScrollTextArrCanvas;
        private var _109757477star7:Image;
        public var _AstrologicPanel_RoundedLabel1:RoundedLabel;
        public var _AstrologicPanel_RoundedLabel2:RoundedLabel;
        public var _AstrologicPanel_RoundedLabel3:RoundedLabel;
        public var _AstrologicPanel_RoundedLabel4:RoundedLabel;
        public var _AstrologicPanel_RoundedLabel5:RoundedLabel;
        private var state:int = 0;
        private var _1405038219award2:Image;
        private var _103157110look5:BasicDelayButton;
        private var moveType:int = 0;
        private var _109757474star4:Image;
        private var _1497985494myStar4:Image;
        private var _739745681pickInfo:RoundedLabel;
        private var _109757471star1:Image;
        private var _1387624919refreshInfo:RoundedLabel;
        private var _1405038216award5:Image;
        private var myStarsImages:Array;
        private var _892485647star10:Image;
        private var _1497985492myStar2:Image;
        private var _103157109look4:BasicDelayButton;
        private var _110549828total:RoundedLabel;
        private var _103157106look1:BasicDelayButton;
        private var _helpAlert:Alert;
        private var refreshTimes:int = 0;
        private var _109757478star8:Image;
        private var selectIndex:int = -1;
        private var _result:Object;
        private var _109757475star5:Image;
        private var _1405038218award3:Image;
        public var _AstrologicPanel_LinkButton1:LinkButton;
        public var _AstrologicPanel_LinkButton2:LinkButton;
        private var _109757472star2:Image;
        private var _1405038221award0:Image;
        private var starDisMC:Array;
        private var _1497985495myStar5:Image;
        private var pickTimes:int = 0;
        private var _1462326131canvas6111:Canvas;
        private var _892485646star11:Image;
        private var _103157107look2:BasicDelayButton;
        private var buyPickTimes:int = 0;
        private var _109757479star9:Image;
        public var _AstrologicPanel_BasicDelayButton7:BasicDelayButton;
        public var _AstrologicPanel_BasicDelayButton8:BasicDelayButton;
        private var _1497985493myStar3:Image;
        private var _109757476star6:Image;
        private var starDisClass:Class;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":756,
                    "height":515,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"astrologicTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas51111",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":39,
                                "height":455,
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"back",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":0,
                                            "x":0,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"canvas6111",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":726,
                                            "height":455,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_AstrologicPanel_RoundedLabel1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":16,
                                                        "y":15,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_AstrologicPanel_RoundedLabel2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 14;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":87,
                                                        "y":288,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"formula",
                                                "stylesFactory":function ():void
                                                {
                                                    this.leading = 7;
                                                    this.borderThickness = 0;
                                                    this.backgroundAlpha = 0;
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "wordWrap":true,
                                                        "x":10,
                                                        "y":39,
                                                        "width":278,
                                                        "height":145,
                                                        "selectable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ScrollTextArrCanvas,
                                                "id":"textUp",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":318,
                                                        "y":115
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_AstrologicPanel_LinkButton1",
                                                "events":{"click":"___AstrologicPanel_LinkButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textDecoration = "underline";
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":643,
                                                        "y":14,
                                                        "height":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_AstrologicPanel_RoundedLabel3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":331,
                                                        "y":373,
                                                        "width":340,
                                                        "height":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_AstrologicPanel_RoundedLabel4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":6,
                                                        "y":173,
                                                        "width":340,
                                                        "height":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_AstrologicPanel_RoundedLabel5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":21,
                                                        "y":0x0100,
                                                        "width":340,
                                                        "height":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"award0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":125,
                                                        "y":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"award1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":125,
                                                        "y":57
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"award2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":163,
                                                        "y":79
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"award3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":163,
                                                        "y":101
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"award4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":205,
                                                        "y":123
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"award5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":205,
                                                        "y":145
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"look0",
                                                "events":{"click":"__look0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnNormalRed",
                                                        "x":158,
                                                        "y":38
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"look1",
                                                "events":{"click":"__look1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnNormalRed",
                                                        "x":158,
                                                        "y":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"look2",
                                                "events":{"click":"__look2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnNormalRed",
                                                        "x":196,
                                                        "y":82
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"look3",
                                                "events":{"click":"__look3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnNormalRed",
                                                        "x":196,
                                                        "y":104
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"look4",
                                                "events":{"click":"__look4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnNormalRed",
                                                        "x":238,
                                                        "y":126
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"look5",
                                                "events":{"click":"__look5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnNormalRed",
                                                        "x":238,
                                                        "y":148
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextArea,
                                                "id":"recordsList",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderThickness = 0;
                                                    this.backgroundAlpha = 0;
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "wordWrap":true,
                                                        "x":16,
                                                        "y":317,
                                                        "width":245,
                                                        "height":128,
                                                        "selectable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_AstrologicPanel_BasicDelayButton7",
                                                "events":{"click":"___AstrologicPanel_BasicDelayButton7_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingBottom = 0;
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                    this.paddingTop = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnNormalRed",
                                                        "x":373,
                                                        "y":395,
                                                        "width":84,
                                                        "height":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_AstrologicPanel_BasicDelayButton8",
                                                "events":{"click":"___AstrologicPanel_BasicDelayButton8_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnNormalBlue",
                                                        "x":541,
                                                        "y":395,
                                                        "width":84,
                                                        "height":26
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"refreshInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":355,
                                                        "y":425
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"total",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 16187149;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":292,
                                                        "y":17,
                                                        "width":136
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_AstrologicPanel_LinkButton2",
                                                "events":{"click":"___AstrologicPanel_LinkButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.textDecoration = "underline";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":292,
                                                        "y":37,
                                                        "width":78
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"soulLabNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":427,
                                                        "y":17,
                                                        "width":123,
                                                        "height":17
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"pickInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":522,
                                                        "y":425
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star1",
                                                "events":{"click":"__star1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":24,
                                                        "x":445,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star2",
                                                "events":{"click":"__star2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":56,
                                                        "x":551,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star3",
                                                "events":{"click":"__star3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":89,
                                                        "x":374,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star4",
                                                "events":{"click":"__star4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":134,
                                                        "x":606,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star5",
                                                "events":{"click":"__star5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":144,
                                                        "x":448,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star6",
                                                "events":{"click":"__star6_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":185,
                                                        "x":320,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star7",
                                                "events":{"click":"__star7_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":199,
                                                        "x":523,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star8",
                                                "events":{"click":"__star8_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":226,
                                                        "x":657,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star9",
                                                "events":{"click":"__star9_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":241,
                                                        "x":391,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star10",
                                                "events":{"click":"__star10_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":285,
                                                        "x":490,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star11",
                                                "events":{"click":"__star11_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":285,
                                                        "x":592,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"star12",
                                                "events":{"click":"__star12_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":319,
                                                        "x":344,
                                                        "visible":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"myStar1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "source":"",
                                                        "y":194,
                                                        "x":16,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"myStar2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "source":"",
                                                        "y":194,
                                                        "x":81,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"myStar3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "source":"",
                                                        "y":194,
                                                        "x":146,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"myStar4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "source":"",
                                                        "y":194,
                                                        "x":211,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"myStar5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "source":"",
                                                        "y":194,
                                                        "x":275,
                                                        "visible":false
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
        private var formulaArr:Array = [];
        private var myStars:Array = [];
        private var awardArr:Array = [];
        private var iconsUrl:Array = [0, 4030200200087, 4030200200088, 4030200200086, 4030200200079, 4030200200078, 4030200200084, 4030200200077, 4030200200083, 4030200200080, 4030200200081, 4030200200082, 4030200200085];
        private var iconsSelectedUrl:Array = [0, 4030200200075, 4030200200076, 4030200200074, 4030200200067, 4030200200066, 4030200200072, 4030200200065, 4030200200071, 4030200200068, 4030200200069, 4030200200070, 4030200200073];
        private var awardInfo:Object = {
            "0":90,
            "1":90,
            "2":140,
            "3":140,
            "4":195,
            "5":195
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AstrologicPanel()
        {
            mx_internal::_document = this;
            this.width = 756;
            this.height = 515;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AstrologicPanel._watcherSetupUtil = _arg_1;
        }


        public function set star12(_arg_1:Image):void
        {
            var _local_2:Object = this._892485645star12;
            if (_local_2 !== _arg_1)
            {
                this._892485645star12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star12", _local_2, _arg_1));
            };
        }

        public function __star3_click(_arg_1:MouseEvent):void
        {
            selectStar(3);
        }

        [Bindable(event="propertyChange")]
        public function get recordsList():TextArea
        {
            return (this._1334727168recordsList);
        }

        public function __star12_click(_arg_1:MouseEvent):void
        {
            selectStar(12);
        }

        [Bindable(event="propertyChange")]
        public function get star1():Image
        {
            return (this._109757471star1);
        }

        [Bindable(event="propertyChange")]
        public function get star2():Image
        {
            return (this._109757472star2);
        }

        public function set recordsList(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1334727168recordsList;
            if (_local_2 !== _arg_1)
            {
                this._1334727168recordsList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recordsList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star5():Image
        {
            return (this._109757475star5);
        }

        [Bindable(event="propertyChange")]
        public function get star6():Image
        {
            return (this._109757476star6);
        }

        [Bindable(event="propertyChange")]
        public function get star9():Image
        {
            return (this._109757479star9);
        }

        [Bindable(event="propertyChange")]
        public function get star3():Image
        {
            return (this._109757473star3);
        }

        [Bindable(event="propertyChange")]
        public function get refreshInfo():RoundedLabel
        {
            return (this._1387624919refreshInfo);
        }

        [Bindable(event="propertyChange")]
        public function get star7():Image
        {
            return (this._109757477star7);
        }

        public function ___AstrologicPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            gotoEveoPanel();
        }

        [Bindable(event="propertyChange")]
        public function get star8():Image
        {
            return (this._109757478star8);
        }

        public function set astrologicTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._383327001astrologicTitle;
            if (_local_2 !== _arg_1)
            {
                this._383327001astrologicTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "astrologicTitle", _local_2, _arg_1));
            };
        }

        public function set star1(_arg_1:Image):void
        {
            var _local_2:Object = this._109757471star1;
            if (_local_2 !== _arg_1)
            {
                this._109757471star1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star1", _local_2, _arg_1));
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            starDisClass = (loader.contentLoaderInfo.applicationDomain.getDefinition("starDisapear") as Class);
            starDisMC = [];
            loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            loader.unload();
        }

        public function ___AstrologicPanel_BasicDelayButton8_click(_arg_1:MouseEvent):void
        {
            pickClick();
        }

        [Bindable(event="propertyChange")]
        public function get star4():Image
        {
            return (this._109757474star4);
        }

        public function set star5(_arg_1:Image):void
        {
            var _local_2:Object = this._109757475star5;
            if (_local_2 !== _arg_1)
            {
                this._109757475star5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star5", _local_2, _arg_1));
            };
        }

        public function set star2(_arg_1:Image):void
        {
            var _local_2:Object = this._109757472star2;
            if (_local_2 !== _arg_1)
            {
                this._109757472star2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star2", _local_2, _arg_1));
            };
        }

        public function set star6(_arg_1:Image):void
        {
            var _local_2:Object = this._109757476star6;
            if (_local_2 !== _arg_1)
            {
                this._109757476star6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star6", _local_2, _arg_1));
            };
        }

        public function set star3(_arg_1:Image):void
        {
            var _local_2:Object = this._109757473star3;
            if (_local_2 !== _arg_1)
            {
                this._109757473star3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star3", _local_2, _arg_1));
            };
        }

        public function set star4(_arg_1:Image):void
        {
            var _local_2:Object = this._109757474star4;
            if (_local_2 !== _arg_1)
            {
                this._109757474star4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star4", _local_2, _arg_1));
            };
        }

        public function set star8(_arg_1:Image):void
        {
            var _local_2:Object = this._109757478star8;
            if (_local_2 !== _arg_1)
            {
                this._109757478star8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star8", _local_2, _arg_1));
            };
        }

        public function set star9(_arg_1:Image):void
        {
            var _local_2:Object = this._109757479star9;
            if (_local_2 !== _arg_1)
            {
                this._109757479star9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star9", _local_2, _arg_1));
            };
        }

        public function __star8_click(_arg_1:MouseEvent):void
        {
            selectStar(8);
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

        public function set refreshInfo(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1387624919refreshInfo;
            if (_local_2 !== _arg_1)
            {
                this._1387624919refreshInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshInfo", _local_2, _arg_1));
            };
        }

        public function __look4_click(_arg_1:MouseEvent):void
        {
            lookFormula(4);
        }

        private function onLookFormula(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.formula)))
            {
                formulaArr[_arg_1.id] = _arg_1.formula;
                refreshStarFormula();
            };
        }

        private function refreshMyToyal():void
        {
            total.htmlText = "";
        }

        private function refreshPickInfo():void
        {
            var _local_1:* = "";
            if (pickTimes > 0)
            {
                _local_1 = Language.ASTROLOGIC_PANEL_U[23];
                _local_1 = _local_1.replace("num1", pickTimes).replace("num2", FREE_PICK_TIMES);
            }
            else
            {
                _local_1 = Language.ASTROLOGIC_PANEL_U[24];
                _local_1 = _local_1.replace("num", (5 + buyPickTimes));
            };
            pickInfo.text = _local_1;
        }

        [Bindable(event="propertyChange")]
        public function get pickInfo():RoundedLabel
        {
            return (this._739745681pickInfo);
        }

        private function _AstrologicPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                astrologicTitle.text = _arg_1;
            }, "astrologicTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000011));
            }, function (_arg_1:Object):void
            {
                back.source = _arg_1;
            }, "back.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_RoundedLabel1.text = _arg_1;
            }, "_AstrologicPanel_RoundedLabel1.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_RoundedLabel2.text = _arg_1;
            }, "_AstrologicPanel_RoundedLabel2.text");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                formula.filters = _arg_1;
            }, "formula.filters");
            result[4] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _AstrologicPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_AstrologicPanel_LinkButton1.overSkin");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _AstrologicPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_AstrologicPanel_LinkButton1.upSkin");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _AstrologicPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_AstrologicPanel_LinkButton1.downSkin");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_LinkButton1.label = _arg_1;
            }, "_AstrologicPanel_LinkButton1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_RoundedLabel3.htmlText = _arg_1;
            }, "_AstrologicPanel_RoundedLabel3.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_RoundedLabel4.htmlText = _arg_1;
            }, "_AstrologicPanel_RoundedLabel4.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_RoundedLabel5.htmlText = _arg_1;
            }, "_AstrologicPanel_RoundedLabel5.htmlText");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200180555));
            }, function (_arg_1:Object):void
            {
                award0.source = _arg_1;
            }, "award0.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200180555));
            }, function (_arg_1:Object):void
            {
                award1.source = _arg_1;
            }, "award1.source");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200180555));
            }, function (_arg_1:Object):void
            {
                award2.source = _arg_1;
            }, "award2.source");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200180555));
            }, function (_arg_1:Object):void
            {
                award3.source = _arg_1;
            }, "award3.source");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200180555));
            }, function (_arg_1:Object):void
            {
                award4.source = _arg_1;
            }, "award4.source");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200180555));
            }, function (_arg_1:Object):void
            {
                award5.source = _arg_1;
            }, "award5.source");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                look0.label = _arg_1;
            }, "look0.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                look1.label = _arg_1;
            }, "look1.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                look2.label = _arg_1;
            }, "look2.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                look3.label = _arg_1;
            }, "look3.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                look4.label = _arg_1;
            }, "look4.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                look5.label = _arg_1;
            }, "look5.label");
            result[23] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                recordsList.filters = _arg_1;
            }, "recordsList.filters");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_BasicDelayButton7.label = _arg_1;
            }, "_AstrologicPanel_BasicDelayButton7.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_BasicDelayButton8.label = _arg_1;
            }, "_AstrologicPanel_BasicDelayButton8.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.ASTROLOGIC_PANEL_U[0] + ":");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                total.text = _arg_1;
            }, "total.text");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                total.toolTip = _arg_1;
            }, "total.toolTip");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AstrologicPanel_LinkButton2.label = _arg_1;
            }, "_AstrologicPanel_LinkButton2.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.npPnt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulLabNum.text = _arg_1;
            }, "soulLabNum.text");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulLabNum.toolTip = _arg_1;
            }, "soulLabNum.toolTip");
            result[31] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200087));
            }, function (_arg_1:Object):void
            {
                star1.source = _arg_1;
            }, "star1.source");
            result[32] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200088));
            }, function (_arg_1:Object):void
            {
                star2.source = _arg_1;
            }, "star2.source");
            result[33] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200086));
            }, function (_arg_1:Object):void
            {
                star3.source = _arg_1;
            }, "star3.source");
            result[34] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200079));
            }, function (_arg_1:Object):void
            {
                star4.source = _arg_1;
            }, "star4.source");
            result[35] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200078));
            }, function (_arg_1:Object):void
            {
                star5.source = _arg_1;
            }, "star5.source");
            result[36] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200084));
            }, function (_arg_1:Object):void
            {
                star6.source = _arg_1;
            }, "star6.source");
            result[37] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200077));
            }, function (_arg_1:Object):void
            {
                star7.source = _arg_1;
            }, "star7.source");
            result[38] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200083));
            }, function (_arg_1:Object):void
            {
                star8.source = _arg_1;
            }, "star8.source");
            result[39] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200080));
            }, function (_arg_1:Object):void
            {
                star9.source = _arg_1;
            }, "star9.source");
            result[40] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200081));
            }, function (_arg_1:Object):void
            {
                star10.source = _arg_1;
            }, "star10.source");
            result[41] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200082));
            }, function (_arg_1:Object):void
            {
                star11.source = _arg_1;
            }, "star11.source");
            result[42] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4030200200085));
            }, function (_arg_1:Object):void
            {
                star12.source = _arg_1;
            }, "star12.source");
            result[43] = binding;
            return (result);
        }

        public function set star7(_arg_1:Image):void
        {
            var _local_2:Object = this._109757477star7;
            if (_local_2 !== _arg_1)
            {
                this._109757477star7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star7", _local_2, _arg_1));
            };
        }

        private function toResult():void
        {
            var _local_1:String;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:MovieClip;
            var _local_6:UIComponent;
            if (myStars.length > 4)
            {
                myStars = myStars.slice((myStars.length - 4), myStars.length);
            };
            if (_result)
            {
                formulaArr[_result.fid] = _result.formula;
                refreshStarFormula();
                _local_1 = Language.ASTROLOGIC_PANEL_U[13];
                recordsList.htmlText = (_local_1.replace("num", (int(_result.fid) + 1)).replace("cname", _core.player.name).replace("name", _core.player.name).replace("cid", _core.player.id) + recordsList.htmlText);
                _local_2 = int((Math.ceil(((int(_result.fid) + 1) / 2)) + 1));
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_4 = ((myStars.length - _local_2) + _local_3);
                    if (starDisMC[_local_4] == null)
                    {
                        _local_5 = new starDisClass();
                        starDisMC[_local_4] = _local_5;
                        _local_6 = new UIComponent();
                        _local_6.x = (((16 + (_local_4 * 65)) + 28) + 15);
                        _local_6.y = ((194 + 28) + 39);
                        _local_6.addChild(_local_5);
                        this.addChild(_local_6);
                    }
                    else
                    {
                        _local_5 = starDisMC[_local_4];
                    };
                    _local_5.gotoAndPlay(1);
                    _local_3++;
                };
                myStars = _result.stars;
                refreshMyStars();
                if (int(_result.mult) == 1)
                {
                    textUp.setValue((_result.aid * int(_result.mult)), "", Language.ASTROLOGIC_PANEL_U[0]);
                }
                else
                {
                    textUp.setValue((_result.aid * (int(_result.mult) + 1)), "", Language.ASTROLOGIC_PANEL_U[0]);
                };
            };
            _result = null;
            state = 0;
            refreshStarsToPick(refreshTimes, _newStars);
            refreshStarFormula();
        }

        public function set total(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._110549828total;
            if (_local_2 !== _arg_1)
            {
                this._110549828total = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "total", _local_2, _arg_1));
            };
        }

        public function __star5_click(_arg_1:MouseEvent):void
        {
            selectStar(5);
        }

        public function __look1_click(_arg_1:MouseEvent):void
        {
            lookFormula(1);
        }

        private function moveEndHandler(_arg_1:Event):void
        {
            var _local_4:EnterFrameMove;
            var _local_5:AlphaResize;
            var _local_2:EnterFrameMove = (_arg_1.currentTarget as EnterFrameMove);
            if (1 == moveType)
            {
                _local_2.target.x = (16 + (65 * (myStars.length - 1)));
                _local_2.target.y = 194;
            }
            else
            {
                _local_2.target.x = 275;
                _local_2.target.y = 194;
            };
            _local_2.removeEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            _local_2.destroy();
            _local_2 = null;
            if (1 == moveType)
            {
                toResult();
                return;
            };
            var _local_3:int = 1;
            while (_local_3 < 6)
            {
                _local_4 = new EnterFrameMove();
                _local_4.target = this[("myStar" + _local_3)];
                _local_4.xBy = -65;
                _local_4.yBy = 0;
                _local_4.addEventListener(EnterFrameMove.EFFECT_END, move2EndHandler);
                _local_4.play(true);
                if (1 == _local_3)
                {
                    _local_5 = new AlphaResize(myStarsImages[0]);
                    _local_5.duration = 1000;
                    _local_5.alphaFrom = 1;
                    _local_5.alphaTo = 0;
                    _local_5.play();
                };
                _local_3++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get textUp():ScrollTextArrCanvas
        {
            return (this._877021016textUp);
        }

        [Bindable(event="propertyChange")]
        public function get soulLabNum():RoundedLabel
        {
            return (this._1491692172soulLabNum);
        }

        public function refreshMyStars(_arg_1:Boolean=false):void
        {
            var _local_3:Image;
            var _local_2:int;
            while (_local_2 < 4)
            {
                _local_3 = myStarsImages[_local_2];
                if (myStars[_local_2])
                {
                    _local_3.visible = true;
                    _local_3.alpha = 1;
                    _local_3.source = ResManager.getIconUrl(iconsUrl[myStars[_local_2]]);
                }
                else
                {
                    _local_3.visible = false;
                    _local_3.source = null;
                };
                _local_2++;
            };
            if (!_arg_1)
            {
                refreshStarFormula();
            };
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.ASTROLOGIC_PANEL_U[42].toString();
            _helpAlert = Alert.show(_local_1, Language.ASTROLOGIC_PANEL_U[38].toString(), Alert.YES, null, null);
        }

        public function __star2_click(_arg_1:MouseEvent):void
        {
            selectStar(2);
        }

        public function set formula(_arg_1:TextArea):void
        {
            var _local_2:Object = this._677424794formula;
            if (_local_2 !== _arg_1)
            {
                this._677424794formula = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "formula", _local_2, _arg_1));
            };
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
        }

        private function _AstrologicPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ASTROLOGIC_PANEL_U[0];
            _local_1 = ResManager.getIconUrl(4130220000011);
            _local_1 = Language.ASTROLOGIC_PANEL_U[15];
            _local_1 = Language.ASTROLOGIC_PANEL_U[16];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.ASTROLOGIC_PANEL_U[38];
            _local_1 = Language.ASTROLOGIC_PANEL_U[39];
            _local_1 = Language.ASTROLOGIC_PANEL_U[40];
            _local_1 = Language.ASTROLOGIC_PANEL_U[41];
            _local_1 = ResManager.getIconUrl(4030200180555);
            _local_1 = ResManager.getIconUrl(4030200180555);
            _local_1 = ResManager.getIconUrl(4030200180555);
            _local_1 = ResManager.getIconUrl(4030200180555);
            _local_1 = ResManager.getIconUrl(4030200180555);
            _local_1 = ResManager.getIconUrl(4030200180555);
            _local_1 = Language.ASTROLOGIC_PANEL_U[36];
            _local_1 = Language.ASTROLOGIC_PANEL_U[36];
            _local_1 = Language.ASTROLOGIC_PANEL_U[36];
            _local_1 = Language.ASTROLOGIC_PANEL_U[36];
            _local_1 = Language.ASTROLOGIC_PANEL_U[36];
            _local_1 = Language.ASTROLOGIC_PANEL_U[36];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.ASTROLOGIC_PANEL_U[18];
            _local_1 = Language.ASTROLOGIC_PANEL_U[19];
            _local_1 = (Language.ASTROLOGIC_PANEL_U[0] + ":");
            _local_1 = Language.ASTROLOGIC_PANEL_U[44];
            _local_1 = Language.ASTROLOGIC_PANEL_U[49];
            _local_1 = _core.player.npPnt;
            _local_1 = Language.ASTROLOGIC_PANEL_U[44];
            _local_1 = ResManager.getIconUrl(4030200200087);
            _local_1 = ResManager.getIconUrl(4030200200088);
            _local_1 = ResManager.getIconUrl(4030200200086);
            _local_1 = ResManager.getIconUrl(4030200200079);
            _local_1 = ResManager.getIconUrl(4030200200078);
            _local_1 = ResManager.getIconUrl(4030200200084);
            _local_1 = ResManager.getIconUrl(4030200200077);
            _local_1 = ResManager.getIconUrl(4030200200083);
            _local_1 = ResManager.getIconUrl(4030200200080);
            _local_1 = ResManager.getIconUrl(4030200200081);
            _local_1 = ResManager.getIconUrl(4030200200082);
            _local_1 = ResManager.getIconUrl(4030200200085);
        }

        public function ___AstrologicPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        private function refreshStarFormula():void
        {
            var _local_4:Object;
            var _local_5:int;
            var _local_6:int;
            if (!formulaArr)
            {
                return;
            };
            var _local_1:String = FORMULA_TEMPLE;
            var _local_2:Array = getCheck();
            var _local_3:int;
            while (_local_3 < 6)
            {
                _local_4 = formulaArr[_local_3];
                _local_5 = int(Math.ceil((((_local_3 + 1) / 2) + 1)));
                _local_6 = 0;
                while (_local_6 < _local_5)
                {
                    if (_local_4)
                    {
                        if (_local_2[_local_3][_local_6])
                        {
                            _local_1 = _local_1.replace((("p" + _local_3) + _local_6), (("<font color='#88aa00'>" + Language.ASTROLOGIC_PANEL_U[_local_4[_local_6]]) + "</font>"));
                        }
                        else
                        {
                            _local_1 = _local_1.replace((("p" + _local_3) + _local_6), Language.ASTROLOGIC_PANEL_U[_local_4[_local_6]]);
                        };
                    }
                    else
                    {
                        _local_1 = _local_1.replace((("p" + _local_3) + _local_6), "？");
                    };
                    _local_6++;
                };
                _local_3++;
            };
            formula.htmlText = _local_1;
            _local_3 = 0;
            while (_local_3 < 6)
            {
                if (formulaArr[_local_3])
                {
                    this[("look" + _local_3)].visible = false;
                    this[("award" + _local_3)].filters = [];
                }
                else
                {
                    ResManager.applyGray(this[("award" + _local_3)]);
                    this[("look" + _local_3)].visible = true;
                };
                _local_3++;
            };
        }

        public function initData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:Object;
            awardArr = _arg_1.award;
            formulaArr = _arg_1.formula;
            myStars = _arg_1.starsNow;
            refreshStarFormula();
            recordsList.htmlText = "";
            for (_local_2 in _arg_1.award_record)
            {
                if (_arg_1.award_record[_local_2])
                {
                    _local_3 = Language.ASTROLOGIC_PANEL_U[13];
                    _local_4 = _arg_1.award_record[_local_2];
                    recordsList.htmlText = (_local_3.replace("num", (int(_local_4.aid) + 1)).replace("cname", _local_4.name).replace("name", _local_4.name).replace("cid", _local_4.cid) + recordsList.htmlText);
                };
            };
            refreshStarsToPick(_arg_1.refreshCount, _arg_1.starsToPick);
            pickTimes = _arg_1.pickCount;
            buyPickTimes = _arg_1.buyPickCount;
            refreshPickInfo();
            if (myStars.length > 4)
            {
                myStars = myStars.slice((myStars.length - 4), myStars.length);
            };
            refreshMyStars(true);
            super.visible = true;
            recordsList.addEventListener(TextEvent.LINK, nameClick);
        }

        public function __star11_click(_arg_1:MouseEvent):void
        {
            selectStar(11);
        }

        public function set look0(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._103157105look0;
            if (_local_2 !== _arg_1)
            {
                this._103157105look0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "look0", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_3:Number;
            if ((((_arg_1) && (_core.player)) && (_core.player.level < 70)))
            {
                return;
            };
            var _local_2:* = "";
            init();
            if (_arg_1)
            {
                if (_core.player)
                {
                    _core.remote.call("getAstrologicData", null);
                };
                if (!starDisClass)
                {
                    loadDispMC();
                };
                _local_3 = 0;
                while (_local_3 <= 5)
                {
                    if (_core.MC_BIRTH_FLAG[101])
                    {
                        this[("award" + _local_3)].toolTip = Language.ASTROLOGIC_PANEL_U[46].replace("{num}", Math.ceil((awardInfo[_local_3] * _core.MC_BIRTH_FLAG[101])));
                    }
                    else
                    {
                        this[("award" + _local_3)].toolTip = Language.ASTROLOGIC_PANEL_U[(_local_3 + 25)];
                    };
                    _local_3++;
                };
            }
            else
            {
                super.visible = false;
            };
        }

        public function set pickInfo(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._739745681pickInfo;
            if (_local_2 !== _arg_1)
            {
                this._739745681pickInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pickInfo", _local_2, _arg_1));
            };
        }

        public function set award0(_arg_1:Image):void
        {
            var _local_2:Object = this._1405038221award0;
            if (_local_2 !== _arg_1)
            {
                this._1405038221award0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get back():Image
        {
            return (this._3015911back);
        }

        public function set award2(_arg_1:Image):void
        {
            var _local_2:Object = this._1405038219award2;
            if (_local_2 !== _arg_1)
            {
                this._1405038219award2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award2", _local_2, _arg_1));
            };
        }

        public function set award4(_arg_1:Image):void
        {
            var _local_2:Object = this._1405038217award4;
            if (_local_2 !== _arg_1)
            {
                this._1405038217award4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award4", _local_2, _arg_1));
            };
        }

        public function set award1(_arg_1:Image):void
        {
            var _local_2:Object = this._1405038220award1;
            if (_local_2 !== _arg_1)
            {
                this._1405038220award1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award1", _local_2, _arg_1));
            };
        }

        public function set award5(_arg_1:Image):void
        {
            var _local_2:Object = this._1405038216award5;
            if (_local_2 !== _arg_1)
            {
                this._1405038216award5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award5", _local_2, _arg_1));
            };
        }

        public function set look4(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._103157109look4;
            if (_local_2 !== _arg_1)
            {
                this._103157109look4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "look4", _local_2, _arg_1));
            };
        }

        public function set canvas6111(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1462326131canvas6111;
            if (_local_2 !== _arg_1)
            {
                this._1462326131canvas6111 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas6111", _local_2, _arg_1));
            };
        }

        public function set look3(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._103157108look3;
            if (_local_2 !== _arg_1)
            {
                this._103157108look3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "look3", _local_2, _arg_1));
            };
        }

        public function set award3(_arg_1:Image):void
        {
            var _local_2:Object = this._1405038218award3;
            if (_local_2 !== _arg_1)
            {
                this._1405038218award3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award3", _local_2, _arg_1));
            };
        }

        public function set look2(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._103157107look2;
            if (_local_2 !== _arg_1)
            {
                this._103157107look2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "look2", _local_2, _arg_1));
            };
        }

        public function ___AstrologicPanel_BasicDelayButton7_click(_arg_1:MouseEvent):void
        {
            refreshClick();
        }

        public function set look5(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._103157110look5;
            if (_local_2 !== _arg_1)
            {
                this._103157110look5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "look5", _local_2, _arg_1));
            };
        }

        public function set look1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._103157106look1;
            if (_local_2 !== _arg_1)
            {
                this._103157106look1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "look1", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            if (!myStarsImages)
            {
                myStarsImages = [this["myStar1"], this["myStar2"], this["myStar3"], this["myStar4"], this["myStar5"]];
            };
            var _local_1:StringBuffer = new StringBuffer();
            var _local_2:int;
            while (_local_2 < 6)
            {
                if (_local_2 <= 1)
                {
                    _local_1.append(((Language.GAMEPREDEF_S[(_local_2 + 544)] + "、") + "？ + ？ = "));
                }
                else
                {
                    if (_local_2 <= 3)
                    {
                        _local_1.append(((Language.GAMEPREDEF_S[(_local_2 + 544)] + "、") + "？ + ？ + ？ = "));
                    }
                    else
                    {
                        _local_1.append(((Language.GAMEPREDEF_S[(_local_2 + 544)] + "、") + "？ + ？ + ？ + ？ = "));
                    };
                };
                _local_2++;
            };
            formula.htmlText = _local_1.toString();
            formula.editable = false;
            formula.mouseEnabled = false;
            selectIndex = -1;
            recordsList.htmlText = "";
        }

        public function onPickStar(_arg_1:Object):void
        {
            pickTimes = _arg_1.leftTimes;
            buyPickTimes = _arg_1.buyTimes;
            refreshPickInfo();
            myStars.push(_arg_1.sid);
            startMove(_arg_1.sid);
            _result = _arg_1.result;
            _newStars = _arg_1.newStars;
            this.refreshTimes = _arg_1.refreshTimes;
            textUp.setValue(PICK_AWARD, "", Language.ASTROLOGIC_PANEL_U[0]);
        }

        public function set soulLabNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1491692172soulLabNum;
            if (_local_2 !== _arg_1)
            {
                this._1491692172soulLabNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulLabNum", _local_2, _arg_1));
            };
        }

        public function __look3_click(_arg_1:MouseEvent):void
        {
            lookFormula(3);
        }

        [Bindable(event="propertyChange")]
        public function get astrologicTitle():BasicTitleCanvas
        {
            return (this._383327001astrologicTitle);
        }

        public function __star7_click(_arg_1:MouseEvent):void
        {
            selectStar(7);
        }

        public function refreshStarsToPick(_arg_1:int, _arg_2:Object):void
        {
            var _local_3:String;
            state = 0;
            refreshTimes = _arg_1;
            if (_arg_1)
            {
                _local_3 = Language.ASTROLOGIC_PANEL_U[21];
                refreshInfo.text = _local_3.replace("num1", _arg_1).replace("num2", FREE_REFRESH_TIMES);
            }
            else
            {
                _local_3 = Language.ASTROLOGIC_PANEL_U[22];
                refreshInfo.text = _local_3.replace("num", 5);
            };
            var _local_4:int = 1;
            while (_local_4 < 13)
            {
                if (_arg_2.indexOf(_local_4) > -1)
                {
                    this[("star" + _local_4)].visible = true;
                    this[("star" + _local_4)].source = ResManager.getIconUrl(iconsUrl[_local_4]);
                }
                else
                {
                    this[("star" + _local_4)].visible = false;
                };
                _local_4++;
            };
        }

        private function loadDispMC():void
        {
            if (!loader)
            {
                loader = new Loader();
            };
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
            loader.load(new URLRequest(ResManager.getResUrl(2080130100019)));
        }

        public function set canvas51111(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1913453667canvas51111;
            if (_local_2 !== _arg_1)
            {
                this._1913453667canvas51111 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas51111", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get total():RoundedLabel
        {
            return (this._110549828total);
        }

        public function __star4_click(_arg_1:MouseEvent):void
        {
            selectStar(4);
        }

        private function move2EndHandler(_arg_1:Event):void
        {
            var _local_2:EnterFrameMove = (_arg_1.currentTarget as EnterFrameMove);
            _local_2.removeEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            _local_2.destroy();
            _local_2 = null;
            moveReset();
        }

        private function startMove(_arg_1:int):void
        {
            var _local_2:Image;
            if (myStars.length < 5)
            {
                moveType = 1;
                _local_2 = myStarsImages[(myStars.length - 1)];
            }
            else
            {
                moveType = 2;
                _local_2 = myStarsImages[(myStarsImages.length - 1)];
            };
            _local_2.source = ResManager.getIconUrl(iconsUrl[_arg_1]);
            _local_2.visible = true;
            _local_2.alpha = 1;
            _local_2.x = this[("star" + selectIndex)].x;
            _local_2.y = this[("star" + selectIndex)].y;
            selectIndex = -1;
            var _local_3:EnterFrameMove = new EnterFrameMove();
            state = 3;
            _local_3.target = _local_2;
            _local_3.stepLength = 20;
            if (1 == moveType)
            {
                _local_3.xBy = ((16 + ((myStars.length - 1) * 65)) - _local_2.x);
            }
            else
            {
                _local_3.xBy = (275 - _local_2.x);
            };
            _local_3.yBy = (194 - _local_2.y);
            _local_3.addEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            _local_3.play(true);
        }

        public function set textUp(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object = this._877021016textUp;
            if (_local_2 !== _arg_1)
            {
                this._877021016textUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textUp", _local_2, _arg_1));
            };
        }

        private function getCheck():Array
        {
            var _local_3:Array;
            var _local_4:Boolean;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_1:Array = [[false, false], [false, false], [false, false, false], [false, false, false], [false, false, false, false], [false, false, false, false]];
            var _local_2:int;
            while (_local_2 < formulaArr.length)
            {
                _local_3 = formulaArr[_local_2];
                _local_4 = false;
                if (!((!(_local_3)) || (_local_3.length < 2)))
                {
                    _local_5 = (myStars.length - 1);
                    _local_6 = myStars[_local_5--];
                    _local_7 = -1;
                    _local_8 = Math.min((myStars.length - 1), (_local_3.length - 2));
                    while (_local_8 >= 0)
                    {
                        if (_local_3[_local_8] != _local_6)
                        {
                            _local_4 = false;
                            _local_7 = -1;
                            _local_5 = (myStars.length - 1);
                            _local_6 = myStars[_local_5--];
                        }
                        else
                        {
                            if (!_local_4)
                            {
                                _local_7 = _local_8;
                                _local_4 = true;
                            };
                            _local_6 = myStars[_local_5--];
                            if (_local_5 < -1) break;
                        };
                        _local_8--;
                    };
                    if (_local_4)
                    {
                        _local_9 = 0;
                        while (_local_9 <= _local_7)
                        {
                            _local_1[_local_2][_local_9] = true;
                            _local_9++;
                        };
                    };
                };
                _local_2++;
            };
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get formula():TextArea
        {
            return (this._677424794formula);
        }

        public function __look0_click(_arg_1:MouseEvent):void
        {
            lookFormula(0);
        }

        private function selectStar(_arg_1:int):void
        {
            if (state != 0)
            {
                return;
            };
            selectIndex = _arg_1;
            var _local_2:int = 1;
            while (_local_2 < 13)
            {
                if (_local_2 == selectIndex)
                {
                    this[("star" + _local_2)].source = ResManager.getIconUrl(iconsSelectedUrl[_local_2]);
                }
                else
                {
                    this[("star" + _local_2)].source = ResManager.getIconUrl(iconsUrl[_local_2]);
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get look0():BasicDelayButton
        {
            return (this._103157105look0);
        }

        [Bindable(event="propertyChange")]
        public function get award0():Image
        {
            return (this._1405038221award0);
        }

        private function refreshClick():void
        {
            var _alert:Alert;
            var tf:IUITextField;
            if (((!(_core.player)) || (!(state == 0))))
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (_core.player.gold < 5)
                    {
                        Alert.show(Language.GUILDCONTRIBPANEL_U[1]);
                        selectIndex = -1;
                        state = 0;
                    }
                    else
                    {
                        _core.remote.call("refreshStars", null);
                        selectIndex = -1;
                        state = 1;
                    };
                };
            };
            if (refreshTimes <= 0)
            {
                _alert = Alert.show(Language.ASTROLOGIC_PANEL_U[34], "", (Alert.YES | Alert.NO), null, func);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = Language.ASTROLOGIC_PANEL_U[34];
                tf.filters = GamePredef.FILTER_TEXT1;
            }
            else
            {
                selectIndex = -1;
                _core.remote.call("refreshStars", null);
            };
        }

        [Bindable(event="propertyChange")]
        public function get award2():Image
        {
            return (this._1405038219award2);
        }

        [Bindable(event="propertyChange")]
        public function get award4():Image
        {
            return (this._1405038217award4);
        }

        [Bindable(event="propertyChange")]
        public function get award5():Image
        {
            return (this._1405038216award5);
        }

        [Bindable(event="propertyChange")]
        public function get award1():Image
        {
            return (this._1405038220award1);
        }

        [Bindable(event="propertyChange")]
        public function get look4():BasicDelayButton
        {
            return (this._103157109look4);
        }

        [Bindable(event="propertyChange")]
        public function get award3():Image
        {
            return (this._1405038218award3);
        }

        [Bindable(event="propertyChange")]
        public function get look1():BasicDelayButton
        {
            return (this._103157106look1);
        }

        [Bindable(event="propertyChange")]
        public function get canvas6111():Canvas
        {
            return (this._1462326131canvas6111);
        }

        [Bindable(event="propertyChange")]
        public function get look3():BasicDelayButton
        {
            return (this._103157108look3);
        }

        [Bindable(event="propertyChange")]
        public function get look5():BasicDelayButton
        {
            return (this._103157110look5);
        }

        private function gotoEveoPanel():void
        {
            if (_core.player.level < 120)
            {
                _core.sysMsg(Language.PET_HANDBOOK_PANEL_U[112]);
                return;
            };
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PET_EVOLUTION);
            if (_local_1)
            {
                _local_1.open(0);
                if (_local_1.initialized)
                {
                    _local_1.pageTab.selectedIndex = 1;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get look2():BasicDelayButton
        {
            return (this._103157107look2);
        }

        override public function initialize():void
        {
            var target:AstrologicPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AstrologicPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AstrologicPanelWatcherSetupUtil");
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

        public function __star10_click(_arg_1:MouseEvent):void
        {
            selectStar(10);
        }

        public function __look5_click(_arg_1:MouseEvent):void
        {
            lookFormula(5);
        }

        public function __star1_click(_arg_1:MouseEvent):void
        {
            selectStar(1);
        }

        [Bindable(event="propertyChange")]
        public function get canvas51111():Canvas
        {
            return (this._1913453667canvas51111);
        }

        public function set myStar1(_arg_1:Image):void
        {
            var _local_2:Object = this._1497985491myStar1;
            if (_local_2 !== _arg_1)
            {
                this._1497985491myStar1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myStar1", _local_2, _arg_1));
            };
        }

        public function __star9_click(_arg_1:MouseEvent):void
        {
            selectStar(9);
        }

        public function set myStar3(_arg_1:Image):void
        {
            var _local_2:Object = this._1497985493myStar3;
            if (_local_2 !== _arg_1)
            {
                this._1497985493myStar3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myStar3", _local_2, _arg_1));
            };
        }

        public function set myStar4(_arg_1:Image):void
        {
            var _local_2:Object = this._1497985494myStar4;
            if (_local_2 !== _arg_1)
            {
                this._1497985494myStar4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myStar4", _local_2, _arg_1));
            };
        }

        public function set myStar2(_arg_1:Image):void
        {
            var _local_2:Object = this._1497985492myStar2;
            if (_local_2 !== _arg_1)
            {
                this._1497985492myStar2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myStar2", _local_2, _arg_1));
            };
        }

        public function set myStar5(_arg_1:Image):void
        {
            var _local_2:Object = this._1497985495myStar5;
            if (_local_2 !== _arg_1)
            {
                this._1497985495myStar5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myStar5", _local_2, _arg_1));
            };
        }

        private function nameClick(_arg_1:TextEvent):void
        {
            LinkEventUtil.linkTextHandler(_arg_1.text, this.stage);
        }

        private function lookFormula(fid:int):void
        {
            var cost:int;
            var gfunc:Function;
            var str:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (((formulaArr) && (formulaArr[fid])))
            {
                return;
            };
            var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var goldLockFlag:Boolean = bagPanel.goldLockFlag;
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
            cost = 0;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (_core.player.gold < cost)
                    {
                        Alert.show(Language.GUILDCONTRIBPANEL_U[1]);
                    }
                    else
                    {
                        _core.remote.call("lookFormula", new Responder(onLookFormula), fid);
                    };
                };
            };
            if (_core.player)
            {
                str = Language.ASTROLOGIC_PANEL_U[35];
                if (fid <= 1)
                {
                    cost = 180;
                }
                else
                {
                    if (fid <= 3)
                    {
                        cost = 280;
                    }
                    else
                    {
                        cost = 380;
                    };
                };
                str = str.replace("num", cost);
                _alert = Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = str;
                tf.filters = GamePredef.FILTER_TEXT1;
            };
        }

        public function __star6_click(_arg_1:MouseEvent):void
        {
            selectStar(6);
        }

        public function set back(_arg_1:Image):void
        {
            var _local_2:Object = this._3015911back;
            if (_local_2 !== _arg_1)
            {
                this._3015911back = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "back", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myStar1():Image
        {
            return (this._1497985491myStar1);
        }

        [Bindable(event="propertyChange")]
        public function get myStar2():Image
        {
            return (this._1497985492myStar2);
        }

        override public function initView():void
        {
        }

        public function __look2_click(_arg_1:MouseEvent):void
        {
            lookFormula(2);
        }

        public function set star10(_arg_1:Image):void
        {
            var _local_2:Object = this._892485647star10;
            if (_local_2 !== _arg_1)
            {
                this._892485647star10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myStar3():Image
        {
            return (this._1497985493myStar3);
        }

        [Bindable(event="propertyChange")]
        public function get myStar4():Image
        {
            return (this._1497985494myStar4);
        }

        [Bindable(event="propertyChange")]
        public function get myStar5():Image
        {
            return (this._1497985495myStar5);
        }

        private function pickClick():void
        {
            var str:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (!_core.player)
            {
                return;
            };
            if (selectIndex == -1)
            {
                Alert.show(Language.ASTROLOGIC_PANEL_U[45], "", Alert.YES);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (_core.player.gold < (5 + buyPickTimes))
                    {
                        Alert.show(Language.GUILDCONTRIBPANEL_U[1]);
                    }
                    else
                    {
                        _core.remote.call("pickStar", null, selectIndex);
                    };
                };
            };
            if (pickTimes <= 0)
            {
                str = Language.ASTROLOGIC_PANEL_U[33];
                _alert = Alert.show(str.replace("num", (5 + buyPickTimes)), "", (Alert.YES | Alert.NO), null, func);
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = str.replace("num", (5 + buyPickTimes));
                tf.filters = GamePredef.FILTER_TEXT1;
            }
            else
            {
                _core.remote.call("pickStar", null, selectIndex);
            };
        }

        public function set star11(_arg_1:Image):void
        {
            var _local_2:Object = this._892485646star11;
            if (_local_2 !== _arg_1)
            {
                this._892485646star11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star10():Image
        {
            return (this._892485647star10);
        }

        [Bindable(event="propertyChange")]
        public function get star12():Image
        {
            return (this._892485645star12);
        }

        [Bindable(event="propertyChange")]
        public function get star11():Image
        {
            return (this._892485646star11);
        }

        private function moveReset():void
        {
            if (((state == 3) && (2 == moveType)))
            {
                myStarsImages.push(myStarsImages.shift());
                myStarsImages[(myStarsImages.length - 1)].source = null;
                myStarsImages[(myStarsImages.length - 1)].visible = false;
                toResult();
            };
            var _local_1:int;
            while (_local_1 < 4)
            {
                myStarsImages[_local_1].x = (16 + (65 * _local_1));
                _local_1++;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

