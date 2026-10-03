// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WaWaGamePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ShopSlot;
    import mx.controls.Image;
    import flash.display.Loader;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.WaWaSlot;
    import mx.controls.Label;
    import mx.controls.Alert;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.IntroText;
    import flash.net.URLRequest;
    import flash.display.MovieClip;
    import mx.core.UIComponent;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.Event;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.data.GameData;
    import mx.binding.BindingManager;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
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

    public class WaWaGamePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1141924040shopSlot15:ShopSlot;
        private var _1141924010shopSlot24:ShopSlot;
        private var _105451l43:Image;
        public var loader:Loader;
        private var _1442260067pageSelectorNor:PageSelector;
        private var _2115046236shopSlot8:ShopSlot;
        private var _2115046240shopSlot4:ShopSlot;
        private var _808329852vsFlop:ViewStack;
        private var _100525950item1:WaWaSlot;
        private var _1178662790item18:WaWaSlot;
        private var _1141924043shopSlot12:ShopSlot;
        private var _1141924013shopSlot21:ShopSlot;
        private var _105388l22:Image;
        public var _WaWaGamePanel_Image1:Image;
        private var _627007096frLabel:Label;
        private var _alert:Alert;
        private var _3526425sel3:CheckBox;
        private var _1608075081bCoinBtn:DelayButton;
        private var _1141924005shopSlot29:ShopSlot;
        private var _105452l44:Image;
        private var _1178662795item13:WaWaSlot;
        private var _109211219save0:DelayButton;
        private var posY:Number = 0;
        private var _105418l31:Image;
        private var _104584967name2:Label;
        private var ITEM_COUNT_PER_PAGE:Number = 15;
        private var _100525957item8:WaWaSlot;
        private var _2115046244shopSlot0:ShopSlot;
        private var _1178662789item19:WaWaSlot;
        private var _105389l23:Image;
        private var _1141924008shopSlot26:ShopSlot;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _1141924038shopSlot17:ShopSlot;
        private var _100525951item2:WaWaSlot;
        private var _105390l24:Image;
        private var _105419l32:Image;
        private var _3526424sel2:CheckBox;
        private var addCount:Boolean = false;
        private var _105356l11:Image;
        private var _934908847record:DataGrid;
        private var count:Number = 0;
        private var _105420l33:Image;
        private var _104584968name3:Label;
        private var _100525958item9:WaWaSlot;
        private var _1178662794item14:WaWaSlot;
        private var _2115046237shopSlot7:ShopSlot;
        private var _2115046241shopSlot3:ShopSlot;
        public var _WaWaGamePanel_DataGridColumn1:DataGridColumn;
        public var _WaWaGamePanel_DataGridColumn2:DataGridColumn;
        public var _WaWaGamePanel_DataGridColumn3:DataGridColumn;
        private var _105357l12:Image;
        private var _1081154686maxNum:NumericStepper;
        private var _3526423sel1:CheckBox;
        private var _100525952item3:WaWaSlot;
        private var _105421l34:Image;
        private var _1141924042shopSlot13:ShopSlot;
        private var _1141924012shopSlot22:ShopSlot;
        public var _WaWaGamePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1089552672rfLabel:Label;
        private var _108357417reBtn:DelayButton;
        private var _1442251695pageSelectorExp:PageSelector;
        private var _105358l13:Image;
        private var _1863324753bangBtn3:BasicGlowButton;
        private var addExp:Number = 0;
        private var _106845584point:Label;
        private var _1141924045shopSlot10:ShopSlot;
        private var _3648t4:ItemSlot;
        private var _104584969name4:Label;
        public var _WaWaGamePanel_Label6:Label;
        private var _1141924037shopSlot18:ShopSlot;
        private var _1141924007shopSlot27:ShopSlot;
        private var _1178662793item15:WaWaSlot;
        private var _3647t3:ItemSlot;
        private var _105359l14:Image;
        private var _100525953item4:WaWaSlot;
        private var _1088335764bCoinMoreLab1:Label;
        private var _1178662798item10:WaWaSlot;
        private var rr:Boolean = false;
        private var _3646t2:ItemSlot;
        private var sver:Number = -110;
        private var _2115046238shopSlot6:ShopSlot;
        private var _2115046242shopSlot2:ShopSlot;
        private var _100361836intro:IntroText;
        private var _100525949item0:WaWaSlot;
        private var _3645t1:ItemSlot;
        public var urlSwf:URLRequest;
        private var _100525954item5:WaWaSlot;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _1178662792item16:WaWaSlot;
        private var _1141924041shopSlot14:ShopSlot;
        private var _1141924011shopSlot23:ShopSlot;
        private var _173654939bCoinMoreLab:Label;
        private var _1608084090bCoinLab:Label;
        private var _173663948bCoinMoreBtn:DelayButton;
        private var _1178662797item11:WaWaSlot;
        private var _2115046235shopSlot9:ShopSlot;
        private var _1141924044shopSlot11:ShopSlot;
        private var _1141924014shopSlot20:ShopSlot;
        public var yaogan:MovieClip;
        private var _3350645nImg:Image;
        private var _94839743coin0:Label;
        private var _1141924036shopSlot19:ShopSlot;
        private var _1141924006shopSlot28:ShopSlot;
        private var _403846527yaoganUi:UIComponent;
        private var ITEM_COUNT_PER_PAGE_EXP:Number = 20;
        private var _100525955item6:WaWaSlot;
        private var _1141924039shopSlot16:ShopSlot;
        private var _1141924009shopSlot25:ShopSlot;
        private var _1178662791item17:WaWaSlot;
        private var _2115046239shopSlot5:ShopSlot;
        private var _2115046243shopSlot1:ShopSlot;
        private var _105449l41:Image;
        private var ver:Number = -110;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _1178662796item12:WaWaSlot;
        private var _105450l42:Image;
        private var _1442264890pageSelectorSpe:PageSelector;
        private var _94839744coin1:Label;
        private var _3059345coin:Label;
        private var _104584966name1:Label;
        private var _3526426sel4:CheckBox;
        private var _105387l21:Image;
        private var _100525956item7:WaWaSlot;
        private var _cid:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":549,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_WaWaGamePanel_BasicTitleCanvas1"
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
                                "width":78,
                                "x":10,
                                "y":49
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
                                "width":78,
                                "x":86,
                                "y":49
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
                                "width":78,
                                "x":163,
                                "y":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn3",
                        "events":{"click":"__bangBtn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "width":146,
                                "x":240,
                                "y":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsFlop",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "69";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_WaWaGamePanel_Image1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "2";
                                                    this.bottom = "2";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2,
                                                        "y":2,
                                                        "percentWidth":100,
                                                        "percentHeight":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":30,
                                                        "y":40,
                                                        "width":90,
                                                        "height":120,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"t1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":27.5,
                                                                    "y":25,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"name1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":67,
                                                                    "width":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"sel1",
                                                            "events":{"click":"__sel1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":66.5,
                                                                    "y":94.5
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
                                                        "x":130,
                                                        "y":40,
                                                        "width":90,
                                                        "height":120,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"t2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":27.5,
                                                                    "y":25,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"name2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":67,
                                                                    "width":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"sel2",
                                                            "events":{"click":"__sel2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":66.5,
                                                                    "y":94.5
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
                                                        "x":230,
                                                        "y":40,
                                                        "width":90,
                                                        "height":120,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"t3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":27.5,
                                                                    "y":25,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"name3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":67,
                                                                    "width":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"sel3",
                                                            "events":{"click":"__sel3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":66.5,
                                                                    "y":94.5
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
                                                        "x":330,
                                                        "y":40,
                                                        "width":90,
                                                        "height":120,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"t4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":27.5,
                                                                    "y":25,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"name4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":67,
                                                                    "width":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"sel4",
                                                            "events":{"click":"__sel4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":66.5,
                                                                    "y":94.5
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
                                                        "x":492,
                                                        "y":40,
                                                        "width":90,
                                                        "height":120,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"nImg",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":90,
                                                                    "height":1080
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":23,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":46,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":70,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":93,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l21",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":123,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l22",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":146,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l23",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":170,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l24",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":193,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l31",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":223,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l32",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":246,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l33",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":270,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l34",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":293,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l41",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":323,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l42",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":346,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l43",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":370,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"l44",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":31,
                                                        "height":31,
                                                        "x":393,
                                                        "y":166
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"reBtn",
                                                "events":{"click":"__reBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":30,
                                                        "y":195,
                                                        "width":164,
                                                        "height":42,
                                                        "styleName":"changtiao"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"bCoinBtn",
                                                "events":{"click":"__bCoinBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":48,
                                                        "y":300,
                                                        "width":179,
                                                        "height":115,
                                                        "styleName":"jinbi"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"bCoinMoreBtn",
                                                "events":{"click":"__bCoinMoreBtn_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":238,
                                                        "y":300,
                                                        "width":179,
                                                        "height":115,
                                                        "styleName":"chaopiao"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"rfLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "htmlText":"",
                                                        "x":301,
                                                        "y":192,
                                                        "width":170,
                                                        "height":23
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_WaWaGamePanel_Label6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":301,
                                                        "y":213,
                                                        "width":147,
                                                        "height":23
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"yaoganUi",
                                                "events":{"click":"__yaoganUi_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":620,
                                                        "y":25,
                                                        "width":46,
                                                        "height":195
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"maxNum",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "stepSize":1,
                                                        "minimum":1,
                                                        "maximum":999999,
                                                        "x":538,
                                                        "y":320,
                                                        "width":61
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"save0",
                                                "events":{"click":"__save0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":472,
                                                        "y":362,
                                                        "clickDelay":3000,
                                                        "styleName":"wakaishi",
                                                        "width":174,
                                                        "height":92
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "events":{"click":"___WaWaGamePanel_DelayButton5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":607,
                                                        "y":313,
                                                        "clickDelay":3000,
                                                        "styleName":"wamax",
                                                        "width":35,
                                                        "height":35
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"bCoinLab",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 18;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":121,
                                                        "y":412,
                                                        "width":60,
                                                        "height":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"bCoinMoreLab",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 18;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":306,
                                                        "y":412,
                                                        "width":60,
                                                        "height":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"bCoinMoreLab1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.fontSize = 18;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":353,
                                                        "y":412,
                                                        "width":60,
                                                        "height":25
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
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "21";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "height":213,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":14,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":398,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":270,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":526,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":14,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":398,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":270,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":526,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":14,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":398,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":270,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":526,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelector,
                                                            "id":"pageSelectorSpe",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.horizontalCenter = "0";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"coin0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.fontSize = 18;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":14,
                                                                    "y":6,
                                                                    "width":132,
                                                                    "height":23
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "248";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "height":213,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":14,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":398,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":270,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot19",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":526,
                                                                    "y":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":14,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot21",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":398,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot22",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":270,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot23",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot24",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":526,
                                                                    "y":84
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot25",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":14,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot26",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":398,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot27",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":270,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot28",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":142,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot29",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":526,
                                                                    "y":133
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelector,
                                                            "id":"pageSelectorNor",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.horizontalCenter = "0";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"coin1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.fontSize = 18;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":14,
                                                                    "y":7,
                                                                    "width":132,
                                                                    "height":23
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
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":26.5,
                                                        "y":36
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":184.5,
                                                        "y":36
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":344,
                                                        "y":36
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":502,
                                                        "y":36
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":28,
                                                        "y":114
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":186,
                                                        "y":114
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":345.5,
                                                        "y":114
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":503.5,
                                                        "y":114
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":28,
                                                        "y":192
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":186,
                                                        "y":192
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":345.5,
                                                        "y":192
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":503.5,
                                                        "y":192
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":29.5,
                                                        "y":270
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":187.5,
                                                        "y":270
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":347,
                                                        "y":270
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":505,
                                                        "y":270
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item16",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":29.5,
                                                        "y":349
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item17",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":187.5,
                                                        "y":349
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":347,
                                                        "y":349
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WaWaSlot,
                                                "id":"item19",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":505,
                                                        "y":349
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelectorExp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "15";
                                                    this.horizontalCenter = "0";
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
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":IntroText,
                                                "id":"intro",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":222,
                                                        "width":258,
                                                        "height":225,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"record",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "doubleClickEnabled":true,
                                                                    "height":180,
                                                                    "y":37,
                                                                    "columns":[_WaWaGamePanel_DataGridColumn1_i(), _WaWaGamePanel_DataGridColumn2_i(), _WaWaGamePanel_DataGridColumn3_i()]
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
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"coin",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":394,
                                "y":45,
                                "width":132,
                                "height":23
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"frLabel",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":580,
                                "y":45,
                                "width":132,
                                "height":23
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"point",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontSize = 12;
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":489,
                                "y":45,
                                "width":132,
                                "height":23
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var posObj:Object = {
            "-3":-960,
            "-2":-840,
            "-1":-720,
            "0":-600,
            "1":-480,
            "2":-360,
            "3":-240,
            "4":-120
        };
        private var timer:Timer = new Timer(100);
        private var wwData:Object = new Object();
        private var wwGlobalData:Object = new Object();
        private var wawaAwardItemListSpe:ArrayCollection = new ArrayCollection();
        private var wawaAwardItemListNor:ArrayCollection = new ArrayCollection();
        private var wawaExchangeItemList:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WaWaGamePanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 549;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.x = 103;
            this.y = 102;
            this.addEventListener("creationComplete", ___WaWaGamePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WaWaGamePanel._watcherSetupUtil = _arg_1;
        }


        public function __sel4_click(_arg_1:MouseEvent):void
        {
            selectItem(4);
        }

        public function onPlayWaWaGame(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (timer.running)
                {
                    timer.stop();
                };
                if (timer.hasEventListener(TimerEvent.TIMER))
                {
                    timer.removeEventListener(TimerEvent.TIMER, moveWaWaNum);
                };
                nImg.y = posY;
                posY = posObj[_arg_1["sc"]];
                wwData[("d" + _arg_1.i)]["n"] = _arg_1.n;
                setCoinNum(_arg_1.coin);
                addExp = ToolKit.minus(_arg_1.exp, _arg_1.oExp);
                wwData.exp = _arg_1.exp;
                startGo();
                _core.sysBlueMsg(Language.WAWA_GAME_PANEL[37].replace("{num}", _arg_1["costTime"]));
            };
        }

        private function initComp():void
        {
            if (!yaogan)
            {
                loader = new Loader();
                urlSwf = new URLRequest(ResManager.getResUrl(2080130102008));
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onInitComp);
                loader.load(urlSwf);
            };
        }

        private function setExchangeSlot():void
        {
            var _local_2:Number;
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE_EXP)
            {
                _local_2 = _local_1;
                if (_local_1 < wawaAwardItemListNor.length)
                {
                    this[("item" + _local_2)].slotData = wawaAwardItemListNor[_local_1].slotData;
                    this[("item" + _local_2)].type = wawaAwardItemListNor[_local_1].type;
                    this[("item" + _local_2)].giid = wawaAwardItemListNor[_local_1].itemId;
                    this[("item" + _local_2)].stackNum = 1;
                    this[("item" + _local_2)].useNum = wawaAwardItemListNor[_local_1].useNum;
                    this[("item" + _local_2)].visible = true;
                };
                _local_1++;
            };
        }

        public function onResetWaWaGameItem(_arg_1:Object):void
        {
            if (((initialized) && (_arg_1)))
            {
                wwData = _arg_1;
                initWaWaAwardItem(wwData);
                setCoinNum(wwData.coin);
                setPointNum(wwData.exp);
                rfLabel.htmlText = Language.WAWA_GAME_PANEL[1].replace("{num}", wwData.fr);
                frLabel.text = Language.WAWA_GAME_PANEL[33].replace("{num}", wwData.fr);
            };
        }

        [Bindable(event="propertyChange")]
        public function get record():DataGrid
        {
            return (this._934908847record);
        }

        public function onGetWaWaAward(_arg_1:Object):void
        {
            if (((initialized) && (_arg_1)))
            {
                if (_arg_1["t"])
                {
                    wwData["l"][_arg_1.index] = new Object();
                    wwData["l"][_arg_1.index] = _arg_1.d;
                    initRecord();
                }
                else
                {
                    wwData.exp = _arg_1["exp"];
                    setPointNum(wwData.exp);
                    _core.sysBlueMsg(Language.WAWA_GAME_PANEL[12].replace("{num}", wwGlobalData.lpt));
                };
                wwData[("d" + _arg_1.index1)]["l"] = _arg_1["l"];
            };
        }

        [Bindable(event="propertyChange")]
        public function get bCoinMoreLab():Label
        {
            return (this._173654939bCoinMoreLab);
        }

        private function resetWaWaGameItem():void
        {
            var handler:Function;
            if (count != 0)
            {
                _core.sysMsg(Language.WAWA_GAME_PANEL[38]);
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("resetWaWaGameItem", null);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.WAWA_GAME_PANEL[25].replace("{point}", wwGlobalData.rpt);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        [Bindable(event="propertyChange")]
        public function get pageSelectorNor():PageSelector
        {
            return (this._1442260067pageSelectorNor);
        }

        public function onInitPlayerWaWaData(_arg_1:Object):void
        {
            var _local_2:Number;
            if (_arg_1)
            {
                if (_cid != _core.player.id)
                {
                    if (timer.running)
                    {
                        timer.stop();
                    };
                    if (timer.hasEventListener(TimerEvent.TIMER))
                    {
                        timer.removeEventListener(TimerEvent.TIMER, moveWaWaNum);
                    };
                    nImg.y = -960;
                    count = 0;
                    posY = 0;
                    _cid = _core.player.id;
                    ver = -110;
                    sver = -110;
                    _core.remote.call("initPlayerWaWaData", new Responder(onInitPlayerWaWaData), ver, sver);
                    return;
                };
                if (_arg_1["rr"] == 2)
                {
                    rr = true;
                };
                if (_arg_1["idata"])
                {
                    wwGlobalData = _arg_1["idata"];
                    reBtn.label = Language.WAWA_GAME_PANEL[23].replace("{point}", wwGlobalData.rpt);
                    bCoinLab.htmlText = (("<font color ='#00FF00'>" + wwGlobalData.bpt) + "</font>");
                    bCoinMoreLab.htmlText = (("<font color ='#00FF00'>" + wwGlobalData.bptAll) + "</font>");
                    bCoinMoreLab1.htmlText = (("<font color ='#00FF00'>" + wwGlobalData.bptAllNum) + "</font>");
                    ver = wwGlobalData.ver;
                    sver = wwGlobalData.sver;
                    wawaAwardItemListSpe.removeAll();
                    wawaAwardItemListSpe = addDataToList(2);
                    setWaWaAwardSlotSpe();
                    pageSelectorSpe.onPageChanged = onPageChangedSpe;
                    pageSelectorSpe.onPageCleared = clearPageSpe;
                    pageSelectorSpe.initPageSeletor(wawaAwardItemListSpe.length, ITEM_COUNT_PER_PAGE);
                    wawaAwardItemListNor.removeAll();
                    wawaAwardItemListNor = addDataToList(1);
                    setWaWaAwardSlotNor();
                    pageSelectorNor.onPageChanged = onPageChangedNor;
                    pageSelectorNor.onPageCleared = clearPageNor;
                    pageSelectorNor.initPageSeletor(wawaAwardItemListNor.length, ITEM_COUNT_PER_PAGE);
                    _local_2 = 10;
                    intro.htmlText = Language.WAWA_GAME_PANEL[29].replace("{ps}", wwGlobalData.apt).replace("{pe}", wwGlobalData.apt0).replace("{pend}", wwGlobalData.lpt).replace("{pe1}", wwGlobalData.apt2).replace("{ps1}", wwGlobalData.apt1).replace("{exp}", _local_2).replace("{rpt}", wwGlobalData.rpt).replace("{btime}", TimeUtil.dateTimeToString(new Date(wwGlobalData.start))).replace("{etime}", TimeUtil.dateTimeToString(new Date(wwGlobalData.end))).replace("{ctime}", TimeUtil.dateTimeToString(new Date(wwGlobalData.close)));
                };
                if (_arg_1["data"])
                {
                    wwData = _arg_1["data"];
                    initWaWaAwardItem(wwData);
                    setCoinNum(wwData.coin);
                    setPointNum(wwData.exp);
                    rfLabel.htmlText = Language.WAWA_GAME_PANEL[1].replace("{num}", wwData.fr);
                    frLabel.text = Language.WAWA_GAME_PANEL[33].replace("{num}", wwData.fr);
                    initRecord();
                    getWaWaAward();
                };
                _core.remote.call("getLimitData", null);
            };
        }

        [Bindable(event="propertyChange")]
        public function get item12():WaWaSlot
        {
            return (this._1178662796item12);
        }

        [Bindable(event="propertyChange")]
        public function get item13():WaWaSlot
        {
            return (this._1178662795item13);
        }

        [Bindable(event="propertyChange")]
        public function get item16():WaWaSlot
        {
            return (this._1178662792item16);
        }

        [Bindable(event="propertyChange")]
        public function get item10():WaWaSlot
        {
            return (this._1178662798item10);
        }

        private function setCoinNum(_arg_1:Number):void
        {
            wwData.coin = Math.floor(_arg_1);
            coin.text = Language.WAWA_GAME_PANEL[10].replace("{num}", _arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get bCoinMoreLab1():Label
        {
            return (this._1088335764bCoinMoreLab1);
        }

        [Bindable(event="propertyChange")]
        public function get nImg():Image
        {
            return (this._3350645nImg);
        }

        [Bindable(event="propertyChange")]
        public function get item14():WaWaSlot
        {
            return (this._1178662794item14);
        }

        [Bindable(event="propertyChange")]
        public function get item18():WaWaSlot
        {
            return (this._1178662790item18);
        }

        [Bindable(event="propertyChange")]
        public function get item19():WaWaSlot
        {
            return (this._1178662789item19);
        }

        public function set t2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3646t2;
            if (_local_2 !== _arg_1)
            {
                this._3646t2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t2", _local_2, _arg_1));
            };
        }

        public function set t4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3648t4;
            if (_local_2 !== _arg_1)
            {
                this._3648t4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t4", _local_2, _arg_1));
            };
        }

        public function set t1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3645t1;
            if (_local_2 !== _arg_1)
            {
                this._3645t1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item11():WaWaSlot
        {
            return (this._1178662797item11);
        }

        [Bindable(event="propertyChange")]
        public function get item15():WaWaSlot
        {
            return (this._1178662793item15);
        }

        [Bindable(event="propertyChange")]
        public function get item17():WaWaSlot
        {
            return (this._1178662791item17);
        }

        public function set t3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3647t3;
            if (_local_2 !== _arg_1)
            {
                this._3647t3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot0():ShopSlot
        {
            return (this._2115046244shopSlot0);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot1():ShopSlot
        {
            return (this._2115046243shopSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot2():ShopSlot
        {
            return (this._2115046242shopSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot3():ShopSlot
        {
            return (this._2115046241shopSlot3);
        }

        public function set record(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._934908847record;
            if (_local_2 !== _arg_1)
            {
                this._934908847record = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "record", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot7():ShopSlot
        {
            return (this._2115046237shopSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot8():ShopSlot
        {
            return (this._2115046236shopSlot8);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot9():ShopSlot
        {
            return (this._2115046235shopSlot9);
        }

        public function onUpdateWaWaData(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Object, _arg_7:Number):void
        {
            var _local_8:*;
            if (((initialized) && (_arg_1)))
            {
                wwData.exp = _arg_4;
                setPointNum(wwData.exp);
                if (_arg_6["t"])
                {
                    wwData["l"][_arg_5] = new Object();
                    wwData["l"][_arg_5] = _arg_6;
                    initRecord();
                };
                wwData.fr = _arg_7;
                rfLabel.htmlText = Language.WAWA_GAME_PANEL[1].replace("{num}", wwData.fr);
                frLabel.text = Language.WAWA_GAME_PANEL[33].replace("{num}", wwData.fr);
                if (_arg_1 == 3)
                {
                    for (_local_8 in wawaExchangeItemList)
                    {
                        if (wawaExchangeItemList[_local_8].giid == _arg_2)
                        {
                            wawaExchangeItemList[_local_8].useNum = _arg_3;
                            _core.sysBlueMsg(Language.WAWA_GAME_PANEL[24].replace("{num}", wawaExchangeItemList[_local_8].slotData["pNum1"]));
                            pageSelectorExp.refreshPage();
                            break;
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot5():ShopSlot
        {
            return (this._2115046239shopSlot5);
        }

        private function playWaWaGame(_arg_1:Number):void
        {
            var _local_2:Number;
            var _local_3:Number;
            if (count == 0)
            {
                _local_2 = getSelectItemIndex();
                _local_3 = 1;
                if (_local_2 < 1)
                {
                    _core.sysMsg(Language.WAWA_GAME_PANEL[34]);
                    return;
                };
                if (_arg_1 != 1)
                {
                    _local_3 = Math.floor(maxNum.value);
                };
                if (((wwData) && (ToolKit.isBigOrEqual(wwData[("d" + _local_2)]["n"], 4))))
                {
                    _core.sysMsg(Language.WAWA_GAME_PANEL[35]);
                    return;
                };
                if (((checkData()) && (ToolKit.isBigThan(getCoinNum(), 0))))
                {
                    if (_local_3 > getCoinNum())
                    {
                        _core.sysMsg(Language.WAWA_GAME_PANEL[36]);
                        return;
                    };
                    _core.remote.call("playWaWaGame", new Responder(onPlayWaWaGame), _local_2, _local_3);
                    if (yaogan)
                    {
                        yaogan.gotoAndStop(0);
                        yaogan.play();
                    };
                }
                else
                {
                    _core.sysMsg(Language.WAWA_GAME_PANEL[36]);
                    return;
                };
            }
            else
            {
                if (((count > 10) && (count < 85)))
                {
                    count = (92 + Math.floor((Math.random() * 6)));
                    if (yaogan)
                    {
                        yaogan.gotoAndStop(0);
                        yaogan.play();
                    };
                }
                else
                {
                    _core.sysMsg(Language.WAWA_GAME_PANEL[27]);
                };
            };
        }

        public function set save0(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._109211219save0;
            if (_local_2 !== _arg_1)
            {
                this._109211219save0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "save0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot4():ShopSlot
        {
            return (this._2115046240shopSlot4);
        }

        private function setWaWaAwardSlotNor():void
        {
            var _local_2:Number;
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                if (_local_1 < wawaAwardItemListNor.length)
                {
                    _local_2 = (_local_1 + 15);
                    this[("shopSlot" + _local_2)].slotData = wawaAwardItemListNor[_local_1].slotData;
                    this[("shopSlot" + _local_2)].type = wawaAwardItemListNor[_local_1].type;
                    this[("shopSlot" + _local_2)].giid = wawaAwardItemListNor[_local_1].itemId;
                    this[("shopSlot" + _local_2)].stackNum = 1;
                    this[("shopSlot" + _local_2)].visible = true;
                };
                _local_1++;
            };
        }

        public function __sel3_click(_arg_1:MouseEvent):void
        {
            selectItem(3);
        }

        public function __save0_click(_arg_1:MouseEvent):void
        {
            playWaWaGame(2);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot6():ShopSlot
        {
            return (this._2115046238shopSlot6);
        }

        public function set pageSelectorNor(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1442260067pageSelectorNor;
            if (_local_2 !== _arg_1)
            {
                this._1442260067pageSelectorNor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelectorNor", _local_2, _arg_1));
            };
        }

        public function set bCoinMoreLab(_arg_1:Label):void
        {
            var _local_2:Object = this._173654939bCoinMoreLab;
            if (_local_2 !== _arg_1)
            {
                this._173654939bCoinMoreLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bCoinMoreLab", _local_2, _arg_1));
            };
        }

        private function checkData():Boolean
        {
            if (wwData.v)
            {
                return (true);
            };
            return (false);
        }

        public function getWaWaAward():void
        {
            var _local_1:* = 1;
            while (_local_1 <= 4)
            {
                if (((((wwData[("d" + _local_1)]) && (wwData[("d" + _local_1)].n)) && (ToolKit.isBigOrEqual(wwData[("d" + _local_1)].n, 4))) && (ToolKit.isBigOrEqual(wwData[("d" + _local_1)].l, 1))))
                {
                    noticeAwardAlert(_local_1);
                    return;
                };
                _local_1++;
            };
        }

        public function __bangBtn3_click(_arg_1:MouseEvent):void
        {
            changeView(3);
        }

        public function set bCoinMoreLab1(_arg_1:Label):void
        {
            var _local_2:Object = this._1088335764bCoinMoreLab1;
            if (_local_2 !== _arg_1)
            {
                this._1088335764bCoinMoreLab1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bCoinMoreLab1", _local_2, _arg_1));
            };
        }

        public function set item12(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662796item12;
            if (_local_2 !== _arg_1)
            {
                this._1178662796item12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item12", _local_2, _arg_1));
            };
        }

        private function startGo():void
        {
            if (timer.running)
            {
                timer.stop();
            };
            if (timer.hasEventListener(TimerEvent.TIMER))
            {
                timer.removeEventListener(TimerEvent.TIMER, moveWaWaNum);
            };
            count = 0;
            timer.addEventListener(TimerEvent.TIMER, moveWaWaNum);
            timer.start();
        }

        public function set item10(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662798item10;
            if (_local_2 !== _arg_1)
            {
                this._1178662798item10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item10", _local_2, _arg_1));
            };
        }

        public function set intro(_arg_1:IntroText):void
        {
            var _local_2:Object = this._100361836intro;
            if (_local_2 !== _arg_1)
            {
                this._100361836intro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "intro", _local_2, _arg_1));
            };
        }

        public function set item13(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662795item13;
            if (_local_2 !== _arg_1)
            {
                this._1178662795item13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item13", _local_2, _arg_1));
            };
        }

        public function __bCoinBtn_click(_arg_1:MouseEvent):void
        {
            buyWaWaGameCoin(false);
        }

        public function set item14(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662794item14;
            if (_local_2 !== _arg_1)
            {
                this._1178662794item14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item14", _local_2, _arg_1));
            };
        }

        public function set bCoinLab(_arg_1:Label):void
        {
            var _local_2:Object = this._1608084090bCoinLab;
            if (_local_2 !== _arg_1)
            {
                this._1608084090bCoinLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bCoinLab", _local_2, _arg_1));
            };
        }

        public function set item11(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662797item11;
            if (_local_2 !== _arg_1)
            {
                this._1178662797item11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item11", _local_2, _arg_1));
            };
        }

        public function set item19(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662789item19;
            if (_local_2 !== _arg_1)
            {
                this._1178662789item19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item19", _local_2, _arg_1));
            };
        }

        public function set item16(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662792item16;
            if (_local_2 !== _arg_1)
            {
                this._1178662792item16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item16", _local_2, _arg_1));
            };
        }

        public function set item17(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662791item17;
            if (_local_2 !== _arg_1)
            {
                this._1178662791item17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item17", _local_2, _arg_1));
            };
        }

        public function set item18(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662790item18;
            if (_local_2 !== _arg_1)
            {
                this._1178662790item18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item18", _local_2, _arg_1));
            };
        }

        public function set item15(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._1178662793item15;
            if (_local_2 !== _arg_1)
            {
                this._1178662793item15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item15", _local_2, _arg_1));
            };
        }

        public function set nImg(_arg_1:Image):void
        {
            var _local_2:Object = this._3350645nImg;
            if (_local_2 !== _arg_1)
            {
                this._3350645nImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nImg", _local_2, _arg_1));
            };
        }

        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function set yaoganUi(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._403846527yaoganUi;
            if (_local_2 !== _arg_1)
            {
                this._403846527yaoganUi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yaoganUi", _local_2, _arg_1));
            };
        }

        public function __reBtn_click(_arg_1:MouseEvent):void
        {
            resetWaWaGameItem();
        }

        public function set coin(_arg_1:Label):void
        {
            var _local_2:Object = this._3059345coin;
            if (_local_2 !== _arg_1)
            {
                this._3059345coin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "coin", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rfLabel():Label
        {
            return (this._1089552672rfLabel);
        }

        public function set shopSlot0(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046244shopSlot0;
            if (_local_2 !== _arg_1)
            {
                this._2115046244shopSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot0", _local_2, _arg_1));
            };
        }

        public function set shopSlot1(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046243shopSlot1;
            if (_local_2 !== _arg_1)
            {
                this._2115046243shopSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bCoinMoreBtn():DelayButton
        {
            return (this._173663948bCoinMoreBtn);
        }

        public function set shopSlot2(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046242shopSlot2;
            if (_local_2 !== _arg_1)
            {
                this._2115046242shopSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot2", _local_2, _arg_1));
            };
        }

        public function set shopSlot3(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046241shopSlot3;
            if (_local_2 !== _arg_1)
            {
                this._2115046241shopSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot3", _local_2, _arg_1));
            };
        }

        public function set shopSlot6(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046238shopSlot6;
            if (_local_2 !== _arg_1)
            {
                this._2115046238shopSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot6", _local_2, _arg_1));
            };
        }

        public function set shopSlot7(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046237shopSlot7;
            if (_local_2 !== _arg_1)
            {
                this._2115046237shopSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot7", _local_2, _arg_1));
            };
        }

        public function set shopSlot4(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046240shopSlot4;
            if (_local_2 !== _arg_1)
            {
                this._2115046240shopSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot4", _local_2, _arg_1));
            };
        }

        public function set shopSlot8(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046236shopSlot8;
            if (_local_2 !== _arg_1)
            {
                this._2115046236shopSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot8", _local_2, _arg_1));
            };
        }

        public function set shopSlot5(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046239shopSlot5;
            if (_local_2 !== _arg_1)
            {
                this._2115046239shopSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot5", _local_2, _arg_1));
            };
        }

        public function set shopSlot9(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046235shopSlot9;
            if (_local_2 !== _arg_1)
            {
                this._2115046235shopSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot9", _local_2, _arg_1));
            };
        }

        public function getPointNum():Number
        {
            return (wwData.exp);
        }

        public function initRecord():void
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:Date;
            var _local_1:ArrayCollection = new ArrayCollection();
            for (_local_2 in wwData["l"])
            {
                _local_3 = {};
                _local_3["type"] = ((Number(wwData["l"][_local_2]["tt"]) == 1) ? "获得" : "兑换");
                _local_3["name"] = GameData.d[29][wwData["l"][_local_2]["i"]].name;
                _local_4 = new Date(wwData["l"][_local_2]["t"]);
                _local_3["t"] = Number(wwData["l"][_local_2]["t"]);
                _local_3["time"] = TimeUtil.dateTimeToString(_local_4);
                _local_1.addItem(_local_3);
            };
            _local_1 = sortAc(_local_1, 1);
            record.dataProvider = _local_1;
        }

        private function addDataToList(_arg_1:Number):ArrayCollection
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_2:ArrayCollection = new ArrayCollection();
            var _local_3:Object = ((wwGlobalData["info"]) ? wwGlobalData["info"] : null);
            for each (_local_4 in _local_3)
            {
                if (!((_local_4 == null) || (!(_local_4.inc == _arg_1))))
                {
                    _local_5 = new Object();
                    _local_5.type = _local_4.tid;
                    _local_5.giid = _local_4.iid;
                    _local_5.slotData = new Object();
                    _local_6 = GameData.d[_local_5.type][_local_5.giid];
                    _local_5.slotData["itemId"] = _local_6.id;
                    _local_5.slotData["itemName"] = _local_6.name;
                    _local_5.slotData["itemColor"] = _local_6.color;
                    _local_5.slotData["type"] = _local_4.tid;
                    _local_2.addItem(_local_5);
                };
            };
            return (_local_2);
        }

        public function __sel2_click(_arg_1:MouseEvent):void
        {
            selectItem(2);
        }

        [Bindable(event="propertyChange")]
        public function get vsFlop():ViewStack
        {
            return (this._808329852vsFlop);
        }

        private function clearPageSpe():void
        {
            var _local_2:Number;
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                _local_2 = _local_1;
                this[("shopSlot" + _local_2)].st = -1;
                this[("shopSlot" + _local_2)].visible = false;
                _local_1++;
            };
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            changeView(2);
        }

        [Bindable(event="propertyChange")]
        public function get point():Label
        {
            return (this._106845584point);
        }

        private function getColor(_arg_1:Number):String
        {
            var _local_3:*;
            var _local_2:Object = ((wwGlobalData["info"]) ? wwGlobalData["info"] : {});
            for (_local_3 in _local_2)
            {
                if (((ToolKit.isEqual(_local_2[_local_3].iid, _arg_1)) && (ToolKit.isSmallThan(_local_2[_local_3].inc, 3))))
                {
                    return ((ToolKit.isEqual(_local_2[_local_3].inc, 1)) ? "#00FF00" : "#FA5B05");
                };
            };
            return ("#00FF00");
        }

        private function getSelectItemIndex():*
        {
            var _local_1:int = 1;
            while (_local_1 < 5)
            {
                if (this[("sel" + _local_1)].selected)
                {
                    return (_local_1);
                };
                _local_1++;
            };
            return (0);
        }

        private function addDataToExpList(_arg_1:Object):ArrayCollection
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_2:ArrayCollection = new ArrayCollection();
            var _local_3:Object = ((wwGlobalData["info"]) ? wwGlobalData["info"] : null);
            for each (_local_4 in _local_3)
            {
                if (!((_local_4 == null) || (!(_local_4.inc == 3))))
                {
                    _local_5 = new Object();
                    _local_5.type = _local_4.tid;
                    _local_5.giid = _local_4.iid;
                    _local_5.slotData = new Object();
                    _local_6 = GameData.d[_local_5.type][_local_5.giid];
                    _local_5.slotData["itemId"] = _local_6.id;
                    _local_5.slotData["itemName"] = _local_6.name;
                    _local_5.slotData["itemColor"] = _local_6.color;
                    _local_5.slotData["type"] = _local_4.tid;
                    _local_5.slotData["pNum1"] = _local_4.pt;
                    _local_5.slotData["amount"] = _local_4.saleAll;
                    _local_5.useNum = ((_arg_1[_local_6.id]) ? _arg_1[_local_6.id] : 0);
                    _local_2.addItem(_local_5);
                };
            };
            return (_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get frLabel():Label
        {
            return (this._627007096frLabel);
        }

        public function noticeAwardAlert(index:Number):void
        {
            var itemIndex:Number;
            var handler:Function;
            var yes:String;
            var no:String;
            itemIndex = index;
            yes = Alert.yesLabel;
            no = Alert.noLabel;
            Alert.yesLabel = Language.WAWA_GAME_PANEL[31];
            Alert.noLabel = Language.WAWA_GAME_PANEL[32];
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("getWaWaAward", new Responder(onGetWaWaAward), itemIndex, true);
                }
                else
                {
                    if (_arg_1.detail == Alert.NO)
                    {
                        _core.remote.call("getWaWaAward", new Responder(onGetWaWaAward), itemIndex, false);
                    };
                };
                Alert.yesLabel = yes;
                Alert.noLabel = no;
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.WAWA_GAME_PANEL[30].replace("{point}", wwGlobalData.bptAll).replace("{num}", wwGlobalData.bptAllNum);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        private function _WaWaGamePanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WaWaGamePanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "time";
            _local_1.width = 200;
            BindingManager.executeBindings(this, "_WaWaGamePanel_DataGridColumn3", _WaWaGamePanel_DataGridColumn3);
            return (_local_1);
        }

        private function clearPageExp():void
        {
            var _local_2:Number;
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE_EXP)
            {
                _local_2 = _local_1;
                this[("item" + _local_2)].visible = false;
                _local_1++;
            };
        }

        private function onPageChangedSpe(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_5:Number;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                if (_local_3 < wawaAwardItemListSpe.length)
                {
                    _local_5 = _local_4;
                    this[("shopSlot" + _local_5)].type = wawaAwardItemListSpe[_local_3].type;
                    this[("shopSlot" + _local_5)].slotData = wawaAwardItemListSpe[_local_4].slotData;
                    this[("shopSlot" + _local_5)].stackNum = 1;
                    this[("shopSlot" + _local_5)].giid = wawaAwardItemListSpe[_local_3].giid;
                    this[("shopSlot" + _local_5)].visible = true;
                };
                _local_4++;
            };
        }

        public function set name2(_arg_1:Label):void
        {
            var _local_2:Object = this._104584967name2;
            if (_local_2 !== _arg_1)
            {
                this._104584967name2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name2", _local_2, _arg_1));
            };
        }

        public function set name4(_arg_1:Label):void
        {
            var _local_2:Object = this._104584969name4;
            if (_local_2 !== _arg_1)
            {
                this._104584969name4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name4", _local_2, _arg_1));
            };
        }

        public function set name3(_arg_1:Label):void
        {
            var _local_2:Object = this._104584968name3;
            if (_local_2 !== _arg_1)
            {
                this._104584968name3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name3", _local_2, _arg_1));
            };
        }

        public function set name1(_arg_1:Label):void
        {
            var _local_2:Object = this._104584966name1;
            if (_local_2 !== _arg_1)
            {
                this._104584966name1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name1", _local_2, _arg_1));
            };
        }

        public function __yaoganUi_click(_arg_1:MouseEvent):void
        {
            playWaWaGame(1);
        }

        private function selectItem(_arg_1:Number):*
        {
            var _local_2:int = 1;
            while (_local_2 < 5)
            {
                this[("sel" + _local_2)].selected = false;
                _local_2++;
            };
            this[("sel" + _arg_1)].selected = true;
        }

        public function set sel2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3526424sel2;
            if (_local_2 !== _arg_1)
            {
                this._3526424sel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sel2", _local_2, _arg_1));
            };
        }

        public function set sel3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3526425sel3;
            if (_local_2 !== _arg_1)
            {
                this._3526425sel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sel3", _local_2, _arg_1));
            };
        }

        public function set sel4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3526426sel4;
            if (_local_2 !== _arg_1)
            {
                this._3526426sel4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sel4", _local_2, _arg_1));
            };
        }

        private function _WaWaGamePanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WaWaGamePanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_WaWaGamePanel_DataGridColumn2", _WaWaGamePanel_DataGridColumn2);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get t2():ItemSlot
        {
            return (this._3646t2);
        }

        [Bindable(event="propertyChange")]
        public function get t3():ItemSlot
        {
            return (this._3647t3);
        }

        [Bindable(event="propertyChange")]
        public function get t1():ItemSlot
        {
            return (this._3645t1);
        }

        public function set sel1(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3526423sel1;
            if (_local_2 !== _arg_1)
            {
                this._3526423sel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sel1", _local_2, _arg_1));
            };
        }

        public function __sel1_click(_arg_1:MouseEvent):void
        {
            selectItem(1);
        }

        public function set rfLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1089552672rfLabel;
            if (_local_2 !== _arg_1)
            {
                this._1089552672rfLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rfLabel", _local_2, _arg_1));
            };
        }

        public function set reBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._108357417reBtn;
            if (_local_2 !== _arg_1)
            {
                this._108357417reBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get save0():DelayButton
        {
            return (this._109211219save0);
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        private function setPointNum(_arg_1:Number):void
        {
            wwData.exp = Math.floor(_arg_1);
            point.text = Language.WAWA_GAME_PANEL[11].replace("{num}", _arg_1);
        }

        public function set shopSlot10(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924045shopSlot10;
            if (_local_2 !== _arg_1)
            {
                this._1141924045shopSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot10", _local_2, _arg_1));
            };
        }

        public function set bCoinMoreBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._173663948bCoinMoreBtn;
            if (_local_2 !== _arg_1)
            {
                this._173663948bCoinMoreBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bCoinMoreBtn", _local_2, _arg_1));
            };
        }

        public function set shopSlot12(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924043shopSlot12;
            if (_local_2 !== _arg_1)
            {
                this._1141924043shopSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot12", _local_2, _arg_1));
            };
        }

        public function set shopSlot14(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924041shopSlot14;
            if (_local_2 !== _arg_1)
            {
                this._1141924041shopSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot14", _local_2, _arg_1));
            };
        }

        private function sortAc(_arg_1:ArrayCollection, _arg_2:int):ArrayCollection
        {
            var _local_3:Sort = new Sort();
            switch (_arg_2)
            {
                case 1:
                    _local_3.fields = [new SortField("t", true, true)];
                    break;
            };
            _arg_1.sort = _local_3;
            _arg_1.refresh();
            return (_arg_1);
        }

        public function set shopSlot15(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924040shopSlot15;
            if (_local_2 !== _arg_1)
            {
                this._1141924040shopSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot15", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get intro():IntroText
        {
            return (this._100361836intro);
        }

        public function set pageSelectorSpe(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1442264890pageSelectorSpe;
            if (_local_2 !== _arg_1)
            {
                this._1442264890pageSelectorSpe = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelectorSpe", _local_2, _arg_1));
            };
        }

        private function changeView(_arg_1:Number):void
        {
            vsFlop.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 4)
            {
                this[("bangBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
        }

        public function set shopSlot18(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924037shopSlot18;
            if (_local_2 !== _arg_1)
            {
                this._1141924037shopSlot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot18", _local_2, _arg_1));
            };
        }

        private function onPageChangedExp(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_5:Number;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                _local_5 = _local_4;
                if (_local_3 < wawaExchangeItemList.length)
                {
                    this[("item" + _local_5)].type = wawaExchangeItemList[_local_3].type;
                    this[("item" + _local_5)].slotData = wawaExchangeItemList[_local_4].slotData;
                    this[("item" + _local_5)].stackNum = 1;
                    this[("item" + _local_5)].giid = wawaExchangeItemList[_local_3].giid;
                    this[("item" + _local_5)].useNum = wawaExchangeItemList[_local_3].useNum;
                    this[("item" + _local_5)].setLimit();
                    this[("item" + _local_5)].visible = true;
                };
                _local_4++;
            };
        }

        public function set shopSlot19(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924036shopSlot19;
            if (_local_2 !== _arg_1)
            {
                this._1141924036shopSlot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot19", _local_2, _arg_1));
            };
        }

        public function set shopSlot16(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924039shopSlot16;
            if (_local_2 !== _arg_1)
            {
                this._1141924039shopSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot16", _local_2, _arg_1));
            };
        }

        public function set shopSlot13(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924042shopSlot13;
            if (_local_2 !== _arg_1)
            {
                this._1141924042shopSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot13", _local_2, _arg_1));
            };
        }

        private function _WaWaGamePanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WaWaGamePanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "type";
            _local_1.width = 65;
            BindingManager.executeBindings(this, "_WaWaGamePanel_DataGridColumn1", _WaWaGamePanel_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get bCoinLab():Label
        {
            return (this._1608084090bCoinLab);
        }

        public function set shopSlot17(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924038shopSlot17;
            if (_local_2 !== _arg_1)
            {
                this._1141924038shopSlot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot17", _local_2, _arg_1));
            };
        }

        private function setMaxNum():void
        {
            if (getCoinNum() <= 0)
            {
                return;
            };
            maxNum.value = getCoinNum();
        }

        [Bindable(event="propertyChange")]
        public function get t4():ItemSlot
        {
            return (this._3648t4);
        }

        [Bindable(event="propertyChange")]
        public function get yaoganUi():UIComponent
        {
            return (this._403846527yaoganUi);
        }

        private function _WaWaGamePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WaWaGamePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_WaWaGamePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn3.label = _arg_1;
            }, "bangBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000500));
            }, function (_arg_1:Object):void
            {
                _WaWaGamePanel_Image1.source = _arg_1;
            }, "_WaWaGamePanel_Image1.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000497));
            }, function (_arg_1:Object):void
            {
                nImg.source = _arg_1;
            }, "nImg.source");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WaWaGamePanel_Label6.text = _arg_1;
            }, "_WaWaGamePanel_Label6.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                coin0.htmlText = _arg_1;
            }, "coin0.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                coin1.htmlText = _arg_1;
            }, "coin1.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WaWaGamePanel_DataGridColumn1.headerText = _arg_1;
            }, "_WaWaGamePanel_DataGridColumn1.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WaWaGamePanel_DataGridColumn2.headerText = _arg_1;
            }, "_WaWaGamePanel_DataGridColumn2.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WaWaGamePanel_DataGridColumn3.headerText = _arg_1;
            }, "_WaWaGamePanel_DataGridColumn3.headerText");
            result[12] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get coin():Label
        {
            return (this._3059345coin);
        }

        public function set bCoinBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1608075081bCoinBtn;
            if (_local_2 !== _arg_1)
            {
                this._1608075081bCoinBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bCoinBtn", _local_2, _arg_1));
            };
        }

        public function set shopSlot11(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924044shopSlot11;
            if (_local_2 !== _arg_1)
            {
                this._1141924044shopSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot11", _local_2, _arg_1));
            };
        }

        private function moveWaWaNum(_arg_1:Event):*
        {
            count++;
            if (ToolKit.isBigOrEqual(nImg.y, 0))
            {
                nImg.y = -960;
            };
            if (count <= 6)
            {
                nImg.y = ToolKit.add(nImg.y, 20);
            }
            else
            {
                if (count <= 10)
                {
                    nImg.y = ToolKit.add(nImg.y, 40);
                }
                else
                {
                    if (count <= 26)
                    {
                        nImg.y = ToolKit.add(nImg.y, 60);
                    }
                    else
                    {
                        if (count <= 50)
                        {
                            nImg.y = ToolKit.add(nImg.y, 80);
                        }
                        else
                        {
                            if (count <= 66)
                            {
                                nImg.y = ToolKit.add(nImg.y, 120);
                            }
                            else
                            {
                                if (count <= 80)
                                {
                                    nImg.y = ToolKit.add(nImg.y, 60);
                                }
                                else
                                {
                                    if (count <= 86)
                                    {
                                        nImg.y = ToolKit.add(nImg.y, 40);
                                    }
                                    else
                                    {
                                        if (count <= 92)
                                        {
                                            nImg.y = ToolKit.add(nImg.y, 20);
                                        }
                                        else
                                        {
                                            nImg.y = ToolKit.add(nImg.y, 20);
                                            if (ToolKit.isEqual(nImg.y, posY))
                                            {
                                                nImg.y = posY;
                                                timer.removeEventListener(TimerEvent.TIMER, moveWaWaNum);
                                                timer.stop();
                                                initWaWaAwardItem(wwData);
                                                if (!((!(addExp)) || (addExp == 0)))
                                                {
                                                    _core.sysBlueMsg(Language.WAWA_GAME_PANEL[12].replace("{num}", addExp));
                                                };
                                                setPointNum(wwData.exp);
                                                count = 0;
                                                getWaWaAward();
                                            }
                                            else
                                            {
                                                if (((ToolKit.isEqual(posY, -960)) && (ToolKit.isEqual(nImg.y, 0))))
                                                {
                                                    nImg.y = posY;
                                                    timer.removeEventListener(TimerEvent.TIMER, moveWaWaNum);
                                                    timer.stop();
                                                    initWaWaAwardItem(wwData);
                                                    if (!((!(addExp)) || (addExp == 0)))
                                                    {
                                                        _core.sysBlueMsg(Language.WAWA_GAME_PANEL[12].replace("{num}", addExp));
                                                    };
                                                    setPointNum(wwData.exp);
                                                    count = 0;
                                                    getWaWaAward();
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

        private function buyWaWaGameCoin(flag:Boolean):void
        {
            var handler:Function;
            var view:Object;
            if (!flag)
            {
                view = _core.view.getUI(ViewManager.PANEL_WAWA_CHANGE);
                ((view) && (view.initWorldCupChangePanel(wwGlobalData.bpt)));
                return;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyWaWaGameCoin", null, true, 1);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.WAWA_GAME_PANEL[26].replace("{point}", wwGlobalData.bptAll).replace("{num}", wwGlobalData.bptAllNum);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        public function set shopSlot21(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924013shopSlot21;
            if (_local_2 !== _arg_1)
            {
                this._1141924013shopSlot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot21", _local_2, _arg_1));
            };
        }

        public function set shopSlot22(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924012shopSlot22;
            if (_local_2 !== _arg_1)
            {
                this._1141924012shopSlot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot22", _local_2, _arg_1));
            };
        }

        public function set shopSlot20(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924014shopSlot20;
            if (_local_2 !== _arg_1)
            {
                this._1141924014shopSlot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot20", _local_2, _arg_1));
            };
        }

        public function __bCoinMoreBtn_click(_arg_1:MouseEvent):void
        {
            buyWaWaGameCoin(true);
        }

        public function set shopSlot23(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924011shopSlot23;
            if (_local_2 !== _arg_1)
            {
                this._1141924011shopSlot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot23", _local_2, _arg_1));
            };
        }

        public function set shopSlot24(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924010shopSlot24;
            if (_local_2 !== _arg_1)
            {
                this._1141924010shopSlot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot24", _local_2, _arg_1));
            };
        }

        public function set shopSlot28(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924006shopSlot28;
            if (_local_2 !== _arg_1)
            {
                this._1141924006shopSlot28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot28", _local_2, _arg_1));
            };
        }

        private function clearPageNor():void
        {
            var _local_2:Number;
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                _local_2 = (_local_1 + 15);
                this[("shopSlot" + _local_2)].st = -1;
                this[("shopSlot" + _local_2)].visible = false;
                _local_1++;
            };
        }

        public function set shopSlot26(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924008shopSlot26;
            if (_local_2 !== _arg_1)
            {
                this._1141924008shopSlot26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot26", _local_2, _arg_1));
            };
        }

        public function set shopSlot27(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924007shopSlot27;
            if (_local_2 !== _arg_1)
            {
                this._1141924007shopSlot27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot27", _local_2, _arg_1));
            };
        }

        public function set shopSlot25(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924009shopSlot25;
            if (_local_2 !== _arg_1)
            {
                this._1141924009shopSlot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot25", _local_2, _arg_1));
            };
        }

        public function onBuyWaWaGameCoin(_arg_1:Number):void
        {
            if (initialized)
            {
                setCoinNum(_arg_1);
            };
        }

        public function onGetLimitData(_arg_1:Object):void
        {
            if (((initialized) && (_arg_1)))
            {
                wawaExchangeItemList.removeAll();
                wawaExchangeItemList = addDataToExpList(_arg_1);
                setExchangeSlot();
                pageSelectorExp.onPageChanged = onPageChangedExp;
                pageSelectorExp.onPageCleared = clearPageExp;
                pageSelectorExp.initPageSeletor(wawaExchangeItemList.length, ITEM_COUNT_PER_PAGE_EXP);
            };
        }

        public function set shopSlot29(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924005shopSlot29;
            if (_local_2 !== _arg_1)
            {
                this._1141924005shopSlot29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot29", _local_2, _arg_1));
            };
        }

        public function set item0(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525949item0;
            if (_local_2 !== _arg_1)
            {
                this._100525949item0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item0", _local_2, _arg_1));
            };
        }

        public function set item1(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525950item1;
            if (_local_2 !== _arg_1)
            {
                this._100525950item1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item1", _local_2, _arg_1));
            };
        }

        public function set item2(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525951item2;
            if (_local_2 !== _arg_1)
            {
                this._100525951item2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item2", _local_2, _arg_1));
            };
        }

        private function getCoinNum():Number
        {
            return (Math.floor(wwData.coin));
        }

        public function set item3(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525952item3;
            if (_local_2 !== _arg_1)
            {
                this._100525952item3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item3", _local_2, _arg_1));
            };
        }

        public function set item4(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525953item4;
            if (_local_2 !== _arg_1)
            {
                this._100525953item4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item4", _local_2, _arg_1));
            };
        }

        public function set item5(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525954item5;
            if (_local_2 !== _arg_1)
            {
                this._100525954item5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get name2():Label
        {
            return (this._104584967name2);
        }

        public function set item7(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525956item7;
            if (_local_2 !== _arg_1)
            {
                this._100525956item7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item7", _local_2, _arg_1));
            };
        }

        public function ___WaWaGamePanel_DelayButton5_click(_arg_1:MouseEvent):void
        {
            setMaxNum();
        }

        public function set maxNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1081154686maxNum;
            if (_local_2 !== _arg_1)
            {
                this._1081154686maxNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get name3():Label
        {
            return (this._104584968name3);
        }

        public function set frLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._627007096frLabel;
            if (_local_2 !== _arg_1)
            {
                this._627007096frLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "frLabel", _local_2, _arg_1));
            };
        }

        private function getReItemNum():Number
        {
            return (wwData.fr);
        }

        private function initWaWaAwardItem(_arg_1:Object):void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:Number;
            var _local_2:Number = 1;
            while (_local_2 <= 4)
            {
                _local_3 = _arg_1[("d" + _local_2)]["tid"];
                _local_4 = _arg_1[("d" + _local_2)]["n"];
                _local_5 = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_3];
                if (_local_5)
                {
                    this[("t" + _local_2)].type = GamePredef.TBL_ITEM_TEMPLATE;
                    this[("t" + _local_2)].giid = _local_3;
                    this[("t" + _local_2)].slotData = _local_5;
                    this[("name" + _local_2)].htmlText = (((("<font color='" + getColor(_local_3)) + "'>") + _local_5.name) + "</font>");
                    _local_6 = 1;
                    while (_local_6 <= 4)
                    {
                        if (_local_6 > _local_4)
                        {
                            this[(("l" + String(_local_2)) + String(_local_6))].source = ResManager.getIconUrl(4130220000499);
                        }
                        else
                        {
                            this[(("l" + String(_local_2)) + String(_local_6))].source = ResManager.getIconUrl(4130220000498);
                        };
                        _local_6++;
                    };
                };
                _local_2++;
            };
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            changeView(0);
        }

        [Bindable(event="propertyChange")]
        public function get sel1():CheckBox
        {
            return (this._3526423sel1);
        }

        public function set l11(_arg_1:Image):void
        {
            var _local_2:Object = this._105356l11;
            if (_local_2 !== _arg_1)
            {
                this._105356l11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l11", _local_2, _arg_1));
            };
        }

        public function set item8(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525957item8;
            if (_local_2 !== _arg_1)
            {
                this._100525957item8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item8", _local_2, _arg_1));
            };
        }

        public function set l12(_arg_1:Image):void
        {
            var _local_2:Object = this._105357l12;
            if (_local_2 !== _arg_1)
            {
                this._105357l12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l12", _local_2, _arg_1));
            };
        }

        public function set item9(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525958item9;
            if (_local_2 !== _arg_1)
            {
                this._100525958item9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item9", _local_2, _arg_1));
            };
        }

        public function set l13(_arg_1:Image):void
        {
            var _local_2:Object = this._105358l13;
            if (_local_2 !== _arg_1)
            {
                this._105358l13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sel2():CheckBox
        {
            return (this._3526424sel2);
        }

        public function set point(_arg_1:Label):void
        {
            var _local_2:Object = this._106845584point;
            if (_local_2 !== _arg_1)
            {
                this._106845584point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "point", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get name4():Label
        {
            return (this._104584969name4);
        }

        public function set l14(_arg_1:Image):void
        {
            var _local_2:Object = this._105359l14;
            if (_local_2 !== _arg_1)
            {
                this._105359l14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l14", _local_2, _arg_1));
            };
        }

        public function set item6(_arg_1:WaWaSlot):void
        {
            var _local_2:Object = this._100525955item6;
            if (_local_2 !== _arg_1)
            {
                this._100525955item6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get reBtn():DelayButton
        {
            return (this._108357417reBtn);
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

        private function onPageChangedNor(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_5:Number;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                _local_5 = (_local_4 + 15);
                if (_local_3 < wawaAwardItemListNor.length)
                {
                    this[("shopSlot" + _local_5)].type = wawaAwardItemListNor[_local_3].type;
                    this[("shopSlot" + _local_5)].slotData = wawaAwardItemListNor[_local_4].slotData;
                    this[("shopSlot" + _local_5)].stackNum = 1;
                    this[("shopSlot" + _local_5)].giid = wawaAwardItemListNor[_local_3].giid;
                    this[("shopSlot" + _local_5)].visible = true;
                };
                _local_4++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get sel4():CheckBox
        {
            return (this._3526426sel4);
        }

        [Bindable(event="propertyChange")]
        public function get name1():Label
        {
            return (this._104584966name1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot11():ShopSlot
        {
            return (this._1141924044shopSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot12():ShopSlot
        {
            return (this._1141924043shopSlot12);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot13():ShopSlot
        {
            return (this._1141924042shopSlot13);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot14():ShopSlot
        {
            return (this._1141924041shopSlot14);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot15():ShopSlot
        {
            return (this._1141924040shopSlot15);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelectorSpe():PageSelector
        {
            return (this._1442264890pageSelectorSpe);
        }

        [Bindable(event="propertyChange")]
        public function get sel3():CheckBox
        {
            return (this._3526425sel3);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot19():ShopSlot
        {
            return (this._1141924036shopSlot19);
        }

        private function onInitComp(_arg_1:Event):void
        {
            var _local_2:Class;
            if (!yaogan)
            {
                _local_2 = (loader.contentLoaderInfo.applicationDomain.getDefinition("yaogan") as Class);
                yaogan = (new (_local_2)() as MovieClip);
                if (yaogan)
                {
                    yaoganUi.addChild(yaogan);
                    yaogan.gotoAndStop(0);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot16():ShopSlot
        {
            return (this._1141924039shopSlot16);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot17():ShopSlot
        {
            return (this._1141924038shopSlot17);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot10():ShopSlot
        {
            return (this._1141924045shopSlot10);
        }

        [Bindable(event="propertyChange")]
        public function get bCoinBtn():DelayButton
        {
            return (this._1608075081bCoinBtn);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot18():ShopSlot
        {
            return (this._1141924037shopSlot18);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot20():ShopSlot
        {
            return (this._1141924014shopSlot20);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot21():ShopSlot
        {
            return (this._1141924013shopSlot21);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot23():ShopSlot
        {
            return (this._1141924011shopSlot23);
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

        [Bindable(event="propertyChange")]
        public function get shopSlot27():ShopSlot
        {
            return (this._1141924007shopSlot27);
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

        [Bindable(event="propertyChange")]
        public function get shopSlot22():ShopSlot
        {
            return (this._1141924012shopSlot22);
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

        public function set l21(_arg_1:Image):void
        {
            var _local_2:Object = this._105387l21;
            if (_local_2 !== _arg_1)
            {
                this._105387l21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l21", _local_2, _arg_1));
            };
        }

        public function set l22(_arg_1:Image):void
        {
            var _local_2:Object = this._105388l22;
            if (_local_2 !== _arg_1)
            {
                this._105388l22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l22", _local_2, _arg_1));
            };
        }

        public function set l23(_arg_1:Image):void
        {
            var _local_2:Object = this._105389l23;
            if (_local_2 !== _arg_1)
            {
                this._105389l23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l23", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot29():ShopSlot
        {
            return (this._1141924005shopSlot29);
        }

        public function set l24(_arg_1:Image):void
        {
            var _local_2:Object = this._105390l24;
            if (_local_2 !== _arg_1)
            {
                this._105390l24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l24", _local_2, _arg_1));
            };
        }

        public function set bangBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324753bangBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1863324753bangBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot25():ShopSlot
        {
            return (this._1141924009shopSlot25);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot26():ShopSlot
        {
            return (this._1141924008shopSlot26);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot28():ShopSlot
        {
            return (this._1141924006shopSlot28);
        }

        public function set pageSelectorExp(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1442251695pageSelectorExp;
            if (_local_2 !== _arg_1)
            {
                this._1442251695pageSelectorExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelectorExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot24():ShopSlot
        {
            return (this._1141924010shopSlot24);
        }

        public function set coin0(_arg_1:Label):void
        {
            var _local_2:Object = this._94839743coin0;
            if (_local_2 !== _arg_1)
            {
                this._94839743coin0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "coin0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item2():WaWaSlot
        {
            return (this._100525951item2);
        }

        [Bindable(event="propertyChange")]
        public function get item4():WaWaSlot
        {
            return (this._100525953item4);
        }

        [Bindable(event="propertyChange")]
        public function get item5():WaWaSlot
        {
            return (this._100525954item5);
        }

        private function setWaWaAwardSlotSpe():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                if (_local_1 < wawaAwardItemListSpe.length)
                {
                    this[("shopSlot" + _local_1)].slotData = wawaAwardItemListSpe[_local_1].slotData;
                    this[("shopSlot" + _local_1)].type = wawaAwardItemListSpe[_local_1].type;
                    this[("shopSlot" + _local_1)].giid = wawaAwardItemListSpe[_local_1].itemId;
                    this[("shopSlot" + _local_1)].stackNum = 1;
                    this[("shopSlot" + _local_1)].visible = true;
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get item7():WaWaSlot
        {
            return (this._100525956item7);
        }

        [Bindable(event="propertyChange")]
        public function get item8():WaWaSlot
        {
            return (this._100525957item8);
        }

        [Bindable(event="propertyChange")]
        public function get item9():WaWaSlot
        {
            return (this._100525958item9);
        }

        [Bindable(event="propertyChange")]
        public function get maxNum():NumericStepper
        {
            return (this._1081154686maxNum);
        }

        [Bindable(event="propertyChange")]
        public function get item1():WaWaSlot
        {
            return (this._100525950item1);
        }

        [Bindable(event="propertyChange")]
        public function get l13():Image
        {
            return (this._105358l13);
        }

        public function set coin1(_arg_1:Label):void
        {
            var _local_2:Object = this._94839744coin1;
            if (_local_2 !== _arg_1)
            {
                this._94839744coin1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "coin1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item6():WaWaSlot
        {
            return (this._100525955item6);
        }

        [Bindable(event="propertyChange")]
        public function get l11():Image
        {
            return (this._105356l11);
        }

        [Bindable(event="propertyChange")]
        public function get l12():Image
        {
            return (this._105357l12);
        }

        [Bindable(event="propertyChange")]
        public function get item0():WaWaSlot
        {
            return (this._100525949item0);
        }

        override public function initialize():void
        {
            var target:WaWaGamePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WaWaGamePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WaWaGamePanelWatcherSetupUtil");
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

        private function _WaWaGamePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WAWA_GAME_PANEL[0];
            _local_1 = Language.WAWA_GAME_PANEL[15];
            _local_1 = Language.WAWA_GAME_PANEL[16];
            _local_1 = Language.WAWA_GAME_PANEL[17];
            _local_1 = Language.WAWA_GAME_PANEL[28];
            _local_1 = ResManager.getIconUrl(4130220000500);
            _local_1 = ResManager.getIconUrl(4130220000497);
            _local_1 = Language.WAWA_GAME_PANEL[2];
            _local_1 = Language.WAWA_GAME_PANEL[14];
            _local_1 = Language.WAWA_GAME_PANEL[13];
            _local_1 = Language.WAWA_GAME_PANEL[18];
            _local_1 = Language.WAWA_GAME_PANEL[19];
            _local_1 = Language.WAWA_GAME_PANEL[20];
        }

        public function set l31(_arg_1:Image):void
        {
            var _local_2:Object = this._105418l31;
            if (_local_2 !== _arg_1)
            {
                this._105418l31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l31", _local_2, _arg_1));
            };
        }

        public function set l32(_arg_1:Image):void
        {
            var _local_2:Object = this._105419l32;
            if (_local_2 !== _arg_1)
            {
                this._105419l32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l32", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get l14():Image
        {
            return (this._105359l14);
        }

        public function set l34(_arg_1:Image):void
        {
            var _local_2:Object = this._105421l34;
            if (_local_2 !== _arg_1)
            {
                this._105421l34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l34", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item3():WaWaSlot
        {
            return (this._100525952item3);
        }

        public function set l33(_arg_1:Image):void
        {
            var _local_2:Object = this._105420l33;
            if (_local_2 !== _arg_1)
            {
                this._105420l33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l33", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get l21():Image
        {
            return (this._105387l21);
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
        public function get bangBtn2():BasicGlowButton
        {
            return (this._1863324754bangBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn3():BasicGlowButton
        {
            return (this._1863324753bangBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get l22():Image
        {
            return (this._105388l22);
        }

        [Bindable(event="propertyChange")]
        public function get l23():Image
        {
            return (this._105389l23);
        }

        [Bindable(event="propertyChange")]
        public function get l24():Image
        {
            return (this._105390l24);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelectorExp():PageSelector
        {
            return (this._1442251695pageSelectorExp);
        }

        [Bindable(event="propertyChange")]
        public function get coin0():Label
        {
            return (this._94839743coin0);
        }

        [Bindable(event="propertyChange")]
        public function get coin1():Label
        {
            return (this._94839744coin1);
        }

        [Bindable(event="propertyChange")]
        public function get l32():Image
        {
            return (this._105419l32);
        }

        public function ___WaWaGamePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get l31():Image
        {
            return (this._105418l31);
        }

        public function set l41(_arg_1:Image):void
        {
            var _local_2:Object = this._105449l41;
            if (_local_2 !== _arg_1)
            {
                this._105449l41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l41", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get l33():Image
        {
            return (this._105420l33);
        }

        [Bindable(event="propertyChange")]
        public function get l34():Image
        {
            return (this._105421l34);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            initComp();
            _core.remote.call("initPlayerWaWaData", new Responder(onInitPlayerWaWaData), ver, sver);
        }

        public function set l43(_arg_1:Image):void
        {
            var _local_2:Object = this._105451l43;
            if (_local_2 !== _arg_1)
            {
                this._105451l43 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l43", _local_2, _arg_1));
            };
        }

        public function set l44(_arg_1:Image):void
        {
            var _local_2:Object = this._105452l44;
            if (_local_2 !== _arg_1)
            {
                this._105452l44 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l44", _local_2, _arg_1));
            };
        }

        public function set l42(_arg_1:Image):void
        {
            var _local_2:Object = this._105450l42;
            if (_local_2 !== _arg_1)
            {
                this._105450l42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l42", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get l41():Image
        {
            return (this._105449l41);
        }

        [Bindable(event="propertyChange")]
        public function get l42():Image
        {
            return (this._105450l42);
        }

        [Bindable(event="propertyChange")]
        public function get l43():Image
        {
            return (this._105451l43);
        }

        [Bindable(event="propertyChange")]
        public function get l44():Image
        {
            return (this._105452l44);
        }


    }
}//package com.qeedoo.ui.view.compDragable

