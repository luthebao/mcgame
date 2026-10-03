// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.HulaPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import mx.controls.Image;
    import flash.display.Loader;
    import mx.controls.TextArea;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.object.Npc;
    import mx.binding.BindingManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.MouseEvent;
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.qeedoo.ui.view.compGameStage.NPCView;
    import mx.events.FlexEvent;
    import flash.net.URLRequest;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.net.Responder;
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

    public class HulaPanel extends DragableCanvas implements IBindingClient 
    {

        private static const HULA_INIT_PRE_NUM:int = 20;
        private static const HULA_INIT_POP_NUM:int = 10;
        private static const HULA_REAP_NUM:int = 3;
        public static const HULA_NPC_SCRIPT_AWARD:String = "script_award";
        public static const HULA_NPC_SCRIPT_BATTLE:String = "script_battle";
        public static const HULA_NPC_SCRIPT_CHANGE:String = "script_change";
        public static const HULA_NPC_SCRIPT_CANCEL:String = "script_cancel";
        public static const HULA_NPC_SCRIPT_CHANGE_RED:String = "script_change_red";
        public static const HULA_NPC_SCRIPT_CHANGE_YELLOW:String = "script_change_yellow";
        public static const HULA_NPC_SCRIPT_CHANGE_GREEN:String = "script_change_green";
        public static const HULA_NPC_SCRIPT_CHANGE_BLUE:String = "script_change_blue";
        public static var bombArr:Array = null;
        public static var isTurning:Boolean = false;
        public static var MOVE_POINT:Array = [[12, 70], [17, 70], [22, 70], [27, 70], [32, 70], [37, 70], [42, 70], [47, 70], [52, 70], [57, 70], [12, 80], [17, 80], [22, 80], [27, 80], [32, 80], [37, 80], [42, 80], [47, 80], [52, 80], [57, 80], [(-98 + 160), (0 + 90)], [(-93 + 160), (11 + 90)], [(-87 + 160), (21 + 90)], [(-79 + 160), (30 + 90)], [(-70 + 160), (39 + 90)], [(-60 + 160), (45 + 90)], [(-47 + 160), (50 + 90)], [(-34 + 160), (52 + 90)], [(-22 + 160), (54 + 90)], [(-9 + 160), (55 + 90)], [(4 + 160), (55 + 90)], [(16 + 160), (55 + 90)], [(28 + 160), (53 + 90)], [(41 + 160), (51 + 90)], [(53 + 160), (48 + 90)], [(63 + 160), (45 + 90)], [(73 + 160), (41 + 90)], [(81 + 160), (36 + 90)], [(88 + 160), (30 + 90)], [(93 + 160), (22 + 90)], [(97 + 160), (13 + 90)], [(98 + 160), (3 + 90)], [(97 + 160), (-7 + 90)], [(95 + 160), (-17 + 90)], [(88 + 160), (-25 + 90)], [(81 + 160), (-33 + 90)], [(72 + 160), (-39 + 90)], [(64 + 160), (-45 + 90)], [(55 + 160), (-49 + 90)], [(45 + 160), (-52 + 90)], [(34 + 160), (-54 + 90)], [(21 + 160), (-55 + 90)], [(9 + 160), (-55 + 90)], [(-3 + 160), (-55 + 90)], [(-15 + 160), (-54 + 90)], [(-27 + 160), (-53 + 90)], [(-39 + 160), (-50 + 90)], [(-50 + 160), (-45 + 90)], [(-59 + 160), (-39 + 90)], [(-68 + 160), (-33 + 90)], [(-74 + 160), (-24 + 90)], [(-75 + 160), (-12 + 90)], [(-73 + 160), (-1 + 90)], [(-68 + 160), (9 + 90)], [(-62 + 160), (19 + 90)], [(-52 + 160), (25 + 90)], [(-41 + 160), (31 + 90)], [(-30 + 160), (35 + 90)], [(-19 + 160), (37 + 90)], [(-8 + 160), (38 + 90)], [(5 + 160), (38 + 90)], [(18 + 160), (36 + 90)], [(32 + 160), (32 + 90)], [(44 + 160), (26 + 90)], [(55 + 160), (21 + 90)], [(63 + 160), (12 + 90)], [(65 + 160), (-1 + 90)], [(63 + 160), (-14 + 90)], [(55 + 160), (-23 + 90)], [(47 + 160), (-31 + 90)], [(35 + 160), (-36 + 90)], [(22 + 160), (-39 + 90)], [(7 + 160), (-40 + 90)], [(-7 + 160), (-40 + 90)], [(-21 + 160), (-39 + 90)], [(-33 + 160), (-34 + 90)], [(-44 + 160), (-27 + 90)], [(-52 + 160), (-17 + 90)], [(-51 + 160), (-4 + 90)], [(-45 + 160), (7 + 90)], [(-34 + 160), (15 + 90)], [(-23 + 160), (21 + 90)], [(-9 + 160), (22 + 90)], [(5 + 160), (22 + 90)], [(18 + 160), (19 + 90)], [(27 + 160), (11 + 90)], [(29 + 160), (0 + 90)], [(24 + 160), (-12 + 90)], [(13 + 160), (-20 + 90)], [(0 + 160), (-21 + 90)], [(-14 + 160), (-20 + 90)], [(-25 + 160), (-12 + 90)], [(-21 + 160), (-1 + 90)], [(-11 + 160), (4 + 90)], [(-2 + 160), (-2 + 90)]];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _HulaPanel_Label12:Label;
        private var _195633910gameBtn:BasicGlowButton;
        private var _1091754364holeBtn:BasicGlowButton;
        private var isGameOver:Boolean = false;
        private var _115312txt:IntroText;
        private var _1419990172maxComboNum:Label;
        private var rankObj:Array = null;
        public var _HulaPanel_DataGridColumn1:DataGridColumn;
        public var _HulaPanel_DataGridColumn2:DataGridColumn;
        public var _HulaPanel_DataGridColumn3:DataGridColumn;
        public var _HulaPanel_Label1:Label;
        public var _HulaPanel_Label2:Label;
        public var _HulaPanel_Label3:Label;
        public var _HulaPanel_Label4:Label;
        public var _HulaPanel_Label5:Label;
        private var _1191282484leaderName:Label;
        private var _760893254battleScore:Label;
        private var _978074256rankBtn:BasicGlowButton;
        private var _255229216totleScore:Label;
        private var reapNum:int = 0;
        private var _255572470rankData:DataGrid;
        public var _HulaPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _606510598awardVs:ViewStack;
        private var _12589660comboScore:Label;
        private var _211936761gotoBtn:BasicGlowButton;
        public var _HulaPanel_Image1:Image;
        private var npcMoveNum:int = 0;
        private var load:Loader;
        private var _1401389892membersName:TextArea;
        private var res_load_state:int = 0;
        public var _HulaPanel_Label13:Label;
        public var _HulaPanel_Label10:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":545,
                    "height":405,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_HulaPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"holeBtn",
                        "events":{"click":"__holeBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "25";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "width":68,
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"gameBtn",
                        "events":{"click":"__gameBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "95";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "enabled":false,
                                "styleName":"HorizontalTab",
                                "width":68,
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"rankBtn",
                        "events":{"click":"__rankBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "165";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":false,
                                "enabled":false,
                                "styleName":"HorizontalTab",
                                "y":38
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"awardVs",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":340,
                                "x":0,
                                "y":55,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "50";
                                        this.left = "5";
                                        this.right = "5";
                                        this.bottom = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"txt",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "5";
                                                    this.top = "5";
                                                    this.right = "5";
                                                    this.backgroundAlpha = 0;
                                                    this.fontStyle = "normal";
                                                    this.fontWeight = "bold";
                                                    this.textAlign = "left";
                                                    this.fontSize = 12;
                                                    this.borderThickness = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":310,
                                                        "mouseEnabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"gotoBtn",
                                                "events":{"click":"__gotoBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "3";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":70,
                                                        "styleName":"BtnStdRed"
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
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":530,
                                                        "height":310,
                                                        "styleName":"RoundedGradientBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_HulaPanel_Image1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "2";
                                                                this.top = "3";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_HulaPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "0";
                                                                this.top = "15";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 26;
                                                                this.fontWeight = "bold";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":30,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_HulaPanel_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "25";
                                                                this.top = "60";
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_HulaPanel_Label3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "155";
                                                                this.top = "60";
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_HulaPanel_Label4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "285";
                                                                this.top = "60";
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_HulaPanel_Label5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "415";
                                                                this.top = "60";
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"battleScore",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "25";
                                                                this.top = "90";
                                                                this.color = 0x8000;
                                                                this.textAlign = "center";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"comboScore",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "155";
                                                                this.top = "90";
                                                                this.color = 0x8000;
                                                                this.textAlign = "center";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"maxComboNum",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "285";
                                                                this.top = "90";
                                                                this.color = 0x8000;
                                                                this.textAlign = "center";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"totleScore",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "415";
                                                                this.top = "90";
                                                                this.color = 0x8000;
                                                                this.textAlign = "center";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_HulaPanel_Label10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "28";
                                                                this.top = "168";
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"leaderName",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "136";
                                                                this.top = "168";
                                                                this.color = 0xFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":320,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_HulaPanel_Label12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "28";
                                                                this.top = "198";
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":100,
                                                                    "height":20,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"membersName",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "136";
                                                                this.top = "198";
                                                                this.color = 0xFFFF;
                                                                this.fontWeight = "bold";
                                                                this.backgroundAlpha = 0;
                                                                this.borderThickness = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":320,
                                                                    "height":80,
                                                                    "mouseEnabled":false,
                                                                    "selectable":false,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off"
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
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":530,
                                                        "height":310,
                                                        "styleName":"RoundedGradientBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_HulaPanel_Label13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "0";
                                                                this.top = "15";
                                                                this.textAlign = "center";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 26;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"rankData",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.top = "50";
                                                                this.textAlign = "center";
                                                                this.fontSize = 16;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "sortableColumns":false,
                                                                    "selectable":false,
                                                                    "height":250,
                                                                    "width":570,
                                                                    "headerHeight":25,
                                                                    "columns":[_HulaPanel_DataGridColumn1_i(), _HulaPanel_DataGridColumn2_i(), _HulaPanel_DataGridColumn3_i()]
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
        private var HULA_NPC_DATA:Array = [2092, 2093, 2094, 2095, 2096, 2097];
        private var npcList:Array = [];
        private var preList:Array = [];
        private var gameData:Object = {};
        private var tempBattle:Array = [];
        private var removeArr:Array = [];
        private var _core:Core = Core.getInstance();
        private var rankList:ArrayCollection = new ArrayCollection();
        private var comboResCodeArr:Array = [0, 2060090400043, 2060090400044, 2060090400045, 2060090400046, 2060090400047, 2060090400048, 2060090400049, 2060090400050, 2060090400051, 2060090400052, 2060090400053, 2060090400054, 2060090400055, 2060090400056, 2060090400057, 2060090400058, 2060090400059, 2060090400060, 2060090400061, 2060090400062, 2060090400063, 2060090400064, 2060090400065, 2060090400066, 2060090400067, 2060090400068, 2060090400069, 2060090400070, 2060090400071, 2060090400072];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function HulaPanel()
        {
            mx_internal::_document = this;
            this.width = 545;
            this.height = 405;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___HulaPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            HulaPanel._watcherSetupUtil = _arg_1;
        }


        public function onNPCAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int = _arg_1["index"];
            npcDead(_local_2);
        }

        public function set awardVs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._606510598awardVs;
            if (_local_2 !== _arg_1)
            {
                this._606510598awardVs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardVs", _local_2, _arg_1));
            };
        }

        public function set rankData(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._255572470rankData;
            if (_local_2 !== _arg_1)
            {
                this._255572470rankData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankData", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        private function getHulaNpc(_arg_1:int):Npc
        {
            var _local_4:Npc;
            if (!npcList)
            {
                return (null);
            };
            var _local_2:Npc;
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < npcList.length)
            {
                _local_4 = npcList[_local_3];
                if ((((_local_4) && (_local_4.hulaData)) && (_local_4.hulaData.index == _arg_1)))
                {
                    _local_2 = _local_4;
                    break;
                };
                _local_3++;
            };
            return (_local_2);
        }

        private function _HulaPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _HulaPanel_DataGridColumn3 = _local_1;
            _local_1.width = 50;
            _local_1.dataField = "score";
            _local_1.setStyle("color", 0xFFFF);
            BindingManager.executeBindings(this, "_HulaPanel_DataGridColumn3", _HulaPanel_DataGridColumn3);
            return (_local_1);
        }

        private function onGetRankData(_arg_1:Object):void
        {
            var _local_3:Object;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Object = _arg_1["rank"];
            if (((!(_local_2)) || (!(_local_2 is Array))))
            {
                return;
            };
            rankBtn.enabled = false;
            gameBtn.enabled = false;
            if (initialized)
            {
                rankObj = (_local_2 as Array);
                rankBtn.enabled = (!(rankObj == null));
                refreshRank();
                _local_3 = _arg_1["info"];
                gameBtn.enabled = (!(_local_3 == null));
                if (_local_3)
                {
                    gameData = _local_3;
                    refreshGameData();
                    refreshTeamData();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get rankData():DataGrid
        {
            return (this._255572470rankData);
        }

        private function init():void
        {
            txt.htmlText = Language.HULA_PANEL[2];
        }

        [Bindable(event="propertyChange")]
        public function get gameBtn():BasicGlowButton
        {
            return (this._195633910gameBtn);
        }

        [Bindable(event="propertyChange")]
        public function get awardVs():ViewStack
        {
            return (this._606510598awardVs);
        }

        public function set gameBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._195633910gameBtn;
            if (_local_2 !== _arg_1)
            {
                this._195633910gameBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gameBtn", _local_2, _arg_1));
            };
        }

        private function _HulaPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.HULA_PANEL[1];
            _local_1 = Language.HULA_PANEL[12];
            _local_1 = Language.HULA_PANEL[13];
            _local_1 = Language.HULA_PANEL[20];
            _local_1 = Language.HULA_PANEL[3];
            _local_1 = ResManager.getIconUrl(4130220000390);
            _local_1 = Language.HULA_PANEL[21];
            _local_1 = Language.HULA_PANEL[22];
            _local_1 = Language.HULA_PANEL[23];
            _local_1 = Language.HULA_PANEL[24];
            _local_1 = Language.HULA_PANEL[25];
            _local_1 = Language.HULA_PANEL[26];
            _local_1 = Language.HULA_PANEL[27];
            _local_1 = Language.HULA_PANEL[28];
            _local_1 = rankList;
            _local_1 = Language.HULA_PANEL[29];
            _local_1 = Language.HULA_PANEL[30];
            _local_1 = Language.HULA_PANEL[31];
        }

        private function getHulaPreNpc(_arg_1:int):Npc
        {
            var _local_4:Npc;
            if (!preList)
            {
                return (null);
            };
            var _local_2:Npc;
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < preList.length)
            {
                _local_4 = preList[_local_3];
                if ((((_local_4) && (_local_4.hulaData)) && (_local_4.hulaData.index == _arg_1)))
                {
                    _local_2 = _local_4;
                    break;
                };
                _local_3++;
            };
            return (_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get gotoBtn():BasicGlowButton
        {
            return (this._211936761gotoBtn);
        }

        public function set rankBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._978074256rankBtn;
            if (_local_2 !== _arg_1)
            {
                this._978074256rankBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankBtn", _local_2, _arg_1));
            };
        }

        public function __holeBtn_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get totleScore():Label
        {
            return (this._255229216totleScore);
        }

        [Bindable(event="propertyChange")]
        public function get leaderName():Label
        {
            return (this._1191282484leaderName);
        }

        public function set gotoBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._211936761gotoBtn;
            if (_local_2 !== _arg_1)
            {
                this._211936761gotoBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gotoBtn", _local_2, _arg_1));
            };
        }

        public function __rankBtn_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        private function removeSubBall(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_3:int = _arg_1;
            while (_local_3 > (_arg_1 - _arg_2))
            {
                _local_4 = gameData["hulaData"]["queue"][_local_3];
                removeArr.push(_local_4);
                gameData["hulaData"]["queue"][_local_3] = null;
                _local_3--;
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_5:BitmapData;
            var _local_2:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("bomb") as Class);
            var _local_3:MovieClip = new (_local_2)();
            bombArr = [];
            var _local_4:int = 1;
            while (_local_4 <= _local_3.totalFrames)
            {
                _local_3.gotoAndStop(_local_4);
                _local_5 = new BitmapData(160, 160, true, 0xFFFFFF);
                _local_5.draw(_local_3);
                bombArr.push(_local_5);
                _local_4++;
            };
            res_load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
        }

        public function set totleScore(_arg_1:Label):void
        {
            var _local_2:Object = this._255229216totleScore;
            if (_local_2 !== _arg_1)
            {
                this._255229216totleScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totleScore", _local_2, _arg_1));
            };
        }

        public function onGetData(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(_arg_1["tData"]))))
            {
                return;
            };
            getRes();
            gameData = _arg_1["tData"];
            rankObj = _arg_1["rank"];
            if (initialized)
            {
                rankBtn.enabled = (!(rankObj == null));
            };
            if (_arg_1["tData"].state >= 2)
            {
                isGameOver = true;
            };
            refreshNpcPositionIndex();
            refreshQueue();
            refreshPre();
        }

        private function getMemberName(_arg_1:Array, _arg_2:int):String
        {
            var _local_4:Object;
            if (!_arg_1)
            {
                return ("");
            };
            var _local_3:int;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = _arg_1[_local_3];
                if (((_local_4) && (_local_4["cid"] == _arg_2)))
                {
                    return (_local_4["name"]);
                };
                _local_3++;
            };
            return ("");
        }

        public function set maxComboNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1419990172maxComboNum;
            if (_local_2 !== _arg_1)
            {
                this._1419990172maxComboNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxComboNum", _local_2, _arg_1));
            };
        }

        private function cleanQueue():void
        {
            var _local_2:Npc;
            isTurning = false;
            if (!npcList)
            {
                return;
            };
            var _local_1:int;
            while (_local_1 < npcList.length)
            {
                _local_2 = npcList[_local_1];
                if (_local_2)
                {
                    _core.view.removeN(_local_2.id);
                };
                _local_1++;
            };
            npcList.length = 0;
        }

        private function _HulaPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _HulaPanel_DataGridColumn2 = _local_1;
            _local_1.width = 150;
            _local_1.dataField = "leaderName";
            _local_1.setStyle("color", 0xFFFF);
            BindingManager.executeBindings(this, "_HulaPanel_DataGridColumn2", _HulaPanel_DataGridColumn2);
            return (_local_1);
        }

        private function gotoHall():void
        {
            _core.remote.call("hulaEntraHole", null);
        }

        private function npcMove(_arg_1:Boolean=false):void
        {
            var _local_4:Object;
            var _local_5:Npc;
            var _local_6:Array;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Object;
            var _local_10:NPCView;
            var _local_11:int;
            var _local_12:int;
            npcMoveNum = 0;
            var _local_2:int;
            var _local_3:int;
            _local_2 = 0;
            while (_local_2 < gameData["hulaData"]["queue"].length)
            {
                _local_4 = gameData["hulaData"]["queue"][_local_2];
                if (!_local_4)
                {
                    _local_3++;
                }
                else
                {
                    _local_5 = getHulaNpc(_local_4.index);
                    if (_local_5)
                    {
                        _local_6 = [];
                        _local_7 = _local_4.pIndex;
                        _local_8 = (_local_2 - _local_3);
                        if (_local_8 >= _local_7)
                        {
                            _local_11 = _local_7;
                            while (_local_11 <= _local_8)
                            {
                                _local_9 = {};
                                _local_9["index"] = _local_11;
                                _local_9["p"] = MOVE_POINT[(_local_11 + HULA_INIT_PRE_NUM)];
                                _local_6.push(_local_9);
                                _local_11++;
                            };
                        }
                        else
                        {
                            if (_local_8 < _local_7)
                            {
                                _local_12 = (_local_7 - 1);
                                while (_local_12 >= _local_8)
                                {
                                    _local_9 = {};
                                    _local_9["index"] = _local_12;
                                    _local_9["p"] = MOVE_POINT[(_local_12 + HULA_INIT_PRE_NUM)];
                                    _local_6.push(_local_9);
                                    _local_12--;
                                };
                            };
                        };
                        _local_10 = (_core.view.getN(_local_5.id) as NPCView);
                        if (((_local_10) && (_local_6.length > 0)))
                        {
                            if (!_local_10.hasEventListener("npc_stop"))
                            {
                                _local_10.addEventListener("npc_stop", npcStop);
                                _local_10.addEventListener("hula_game_over", gameOver);
                            };
                            npcMoveNum++;
                            _local_10.setSpeed(10);
                            _local_10.walkQueue(_local_6);
                            _local_4.pIndex = _local_8;
                        };
                    };
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get membersName():TextArea
        {
            return (this._1401389892membersName);
        }

        public function __gameBtn_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        public function ___HulaPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function resort():void
        {
            var _local_2:Object;
            var _local_1:* = 0;
            while (_local_1 < gameData["hulaData"]["queue"].length)
            {
                _local_2 = gameData["hulaData"]["queue"][_local_1];
                if (((!(_local_2)) || (_local_2.isDead)))
                {
                    gameData["hulaData"]["queue"].splice(_local_1, 1);
                    _local_1--;
                };
                _local_1++;
            };
        }

        public function set leaderName(_arg_1:Label):void
        {
            var _local_2:Object = this._1191282484leaderName;
            if (_local_2 !== _arg_1)
            {
                this._1191282484leaderName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leaderName", _local_2, _arg_1));
            };
        }

        private function getRes():void
        {
            if (res_load_state != 0)
            {
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130101005)));
                res_load_state = 1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get txt():IntroText
        {
            return (this._115312txt);
        }

        public function set battleScore(_arg_1:Label):void
        {
            var _local_2:Object = this._760893254battleScore;
            if (_local_2 !== _arg_1)
            {
                this._760893254battleScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleScore", _local_2, _arg_1));
            };
        }

        public function set comboScore(_arg_1:Label):void
        {
            var _local_2:Object = this._12589660comboScore;
            if (_local_2 !== _arg_1)
            {
                this._12589660comboScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "comboScore", _local_2, _arg_1));
            };
        }

        public function onChange(_arg_1:Object):void
        {
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int = _arg_1["index"];
            var _local_3:int = _arg_1["targetNPCId"];
            var _local_4:int;
            while (_local_4 < gameData["hulaData"]["queue"].length)
            {
                _local_6 = gameData["hulaData"]["queue"][_local_4];
                if (((_local_6) && (_local_6.index == _local_2)))
                {
                    _local_6.npcId = _local_3;
                    break;
                };
                _local_4++;
            };
            var _local_5:Npc = getHulaNpc(_local_2);
            if (_local_5)
            {
                _local_7 = _core.view.getN(_local_5.id);
                _local_8 = _core.data.getGameData(GamePredef.TBL_NPC, _local_3);
                ((_local_7) && (_local_7.reloadHula({
                    "nid":_local_5.id,
                    "resCode":_local_8.resCode,
                    "objName":(_local_8.name + _local_5.hulaData.sortId)
                })));
            };
        }

        private function _HulaPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _HulaPanel_DataGridColumn1 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "rank";
            _local_1.setStyle("color", 0xFFFF);
            BindingManager.executeBindings(this, "_HulaPanel_DataGridColumn1", _HulaPanel_DataGridColumn1);
            return (_local_1);
        }

        private function toShowUnlock():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Boolean;
            _core.sysBlueMsg(Language.HULA_PANEL[0]);
            var _local_1:int;
            while (_local_1 < tempBattle.length)
            {
                _local_2 = tempBattle[_local_1];
                if (_local_2)
                {
                    _local_3 = _local_2["obj"];
                    _local_4 = _local_3["index"];
                    _local_5 = bomb(_local_4);
                    if (!_local_5)
                    {
                        npcDead(_local_4);
                        gameData["score"] = (gameData["score"] + 1);
                        gameData["battleScore"] = (gameData["battleScore"] + 1);
                    };
                };
                refreshGameData();
                _local_1++;
            };
            tempBattle.length = 0;
        }

        private function npcStop(_arg_1:Event):void
        {
            npcMoveNum--;
            if (npcMoveNum == 0)
            {
                toScore();
            };
        }

        public function set membersName(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1401389892membersName;
            if (_local_2 !== _arg_1)
            {
                this._1401389892membersName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "membersName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get holeBtn():BasicGlowButton
        {
            return (this._1091754364holeBtn);
        }

        override public function initialize():void
        {
            var target:HulaPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _HulaPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_HulaPanelWatcherSetupUtil");
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

        private function toClear():void
        {
            var _local_2:Object;
            var _local_1:int;
            while (_local_1 < gameData["hulaData"]["queue"].length)
            {
                _local_2 = gameData["hulaData"]["queue"][_local_1];
                if (((_local_2) && (_local_2.isDead)))
                {
                    gameData["hulaData"]["queue"][_local_1] = null;
                };
                _local_1++;
            };
        }

        public function cleanAll():void
        {
            cleanQueue();
            cleanPre();
        }

        private function cleanPre():void
        {
            var _local_2:Npc;
            if (!preList)
            {
                return;
            };
            var _local_1:int;
            while (_local_1 < preList.length)
            {
                _local_2 = preList[_local_1];
                if (_local_2)
                {
                    _core.view.removeN(_local_2.id);
                };
                _local_1++;
            };
            preList.length = 0;
        }

        [Bindable(event="propertyChange")]
        public function get maxComboNum():Label
        {
            return (this._1419990172maxComboNum);
        }

        private function refreshRank():void
        {
            var _local_4:Object;
            var _local_5:String;
            rankList.removeAll();
            rankBtn.enabled = false;
            if (!rankObj)
            {
                return;
            };
            rankBtn.enabled = true;
            var _local_1:int = -1;
            var _local_2:int = -1;
            var _local_3:int;
            while (_local_3 < rankObj.length)
            {
                _local_4 = rankObj[_local_3];
                if (_local_4)
                {
                    if (_local_1 != int(_local_4.score))
                    {
                        _local_1 = int(_local_4.score);
                        _local_2 = _local_3;
                    };
                    _local_5 = "";
                    if (_local_4["members"])
                    {
                        _local_5 = getMemberName(_local_4["members"], int(_local_4["leaderId"]));
                    };
                    rankList.addItem({
                        "rank":(_local_2 + 1),
                        "leaderName":_local_5,
                        "score":_local_4["score"]
                    });
                };
                _local_3++;
            };
        }

        private function _HulaPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_HulaPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                holeBtn.label = _arg_1;
            }, "holeBtn.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gameBtn.label = _arg_1;
            }, "gameBtn.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rankBtn.label = _arg_1;
            }, "rankBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gotoBtn.label = _arg_1;
            }, "gotoBtn.label");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000390));
            }, function (_arg_1:Object):void
            {
                _HulaPanel_Image1.source = _arg_1;
            }, "_HulaPanel_Image1.source");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_Label1.text = _arg_1;
            }, "_HulaPanel_Label1.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_Label2.text = _arg_1;
            }, "_HulaPanel_Label2.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_Label3.text = _arg_1;
            }, "_HulaPanel_Label3.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_Label4.text = _arg_1;
            }, "_HulaPanel_Label4.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_Label5.text = _arg_1;
            }, "_HulaPanel_Label5.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_Label10.text = _arg_1;
            }, "_HulaPanel_Label10.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_Label12.text = _arg_1;
            }, "_HulaPanel_Label12.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_Label13.text = _arg_1;
            }, "_HulaPanel_Label13.text");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (rankList);
            }, function (_arg_1:Object):void
            {
                rankData.dataProvider = _arg_1;
            }, "rankData.dataProvider");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_DataGridColumn1.headerText = _arg_1;
            }, "_HulaPanel_DataGridColumn1.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_DataGridColumn2.headerText = _arg_1;
            }, "_HulaPanel_DataGridColumn2.headerText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.HULA_PANEL[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _HulaPanel_DataGridColumn3.headerText = _arg_1;
            }, "_HulaPanel_DataGridColumn3.headerText");
            result[17] = binding;
            return (result);
        }

        private function bomb(_arg_1:int):Boolean
        {
            var _local_10:*;
            var _local_2:Npc = getHulaNpc(_arg_1);
            if (((!(_local_2)) || (!(_local_2.nid == HULA_NPC_DATA[5]))))
            {
                return (false);
            };
            var _local_3:int = -1;
            var _local_4:* = 0;
            while (_local_4 < gameData["hulaData"]["queue"].length)
            {
                _local_10 = gameData["hulaData"]["queue"][_local_4];
                if (((_local_10) && (_local_10.sortId == _local_2.hulaData.sortId)))
                {
                    npcDead(_arg_1);
                    _local_3 = _local_4;
                };
                _local_4++;
            };
            var _local_5:int = 1;
            var _local_6:* = (_local_3 - 1);
            var _local_7:Object = gameData["hulaData"]["queue"][_local_6];
            while ((((_local_7) && (_local_7.npcId == HULA_NPC_DATA[5])) && (!(_local_7.isDead))))
            {
                _local_7.isDead = true;
                _local_7.inBattle = false;
                npcDead(_local_7.index);
                _local_5++;
                _local_6--;
                _local_7 = gameData["hulaData"]["queue"][_local_6];
            };
            if (_local_7)
            {
                if (!_local_7.isDead)
                {
                    _local_5++;
                };
                _local_7.isDead = true;
                _local_7.inBattle = false;
                npcDead(_local_7.index);
            };
            var _local_8:int = (_local_3 + 1);
            var _local_9:Object = gameData["hulaData"]["queue"][_local_8];
            while ((((_local_9) && (_local_9.npcId == HULA_NPC_DATA[5])) && (!(_local_9.isDead))))
            {
                _local_9.isDead = true;
                _local_9.inBattle = false;
                npcDead(_local_9.index);
                _local_5++;
                _local_8 = (_local_8 + 1);
                _local_9 = gameData["hulaData"]["queue"][_local_8];
            };
            if (_local_9)
            {
                if (!_local_9.isDead)
                {
                    _local_5++;
                };
                _local_9.isDead = true;
                _local_9.inBattle = false;
                npcDead(_local_9.index);
            };
            gameData["score"] = (gameData["score"] + _local_5);
            gameData["battleScore"] = (gameData["battleScore"] + _local_5);
            return (true);
        }

        [Bindable(event="propertyChange")]
        public function get comboScore():Label
        {
            return (this._12589660comboScore);
        }

        private function refreshGameData():void
        {
            if (initialized)
            {
                maxComboNum.text = gameData["maxComboNum"];
                battleScore.text = gameData["battleScore"];
                comboScore.text = gameData["comboScore"];
                totleScore.text = gameData["score"];
            };
        }

        [Bindable(event="propertyChange")]
        public function get rankBtn():BasicGlowButton
        {
            return (this._978074256rankBtn);
        }

        [Bindable(event="propertyChange")]
        public function get battleScore():Label
        {
            return (this._760893254battleScore);
        }

        private function refreshNpcPositionIndex():void
        {
            var _local_2:Object;
            var _local_1:int;
            while (_local_1 < gameData["hulaData"]["queue"].length)
            {
                _local_2 = gameData["hulaData"]["queue"][_local_1];
                if (_local_2)
                {
                    _local_2.pIndex = _local_1;
                };
                _local_1++;
            };
        }

        private function refreshTeamData():void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:String;
            if (!initialized)
            {
                return;
            };
            var _local_1:int = gameData["leaderId"];
            var _local_2:Array = gameData["membersArr"];
            leaderName.text = "";
            membersName.text = "";
            if ((((_local_1) && (_local_2)) && (_local_2.length > 1)))
            {
                _local_3 = 0;
                while (_local_3 < _local_2.length)
                {
                    _local_4 = _local_2[_local_3];
                    if (_local_4)
                    {
                        _local_5 = _local_4["cid"];
                        _local_6 = _local_4["name"];
                        if (_local_5 == _local_1)
                        {
                            leaderName.text = _local_6;
                        }
                        else
                        {
                            membersName.text = (membersName.text + (_local_6 + "\n"));
                        };
                    };
                    _local_3++;
                };
            };
        }

        private function npcDisappear(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_3:int;
            while (_local_3 < removeArr.length)
            {
                _local_4 = removeArr[_local_3];
                if (_local_4)
                {
                    npcDead(_local_4.index, false);
                };
                _local_3++;
            };
            removeArr.length = 0;
        }

        private function refreshPre():void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Npc;
            cleanPre();
            var _local_1:Array = gameData["hulaData"]["pre"];
            if (((!(_local_1)) || (_local_1.length == 0)))
            {
                return;
            };
            var _local_2:int;
            while (_local_2 < _local_1.length)
            {
                _local_3 = _local_1[_local_2];
                _local_3.isPre = true;
                _local_4 = _local_3.npcId;
                _local_5 = _core.data.gameData[GamePredef.TBL_NPC][_local_4];
                if (!((!(_local_5)) || (_local_3.isDead)))
                {
                    _local_5.id = _local_3.index;
                    _local_5.posX = (MOVE_POINT[_local_2][0] * 10);
                    _local_5.posY = (MOVE_POINT[_local_2][1] * 10);
                    _local_5.nid = _local_4;
                    _local_5.busy = false;
                    _local_6 = _local_5.name;
                    _local_5.name = (_local_5.name + _local_3.sortId);
                    _core.createNpc(_local_5);
                    _local_5.name = _local_6;
                    _local_7 = _core.getNpc(_local_5.id);
                    if (_local_7)
                    {
                        _local_7.hulaData = _local_3;
                        _local_7.state = 101;
                        preList[_local_2] = _local_7;
                    };
                };
                _local_2++;
            };
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" hula load res Error ");
        }

        override public function initView():void
        {
            if (!initialized)
            {
                getRes();
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (_core.player.mapData.templateId == 76)
            {
                gameBtn.enabled = true;
            }
            else
            {
                tabClick(0);
                gameBtn.enabled = false;
            };
            _core.remote.call("hulaGetRankData", new Responder(onGetRankData));
        }

        private function toScore():void
        {
            var _local_8:Object;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Object;
            if (isGameOver)
            {
                return;
            };
            var _local_1:int;
            var _local_2:int;
            var _local_3:Boolean;
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:int;
            while (_local_7 < gameData["hulaData"]["queue"].length)
            {
                _local_8 = gameData["hulaData"]["queue"][_local_7];
                if (!_local_8)
                {
                    if (_local_1 != 0)
                    {
                        _local_4 = true;
                        _local_6++;
                    };
                }
                else
                {
                    if (_local_1 == 0)
                    {
                        _local_1 = _local_8.npcId;
                    }
                    else
                    {
                        if (_local_1 == _local_8.npcId)
                        {
                            _local_2++;
                            if (_local_4)
                            {
                                _local_5 = true;
                            };
                        }
                        else
                        {
                            if (((_local_2 >= HULA_REAP_NUM) && (_local_5)))
                            {
                                _local_9 = (_local_2 + (_local_2 * reapNum));
                                gameData["score"] = (gameData["score"] + _local_9);
                                gameData["comboScore"] = (gameData["comboScore"] + _local_9);
                                _local_3 = true;
                                removeSubBall((_local_7 - 1), (_local_2 + _local_6));
                                npcDisappear(_local_7, (_local_2 + _local_6));
                            };
                            _local_1 = _local_8.npcId;
                            _local_2 = 1;
                            _local_6 = 0;
                            _local_4 = false;
                            _local_5 = false;
                        };
                    };
                };
                _local_7++;
            };
            if (((_local_2 >= HULA_REAP_NUM) && (_local_5)))
            {
                _local_10 = (_local_2 + (_local_2 * reapNum));
                gameData["score"] = (gameData["score"] + _local_10);
                gameData["comboScore"] = (gameData["comboScore"] + _local_10);
                _local_3 = true;
                removeSubBall((gameData["hulaData"]["queue"].length - 1), (_local_2 + _local_6));
                npcDisappear(_local_7, (_local_2 + _local_6));
            };
            if (_local_3)
            {
                reapNum++;
                if (reapNum > gameData["maxComboNum"])
                {
                    gameData["maxComboNum"] = reapNum;
                };
                _local_11 = _core.view.getUI(ViewManager.MAIN_CNOTICE);
                _local_11.addNotice({
                    "delay":2000,
                    "effect":comboResCodeArr[reapNum],
                    "msg":""
                });
                refreshGameData();
                npcMove(true);
            }
            else
            {
                refreshPre();
                resort();
                isTurning = false;
                toShowUnlock();
            };
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

        public function onBattleEnd(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Boolean;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Boolean = _arg_1["isWin"];
            if (_local_2)
            {
                if (isTurning)
                {
                    tempBattle.push(_arg_1);
                }
                else
                {
                    _local_3 = _arg_1["obj"];
                    _local_4 = _local_3["index"];
                    _local_5 = bomb(_local_4);
                    if (!_local_5)
                    {
                        npcDead(_local_4);
                        gameData["score"] = (gameData["score"] + 1);
                        gameData["battleScore"] = (gameData["battleScore"] + 1);
                    };
                };
                refreshGameData();
            };
        }

        private function npcDead(_arg_1:int, _arg_2:Boolean=true):void
        {
            var _local_4:NPCView;
            var _local_5:int;
            var _local_6:Object;
            var _local_3:Npc = getHulaNpc(_arg_1);
            if (_local_3)
            {
                _local_3.hulaData.isDead = true;
                _local_4 = (_core.view.getN(_local_3.id) as NPCView);
                _core.view.removeN(_local_3.id);
                if (_local_4)
                {
                    if (_local_4.hasEventListener("npc_stop"))
                    {
                        _local_4.removeEventListener("npc_stop", npcStop);
                        _local_4.removeEventListener("hula_game_over", gameOver);
                    };
                    _local_4.hulaDead();
                };
            };
            if (_arg_2)
            {
                _local_5 = 0;
                while (_local_5 < gameData["hulaData"]["queue"].length)
                {
                    _local_6 = gameData["hulaData"]["queue"][_local_5];
                    if (((_local_6) && (_local_6.index == _arg_1)))
                    {
                        _local_6.isDead = true;
                        return;
                    };
                    _local_5++;
                };
            };
        }

        public function __gotoBtn_click(_arg_1:MouseEvent):void
        {
            gotoHall();
        }

        private function gameOver(_arg_1:Event):void
        {
            var _local_4:Object;
            var _local_5:Npc;
            var _local_6:NPCView;
            if (isGameOver)
            {
                return;
            };
            _core.sysBlueMsg(Language.HULA_PANEL[16]);
            isGameOver = true;
            npcMoveNum = 0;
            var _local_2:int = 84;
            var _local_3:int = (gameData["hulaData"]["queue"].length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = gameData["hulaData"]["queue"][_local_3];
                if (_local_4)
                {
                    _local_5 = getHulaNpc(_local_4.index);
                    if (_local_5)
                    {
                        _local_6 = (_core.view.getN(_local_5.id) as NPCView);
                        if (_local_6)
                        {
                            if (_local_6.hasEventListener("npc_stop"))
                            {
                                _local_6.removeEventListener("npc_stop", npcStop);
                                _local_6.removeEventListener("hula_game_over", gameOver);
                            };
                            if (_local_2 >= 0)
                            {
                                _local_6.stopWalkQueue(MOVE_POINT[(_local_2-- + HULA_INIT_PRE_NUM)]);
                            }
                            else
                            {
                                _local_6.stopWalkQueue();
                            };
                        };
                    };
                };
                _local_3--;
            };
        }

        public function onPop(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:Object;
            if (((!(_arg_1)) || (!(gameData["hulaData"]["pre"]))))
            {
                return;
            };
            isTurning = true;
            _core.sysBlueMsg(Language.HULA_PANEL[17]);
            refreshNpcPositionIndex();
            var _local_2:int;
            while (_local_2 < HULA_INIT_POP_NUM)
            {
                _local_3 = gameData["hulaData"]["pre"].pop();
                gameData["hulaData"]["queue"].unshift(_local_3);
                _local_4 = preList.pop();
                _local_4.hulaData.isPre = false;
                npcList.unshift(_local_4);
                _local_2++;
            };
            gameData["hulaData"]["pre"] = _arg_1["pre"];
            reapNum = 0;
            toClear();
            npcMove();
        }

        private function tabClick(_arg_1:int):void
        {
            awardVs.selectedIndex = _arg_1;
            holeBtn.selected = (_arg_1 == 0);
            gameBtn.selected = (_arg_1 == 1);
            rankBtn.selected = (_arg_1 == 2);
            if (_arg_1 == 1)
            {
                refreshGameData();
                refreshTeamData();
            }
            else
            {
                if (_arg_1 == 2)
                {
                    refreshRank();
                };
            };
        }

        public function set holeBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1091754364holeBtn;
            if (_local_2 !== _arg_1)
            {
                this._1091754364holeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeBtn", _local_2, _arg_1));
            };
        }

        private function refreshQueue():void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Npc;
            var _local_8:int;
            cleanQueue();
            var _local_1:Array = gameData["hulaData"]["queue"];
            if (((!(_local_1)) || (_local_1.length == 0)))
            {
                return;
            };
            if (_local_1.length <= 85)
            {
                _local_2 = 0;
                while (((_local_2 < _local_1.length) && (_local_2 < 85)))
                {
                    _local_3 = _local_1[_local_2];
                    _local_4 = _local_3.npcId;
                    _local_5 = _core.data.gameData[GamePredef.TBL_NPC][_local_4];
                    if (!((!(_local_5)) || (_local_3.isDead)))
                    {
                        _local_5.id = _local_3.index;
                        _local_5.posX = (MOVE_POINT[(_local_2 + HULA_INIT_PRE_NUM)][0] * 10);
                        _local_5.posY = (MOVE_POINT[(_local_2 + HULA_INIT_PRE_NUM)][1] * 10);
                        _local_5.nid = _local_4;
                        _local_5.busy = false;
                        _local_6 = _local_5.name;
                        _local_5.name = (_local_5.name + _local_3.sortId);
                        _core.createNpc(_local_5);
                        _local_5.name = _local_6;
                        _local_7 = _core.getNpc(_local_5.id);
                        if (_local_7)
                        {
                            _local_7.hulaData = _local_3;
                            _local_7.state = 101;
                            npcList[_local_2] = _local_7;
                        };
                    };
                    _local_2++;
                };
            }
            else
            {
                _local_8 = 104;
                _local_2 = (_local_1.length - 1);
                while (((_local_2 >= 0) && (_local_8 >= 0)))
                {
                    _local_3 = _local_1[_local_2];
                    _local_4 = _local_3.npcId;
                    _local_5 = _core.data.gameData[GamePredef.TBL_NPC][_local_4];
                    if (!((!(_local_5)) || (_local_3.isDead)))
                    {
                        _local_5.id = _local_3.index;
                        _local_5.posX = (MOVE_POINT[_local_8][0] * 10);
                        _local_5.posY = (MOVE_POINT[_local_8][1] * 10);
                        _local_5.nid = _local_4;
                        _local_5.busy = false;
                        _local_6 = _local_5.name;
                        _local_5.name = (_local_5.name + _local_3.sortId);
                        _core.createNpc(_local_5);
                        _local_5.name = _local_6;
                        _local_7 = _core.getNpc(_local_5.id);
                        if (_local_7)
                        {
                            _local_7.hulaData = _local_3;
                            _local_7.state = 101;
                            npcList[_local_2] = _local_7;
                        };
                        _local_8--;
                    };
                    _local_2--;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

