// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.XiaochudasaiPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.MyButton;
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.binding.utils.ChangeWatcher;
    import com.qeedoo.ui.view.comp.Property;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import flash.display.Loader;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.XCDSDiabetesBox;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponent;
    import flash.utils.Dictionary;
    import flash.display.Bitmap;
    import mx.controls.DataGrid;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.effects.EnterFrameMove;
    import flash.display.MovieClip;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
    import com.qeedoo.ui.resource.ResManager;
    import flash.geom.Rectangle;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
    import flash.utils.setTimeout;
    import flash.display.Sprite;
    import mx.controls.dataGridClasses.DataGridColumn;
    import flash.utils.getDefinitionByName;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.events.FlexEvent;
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

    public class XiaochudasaiPanel extends DragableCanvas implements IBindingClient 
    {

        public static var rects:Array = [];
        private static const EFFECT_BM_WIDTH:Number = 550;
        private static const EFFECT_BM_HEIGHT:Number = 550;
        private static const XCDS_DIABETES_LINE_NUM:int = 9;
        private static const XCDS_STAR_LEV1:int = 800;
        private static const XCDS_STAR_LEV2:int = 1100;
        private static const XCDS_STAR_LEV3:int = 1380;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var diabetes:Boolean = false;
        public var _XiaochudasaiPanel_Label3:Label;
        public var _XiaochudasaiPanel_Label4:Label;
        public var _XiaochudasaiPanel_Label5:Label;
        public var _XiaochudasaiPanel_Label6:Label;
        public var _XiaochudasaiPanel_Label7:Label;
        public var _XiaochudasaiPanel_Label8:Label;
        private var _109757473star3:MyButton;
        private var _613866340xcdsRoundTody:Label;
        private var _1739702565highestScoreAllRound:Label;
        private var _812013276container1Mask:Canvas;
        private var _519060726xcdsPoint:Label;
        public var _XiaochudasaiPanel_Image1:Image;
        private var _watcher:ChangeWatcher;
        private var _11282169xcdsProgress:Property;
        private var stepData:Object;
        private var _549570497canMove:Boolean = true;
        private var _106433028panel:Canvas;
        private var effect_arr:Array;
        private var _653011671rankSlot3:ItemSlot;
        private var wData:Object;
        private var _109757471star1:MyButton;
        public var _XiaochudasaiPanel_BasicDelayButton1:BasicDelayButton;
        public var _XiaochudasaiPanel_BasicDelayButton4:BasicDelayButton;
        public var _XiaochudasaiPanel_BasicDelayButton2:BasicDelayButton;
        private var _321863295refreshBtn:BasicDelayButton;
        private var _653011673rankSlot1:ItemSlot;
        private var _360515433awardLable:Label;
        private var hasLoadRank:* = false;
        private var _653011669rankSlot5:ItemSlot;
        private var load:Loader;
        public var _XiaochudasaiPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var steps:Array;
        private var _115312txt:IntroText;
        private var moveBox1:XCDSDiabetesBox;
        private var moveBox2:XCDSDiabetesBox;
        private var needToEndThisRound:* = false;
        private var _1256566702newRoundBtn:BasicDelayButton;
        private var _109757472star2:MyButton;
        private var _485512578scoreTxt:Label;
        private var _1578405093startRoundBtnCenter:BasicGlowButton;
        private var _145245136container1:UIComponent;
        private var _653011670rankSlot4:ItemSlot;
        private var _1975768049leftNumTxt:Label;
        private var boxes:Dictionary;
        private var effect_bm:Bitmap;
        private var _653011668rankSlot6:ItemSlot;
        private var _653011672rankSlot2:ItemSlot;
        private var _18543865timeLable:Label;
        private var _2146689831endThisRoundBtn:BasicDelayButton;
        private var moveNum:int = 0;
        private var load_state:int = 0;
        private var _1825991153serverRank:DataGrid;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":839,
                    "height":634,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_XiaochudasaiPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "mouseEnabled":false,
                                "height":600,
                                "width":836,
                                "x":1,
                                "y":32,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.top = "8";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "mouseEnabled":false,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "width":334,
                                            "height":480,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "10";
                                                    this.left = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":129,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"timeLable",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "2";
                                                                this.left = "5";
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"text":"Thời gian:1986-8-13 ~ 1986-8-19"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"awardLable",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "24";
                                                                this.left = "5";
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"text":"Thời gian xếp hạng: "});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rankSlot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rankSlot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":58,
                                                                    "y":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rankSlot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":111,
                                                                    "y":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rankSlot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":161,
                                                                    "y":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rankSlot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":213,
                                                                    "y":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rankSlot6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":266,
                                                                    "y":51
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_XiaochudasaiPanel_Label3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.bottom = "22";
                                                                this.left = "2";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"text":"Top1"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_XiaochudasaiPanel_Label4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.left = "53";
                                                                this.bottom = "22";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"text":"Top2"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_XiaochudasaiPanel_Label5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.left = "107";
                                                                this.bottom = "22";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"text":"Top3"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_XiaochudasaiPanel_Label6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.left = "157";
                                                                this.bottom = "22";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"text":"Top4-5"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_XiaochudasaiPanel_Label7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.left = "204";
                                                                this.bottom = "22";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"text":"Top6-10"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_XiaochudasaiPanel_Label8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                                this.left = "257";
                                                                this.bottom = "22";
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"text":"Top11-20"});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"serverRank",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                    this.top = "121";
                                                    this.bottom = "30";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "columnWidth":180,
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "percentWidth":100,
                                                        "x":8,
                                                        "columns":[_XiaochudasaiPanel_DataGridColumn1_c(), _XiaochudasaiPanel_DataGridColumn2_c(), _XiaochudasaiPanel_DataGridColumn3_c()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_XiaochudasaiPanel_BasicDelayButton1",
                                                "events":{"click":"___XiaochudasaiPanel_BasicDelayButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "7";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":5000,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_XiaochudasaiPanel_BasicDelayButton2",
                                                "events":{"click":"___XiaochudasaiPanel_BasicDelayButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "7";
                                                    this.right = "100";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":10000,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"txt",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "8";
                                        this.top = "496";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "width":334,
                                            "height":97
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"panel",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "8";
                                        this.left = "350";
                                        this.right = "6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "height":585,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_XiaochudasaiPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2,
                                                        "y":2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"highestScoreAllRound",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "9";
                                                    this.left = "15";
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"xcdsPoint",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "32";
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                    this.right = "10";
                                                    this.textAlign = "right";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"xcdsRoundTody",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "32";
                                                    this.left = "15";
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Property,
                                                "id":"xcdsProgress",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "15";
                                                    this.top = "64";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":13,
                                                        "styleName":"ProgressExp",
                                                        "color":0xFFFFFF,
                                                        "m":100,
                                                        "v":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":MyButton,
                                                "id":"star1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":28,
                                                        "height":28,
                                                        "y":56,
                                                        "toolTip":"800 đạt 1 sao"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":MyButton,
                                                "id":"star2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":28,
                                                        "height":28,
                                                        "x":340,
                                                        "y":56,
                                                        "toolTip":"1100 đạt 2 sao"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":MyButton,
                                                "id":"star3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":28,
                                                        "height":28,
                                                        "x":450,
                                                        "y":56,
                                                        "toolTip":"1380 đạt 3 sao"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"container1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "width":450,
                                                        "height":450,
                                                        "x":16,
                                                        "y":98
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"leftNumTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "8";
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                    this.textAlign = "left";
                                                    this.left = "162";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "events":{"click":"___XiaochudasaiPanel_BasicDelayButton3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "7";
                                                    this.right = "191.05";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"styleName":"BtnAdd"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"scoreTxt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "32";
                                                    this.left = "162";
                                                    this.color = 0xFFFF;
                                                    this.fontWeight = "bold";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_XiaochudasaiPanel_BasicDelayButton4",
                                                "events":{"click":"___XiaochudasaiPanel_BasicDelayButton4_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"styleName":"BtnStdRed"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"newRoundBtn",
                                                "events":{"click":"__newRoundBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "96";
                                                    this.top = "558";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":1000,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"endThisRoundBtn",
                                                "events":{"click":"__endThisRoundBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "97";
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":1000,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"refreshBtn",
                                                "events":{"click":"__refreshBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "23";
                                                    this.top = "558";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":1000,
                                                        "styleName":"BtnStdRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"container1Mask",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0.5;
                                                    this.backgroundColor = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "width":450,
                                                        "height":450,
                                                        "x":13,
                                                        "y":95,
                                                        "visible":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"startRoundBtnCenter",
                                                            "events":{"click":"__startRoundBtnCenter_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"BtnStdRed"});
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
        public var effects:Array = [];
        private var _core:Core = Core.getInstance();
        private var _675946490xcdsRank:ArrayCollection = new ArrayCollection();
        private var moveHandlers:Array = [];
        public var XCDSAwardConfig:Array = [6637, 6638, 6639, 6640, 6641, 6642];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function XiaochudasaiPanel()
        {
            mx_internal::_document = this;
            this.width = 839;
            this.height = 634;
            this.styleName = "StandardContent";
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            XiaochudasaiPanel._watcherSetupUtil = _arg_1;
        }


        private function allRefresh():void
        {
            if (!canMove)
            {
                return;
            };
            if (((wData) && (wData.state == 2)))
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[7]);
                return;
            };
            var _local_1:String = Language.SUMMER_GAME_PANEL[10];
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, askRefresh);
        }

        [Bindable(event="propertyChange")]
        public function get panel():Canvas
        {
            return (this._106433028panel);
        }

        public function set xcdsProgress(_arg_1:Property):void
        {
            var _local_2:Object = this._11282169xcdsProgress;
            if (_local_2 !== _arg_1)
            {
                this._11282169xcdsProgress = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xcdsProgress", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star1():MyButton
        {
            return (this._109757471star1);
        }

        public function set panel(_arg_1:Canvas):void
        {
            var _local_2:Object = this._106433028panel;
            if (_local_2 !== _arg_1)
            {
                this._106433028panel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panel", _local_2, _arg_1));
            };
        }

        private function askRefresh(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("XCDSRefresh", new Responder(onRefresh));
            };
        }

        private function set xcdsRank(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._675946490xcdsRank;
            if (_local_2 !== _arg_1)
            {
                this._675946490xcdsRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xcdsRank", _local_2, _arg_1));
            };
        }

        public function set serverRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1825991153serverRank;
            if (_local_2 !== _arg_1)
            {
                this._1825991153serverRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "serverRank", _local_2, _arg_1));
            };
        }

        private function onBuy(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (int(_arg_1["num"]) > 0)
            {
                wData.leftNum = _arg_1["num"];
                leftNumTxt.text = Language.XCDS_PANEL[12].replace("{step}", int(wData.leftNum));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star2():MyButton
        {
            return (this._109757472star2);
        }

        [Bindable(event="propertyChange")]
        public function get star3():MyButton
        {
            return (this._109757473star3);
        }

        private function dropDown():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:XCDSDiabetesBox;
            var _local_7:EnterFrameMove;
            var _local_1:int;
            while (_local_1 < XCDS_DIABETES_LINE_NUM)
            {
                _local_2 = ((17 * XCDS_DIABETES_LINE_NUM) + _local_1);
                _local_3 = 0;
                _local_4 = 0;
                while (_local_4 < (XCDS_DIABETES_LINE_NUM * 2))
                {
                    _local_5 = (_local_2 - (_local_4 * XCDS_DIABETES_LINE_NUM));
                    _local_6 = boxes[_local_5];
                    if (!_local_6)
                    {
                        _local_3++;
                    }
                    else
                    {
                        if (_local_3 > 0)
                        {
                            moveNum++;
                            _local_7 = new EnterFrameMove();
                            _local_7.target = _local_6;
                            _local_7.stepLength = 25;
                            _local_7.xBy = 0;
                            _local_7.yBy = (50 * _local_3);
                            boxes[_local_5] = null;
                            boxes[(_local_5 + (_local_3 * XCDS_DIABETES_LINE_NUM))] = _local_6;
                            _local_6.setIndex((_local_5 + (_local_3 * XCDS_DIABETES_LINE_NUM)));
                            _local_7.addEventListener(EnterFrameMove.EFFECT_END, stepMoveEnd);
                            _local_7.play(true);
                            moveHandlers.push(_local_7);
                        };
                    };
                    _local_4++;
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get serverRank():DataGrid
        {
            return (this._1825991153serverRank);
        }

        public function set star1(_arg_1:MyButton):void
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
            var _local_8:Class;
            var _local_9:MovieClip;
            var _local_10:BitmapData;
            var _local_11:BitmapData;
            var _local_2:Array = ["yellow", "blue", "green", "zi", "red", "bomb", "num2"];
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_8 = (load.contentLoaderInfo.applicationDomain.getDefinition(_local_2[_local_3]) as Class);
                _local_9 = new (_local_8)();
                _local_10 = new BitmapData(_local_9.width, _local_9.height, true, 0xFFFFFF);
                _local_10.draw(_local_9);
                rects[_local_3] = _local_10;
                _local_3++;
            };
            var _local_4:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("bomb_eff") as Class);
            var _local_5:MovieClip = new (_local_4)();
            var _local_6:Matrix = new Matrix();
            var _local_7:int = 1;
            while (_local_7 <= _local_5.totalFrames)
            {
                _local_5.gotoAndStop(_local_7);
                if ((_local_5.width * _local_5.height) > 0)
                {
                    _local_11 = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
                    _local_6.tx = 200;
                    _local_6.ty = 200;
                    _local_11.draw(_local_5, _local_6);
                    effects[(_local_7 - 1)] = _local_11;
                };
                _local_7++;
            };
            load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            init();
            _core.remote.call("getXCDSData", null);
            if (!hasLoadRank)
            {
                getRank();
                hasLoadRank = true;
            };
        }

        public function set star2(_arg_1:MyButton):void
        {
            var _local_2:Object = this._109757472star2;
            if (_local_2 !== _arg_1)
            {
                this._109757472star2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star2", _local_2, _arg_1));
            };
        }

        private function checkDiabete(_arg_1:int):Boolean
        {
            var _local_4:Object;
            var _local_2:Object = wData["data"][_arg_1];
            var _local_3:int = 1;
            _local_4 = wData["data"][(_arg_1 - XCDS_DIABETES_LINE_NUM)];
            while (((_local_4) && (_local_4.type == _local_2.type)))
            {
                _local_3++;
                if ((_local_4.index - XCDS_DIABETES_LINE_NUM) < 81) break;
                _local_4 = wData["data"][(_local_4.index - XCDS_DIABETES_LINE_NUM)];
            };
            _local_4 = wData["data"][(_arg_1 + XCDS_DIABETES_LINE_NUM)];
            while (((_local_4) && (_local_4.type == _local_2.type)))
            {
                _local_3++;
                _local_4 = wData["data"][(_local_4.index + XCDS_DIABETES_LINE_NUM)];
            };
            if (_local_3 >= 3)
            {
                return (true);
            };
            _local_3 = 1;
            _local_4 = wData["data"][(_arg_1 - 1)];
            while ((((_local_4) && (_local_4.type == _local_2.type)) && (!(((_local_4.index + 1) % XCDS_DIABETES_LINE_NUM) == 0))))
            {
                _local_3++;
                _local_4 = wData["data"][(_local_4.index - 1)];
            };
            _local_4 = wData["data"][(_arg_1 + 1)];
            while ((((_local_4) && (_local_4.type == _local_2.type)) && (!((_local_4.index % XCDS_DIABETES_LINE_NUM) == 0))))
            {
                _local_3++;
                _local_4 = wData["data"][(_local_4.index + 1)];
            };
            if (_local_3 >= 3)
            {
                return (true);
            };
            return (false);
        }

        private function clean():void
        {
            var _local_1:XCDSDiabetesBox;
            var _local_3:int;
            var _local_4:int;
            if (!boxes)
            {
                return;
            };
            var _local_2:int;
            while (_local_2 < XCDS_DIABETES_LINE_NUM)
            {
                _local_3 = 0;
                while (_local_3 < XCDS_DIABETES_LINE_NUM)
                {
                    _local_4 = ((_local_2 * XCDS_DIABETES_LINE_NUM) + _local_3);
                    _local_1 = boxes[_local_4];
                    if (_local_1)
                    {
                        _local_1.x = (50 * _local_3);
                        _local_1.y = ((50 * _local_2) - 450);
                        _local_1.setParam(false, 1);
                        _local_1.setType(-1);
                    }
                    else
                    {
                        _local_1 = new XCDSDiabetesBox();
                        _local_1.setIndex(_local_4);
                        boxes[_local_4] = _local_1;
                        _local_1.x = (50 * _local_3);
                        _local_1.y = ((50 * _local_2) - 450);
                        container1.addChild(_local_1);
                    };
                    _local_3++;
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        private function get xcdsRank():ArrayCollection
        {
            return (this._675946490xcdsRank);
        }

        public function ___XiaochudasaiPanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            getRank();
        }

        private function startNewRound():void
        {
            var _local_1:String = Language.XCDS_PANEL[7];
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, _startNewRound);
        }

        private function checkPosition():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:XCDSDiabetesBox;
            var _local_1:int;
            while (_local_1 < (XCDS_DIABETES_LINE_NUM * 2))
            {
                _local_2 = 0;
                while (_local_2 < XCDS_DIABETES_LINE_NUM)
                {
                    _local_3 = ((_local_1 * XCDS_DIABETES_LINE_NUM) + _local_2);
                    _local_4 = boxes[_local_3];
                    if (_local_4)
                    {
                        _local_4.x = (50 * _local_2);
                        _local_4.y = ((50 * _local_1) - 450);
                    };
                    _local_2++;
                };
                _local_1++;
            };
        }

        public function set rankSlot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._653011671rankSlot3;
            if (_local_2 !== _arg_1)
            {
                this._653011671rankSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankSlot3", _local_2, _arg_1));
            };
        }

        public function set rankSlot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._653011670rankSlot4;
            if (_local_2 !== _arg_1)
            {
                this._653011670rankSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankSlot4", _local_2, _arg_1));
            };
        }

        public function set endThisRoundBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._2146689831endThisRoundBtn;
            if (_local_2 !== _arg_1)
            {
                this._2146689831endThisRoundBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endThisRoundBtn", _local_2, _arg_1));
            };
        }

        public function set rankSlot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._653011669rankSlot5;
            if (_local_2 !== _arg_1)
            {
                this._653011669rankSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankSlot5", _local_2, _arg_1));
            };
        }

        public function set rankSlot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._653011672rankSlot2;
            if (_local_2 !== _arg_1)
            {
                this._653011672rankSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankSlot2", _local_2, _arg_1));
            };
        }

        private function _startNewRound(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("XCDSStartNewRound", null);
            };
        }

        public function set star3(_arg_1:MyButton):void
        {
            var _local_2:Object = this._109757473star3;
            if (_local_2 !== _arg_1)
            {
                this._109757473star3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star3", _local_2, _arg_1));
            };
        }

        public function set rankSlot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._653011673rankSlot1;
            if (_local_2 !== _arg_1)
            {
                this._653011673rankSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankSlot1", _local_2, _arg_1));
            };
        }

        public function set rankSlot6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._653011668rankSlot6;
            if (_local_2 !== _arg_1)
            {
                this._653011668rankSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankSlot6", _local_2, _arg_1));
            };
        }

        private function onEndThisRound(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (((_arg_1["point"]) && (_arg_1["point"] >= 0)))
            {
                xcdsPoint.text = Language.XCDS_PANEL[8].replace("{point}", _arg_1["point"]);
            };
            if (_arg_1["flag"])
            {
                highestScoreAllRound.text = Language.XCDS_PANEL[9].replace("{highestScore}", _arg_1["flag"].hs);
            };
            container1Mask.visible = true;
            needToEndThisRound = false;
        }

        private function getDiabetesRes():void
        {
            if (load_state != 0)
            {
                _core.remote.call("getXCDSData", null);
                getRank();
                hasLoadRank = true;
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130000467)));
                load_state = 1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get txt():IntroText
        {
            return (this._115312txt);
        }

        private function effectHandler(_arg_1:Event):void
        {
            var _local_4:Object;
            var _local_5:BitmapData;
            if (effect_arr.length == 0)
            {
                removeEventListener(Event.ENTER_FRAME, effectHandler);
                return;
            };
            effect_bm.bitmapData.fillRect(new Rectangle(0, 0, EFFECT_BM_WIDTH, EFFECT_BM_HEIGHT), 0xFFFFFF);
            var _local_2:Matrix = new Matrix();
            var _local_3:int;
            while (_local_3 < effect_arr.length)
            {
                if (effects.length == 0) break;
                _local_4 = effect_arr[_local_3];
                if (_local_4.counter >= effects.length)
                {
                    effect_arr.splice(_local_3, 1);
                    _local_3--;
                }
                else
                {
                    _local_5 = effects[_local_4.counter++];
                    _local_2.tx = (_local_4._x - 125);
                    _local_2.ty = (_local_4._y - 125);
                    effect_bm.bitmapData.draw(_local_5, _local_2);
                };
                _local_3++;
            };
        }

        private function _XiaochudasaiPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.XCDS_PANEL[0];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = xcdsRank;
            _local_1 = Language.XCDS_PANEL[3];
            _local_1 = Language.XCDS_PANEL[11];
            _local_1 = ResManager.getIconUrl(4130220003332);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.XCDS_PANEL[6];
            _local_1 = canMove;
            _local_1 = Language.XCDS_PANEL[4];
            _local_1 = canMove;
            _local_1 = Language.XCDS_PANEL[15];
            _local_1 = canMove;
            _local_1 = Language.SUMMER_GAME_PANEL[11];
            _local_1 = canMove;
            _local_1 = Language.XCDS_PANEL[4];
        }

        [Bindable(event="propertyChange")]
        public function get scoreTxt():Label
        {
            return (this._485512578scoreTxt);
        }

        private function buy():void
        {
            var _local_1:String = Language.XCDS_PANEL[14];
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, askBuy);
        }

        private function _XiaochudasaiPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XCDS_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiaochudasaiPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_XiaochudasaiPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                timeLable.filters = _arg_1;
            }, "timeLable.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                awardLable.filters = _arg_1;
            }, "awardLable.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiaochudasaiPanel_Label3.filters = _arg_1;
            }, "_XiaochudasaiPanel_Label3.filters");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiaochudasaiPanel_Label4.filters = _arg_1;
            }, "_XiaochudasaiPanel_Label4.filters");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiaochudasaiPanel_Label5.filters = _arg_1;
            }, "_XiaochudasaiPanel_Label5.filters");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiaochudasaiPanel_Label6.filters = _arg_1;
            }, "_XiaochudasaiPanel_Label6.filters");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiaochudasaiPanel_Label7.filters = _arg_1;
            }, "_XiaochudasaiPanel_Label7.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _XiaochudasaiPanel_Label8.filters = _arg_1;
            }, "_XiaochudasaiPanel_Label8.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (xcdsRank);
            }, function (_arg_1:Object):void
            {
                serverRank.dataProvider = _arg_1;
            }, "serverRank.dataProvider");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XCDS_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiaochudasaiPanel_BasicDelayButton1.label = _arg_1;
            }, "_XiaochudasaiPanel_BasicDelayButton1.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XCDS_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiaochudasaiPanel_BasicDelayButton2.label = _arg_1;
            }, "_XiaochudasaiPanel_BasicDelayButton2.label");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220003332));
            }, function (_arg_1:Object):void
            {
                _XiaochudasaiPanel_Image1.source = _arg_1;
            }, "_XiaochudasaiPanel_Image1.source");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                highestScoreAllRound.filters = _arg_1;
            }, "highestScoreAllRound.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                xcdsPoint.filters = _arg_1;
            }, "xcdsPoint.filters");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                xcdsRoundTody.filters = _arg_1;
            }, "xcdsRoundTody.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Class):void
            {
                star1.skin = _arg_1;
            }, "star1.skin");
            result[16] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Class):void
            {
                star2.skin = _arg_1;
            }, "star2.skin");
            result[17] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Class):void
            {
                star3.skin = _arg_1;
            }, "star3.skin");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                leftNumTxt.filters = _arg_1;
            }, "leftNumTxt.filters");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                scoreTxt.filters = _arg_1;
            }, "scoreTxt.filters");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XCDS_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _XiaochudasaiPanel_BasicDelayButton4.label = _arg_1;
            }, "_XiaochudasaiPanel_BasicDelayButton4.label");
            result[21] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (canMove);
            }, function (_arg_1:Boolean):void
            {
                newRoundBtn.enabled = _arg_1;
            }, "newRoundBtn.enabled");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XCDS_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                newRoundBtn.label = _arg_1;
            }, "newRoundBtn.label");
            result[23] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (canMove);
            }, function (_arg_1:Boolean):void
            {
                endThisRoundBtn.enabled = _arg_1;
            }, "endThisRoundBtn.enabled");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XCDS_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                endThisRoundBtn.label = _arg_1;
            }, "endThisRoundBtn.label");
            result[25] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (canMove);
            }, function (_arg_1:Boolean):void
            {
                refreshBtn.enabled = _arg_1;
            }, "refreshBtn.enabled");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SUMMER_GAME_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshBtn.label = _arg_1;
            }, "refreshBtn.label");
            result[27] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (canMove);
            }, function (_arg_1:Boolean):void
            {
                startRoundBtnCenter.enabled = _arg_1;
            }, "startRoundBtnCenter.enabled");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.XCDS_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                startRoundBtnCenter.label = _arg_1;
            }, "startRoundBtnCenter.label");
            result[29] = binding;
            return (result);
        }

        public function __endThisRoundBtn_click(_arg_1:MouseEvent):void
        {
            endThisRound();
        }

        private function moveEndHandler(_arg_1:Event):void
        {
            var _local_2:Array = wData["data"];
            diabetes = ((checkDiabete(moveBox1.index)) || (checkDiabete(moveBox2.index)));
            if (diabetes)
            {
                canMove = false;
                Core.getInstance().remote.call("XCDSMoveBox", null, moveBox1.index, moveBox2.index);
                checkPosition();
                moveBox1 = null;
                moveBox2 = null;
                return;
            };
            swapBoxes(moveEndHandler2);
        }

        public function onXCDSRoundEnd(_arg_1:*):void
        {
            if (_arg_1)
            {
                needToEndThisRound = true;
            };
        }

        private function getAward():void
        {
            _core.remote.call("XCDSGetAward", null);
        }

        private function getRank():void
        {
            _core.remote.call("XCDSGetRank", null);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" diabetes load res Error ");
        }

        public function onSetBox(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Boolean = _arg_1["flag"];
            if (_local_2)
            {
                steps = _arg_1["steps"];
                showStep();
            }
            else
            {
                this.visible = false;
            };
        }

        public function set awardLable(_arg_1:Label):void
        {
            var _local_2:Object = this._360515433awardLable;
            if (_local_2 !== _arg_1)
            {
                this._360515433awardLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardLable", _local_2, _arg_1));
            };
        }

        private function _endThisRound(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("xcdsEndThisRound", new Responder(onEndThisRound));
            };
        }

        public function ___XiaochudasaiPanel_BasicDelayButton4_click(_arg_1:MouseEvent):void
        {
            openXCDSShop();
        }

        public function set xcdsRoundTody(_arg_1:Label):void
        {
            var _local_2:Object = this._613866340xcdsRoundTody;
            if (_local_2 !== _arg_1)
            {
                this._613866340xcdsRoundTody = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xcdsRoundTody", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get highestScoreAllRound():Label
        {
            return (this._1739702565highestScoreAllRound);
        }

        [Bindable(event="propertyChange")]
        public function get container1Mask():Canvas
        {
            return (this._812013276container1Mask);
        }

        private function stepMoveEnd(_arg_1:Event):void
        {
            moveNum--;
            if (moveNum > 0)
            {
                return;
            };
            moveHandlers.length = 0;
            refreshQueue();
            checkPosition();
            showStep();
        }

        private function setProgressBar(_arg_1:Number):void
        {
            var _local_2:* = 0;
            var _local_3:* = 0;
            if (_arg_1 < 0)
            {
                xcdsProgress.v = _local_3;
                return;
            };
            if (_arg_1 >= XCDS_STAR_LEV3)
            {
                _local_3 = 100;
                _local_2 = 3;
            }
            else
            {
                if (_arg_1 >= XCDS_STAR_LEV2)
                {
                    _local_3 = Math.round(((_arg_1 / XCDS_STAR_LEV3) * 100));
                    _local_2 = 2;
                }
                else
                {
                    if (_arg_1 >= XCDS_STAR_LEV1)
                    {
                        _local_3 = Math.round(((_arg_1 / XCDS_STAR_LEV3) * 100));
                        _local_2 = 1;
                    }
                    else
                    {
                        _local_3 = Math.round(((_arg_1 / XCDS_STAR_LEV3) * 100));
                        _local_2 = 0;
                    };
                };
            };
            var _local_4:* = 1;
            while (_local_4 <= 3)
            {
                if (_local_4 <= _local_2)
                {
                    this[("star" + _local_4)].enabled = true;
                }
                else
                {
                    this[("star" + _local_4)].enabled = false;
                };
                _local_4++;
            };
            xcdsProgress.v = _local_3;
        }

        public function set txt(_arg_1:IntroText):void
        {
            var _local_2:Object = this._115312txt;
            if (_local_2 !== _arg_1)
            {
                this._115312txt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txt", _local_2, _arg_1));
            };
        }

        private function endThisRound():void
        {
            var _local_1:String = Language.XCDS_PANEL[16];
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, _endThisRound);
        }

        private function refreshQueue():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:XCDSDiabetesBox;
            var _local_5:Object;
            var _local_1:int;
            while (_local_1 < 9)
            {
                _local_2 = 0;
                while (_local_2 < 9)
                {
                    _local_3 = ((_local_1 * 9) + _local_2);
                    _local_4 = boxes[_local_3];
                    if (!_local_4)
                    {
                        _local_4 = new XCDSDiabetesBox();
                        _local_5 = stepData[_local_3];
                        _local_4.setIndex(_local_3);
                        _local_4.setParam(_local_5.bomb, _local_5.num);
                        _local_4.setType(_local_5.type);
                        boxes[_local_3] = _local_4;
                        _local_4.x = (50 * _local_2);
                        _local_4.y = ((50 * _local_1) - 450);
                        container1.addChild(_local_4);
                    };
                    _local_2++;
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get timeLable():Label
        {
            return (this._18543865timeLable);
        }

        [Bindable(event="propertyChange")]
        public function get startRoundBtnCenter():BasicGlowButton
        {
            return (this._1578405093startRoundBtnCenter);
        }

        public function set scoreTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._485512578scoreTxt;
            if (_local_2 !== _arg_1)
            {
                this._485512578scoreTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get xcdsPoint():Label
        {
            return (this._519060726xcdsPoint);
        }

        public function showPanel():void
        {
            initView();
            visible = true;
            setTimeout(setHasLoadRank, 5000);
        }

        public function set refreshBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._321863295refreshBtn;
            if (_local_2 !== _arg_1)
            {
                this._321863295refreshBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshBtn", _local_2, _arg_1));
            };
        }

        public function ___XiaochudasaiPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        [Bindable(event="propertyChange")]
        public function get xcdsProgress():Property
        {
            return (this._11282169xcdsProgress);
        }

        private function init():void
        {
            var _local_1:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:XCDSDiabetesBox;
            txt.htmlText = Language.XCDS_PANEL[5];
            boxes = new Dictionary();
            _local_1 = 0;
            while (_local_1 < (XCDS_DIABETES_LINE_NUM * 2))
            {
                _local_5 = 0;
                while (_local_5 < XCDS_DIABETES_LINE_NUM)
                {
                    _local_6 = ((_local_1 * XCDS_DIABETES_LINE_NUM) + _local_5);
                    _local_7 = new XCDSDiabetesBox();
                    _local_7.setIndex(_local_6);
                    _local_7.setParam(false, 1);
                    _local_7.setType(-1);
                    _local_7.x = (50 * _local_5);
                    _local_7.y = ((50 * _local_1) - 450);
                    boxes[_local_6] = _local_7;
                    container1.addChild(_local_7);
                    _local_5++;
                };
                _local_1++;
            };
            var _local_2:Sprite = new Sprite();
            _local_2.graphics.beginFill(0xFFFFFF, 1);
            _local_2.graphics.drawRect(0, 0, 450, 450);
            _local_2.graphics.endFill();
            var _local_3:UIComponent = new UIComponent();
            _local_3.x = container1.x;
            _local_3.y = container1.y;
            _local_3.addChild(_local_2);
            panel.addChild(_local_3);
            container1.mask = _local_2;
            effect_bm = new Bitmap(new BitmapData(EFFECT_BM_WIDTH, EFFECT_BM_HEIGHT, true, 0xFFFFFF));
            effect_bm.x = (container1.x - 50);
            effect_bm.y = (container1.y - 50);
            var _local_4:UIComponent = new UIComponent();
            _local_4.addChild(effect_bm);
            _local_4.mouseChildren = false;
            _local_4.mouseEnabled = false;
            panel.addChild(_local_4);
        }

        private function openXCDSShop():void
        {
            _core.remote.call("XCDSOpenShop", null);
        }

        [Bindable(event="propertyChange")]
        public function get rankSlot2():ItemSlot
        {
            return (this._653011672rankSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get rankSlot3():ItemSlot
        {
            return (this._653011671rankSlot3);
        }

        private function setHasLoadRank():void
        {
            hasLoadRank = false;
        }

        public function checkDiabetes(_arg_1:int, _arg_2:int):void
        {
            if (!canMove)
            {
                return;
            };
            if (((wData) && (int(wData.leftNum) == 0)))
            {
                _core.sysMidNote(Language.XCDS_PANEL[17]);
                return;
            };
            if (((!(moveBox1 == null)) || (!(moveBox2 == null))))
            {
                return;
            };
            moveBox1 = boxes[_arg_1];
            moveBox2 = boxes[_arg_2];
            swapBoxes(moveEndHandler);
        }

        [Bindable(event="propertyChange")]
        public function get endThisRoundBtn():BasicDelayButton
        {
            return (this._2146689831endThisRoundBtn);
        }

        public function __refreshBtn_click(_arg_1:MouseEvent):void
        {
            allRefresh();
        }

        [Bindable(event="propertyChange")]
        public function get rankSlot1():ItemSlot
        {
            return (this._653011673rankSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get rankSlot4():ItemSlot
        {
            return (this._653011670rankSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get rankSlot5():ItemSlot
        {
            return (this._653011669rankSlot5);
        }

        public function onGetData(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_4:EnterFrameMove;
            if (((!(_arg_1)) || (!(_arg_1["flag"]))))
            {
                return;
            };
            var _local_2:Object = _arg_1["flag"];
            if (!_arg_1["data"])
            {
                container1Mask.visible = true;
                leftNumTxt.text = Language.XCDS_PANEL[12].replace("{step}", "N/A");
                scoreTxt.text = Language.XCDS_PANEL[13].replace("{score}", "N/A");
            }
            else
            {
                container1Mask.visible = false;
                needToEndThisRound = false;
                clean();
                _local_3 = 0;
                while (_local_3 < moveHandlers.length)
                {
                    _local_4 = moveHandlers[_local_3];
                    if (_local_4)
                    {
                        _local_4.stop();
                        _local_4.destroy();
                    };
                    _local_3++;
                };
                moveHandlers.length = 0;
                wData = _arg_1["data"];
                leftNumTxt.text = Language.XCDS_PANEL[12].replace("{step}", int(wData.leftNum));
                scoreTxt.text = Language.XCDS_PANEL[13].replace("{score}", (Math.floor((int(wData.score) * 10)) / 10).toString());
                setProgressBar(wData.score);
                canMove = true;
                refreshLand(wData["data"]);
                checkPosition();
            };
            xcdsRoundTody.text = Language.XCDS_PANEL[10].replace("{round}", _local_2.r);
            highestScoreAllRound.text = Language.XCDS_PANEL[9].replace("{highestScore}", _local_2.hs);
            xcdsPoint.text = Language.XCDS_PANEL[8].replace("{point}", _arg_1["point"]);
            timeLable.text = Language.XCDS_PANEL[1].replace("{actTime}", _arg_1["activeTime"]);
            awardLable.text = Language.XCDS_PANEL[2].replace("{awradTime}", _arg_1["awardTime"]);
        }

        private function askBuy(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.call("xcdsDiabetesBuy", new Responder(onBuy));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rankSlot6():ItemSlot
        {
            return (this._653011668rankSlot6);
        }

        public function set newRoundBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1256566702newRoundBtn;
            if (_local_2 !== _arg_1)
            {
                this._1256566702newRoundBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newRoundBtn", _local_2, _arg_1));
            };
        }

        private function showStep():void
        {
            var _local_4:int;
            var _local_5:XCDSDiabetesBox;
            if (((!(steps)) || (steps.length == 0)))
            {
                canMove = true;
                wData["data"] = stepData;
                wData.leftNum = (int(wData.leftNum) - 1);
                leftNumTxt.text = Language.XCDS_PANEL[12].replace("{step}", int(wData.leftNum));
                if (needToEndThisRound)
                {
                    container1Mask.visible = true;
                    _core.remote.call("xcdsEndThisRound", new Responder(onEndThisRound));
                };
                return;
            };
            var _local_1:Object = steps.shift();
            stepData = _local_1["data"];
            wData.score = _local_1["score"];
            setProgressBar(wData.score);
            scoreTxt.text = Language.XCDS_PANEL[13].replace("{score}", (Math.floor((int(wData.score) * 10)) / 10).toString());
            effect_arr = [];
            if (!hasEventListener(Event.ENTER_FRAME))
            {
                addEventListener(Event.ENTER_FRAME, effectHandler);
            };
            var _local_2:Array = _local_1["remove"];
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_4 = _local_2[_local_3];
                _local_5 = boxes[_local_4];
                if (_local_5)
                {
                    boxes[_local_4] = null;
                    _local_5.destroy();
                    effect_arr.push({
                        "_x":_local_5.x,
                        "_y":_local_5.y,
                        "counter":0
                    });
                };
                _local_3++;
            };
            dropDown();
        }

        private function _XiaochudasaiPanel_DataGridColumn3_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Điểm cao nhất";
            _local_1.dataField = "s";
            _local_1.width = 100;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get xcdsRoundTody():Label
        {
            return (this._613866340xcdsRoundTody);
        }

        private function refreshLand(_arg_1:Array):void
        {
            var _local_3:XCDSDiabetesBox;
            var _local_4:Object;
            if (!_arg_1)
            {
                return;
            };
            clean();
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                _local_3 = boxes[_local_2];
                if (_arg_1[_local_2])
                {
                    _local_4 = _arg_1[_local_2];
                    if (_local_3)
                    {
                        _local_3.setParam(_local_4.bomb, _local_4.num);
                        _local_3.setType(_local_4.type);
                        _local_3.setIndex(_local_2);
                    };
                }
                else
                {
                    if (_local_3)
                    {
                        _local_3.setParam(false, 1);
                        _local_3.setType(-1);
                    };
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardLable():Label
        {
            return (this._360515433awardLable);
        }

        [Bindable(event="propertyChange")]
        public function get refreshBtn():BasicDelayButton
        {
            return (this._321863295refreshBtn);
        }

        private function set canMove(_arg_1:Boolean):void
        {
            var _local_2:Object = this._549570497canMove;
            if (_local_2 !== _arg_1)
            {
                this._549570497canMove = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canMove", _local_2, _arg_1));
            };
        }

        public function ___XiaochudasaiPanel_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            buy();
        }

        override public function initialize():void
        {
            var target:XiaochudasaiPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _XiaochudasaiPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_XiaochudasaiPanelWatcherSetupUtil");
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

        private function moveEndHandler2(_arg_1:Event):void
        {
            moveBox1 = null;
            moveBox2 = null;
            checkPosition();
        }

        public function onGetAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (!_arg_1["flag"])
            {
                this.visible = false;
                return;
            };
            if (wData)
            {
                wData.state = 2;
            };
        }

        public function set container1(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._145245136container1;
            if (_local_2 !== _arg_1)
            {
                this._145245136container1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container1", _local_2, _arg_1));
            };
        }

        private function _XiaochudasaiPanel_DataGridColumn2_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Server";
            _local_1.dataField = "sn";
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get newRoundBtn():BasicDelayButton
        {
            return (this._1256566702newRoundBtn);
        }

        public function set highestScoreAllRound(_arg_1:Label):void
        {
            var _local_2:Object = this._1739702565highestScoreAllRound;
            if (_local_2 !== _arg_1)
            {
                this._1739702565highestScoreAllRound = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "highestScoreAllRound", _local_2, _arg_1));
            };
        }

        public function set container1Mask(_arg_1:Canvas):void
        {
            var _local_2:Object = this._812013276container1Mask;
            if (_local_2 !== _arg_1)
            {
                this._812013276container1Mask = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container1Mask", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get canMove():Boolean
        {
            return (this._549570497canMove);
        }

        public function onGetRank(_arg_1:Object):void
        {
            var _local_2:ArrayCollection;
            var _local_3:*;
            var _local_4:Sort;
            if (_arg_1)
            {
                _local_2 = new ArrayCollection();
                for (_local_3 in _arg_1)
                {
                    _local_2.addItem(_arg_1[_local_3]);
                };
                _local_4 = new Sort();
                _local_4.fields = [new SortField("r")];
                _local_2.sort = _local_4;
                _local_2.refresh();
                xcdsRank = _local_2;
            };
        }

        public function __startRoundBtnCenter_click(_arg_1:MouseEvent):void
        {
            startNewRound();
        }

        public function set startRoundBtnCenter(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1578405093startRoundBtnCenter;
            if (_local_2 !== _arg_1)
            {
                this._1578405093startRoundBtnCenter = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startRoundBtnCenter", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            var _local_2:ItemSlot;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            var _local_1:* = 1;
            while (_local_1 < 7)
            {
                _local_2 = (this[("rankSlot" + _local_1)] as ItemSlot);
                _local_2.clean();
                _local_2.type = GamePredef.TBL_ITEM_TEMPLATE;
                _local_2.giid = XCDSAwardConfig[(_local_1 - 1)];
                _local_1++;
            };
            getDiabetesRes();
            if (_watcher)
            {
                _watcher.unwatch();
                _watcher = null;
            };
            _watcher = ChangeWatcher.watch(_core.player, "xcds2403p", updateCurrency);
            this.updateCurrency();
        }

        public function __newRoundBtn_click(_arg_1:MouseEvent):void
        {
            startNewRound();
        }

        [Bindable(event="propertyChange")]
        public function get container1():UIComponent
        {
            return (this._145245136container1);
        }

        public function set leftNumTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1975768049leftNumTxt;
            if (_local_2 !== _arg_1)
            {
                this._1975768049leftNumTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftNumTxt", _local_2, _arg_1));
            };
        }

        private function swapBoxes(_arg_1:Function):void
        {
            var _local_2:Object = boxes[moveBox1.index];
            var _local_3:int = moveBox1.index;
            var _local_4:int = moveBox2.index;
            boxes[moveBox1.index] = boxes[moveBox2.index];
            boxes[moveBox2.index] = _local_2;
            var _local_5:int = moveBox1.index;
            moveBox1.index = moveBox2.index;
            moveBox2.index = _local_5;
            var _local_6:Object = wData["data"][moveBox1.index];
            wData["data"][moveBox1.index] = wData["data"][moveBox2.index];
            wData["data"][moveBox2.index] = _local_6;
            var _local_7:int = wData["data"][moveBox1.index].index;
            wData["data"][moveBox1.index].index = wData["data"][moveBox2.index].index;
            wData["data"][moveBox2.index].index = _local_7;
            var _local_8:EnterFrameMove = new EnterFrameMove();
            _local_8.target = moveBox1;
            _local_8.stepLength = 25;
            _local_8.xBy = (moveBox2.x - moveBox1.x);
            _local_8.yBy = (moveBox2.y - moveBox1.y);
            _local_8.addEventListener(EnterFrameMove.EFFECT_END, _arg_1);
            _local_8.play(true);
            var _local_9:EnterFrameMove = new EnterFrameMove();
            _local_9.target = moveBox2;
            _local_9.stepLength = 25;
            _local_9.xBy = (moveBox1.x - moveBox2.x);
            _local_9.yBy = (moveBox1.y - moveBox2.y);
            _local_9.play(true);
        }

        private function _XiaochudasaiPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "XH";
            _local_1.dataField = "r";
            _local_1.width = 20;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get leftNumTxt():Label
        {
            return (this._1975768049leftNumTxt);
        }

        public function set timeLable(_arg_1:Label):void
        {
            var _local_2:Object = this._18543865timeLable;
            if (_local_2 !== _arg_1)
            {
                this._18543865timeLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeLable", _local_2, _arg_1));
            };
        }

        private function updateCurrency(_arg_1:Event=null):void
        {
            xcdsPoint.text = Language.XCDS_PANEL[8].replace("{point}", ((_core.player.hasOwnProperty("xcds2403p")) ? _core.player["xcds2403p"] : 0));
        }

        public function set xcdsPoint(_arg_1:Label):void
        {
            var _local_2:Object = this._519060726xcdsPoint;
            if (_local_2 !== _arg_1)
            {
                this._519060726xcdsPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xcdsPoint", _local_2, _arg_1));
            };
        }

        private function onRefresh(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(_arg_1["data"]))))
            {
                return;
            };
            wData = _arg_1["data"];
            leftNumTxt.text = Language.XCDS_PANEL[12].replace("{step}", int(wData.leftNum));
            scoreTxt.text = Language.XCDS_PANEL[13].replace("{score}", (Math.floor((int(wData.score) * 10)) / 10).toString());
            setProgressBar(wData.score);
            refreshLand(wData["data"]);
            checkPosition();
            if (needToEndThisRound)
            {
                container1Mask.visible = true;
                _core.remote.call("xcdsEndThisRound", new Responder(onEndThisRound));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

