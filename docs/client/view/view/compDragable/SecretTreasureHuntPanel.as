// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SecretTreasureHuntPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.DataGrid;
    import mx.controls.Button;
    import mx.containers.ViewStack;
    import mx.controls.Label;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import flash.display.Loader;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.SecretTreasureHuntPlayerView;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.resource.ResManager;
    import mx.core.UIComponent;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import mx.binding.BindingManager;
    import mx.core.ClassFactory;
    import flash.net.URLRequest;
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

    public class SecretTreasureHuntPanel extends DragableCanvas implements IBindingClient 
    {

        public static const CALL_HELP_INTERVAL:Number = (60 * 1000);//60000
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _SecretTreasureHuntPanel_Image1:Image;
        public var _SecretTreasureHuntPanel_Image4:Image;
        public var _SecretTreasureHuntPanel_Image5:Image;
        public var _SecretTreasureHuntPanel_Image6:Image;
        public var _SecretTreasureHuntPanel_Image8:Image;
        public var _SecretTreasureHuntPanel_Image3:Image;
        public var _SecretTreasureHuntPanel_Image7:Image;
        public var _SecretTreasureHuntPanel_Image9:Image;
        private var _1756909476friendList:DataGrid;
        private var loadcid:Number = 0;
        private var _502003329secretTreasureHuntAuto:Button;
        private var _808329852vsFlop:ViewStack;
        private var ax:* = 975;
        private var _1347466023XYshaiziNum:Label;
        private var _1045285837secretTreasureHuntXY:Button;
        private var moving:Boolean = false;
        private var atNum:Number = 1;
        private var bx:* = -450;
        private var by:* = -211;
        private var ay:* = 544;
        private var _911423782allmain:Canvas;
        private var allAutoNum:Number = 0;
        private var _876648130XYSZNum:int = 0;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _759494043xjBuff:Label;
        private var isAutoPlay:Boolean = false;
        private var _540386746PTshaiziNum0:Label;
        private var _1125810486PTshaiziNum:Label;
        private var _2072063257closeTiShi:Button;
        private var load:Loader;
        private var _2128897502scoreRank:DataGrid;
        private var _1572459433tishiCanvas:Canvas;
        private var _1642576621speedRank:DataGrid;
        private var lastNum:Number = 50;
        private var canPlay:Boolean = true;
        public var _SecretTreasureHuntPanel_DataGridColumn7:DataGridColumn;
        private var _1535831509openTiShi:Button;
        private var _985752863player:SecretTreasureHuntPlayerView;
        private var _470111259PTSZNum:int = 0;
        private var _1045286090secretTreasureHuntPT:Button;
        private var _540386747PTshaiziNum1:Label;
        private var hasAutoNum:Number = 0;
        private var step_num:int = 0;
        private var _1240338023goldJC:Button;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _1458240628BuffIcon:Image;
        private var _3343801main:Canvas;
        private var load_state:int = 0;
        private var _1929187547XYshaiziCanvas:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":1500,
                    "height":877,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"allmain",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "width":1500,
                                "height":877,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"main",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":1500,
                                            "height":877,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SecretTreasureHuntPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "height":877,
                                                        "width":1500
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SecretTreasureHuntPlayerView,
                                                "id":"player",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":25,
                                                        "y":35
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"tishiCanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"StandardContent",
                                            "x":23,
                                            "y":23,
                                            "width":300,
                                            "height":460,
                                            "visible":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"bangBtn0",
                                                "events":{"click":"__bangBtn0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"HorizontalTab",
                                                        "selected":true,
                                                        "labelPlacement":"bottom",
                                                        "width":60,
                                                        "x":10,
                                                        "y":38
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
                                                        "width":60,
                                                        "x":70,
                                                        "y":38
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"bangBtn2",
                                                "events":{"click":"__bangBtn2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"HorizontalTab",
                                                        "width":60,
                                                        "x":130,
                                                        "y":38
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "events":{"click":"___SecretTreasureHuntPanel_BasicDelayButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":300000,
                                                        "label":"Làm mới XP",
                                                        "styleName":"BtnStdGreen",
                                                        "x":224,
                                                        "y":34,
                                                        "toolTip":"Làm mới cách 5p/lần"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"vsFlop",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":57,
                                                        "width":276,
                                                        "height":296,
                                                        "creationPolicy":"all",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"Hornor",
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "x":0,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"scoreRank",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":8,
                                                                                "y":8,
                                                                                "columns":[_SecretTreasureHuntPanel_DataGridColumn1_c(), _SecretTreasureHuntPanel_DataGridColumn2_c(), _SecretTreasureHuntPanel_DataGridColumn3_c()]
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
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "x":0,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"speedRank",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":8,
                                                                                "y":8,
                                                                                "columns":[_SecretTreasureHuntPanel_DataGridColumn4_c(), _SecretTreasureHuntPanel_DataGridColumn5_c(), _SecretTreasureHuntPanel_DataGridColumn6_c()]
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
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "x":0,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"friendList",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":8,
                                                                                "y":8,
                                                                                "columns":[_SecretTreasureHuntPanel_DataGridColumn7_i(), _SecretTreasureHuntPanel_DataGridColumn8_c()]
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
                                                "id":"goldJC",
                                                "events":{"click":"__goldJC_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":120,
                                                        "y":432,
                                                        "styleName":"BtnStdGreen",
                                                        "label":"Mở khóa vàng"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"xjBuff",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":361,
                                                        "width":216,
                                                        "height":63
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"BuffIcon",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":361,
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"openTiShi",
                                    "events":{"click":"__openTiShi_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"EquipBagRight",
                                            "x":13,
                                            "y":178,
                                            "width":11,
                                            "height":131,
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"closeTiShi",
                                    "events":{"click":"__closeTiShi_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"EquipBagLeft",
                                            "x":13,
                                            "y":178,
                                            "width":11,
                                            "height":131,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"XYshaiziCanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":325,
                                            "y":341,
                                            "width":421,
                                            "height":97,
                                            "visible":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SecretTreasureHuntPanel_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":421,
                                                        "height":97
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SecretTreasureHuntPanel_Image4",
                                                "events":{"click":"___SecretTreasureHuntPanel_Image4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":16,
                                                        "y":13,
                                                        "width":52,
                                                        "height":52
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SecretTreasureHuntPanel_Image5",
                                                "events":{"click":"___SecretTreasureHuntPanel_Image5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":83,
                                                        "y":13,
                                                        "width":52,
                                                        "height":52
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SecretTreasureHuntPanel_Image6",
                                                "events":{"click":"___SecretTreasureHuntPanel_Image6_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":150,
                                                        "y":13,
                                                        "width":52,
                                                        "height":52
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SecretTreasureHuntPanel_Image7",
                                                "events":{"click":"___SecretTreasureHuntPanel_Image7_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":217,
                                                        "y":13,
                                                        "width":52,
                                                        "height":52
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SecretTreasureHuntPanel_Image8",
                                                "events":{"click":"___SecretTreasureHuntPanel_Image8_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":284,
                                                        "y":13,
                                                        "width":52,
                                                        "height":52
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_SecretTreasureHuntPanel_Image9",
                                                "events":{"click":"___SecretTreasureHuntPanel_Image9_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":351,
                                                        "y":13,
                                                        "width":52,
                                                        "height":52
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":290,
                                            "y":427,
                                            "width":508,
                                            "height":163,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"secretTreasureHuntPT",
                                                "events":{"click":"__secretTreasureHuntPT_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "styleName":"secretTreasureHuntPT",
                                                        "width":123,
                                                        "height":108
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"secretTreasureHuntXY",
                                                "events":{"click":"__secretTreasureHuntXY_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":183,
                                                        "y":10,
                                                        "styleName":"secretTreasureHuntXY",
                                                        "width":123,
                                                        "height":108
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"secretTreasureHuntAuto",
                                                "events":{"click":"__secretTreasureHuntAuto_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":356,
                                                        "y":10,
                                                        "styleName":"secretTreasureHuntAuto",
                                                        "width":123,
                                                        "height":108
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"PTshaiziNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":75,
                                                        "y":126,
                                                        "width":42,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"XYshaiziNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":254,
                                                        "y":126,
                                                        "width":36.5,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___SecretTreasureHuntPanel_Button7_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":115,
                                                        "y":126,
                                                        "styleName":"BtnAdd",
                                                        "width":18,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___SecretTreasureHuntPanel_Button8_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":288,
                                                        "y":126,
                                                        "styleName":"BtnAdd",
                                                        "width":18,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"PTshaiziNum0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"Xí Ngầu：",
                                                        "x":10,
                                                        "y":126,
                                                        "width":66,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"PTshaiziNum1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "text":"XN May Mắn：",
                                                        "x":183,
                                                        "y":126,
                                                        "width":72,
                                                        "height":20
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___SecretTreasureHuntPanel_Button9_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":850,
                                            "y":25,
                                            "styleName":"secretTreasureHuntExit",
                                            "height":53,
                                            "width":53
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
        private var checkNum:Object = {
            "pt":false,
            "xy":false
        };
        private var shaiziArr:Array = [];
        private var npcShowArr:Array = [];
        private var strShowArr:Array = ["Chuyện gì cũng có thể xảy ra\n", "Bạn đã mở Bảo rương nhỏ nhận: {name}\n", "Bạn đã mở Bảo rương trung nhận：{name}\n", "Bạn đã mở Bảo rương lớn nhận: {name}\n", "Khi tầm bảo đã thuận lợi đánh bại kẻ địch!\n", "Khi tầm bảo đã bị kẻ địch đánh cho 1 trận, phải trị thương trong 2 phút.\n", "Bạn đã đạp trúng cơ quan, bị chuyển đến nơi khác.\n", "Bạn nhận {num} Ngân Phiếu\n", "Bạn đã giải được 1 câu đố, nhận {num} điểm.\n", "Khi tầm bảo bạn đã nhận {num} exp.\n", "Bạn đã đạp trúng cơ quan, bị chuyển về chỗ cũ.\n", "Bạn không cẩn thận rơi xuống giếng, bất động trong 5 phút!\n"];
        public var CALL_HELP_DIC:Dictionary = new Dictionary();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SecretTreasureHuntPanel()
        {
            mx_internal::_document = this;
            this.width = 1500;
            this.height = 877;
            this.movable = false;
            this.addEventListener("creationComplete", ___SecretTreasureHuntPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SecretTreasureHuntPanel._watcherSetupUtil = _arg_1;
        }


        public function onGetSTHScoreRank(_arg_1:Object):void
        {
            scoreRank.dataProvider = _arg_1;
        }

        private function _SecretTreasureHuntPanel_DataGridColumn6_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Th.gian(giây)";
            _local_1.dataField = "time";
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get PTSZNum():int
        {
            return (this._470111259PTSZNum);
        }

        public function getPTSZNum():int
        {
            return (PTSZNum);
        }

        public function __closeTiShi_click(_arg_1:MouseEvent):void
        {
            openCloseTiShiCanvas(0);
        }

        public function __secretTreasureHuntAuto_click(_arg_1:MouseEvent):void
        {
            guajiFunc();
        }

        public function set speedRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1642576621speedRank;
            if (_local_2 !== _arg_1)
            {
                this._1642576621speedRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "speedRank", _local_2, _arg_1));
            };
        }

        public function ___SecretTreasureHuntPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            refreshSTHRank();
        }

        public function onSetSecTreaHuntPlayStop(_arg_1:int, _arg_2:int):*
        {
            var _local_5:String;
            var _local_6:Number;
            var _local_7:String;
            var _local_8:Object;
            var _local_3:Number = 60;
            var _local_4:* = "";
            switch (_arg_1)
            {
                case 3:
                    if (isAutoPlay)
                    {
                        _local_4 = strShowArr[0];
                    };
                    break;
                case 4:
                    _local_5 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_2].name;
                    _local_6 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_2].color;
                    if (isAutoPlay)
                    {
                        _local_4 = strShowArr[1].replace("{name}", _local_5);
                        _local_4 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_6]) + "'>") + _local_4) + "</font>");
                    }
                    else
                    {
                        _local_7 = (Language.SEC_TREA_HUNT[17] + _local_5);
                        _core.sysMidNote(_local_7);
                    };
                    break;
                case 5:
                    _local_5 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_2].name;
                    _local_6 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_2].color;
                    if (isAutoPlay)
                    {
                        _local_4 = strShowArr[2].replace("{name}", _local_5);
                        _local_4 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_6]) + "'>") + _local_4) + "</font>");
                    }
                    else
                    {
                        _local_7 = (Language.SEC_TREA_HUNT[17] + _local_5);
                        _core.sysMidNote(_local_7);
                    };
                    break;
                case 6:
                    if (isAutoPlay)
                    {
                        _local_6 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_2].color;
                        _local_4 = strShowArr[3].replace("{name}", GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_2].name);
                        _local_4 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_6]) + "'>") + _local_4) + "</font>");
                        initView();
                    }
                    else
                    {
                        _local_8 = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_END);
                        if (_local_8)
                        {
                            _local_8.itemNum = _arg_2;
                            _local_8.showPanel();
                        };
                        secretTreasureHuntPT.enabled = false;
                        secretTreasureHuntXY.enabled = false;
                        secretTreasureHuntAuto.enabled = false;
                    };
                    break;
                case 7:
                    if (isAutoPlay)
                    {
                        _local_4 = strShowArr[4];
                    }
                    else
                    {
                        showPanel();
                        if (_arg_2 == 1)
                        {
                            _core.sysMidNote(strShowArr[4]);
                        };
                        if (_arg_2 == 0)
                        {
                            _core.sysMidNote(strShowArr[5]);
                            onSetSecTreaHuntCanPlay(false, 1);
                        };
                    };
                    break;
                case 9:
                    if (isAutoPlay)
                    {
                        _local_4 = strShowArr[6];
                    }
                    else
                    {
                        _core.sysMidNote(Language.SEC_TREA_HUNT[23]);
                    };
                    atNum = _arg_2;
                    player.refresh(_arg_2);
                    break;
                case 10:
                    if (isAutoPlay)
                    {
                        _local_4 = strShowArr[7].replace("{num}", _arg_2);
                    }
                    else
                    {
                        _local_7 = Language.SEC_TREA_HUNT[19].replace("{num}", _arg_2);
                        _core.sysMidNote(_local_7);
                    };
                    break;
                case 11:
                    break;
                case 12:
                    if (isAutoPlay)
                    {
                        _local_4 = strShowArr[9].replace("{num}", _arg_2);
                    }
                    else
                    {
                        _local_7 = Language.SEC_TREA_HUNT[18].replace("{num}", _arg_2);
                        _core.sysMidNote(_local_7);
                    };
                    break;
                case 13:
                    if (isAutoPlay)
                    {
                        _local_4 = strShowArr[10];
                    }
                    else
                    {
                        _core.sysMidNote(Language.SEC_TREA_HUNT[24]);
                    };
                    atNum = _arg_2;
                    player.refresh(_arg_2);
                    break;
            };
            if (isAutoPlay)
            {
                _local_8 = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_AUTO);
                if (_local_8)
                {
                    _local_8._leftTime = (2 * 60);
                    _local_8._strShow = _local_4;
                    _local_8._autoStr = ((("Đang tự động tầm bảo" + hasAutoNum) + "/") + allAutoNum);
                };
            };
            moving = false;
        }

        public function ___SecretTreasureHuntPanel_Image5_click(_arg_1:MouseEvent):void
        {
            goXY(2);
        }

        [Bindable(event="propertyChange")]
        public function get secretTreasureHuntXY():Button
        {
            return (this._1045285837secretTreasureHuntXY);
        }

        private function set PTSZNum(_arg_1:int):void
        {
            var _local_2:Object = this._470111259PTSZNum;
            if (_local_2 !== _arg_1)
            {
                this._470111259PTSZNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "PTSZNum", _local_2, _arg_1));
            };
        }

        private function _SecretTreasureHuntPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(4130220000630);
            _local_1 = Language.SEC_TREA_HUNT[12];
            _local_1 = Language.SEC_TREA_HUNT[13];
            _local_1 = Language.SEC_TREA_HUNT[14];
            _local_1 = Language.IMPANEL_S[59];
            _local_1 = ResManager.getIconUrl(4130220000637);
            _local_1 = ResManager.getIconUrl(4130220000631);
            _local_1 = ResManager.getIconUrl(4130220000632);
            _local_1 = ResManager.getIconUrl(4130220000633);
            _local_1 = ResManager.getIconUrl(4130220000634);
            _local_1 = ResManager.getIconUrl(4130220000635);
            _local_1 = ResManager.getIconUrl(4130220000636);
            _local_1 = PTSZNum;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = XYSZNum;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_2:UIComponent;
            var _local_4:int;
            var _local_5:String;
            var _local_6:Class;
            var _local_7:MovieClip;
            _local_2 = new UIComponent();
            var _local_3:int;
            while (_local_3 < 6)
            {
                _local_4 = (_local_3 + 1);
                _local_5 = ("shaizi" + String(_local_4));
                _local_6 = (load.contentLoaderInfo.applicationDomain.getDefinition(_local_5) as Class);
                _local_7 = new (_local_6)();
                _local_7.stop();
                _local_2 = new UIComponent();
                _local_2.x = 100;
                _local_2.y = -111;
                _local_7.visible = false;
                _local_7.addEventListener("complete", shaiziComplete);
                shaiziArr.push(_local_7);
                _local_2.addChild(_local_7);
                allmain.addChildAt(_local_2, 1);
                _local_3++;
            };
            load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            init();
            _core.remote.call("getSecretTreasureHuntData", null);
        }

        private function closeCanvasFunc():void
        {
            visible = false;
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_AUTO);
            if (_local_1)
            {
                _local_1.visible = false;
            };
        }

        public function set XYshaiziCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1929187547XYshaiziCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1929187547XYshaiziCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "XYshaiziCanvas", _local_2, _arg_1));
            };
        }

        public function __secretTreasureHuntXY_click(_arg_1:MouseEvent):void
        {
            showGoXY();
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        public function onSetSecTreaHuntAutoPlay(_arg_1:Boolean):void
        {
            isAutoPlay = _arg_1;
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_AUTO);
            if (_local_2)
            {
                _local_2._AutoPlay = _arg_1;
            };
        }

        private function _SecretTreasureHuntPanel_DataGridColumn5_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Tên";
            _local_1.dataField = "name";
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get friendList():DataGrid
        {
            return (this._1756909476friendList);
        }

        [Bindable(event="propertyChange")]
        public function get xjBuff():Label
        {
            return (this._759494043xjBuff);
        }

        public function set secretTreasureHuntXY(_arg_1:Button):void
        {
            var _local_2:Object = this._1045285837secretTreasureHuntXY;
            if (_local_2 !== _arg_1)
            {
                this._1045285837secretTreasureHuntXY = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "secretTreasureHuntXY", _local_2, _arg_1));
            };
        }

        private function onGoXY(_arg_1:Object):void
        {
            if ((((!(_arg_1)) || (_arg_1["num"] <= 0)) || (_arg_1["num"] > 6)))
            {
                moving = false;
                return;
            };
            step_num = _arg_1["num"];
            XYSZNum = (XYSZNum - 1);
            atNum = (atNum + _arg_1["num"]);
            shaiziE(step_num);
        }

        private function ifShowPanel(_arg_1:Object):void
        {
            if (!_arg_1.openflag)
            {
                _core.sysMidNote("Sự kiện chưa mở");
                return;
            };
            if (Number(_core.lineInfo.id) != 0)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[32]);
                return;
            };
            if (!_arg_1.group)
            {
                _core.sysMidNote("Trạng thái nhóm không thể vào");
                return;
            };
            initView();
            visible = true;
        }

        public function set PTshaiziNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1125810486PTshaiziNum;
            if (_local_2 !== _arg_1)
            {
                this._1125810486PTshaiziNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "PTshaiziNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tishiCanvas():Canvas
        {
            return (this._1572459433tishiCanvas);
        }

        private function goldJiechu():void
        {
            _core.remote.call("getTreaHuntJiechuGold", null);
        }

        public function set secretTreasureHuntPT(_arg_1:Button):void
        {
            var _local_2:Object = this._1045286090secretTreasureHuntPT;
            if (_local_2 !== _arg_1)
            {
                this._1045286090secretTreasureHuntPT = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "secretTreasureHuntPT", _local_2, _arg_1));
            };
        }

        private function changeView(_arg_1:Number):void
        {
            vsFlop.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 3)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
        }

        public function setAllAutoNum(_arg_1:Number):void
        {
            allAutoNum = _arg_1;
            hasAutoNum = _arg_1;
        }

        private function set XYSZNum(_arg_1:int):void
        {
            var _local_2:Object = this._876648130XYSZNum;
            if (_local_2 !== _arg_1)
            {
                this._876648130XYSZNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "XYSZNum", _local_2, _arg_1));
            };
        }

        public function onGetFriendOnlList(_arg_1:Object):void
        {
            friendList.dataProvider = _arg_1;
        }

        public function refreshSpeedRank():void
        {
            _core.remote.call("getSTHSpeedRank", null);
        }

        [Bindable(event="propertyChange")]
        public function get secretTreasureHuntAuto():Button
        {
            return (this._502003329secretTreasureHuntAuto);
        }

        private function showGoXY():void
        {
            var _local_1:String;
            var _local_2:*;
            if (_core.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)
            {
                _core.sysMidNote("Đang bay không thể lắc xí ngầu");
                return;
            };
            if (_core.player.taskSweep)
            {
                _core.sysMidNote("Đang tự động càn quét không thể lắc xí ngầu");
                return;
            };
            if (XYshaiziCanvas.visible == true)
            {
                XYshaiziCanvas.visible = false;
                return;
            };
            if (isAutoPlay)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[16]);
                return;
            };
            if (!canPlay)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[11]);
                return;
            };
            if (moving)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[67]);
                return;
            };
            if (XYSZNum <= 0)
            {
                if (checkNum.xy == false)
                {
                    _local_1 = "";
                    _local_1 = (_local_1 + Language.SEC_TREA_HUNT[5]);
                    _local_2 = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_ONE);
                    if (_local_2)
                    {
                        _local_2.typeNum = 2;
                        _local_2.str = _local_1;
                        _local_2.showPanel();
                    };
                }
                else
                {
                    _core.remote.call("buySecTreaHuntSZ", null, 2, 1);
                };
            }
            else
            {
                XYshaiziCanvas.visible = true;
            };
        }

        public function ___SecretTreasureHuntPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function shaiziComplete(_arg_1:Event):void
        {
            player.startMove(step_num);
        }

        private function _SecretTreasureHuntPanel_DataGridColumn4_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Hạng";
            _local_1.dataField = "rank";
            _local_1.width = 50;
            return (_local_1);
        }

        private function shaiziE(_arg_1:int):void
        {
            var _local_2:MovieClip;
            _local_2 = shaiziArr[(_arg_1 - 1)];
            if (!_local_2)
            {
                return;
            };
            var _local_3:int;
            while (_local_3 < shaiziArr.length)
            {
                _local_2 = shaiziArr[_local_3];
                if ((_local_3 + 1) == _arg_1)
                {
                    _local_2.visible = true;
                    _local_2.gotoAndPlay(1);
                }
                else
                {
                    _local_2.visible = false;
                };
                _local_3++;
            };
        }

        public function ___SecretTreasureHuntPanel_Button7_click(_arg_1:MouseEvent):void
        {
            buySZ(1);
        }

        public function ___SecretTreasureHuntPanel_Image7_click(_arg_1:MouseEvent):void
        {
            goXY(4);
        }

        public function set tishiCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1572459433tishiCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1572459433tishiCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tishiCanvas", _local_2, _arg_1));
            };
        }

        public function set friendList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1756909476friendList;
            if (_local_2 !== _arg_1)
            {
                this._1756909476friendList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "friendList", _local_2, _arg_1));
            };
        }

        public function __openTiShi_click(_arg_1:MouseEvent):void
        {
            openCloseTiShiCanvas(1);
        }

        public function callHelp(_arg_1:Object):void
        {
            var _local_3:Number;
            if (!CALL_HELP_DIC[_core.cid])
            {
                CALL_HELP_DIC[_core.cid] = {};
            };
            var _local_2:Number = new Date().getTime();
            if (((CALL_HELP_DIC[_core.cid][_arg_1.cid]) && ((_local_2 - CALL_HELP_DIC[_core.cid][_arg_1.cid]) < CALL_HELP_INTERVAL)))
            {
                _core.sysMidNote("Bạn đã cầu cứu bạn bè, vài giây sau hãy thử lại");
                return;
            };
            if (canPlay)
            {
                _core.sysMidNote("Không dính buff, không cần giải cứu");
                return;
            };
            if (((_arg_1) && (_arg_1.cid)))
            {
                _local_3 = _arg_1.cid;
                CALL_HELP_DIC[_core.cid][_arg_1.cid] = _local_2;
                _core.remote.call("STHForHelp", null, _local_3, _core.cid);
            };
        }

        public function STHcancelTripResult():void
        {
            Alert.show("Bạn đã được giải trừ buff");
            _core.remote.call("friendSecTreaHuntJiechu", null);
        }

        private function _SecretTreasureHuntPanel_DataGridColumn3_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Điểm";
            _local_1.dataField = "score";
            return (_local_1);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" summerGames load res Error ");
        }

        public function set xjBuff(_arg_1:Label):void
        {
            var _local_2:Object = this._759494043xjBuff;
            if (_local_2 !== _arg_1)
            {
                this._759494043xjBuff = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xjBuff", _local_2, _arg_1));
            };
        }

        public function getCanplay():Boolean
        {
            return (canPlay);
        }

        [Bindable(event="propertyChange")]
        public function get allmain():Canvas
        {
            return (this._911423782allmain);
        }

        private function ifHadJingGuo(_arg_1:Object, _arg_2:int):Boolean
        {
            var _local_3:*;
            if (((((((_arg_2 == 49) || (_arg_2 == 57)) || (_arg_2 == 90)) || (_arg_2 == 14)) || (_arg_2 == 34)) || (_arg_2 == 64)))
            {
                return (true);
            };
            for (_local_3 in _arg_1["haveGo"])
            {
                if (_arg_1["haveGo"][_local_3] == _arg_2)
                {
                    return (false);
                };
            };
            return (true);
        }

        [Bindable(event="propertyChange")]
        public function get XYshaiziNum():Label
        {
            return (this._1347466023XYshaiziNum);
        }

        [Bindable(event="propertyChange")]
        public function get player():SecretTreasureHuntPlayerView
        {
            return (this._985752863player);
        }

        public function setCanvasXY(_arg_1:Number, _arg_2:Number):void
        {
            if (((_arg_1 < 525) && (_arg_2 < 333)))
            {
                main.x = 0;
                main.y = 0;
            }
            else
            {
                if ((((_arg_1 < 525) && (_arg_2 > 333)) && (_arg_2 < ay)))
                {
                    main.x = 0;
                    main.y = (333 - _arg_2);
                }
                else
                {
                    if (((_arg_1 < 525) && (_arg_2 > ay)))
                    {
                        main.x = 0;
                        main.y = by;
                    }
                    else
                    {
                        if (((((_arg_1 > 525) && (_arg_2 > 333)) && (_arg_1 < ax)) && (_arg_2 < ay)))
                        {
                            main.x = (525 - _arg_1);
                            main.y = (333 - _arg_2);
                        }
                        else
                        {
                            if ((((_arg_2 < 333) && (_arg_1 > 525)) && (_arg_1 < ax)))
                            {
                                main.x = (525 - _arg_1);
                                main.y = 0;
                            }
                            else
                            {
                                if ((((_arg_2 > ay) && (_arg_1 > 525)) && (_arg_1 < ax)))
                                {
                                    main.x = (525 - _arg_1);
                                    main.y = by;
                                }
                                else
                                {
                                    if (((_arg_1 > ax) && (_arg_2 < 333)))
                                    {
                                        main.x = bx;
                                        main.y = 0;
                                    }
                                    else
                                    {
                                        if ((((_arg_1 > ax) && (_arg_2 > 333)) && (_arg_2 < ay)))
                                        {
                                            main.x = bx;
                                            main.y = (333 - _arg_2);
                                        }
                                        else
                                        {
                                            if (((_arg_1 > ax) && (_arg_2 > ay)))
                                            {
                                                main.x = bx;
                                                main.y = by;
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

        public function onSetSecTreaHuntSZnum(_arg_1:Object):void
        {
            PTSZNum = int(_arg_1["pt"]);
            XYSZNum = int(_arg_1["xy"]);
            lastNum = (50 - int(_arg_1["all"]));
            if (_arg_1["check"])
            {
                checkNum = _arg_1["check"];
            };
        }

        [Bindable(event="propertyChange")]
        public function get closeTiShi():Button
        {
            return (this._2072063257closeTiShi);
        }

        private function go():void
        {
            var _local_1:String;
            var _local_2:*;
            if (_core.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)
            {
                _core.sysMidNote("Đang bay không thể lắc xí ngầu");
                return;
            };
            if (_core.player.taskSweep)
            {
                _core.sysMidNote("Đang tự động càn quét không thể lắc xí ngầu");
                return;
            };
            if (isAutoPlay)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[16]);
                return;
            };
            if (!canPlay)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[11]);
                return;
            };
            if (moving)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[7]);
                return;
            };
            if (PTSZNum <= 0)
            {
                if (checkNum.pt == false)
                {
                    _local_1 = "";
                    _local_1 = (_local_1 + Language.SEC_TREA_HUNT[4]);
                    _local_2 = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_ONE);
                    if (_local_2)
                    {
                        _local_2.typeNum = 1;
                        _local_2.str = _local_1;
                        _local_2.showPanel();
                    };
                }
                else
                {
                    _core.remote.call("buySecTreaHuntSZ", null, 1, 1);
                };
            }
            else
            {
                moving = true;
                _core.remote.call("SecretTreasureHuntGo", new Responder(onGo));
            };
        }

        public function onSetSecTreaHuntCanPlay(_arg_1:Boolean, _arg_2:Number):void
        {
            var _local_3:Object;
            canPlay = _arg_1;
            moving = false;
            if (canPlay)
            {
                goldJC.visible = false;
                xjBuff.visible = false;
                BuffIcon.visible = false;
                if (isAutoPlay)
                {
                    _local_3 = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_AUTO);
                    if (_local_3)
                    {
                        _local_3._leftTime = (2 * 60);
                    };
                };
            }
            else
            {
                if (_arg_2 == 1)
                {
                    xjBuff.htmlText = "Chiến bại, trị thương tại chỗ 2p, có thể dùng\nVàng để giải trừ các buff";
                    BuffIcon.visible = false;
                }
                else
                {
                    xjBuff.htmlText = "Trúng phải buff bất động trong 5 phút, có thể cầu cứu bạn bè giúp đỡ hoặc dùng vàng để giải trừ";
                    if (_arg_2 == 14)
                    {
                        BuffIcon.source = ResManager.getIconUrl(4140200100506);
                        _core.sysMidNote(Language.SEC_TREA_HUNT[25]);
                    }
                    else
                    {
                        if (_arg_2 == 15)
                        {
                            BuffIcon.source = ResManager.getIconUrl(4140200100507);
                            _core.sysMidNote(Language.SEC_TREA_HUNT[26]);
                        }
                        else
                        {
                            if (_arg_2 == 16)
                            {
                                BuffIcon.source = ResManager.getIconUrl(4140200100508);
                                _core.sysMidNote(Language.SEC_TREA_HUNT[28]);
                            }
                            else
                            {
                                if (_arg_2 == 17)
                                {
                                    BuffIcon.source = ResManager.getIconUrl(4140200100509);
                                    _core.sysMidNote(Language.SEC_TREA_HUNT[27]);
                                };
                            };
                        };
                    };
                    BuffIcon.visible = true;
                };
                goldJC.visible = true;
                xjBuff.visible = true;
                if (((isAutoPlay) && ((((_arg_2 == 14) || (_arg_2 == 15)) || (_arg_2 == 16)) || (_arg_2 == 17))))
                {
                    _local_3 = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_AUTO);
                    if (_local_3)
                    {
                        _local_3._leftTime = (7 * 60);
                        _local_3._strShow = strShowArr[11];
                        _local_3._autoStr = ((("Đang tự động tầm bảo" + hasAutoNum) + "/") + allAutoNum);
                    };
                };
            };
        }

        public function ___SecretTreasureHuntPanel_Image4_click(_arg_1:MouseEvent):void
        {
            goXY(1);
        }

        public function OnSTHForHelp(name:Object, fromId:Number):*
        {
            var func:Function;
            var str:String;
            if (name)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("STHCancelTrip", null, fromId, true, _core.cid);
                    }
                    else
                    {
                        _core.remote.call("STHCancelTrip", null, fromId, false, _core.cid);
                    };
                };
                str = "{name} xin bạn giúp giải trừ buff";
                Alert.show(str.replace("{name}", name), "", (Alert.YES | Alert.NO), null, func);
            };
        }

        public function onSecTreaHuntAutoPlay(_arg_1:int):void
        {
            PTSZNum = (PTSZNum - 1);
            atNum = (atNum + step_num);
            hasAutoNum = (hasAutoNum - 1);
            player.startMove(_arg_1);
        }

        private function _SecretTreasureHuntPanel_DataGridColumn2_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Tên";
            _local_1.dataField = "name";
            return (_local_1);
        }

        public function showPanel():void
        {
            if (loadcid == 0)
            {
                loadcid = _core.cid;
            };
            if (loadcid != _core.cid)
            {
                loadcid = _core.cid;
            };
            _core.remote.call("sthPlayIsInGroup", new Responder(ifShowPanel));
            secretTreasureHuntPT.enabled = true;
            secretTreasureHuntXY.enabled = true;
            secretTreasureHuntAuto.enabled = true;
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

        public function set secretTreasureHuntAuto(_arg_1:Button):void
        {
            var _local_2:Object = this._502003329secretTreasureHuntAuto;
            if (_local_2 !== _arg_1)
            {
                this._502003329secretTreasureHuntAuto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "secretTreasureHuntAuto", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get speedRank():DataGrid
        {
            return (this._1642576621speedRank);
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        public function set BuffIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1458240628BuffIcon;
            if (_local_2 !== _arg_1)
            {
                this._1458240628BuffIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "BuffIcon", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            player.addEventListener("move_end", playerMpveEnd);
        }

        private function onGo(_arg_1:Object):void
        {
            if ((((!(_arg_1)) || (_arg_1["num"] <= 0)) || (_arg_1["num"] > 6)))
            {
                moving = false;
                return;
            };
            step_num = _arg_1["num"];
            PTSZNum = (PTSZNum - 1);
            atNum = (atNum + step_num);
            shaiziE(step_num);
        }

        public function __secretTreasureHuntPT_click(_arg_1:MouseEvent):void
        {
            go();
        }

        public function set goldJC(_arg_1:Button):void
        {
            var _local_2:Object = this._1240338023goldJC;
            if (_local_2 !== _arg_1)
            {
                this._1240338023goldJC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldJC", _local_2, _arg_1));
            };
        }

        public function ___SecretTreasureHuntPanel_Image9_click(_arg_1:MouseEvent):void
        {
            goXY(6);
        }

        [Bindable(event="propertyChange")]
        public function get XYshaiziCanvas():Canvas
        {
            return (this._1929187547XYshaiziCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get PTshaiziNum():Label
        {
            return (this._1125810486PTshaiziNum);
        }

        public function ___SecretTreasureHuntPanel_Button9_click(_arg_1:MouseEvent):void
        {
            closeCanvasFunc();
        }

        [Bindable(event="propertyChange")]
        public function get secretTreasureHuntPT():Button
        {
            return (this._1045286090secretTreasureHuntPT);
        }

        [Bindable(event="propertyChange")]
        private function get XYSZNum():int
        {
            return (this._876648130XYSZNum);
        }

        public function onGetData(_arg_1:Object, _arg_2:Object, _arg_3:Object):void
        {
            var _local_6:CharactorShowCanvas;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:String;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:Array;
            if ((((!(_arg_1)) || (!(_arg_2))) || (!(_arg_3))))
            {
                return;
            };
            var _local_4:int = 1;
            while (_local_4 <= 103)
            {
                if (npcShowArr[_local_4])
                {
                    main.removeChild(npcShowArr[_local_4]);
                };
                _local_4++;
            };
            npcShowArr = new Array();
            var _local_5:int = 1;
            while (_local_5 <= 103)
            {
                _local_6 = new CharactorShowCanvas();
                _local_7 = GameData.d[GamePredef.TBL_MEVENT_MAP][_local_5];
                _local_8 = _local_7.pos;
                _local_9 = _local_7.meventId;
                if (_arg_1["nullGridMapData"][_local_5])
                {
                    _local_10 = GameData.d[GamePredef.TBL_MEVENT_TYPE][_arg_1["nullGridMapData"][_local_5]];
                }
                else
                {
                    _local_10 = GameData.d[GamePredef.TBL_MEVENT_TYPE][_local_9];
                };
                if (((_local_10.npcId > 0) && (ifHadJingGuo(_arg_1, _local_5))))
                {
                    _local_11 = GameData.d[GamePredef.TBL_NPC][_local_10.npcId];
                    _local_12 = _local_8.split(",");
                    _local_6.url = ResManager.getResUrl(_local_11.resCode);
                    _local_6.x = _local_12[0];
                    _local_6.y = _local_12[1];
                    _local_6.toolTip = _local_10.tip;
                    _local_6.visible = true;
                    npcShowArr[_local_5] = _local_6;
                    main.addChild(_local_6);
                };
                _local_5++;
            };
            player.refresh(_arg_1["atGridNum"]);
            atNum = int(_arg_1["atGridNum"]);
            PTSZNum = int(_arg_1["ptSZnum"]);
            XYSZNum = int(_arg_1["xySZnum"]);
            checkNum = _arg_1["check"];
            lastNum = (50 - _arg_1["allSZBuyNum"]);
            isAutoPlay = _arg_3.play;
            canPlay = _arg_2.flag;
            if (canPlay)
            {
                goldJC.visible = false;
                xjBuff.visible = false;
                BuffIcon.visible = false;
            }
            else
            {
                onSetSecTreaHuntCanPlay(_arg_2.flag, _arg_2.type);
            };
        }

        public function __goldJC_click(_arg_1:MouseEvent):void
        {
            goldJiechu();
        }

        public function refreshScoreRank():void
        {
            _core.remote.call("getSTHScoreRank", null);
        }

        public function getMoving():Boolean
        {
            return (moving);
        }

        public function onGetSTHSpeedRank(_arg_1:Object):void
        {
            speedRank.dataProvider = _arg_1;
        }

        public function setMoving(_arg_1:Boolean):void
        {
            moving = _arg_1;
        }

        private function _SecretTreasureHuntPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Hạng";
            _local_1.dataField = "rank";
            _local_1.width = 50;
            return (_local_1);
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

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
            };
        }

        private function _SecretTreasureHuntPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000630));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntPanel_Image1.source = _arg_1;
            }, "_SecretTreasureHuntPanel_Image1.source");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SecretTreasureHuntPanel_DataGridColumn7.headerText = _arg_1;
            }, "_SecretTreasureHuntPanel_DataGridColumn7.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000637));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntPanel_Image3.source = _arg_1;
            }, "_SecretTreasureHuntPanel_Image3.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000631));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntPanel_Image4.source = _arg_1;
            }, "_SecretTreasureHuntPanel_Image4.source");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000632));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntPanel_Image5.source = _arg_1;
            }, "_SecretTreasureHuntPanel_Image5.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000633));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntPanel_Image6.source = _arg_1;
            }, "_SecretTreasureHuntPanel_Image6.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000634));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntPanel_Image7.source = _arg_1;
            }, "_SecretTreasureHuntPanel_Image7.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000635));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntPanel_Image8.source = _arg_1;
            }, "_SecretTreasureHuntPanel_Image8.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000636));
            }, function (_arg_1:Object):void
            {
                _SecretTreasureHuntPanel_Image9.source = _arg_1;
            }, "_SecretTreasureHuntPanel_Image9.source");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = PTSZNum;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                PTshaiziNum.text = _arg_1;
            }, "PTshaiziNum.text");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                PTshaiziNum.filters = _arg_1;
            }, "PTshaiziNum.filters");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = XYSZNum;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                XYshaiziNum.text = _arg_1;
            }, "XYshaiziNum.text");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                XYshaiziNum.filters = _arg_1;
            }, "XYshaiziNum.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                PTshaiziNum0.filters = _arg_1;
            }, "PTshaiziNum0.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                PTshaiziNum1.filters = _arg_1;
            }, "PTshaiziNum1.filters");
            result[17] = binding;
            return (result);
        }

        private function buySZ(_arg_1:Number):void
        {
            if (!canPlay)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[11]);
                return;
            };
            if (isAutoPlay)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[16]);
                return;
            };
            var _local_2:* = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_ALERT);
            if (_local_2)
            {
                _local_2.ALLSZNum = lastNum;
                _local_2.typeNum = _arg_1;
                _local_2.showPanel();
            };
        }

        public function ___SecretTreasureHuntPanel_Image6_click(_arg_1:MouseEvent):void
        {
            goXY(3);
        }

        public function set main(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3343801main;
            if (_local_2 !== _arg_1)
            {
                this._3343801main = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "main", _local_2, _arg_1));
            };
        }

        public function set PTshaiziNum0(_arg_1:Label):void
        {
            var _local_2:Object = this._540386746PTshaiziNum0;
            if (_local_2 !== _arg_1)
            {
                this._540386746PTshaiziNum0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "PTshaiziNum0", _local_2, _arg_1));
            };
        }

        public function set PTshaiziNum1(_arg_1:Label):void
        {
            var _local_2:Object = this._540386747PTshaiziNum1;
            if (_local_2 !== _arg_1)
            {
                this._540386747PTshaiziNum1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "PTshaiziNum1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vsFlop():ViewStack
        {
            return (this._808329852vsFlop);
        }

        private function openCloseTiShiCanvas(_arg_1:int):void
        {
            if (_arg_1 == 0)
            {
                tishiCanvas.visible = false;
                closeTiShi.visible = false;
                openTiShi.visible = true;
            }
            else
            {
                tishiCanvas.visible = true;
                closeTiShi.visible = true;
                openTiShi.visible = false;
                _core.remote.call("getFriendOnlList", null);
            };
        }

        private function _SecretTreasureHuntPanel_DataGridColumn8_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Thao tác";
            _local_1.width = 66;
            _local_1.itemRenderer = _SecretTreasureHuntPanel_ClassFactory1_c();
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get BuffIcon():Image
        {
            return (this._1458240628BuffIcon);
        }

        override public function initialize():void
        {
            var target:SecretTreasureHuntPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SecretTreasureHuntPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SecretTreasureHuntPanelWatcherSetupUtil");
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

        private function guajiFunc():void
        {
            if (!canPlay)
            {
                if (!isAutoPlay)
                {
                    _core.sysMidNote(Language.SEC_TREA_HUNT[11]);
                    return;
                };
            };
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT_AUTO);
            if (_local_1)
            {
                _local_1.showPanel();
                _local_1._AutoPlay = isAutoPlay;
            };
        }

        public function refreshSTHRank():void
        {
            refreshScoreRank();
            refreshSpeedRank();
        }

        [Bindable(event="propertyChange")]
        public function get goldJC():Button
        {
            return (this._1240338023goldJC);
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            changeView(2);
        }

        public function set bangBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324754bangBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1863324754bangBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn2", _local_2, _arg_1));
            };
        }

        public function onGoldJiechu(goldNum:Number):void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (!canPlay)
                    {
                        _core.remote.call("SecTreaHuntGoldJiechu", null);
                    };
                };
            };
            var tempStr:String = (("Dùng" + goldNum) + "Vàng để giải trừ buff?");
            Alert.show(tempStr, "", (Alert.YES | Alert.NO), null, func);
        }

        public function set openTiShi(_arg_1:Button):void
        {
            var _local_2:Object = this._1535831509openTiShi;
            if (_local_2 !== _arg_1)
            {
                this._1535831509openTiShi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openTiShi", _local_2, _arg_1));
            };
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

        public function onSetSecTreaHuntIfCheck(_arg_1:Object):void
        {
            checkNum = _arg_1;
        }

        public function set allmain(_arg_1:Canvas):void
        {
            var _local_2:Object = this._911423782allmain;
            if (_local_2 !== _arg_1)
            {
                this._911423782allmain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allmain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn2():BasicGlowButton
        {
            return (this._1863324754bangBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get PTshaiziNum0():Label
        {
            return (this._540386746PTshaiziNum0);
        }

        [Bindable(event="propertyChange")]
        public function get PTshaiziNum1():Label
        {
            return (this._540386747PTshaiziNum1);
        }

        public function set scoreRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._2128897502scoreRank;
            if (_local_2 !== _arg_1)
            {
                this._2128897502scoreRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreRank", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get main():Canvas
        {
            return (this._3343801main);
        }

        public function set XYshaiziNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1347466023XYshaiziNum;
            if (_local_2 !== _arg_1)
            {
                this._1347466023XYshaiziNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "XYshaiziNum", _local_2, _arg_1));
            };
        }

        public function set player(_arg_1:SecretTreasureHuntPlayerView):void
        {
            var _local_2:Object = this._985752863player;
            if (_local_2 !== _arg_1)
            {
                this._985752863player = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "player", _local_2, _arg_1));
            };
        }

        private function playerMpveEnd(_arg_1:Event):void
        {
            var _local_3:MovieClip;
            var _local_2:int;
            while (_local_2 < shaiziArr.length)
            {
                _local_3 = shaiziArr[_local_2];
                _local_3.visible = false;
                _local_2++;
            };
            if ((((((((npcShowArr[atNum]) && (!(atNum == 49))) && (!(atNum == 57))) && (!(atNum == 90))) && (!(atNum == 14))) && (!(atNum == 34))) && (!(atNum == 64))))
            {
                main.removeChild(npcShowArr[atNum]);
                npcShowArr[atNum] = null;
            };
            _core.remote.call("afterSTHPlayerStop", null);
        }

        public function set closeTiShi(_arg_1:Button):void
        {
            var _local_2:Object = this._2072063257closeTiShi;
            if (_local_2 !== _arg_1)
            {
                this._2072063257closeTiShi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeTiShi", _local_2, _arg_1));
            };
        }

        private function _SecretTreasureHuntPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _SecretTreasureHuntPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 210;
            BindingManager.executeBindings(this, "_SecretTreasureHuntPanel_DataGridColumn7", _SecretTreasureHuntPanel_DataGridColumn7);
            return (_local_1);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            getSecretTreasureHuntRes();
        }

        private function _SecretTreasureHuntPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = SecretTreasureHuntPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function getSecretTreasureHuntRes():void
        {
            if (load_state != 0)
            {
                _core.remote.call("getSecretTreasureHuntData", null);
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2080130000468)));
                load_state = 1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get openTiShi():Button
        {
            return (this._1535831509openTiShi);
        }

        [Bindable(event="propertyChange")]
        public function get scoreRank():DataGrid
        {
            return (this._2128897502scoreRank);
        }

        public function ___SecretTreasureHuntPanel_Button8_click(_arg_1:MouseEvent):void
        {
            buySZ(2);
        }

        private function goXY(_arg_1:Number):void
        {
            if (isAutoPlay)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[16]);
                return;
            };
            if (!canPlay)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[11]);
                return;
            };
            if (moving)
            {
                _core.sysMidNote(Language.SUMMER_GAME_PANEL[67]);
                return;
            };
            XYshaiziCanvas.visible = false;
            if (((_arg_1 > 0) && (_arg_1 <= 6)))
            {
                moving = true;
                _core.remote.call("SecretTreasureHuntGoXY", new Responder(onGoXY), _arg_1);
            };
        }

        public function ___SecretTreasureHuntPanel_Image8_click(_arg_1:MouseEvent):void
        {
            goXY(5);
        }


    }
}//package com.qeedoo.ui.view.compDragable

