// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.IMPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.DataGrid;
    import mx.collections.ArrayCollection;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.ListEvent;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import com.qeedoo.game.data.GameData;
    import mx.controls.Alert;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import mx.events.DataGridEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.EnemyHBox;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.ui.utils.ChatPanelUtil;
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

    public class IMPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1966193968newFriendButton:Button;
        private var _436740689newBlackButton:Button;
        private var _1659364272teacherInfo:TextArea;
        private var _541082870tsTabBtn0:BasicGlowButton;
        private var _1554141552tabBtn7:BasicGlowButton;
        private var _1413572990brotherList:DataGrid;
        private var blackAC:ArrayCollection;
        private var _1483226179groupList:DataGrid;
        private var _335479685findTeacherButton:BasicGlowButton;
        private var blackAR:Object;
        private var _1269957788connectionList:List;
        private var _1554141557tabBtn2:BasicGlowButton;
        public var _IMPanel_BasicDelayButton1:BasicDelayButton;
        public var _IMPanel_DataGridColumn10:DataGridColumn;
        public var _IMPanel_DataGridColumn11:DataGridColumn;
        public var _IMPanel_DataGridColumn12:DataGridColumn;
        public var _IMPanel_DataGridColumn13:DataGridColumn;
        public var _IMPanel_DataGridColumn14:DataGridColumn;
        public var _IMPanel_DataGridColumn15:DataGridColumn;
        public var _IMPanel_DataGridColumn16:DataGridColumn;
        public var _IMPanel_DataGridColumn17:DataGridColumn;
        public var _IMPanel_DataGridColumn18:DataGridColumn;
        private var _163943896vTabNavigator:ViewStack;
        private var _2095530956btnQuery:BasicGlowButton;
        public var _IMPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _IMPanel_DataGridColumn19:DataGridColumn;
        private var brotherAC:ArrayCollection;
        public var _IMPanel_DataGridColumn21:DataGridColumn;
        public var _IMPanel_DataGridColumn23:DataGridColumn;
        public var _IMPanel_DataGridColumn24:DataGridColumn;
        private var targetX:Number;
        private var targetY:Number;
        public var _IMPanel_DataGridColumn20:DataGridColumn;
        public var _IMPanel_DataGridColumn25:DataGridColumn;
        public var _IMPanel_DataGridColumn22:DataGridColumn;
        public var _IMPanel_DataGridColumn1:DataGridColumn;
        public var _IMPanel_DataGridColumn2:DataGridColumn;
        public var _IMPanel_DataGridColumn3:DataGridColumn;
        public var _IMPanel_DataGridColumn5:DataGridColumn;
        public var _IMPanel_DataGridColumn6:DataGridColumn;
        public var _IMPanel_DataGridColumn7:DataGridColumn;
        public var _IMPanel_DataGridColumn8:DataGridColumn;
        public var _IMPanel_DataGridColumn9:DataGridColumn;
        public var _IMPanel_DataGridColumn4:DataGridColumn;
        private var _1554141553tabBtn6:BasicGlowButton;
        private var _1185989481delTeacherButton:BasicGlowButton;
        private var curItem:Object = null;
        private var studentList:Object;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _1302685476tsViewStack:ViewStack;
        private var _554409723loverInfoTA:LinkTextArea;
        private var enemyAC:ArrayCollection;
        private var _96327450newEnemyButton:Button;
        private var enemyAR:Object;
        private var tutorAC:ArrayCollection;
        private var tutorAR:Object;
        public var _IMPanel_SimpleCanvas2:SimpleCanvas;
        public var _IMPanel_SimpleCanvas3:SimpleCanvas;
        public var _IMPanel_SimpleCanvas4:SimpleCanvas;
        public var _IMPanel_SimpleCanvas5:SimpleCanvas;
        public var _IMPanel_SimpleCanvas6:SimpleCanvas;
        public var _IMPanel_SimpleCanvas7:SimpleCanvas;
        public var _IMPanel_SimpleCanvas1:SimpleCanvas;
        public var _IMPanel_BasicGlowButton13:BasicGlowButton;
        public var _IMPanel_BasicGlowButton14:BasicGlowButton;
        public var _IMPanel_BasicGlowButton17:BasicGlowButton;
        public var _IMPanel_BasicGlowButton12:BasicGlowButton;
        public var _IMPanel_SimpleCanvas9:SimpleCanvas;
        public var _IMPanel_BasicGlowButton11:BasicGlowButton;
        public var _IMPanel_SimpleCanvas8:SimpleCanvas;
        private var _1554141554tabBtn5:BasicGlowButton;
        private var _1756909476friendList:DataGrid;
        private var lineGroupList:Object;
        private var _260999996selfTeacherInfo:Label;
        private var _1554141559tabBtn0:BasicGlowButton;
        public var _IMPanel_BasicGlowButton1:BasicGlowButton;
        public var _IMPanel_BasicGlowButton2:BasicGlowButton;
        public var _IMPanel_BasicGlowButton3:BasicGlowButton;
        public var _IMPanel_BasicGlowButton7:BasicGlowButton;
        private var firstTimeFlag:Boolean = true;
        private var tsInitialized:Boolean = false;
        private var _893258425stGrid:DataGrid;
        private var panelNum:int = 8;
        private var _1554141555tabBtn4:BasicGlowButton;
        private var relationShipList:Object;
        private var _1050415034enemyList:DataGrid;
        private var _1323557593upTeacherButton:BasicGlowButton;
        private var friendAC:ArrayCollection;
        private var _551112863btnReqAdd:BasicGlowButton;
        private var friendAR:Object;
        private var _117682566reportButton:BasicGlowButton;
        public var _IMPanel_SimpleCanvas10:SimpleCanvas;
        private var _541082869tsTabBtn1:BasicGlowButton;
        private var _1332059453blackList:List;
        private var _1554141556tabBtn3:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":440,
                    "height":415,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_IMPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vTabNavigator",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":340,
                                "creationPolicy":"all",
                                "y":60,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"_IMPanel_SimpleCanvas1",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "width":400,
                                                        "height":290,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"friendList",
                                                            "events":{"itemClick":"__friendList_itemClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "width":374,
                                                                    "height":274,
                                                                    "x":8,
                                                                    "y":8,
                                                                    "columns":[_IMPanel_DataGridColumn1_i(), _IMPanel_DataGridColumn2_i(), _IMPanel_DataGridColumn3_i(), _IMPanel_DataGridColumn4_i(), _IMPanel_DataGridColumn5_i(), _IMPanel_DataGridColumn6_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"newFriendButton",
                                                "events":{"click":"__newFriendButton_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "width":20,
                                                        "styleName":"BtnAdd",
                                                        "height":20,
                                                        "x":115
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___IMPanel_Button2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "width":20,
                                                        "styleName":"BtnReduce",
                                                        "height":20,
                                                        "x":143
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_IMPanel_BasicGlowButton1",
                                                "events":{"click":"___IMPanel_BasicGlowButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"_IMPanel_SimpleCanvas2",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"blackList",
                                                "events":{"itemClick":"__blackList_itemClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "iconField":"icon",
                                                        "labelField":"name",
                                                        "width":403,
                                                        "height":289,
                                                        "x":5,
                                                        "y":2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"newBlackButton",
                                                "events":{"click":"__newBlackButton_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "width":20,
                                                        "styleName":"BtnAdd",
                                                        "height":20,
                                                        "x":115
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___IMPanel_Button4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "width":20,
                                                        "styleName":"BtnReduce",
                                                        "height":20,
                                                        "x":143
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_IMPanel_BasicGlowButton2",
                                                "events":{"click":"___IMPanel_BasicGlowButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"_IMPanel_SimpleCanvas3",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"connectionList",
                                                "events":{"itemClick":"__connectionList_itemClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "iconField":"icon",
                                                        "labelField":"name",
                                                        "width":403,
                                                        "height":289,
                                                        "x":5,
                                                        "y":2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_IMPanel_BasicGlowButton3",
                                                "events":{"click":"___IMPanel_BasicGlowButton3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"_IMPanel_SimpleCanvas4",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"tsViewStack",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentHeight":100,
                                                        "percentWidth":100,
                                                        "creationPolicy":"all",
                                                        "x":0,
                                                        "y":30,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":SimpleCanvas,
                                                            "id":"_IMPanel_SimpleCanvas5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":TextArea,
                                                                        "id":"teacherInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.backgroundAlpha = 0;
                                                                            this.fontSize = 12;
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":38,
                                                                                "editable":false,
                                                                                "width":337,
                                                                                "height":214,
                                                                                "x":10
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"reportButton",
                                                                        "events":{"click":"__reportButton_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":275,
                                                                                "enabled":false,
                                                                                "styleName":"BtnStdGreen",
                                                                                "x":159,
                                                                                "width":52.2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"delTeacherButton",
                                                                        "events":{"click":"__delTeacherButton_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":275.1,
                                                                                "styleName":"BtnStdRed",
                                                                                "x":219.2,
                                                                                "width":52.2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"findTeacherButton",
                                                                        "events":{"click":"__findTeacherButton_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":275.1,
                                                                                "styleName":"BtnStdRed",
                                                                                "x":98.8,
                                                                                "width":52.2
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":SimpleCanvas,
                                                            "id":"_IMPanel_SimpleCanvas6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"selfTeacherInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "5";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"stGrid",
                                                                        "events":{"itemClick":"__stGrid_itemClick"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.right = "10";
                                                                            this.top = "25";
                                                                            this.bottom = "50";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "columns":[_IMPanel_DataGridColumn7_i(), _IMPanel_DataGridColumn8_i(), _IMPanel_DataGridColumn9_i()]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_IMPanel_BasicGlowButton7",
                                                                        "events":{"click":"___IMPanel_BasicGlowButton7_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":271,
                                                                                "styleName":"BtnStdRed",
                                                                                "x":159,
                                                                                "width":52.2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"upTeacherButton",
                                                                        "events":{"click":"__upTeacherButton_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":307,
                                                                                "y":5,
                                                                                "styleName":"BtnNormalGreen",
                                                                                "width":38.6,
                                                                                "height":18.2
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tsTabBtn0",
                                                "events":{"click":"__tsTabBtn0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":6,
                                                        "y":7,
                                                        "styleName":"HorizontalTab",
                                                        "width":38.4
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tsTabBtn1",
                                                "events":{"click":"__tsTabBtn1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":43,
                                                        "y":7,
                                                        "styleName":"HorizontalTab",
                                                        "width":38.4
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_IMPanel_BasicGlowButton11",
                                                "events":{"click":"___IMPanel_BasicGlowButton11_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"_IMPanel_SimpleCanvas7",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":LinkTextArea,
                                                "id":"loverInfoTA",
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.borderStyle = "none";
                                                    this.color = 16251643;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "editable":false,
                                                        "enabled":true,
                                                        "selectable":false,
                                                        "mouseEnabled":true,
                                                        "x":22,
                                                        "y":25,
                                                        "width":313,
                                                        "height":243
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_IMPanel_BasicGlowButton12",
                                                "events":{"click":"___IMPanel_BasicGlowButton12_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_IMPanel_BasicGlowButton13",
                                                "events":{"click":"___IMPanel_BasicGlowButton13_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "90";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"_IMPanel_SimpleCanvas8",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "width":400,
                                                        "height":290,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"enemyList",
                                                            "events":{"itemClick":"__enemyList_itemClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "width":374,
                                                                    "height":274,
                                                                    "x":8,
                                                                    "y":8,
                                                                    "columns":[_IMPanel_DataGridColumn10_i(), _IMPanel_DataGridColumn11_i(), _IMPanel_DataGridColumn12_i(), _IMPanel_DataGridColumn13_i(), _IMPanel_DataGridColumn14_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"newEnemyButton",
                                                "events":{"click":"__newEnemyButton_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "width":20,
                                                        "styleName":"BtnAdd",
                                                        "height":20,
                                                        "x":115
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___IMPanel_Button6_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "width":20,
                                                        "styleName":"BtnReduce",
                                                        "height":20,
                                                        "x":143
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_IMPanel_BasicGlowButton14",
                                                "events":{"click":"___IMPanel_BasicGlowButton14_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"_IMPanel_SimpleCanvas9",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "width":400,
                                                        "height":290,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"groupList",
                                                            "events":{"itemClick":"__groupList_itemClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "width":374,
                                                                    "height":274,
                                                                    "x":8,
                                                                    "y":8,
                                                                    "columns":[_IMPanel_DataGridColumn15_i(), _IMPanel_DataGridColumn16_i(), _IMPanel_DataGridColumn17_i(), _IMPanel_DataGridColumn18_i(), _IMPanel_DataGridColumn19_i(), _IMPanel_DataGridColumn20_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btnReqAdd",
                                                "events":{"click":"__btnReqAdd_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btnQuery",
                                                "events":{"click":"__btnQuery_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":83,
                                                        "y":302,
                                                        "styleName":"BtnStdRed",
                                                        "width":70,
                                                        "height":27,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_IMPanel_BasicDelayButton1",
                                                "events":{"click":"___IMPanel_BasicDelayButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "x":250,
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_IMPanel_BasicGlowButton17",
                                                "events":{"click":"___IMPanel_BasicGlowButton17_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":330,
                                                        "y":305,
                                                        "styleName":"BtnStdRed",
                                                        "width":70
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"_IMPanel_SimpleCanvas10",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "width":400,
                                                        "height":320,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"brotherList",
                                                            "events":{"itemClick":"__brotherList_itemClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "width":374,
                                                                    "height":274,
                                                                    "x":8,
                                                                    "y":8,
                                                                    "columns":[_IMPanel_DataGridColumn21_i(), _IMPanel_DataGridColumn22_i(), _IMPanel_DataGridColumn23_i(), _IMPanel_DataGridColumn24_i(), _IMPanel_DataGridColumn25_i()]
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
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":75,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn2",
                        "events":{"click":"__tabBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":125,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn3",
                        "events":{"click":"__tabBtn3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":175,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn4",
                        "events":{"click":"__tabBtn4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":225,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn5",
                        "events":{"click":"__tabBtn5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":275,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn6",
                        "events":{"click":"__tabBtn6_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":325,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":49
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn7",
                        "events":{"click":"__tabBtn7_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":375,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":49
                            });
                        }
                    })]
                });
            }
        });
        private var connectionAC:ArrayCollection = new ArrayCollection();
        private var connectionAR:Array = new Array();
        private var _core:Core = Core.getInstance();
        private var allGroupAC:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function IMPanel()
        {
            mx_internal::_document = this;
            this.width = 440;
            this.height = 415;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            IMPanel._watcherSetupUtil = _arg_1;
        }


        public function __newEnemyButton_click(_arg_1:MouseEvent):void
        {
            addEnemyBtnClick();
        }

        private function getEneNum():int
        {
            var _local_2:*;
            var _local_1:int;
            if (enemyAR)
            {
                for each (_local_2 in blackAR)
                {
                    if (_local_2)
                    {
                        _local_1++;
                    };
                };
            };
            return (_local_1);
        }

        private function _IMPanel_DataGridColumn21_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn21 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn21", _IMPanel_DataGridColumn21);
            return (_local_1);
        }

        public function ___IMPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            refreshGroupList();
        }

        private function getFriNum():int
        {
            var _local_2:*;
            var _local_1:int;
            if (friendAR)
            {
                for each (_local_2 in friendAR)
                {
                    if (((_local_2) && (_local_2.type == 1)))
                    {
                        _local_1++;
                    };
                };
            };
            return (_local_1);
        }

        public function onInitViewImC(_arg_1:Object):void
        {
            this.relationShipList = _arg_1;
            updateView();
        }

        public function ___IMPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_CHATMANAGER);
        }

        public function __tsTabBtn0_click(_arg_1:MouseEvent):void
        {
            tsTabClick(0);
        }

        private function _IMPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn7", _IMPanel_DataGridColumn7);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get enemyList():DataGrid
        {
            return (this._1050415034enemyList);
        }

        private function _IMPanel_DataGridColumn20_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn20 = _local_1;
            _local_1.dataField = "pos";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn20", _IMPanel_DataGridColumn20);
            return (_local_1);
        }

        public function ___IMPanel_Button4_click(_arg_1:MouseEvent):void
        {
            delBlackBtnClick();
        }

        private function updateViewGroupList(_arg_1:Object, _arg_2:ArrayCollection):*
        {
            var _local_3:*;
            var _local_4:*;
            lineGroupList[_arg_1] = _arg_2;
            allGroupAC = new ArrayCollection();
            for (_local_3 in lineGroupList)
            {
                for each (_local_4 in lineGroupList[_local_3])
                {
                    allGroupAC.addItem(_local_4);
                };
            };
            groupList.dataProvider = allGroupAC;
        }

        public function __groupList_itemClick(_arg_1:ListEvent):void
        {
            selectGroupTeam();
        }

        [Bindable(event="propertyChange")]
        public function get friendList():DataGrid
        {
            return (this._1756909476friendList);
        }

        public function isFriend(_arg_1:String):Boolean
        {
            if (!friendAR)
            {
                return (false);
            };
            if (!friendAR[_arg_1])
            {
                return (false);
            };
            return (true);
        }

        private function menuPop(_arg_1:Object):void
        {
            var _local_2:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_2.show(stage.mouseX, stage.mouseY);
            _local_2.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get findTeacherButton():BasicGlowButton
        {
            return (this._335479685findTeacherButton);
        }

        private function _IMPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "revenge";
            _local_1.itemRenderer = _IMPanel_ClassFactory1_c();
            _local_1.width = 65;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn6", _IMPanel_DataGridColumn6);
            return (_local_1);
        }

        public function isEnemy(_arg_1:String):Boolean
        {
            if (!enemyAR)
            {
                return (false);
            };
            if (!enemyAR[_arg_1])
            {
                return (false);
            };
            return (true);
        }

        public function onFindTeacher(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (_arg_1.t == 1)
                {
                    _core.addWarn({
                        "warnType":GamePredef.WARN_TYPE_FINDTEACHER,
                        "studentId":_arg_1.i,
                        "studentName":_arg_1.n
                    });
                }
                else
                {
                    if (_arg_1.t == 2)
                    {
                        if (_arg_1.f == 1)
                        {
                            _core.sysMsg(Language.IMPANEL_S[30]);
                        }
                        else
                        {
                            if (_arg_1.f == 2)
                            {
                                _core.sysMsg(Language.IMPANEL_S[31]);
                            }
                            else
                            {
                                if (_arg_1.f == 3)
                                {
                                    _core.sysMsg(Language.IMPANEL_S[32]);
                                }
                                else
                                {
                                    if (_arg_1.f == 4)
                                    {
                                        _core.sysMsg(Language.IMPANEL_S[33]);
                                    }
                                    else
                                    {
                                        if (_arg_1.f == 5)
                                        {
                                            _core.sysMsg(Language.IMPANEL_S[34]);
                                        }
                                        else
                                        {
                                            if (_arg_1.f == 6)
                                            {
                                                _core.sysMsg(Language.IMPANEL_S[35]);
                                            }
                                            else
                                            {
                                                if (_arg_1.f == 7)
                                                {
                                                    _core.sysMsg(Language.IMPANEL_S[36]);
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

        public function set enemyList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1050415034enemyList;
            if (_local_2 !== _arg_1)
            {
                this._1050415034enemyList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enemyList", _local_2, _arg_1));
            };
        }

        private function initGroupList():void
        {
            lineGroupList = {};
            _core.remote.groupListOfMap(_core.player.posMapId);
        }

        [Bindable(event="propertyChange")]
        public function get connectionList():List
        {
            return (this._1269957788connectionList);
        }

        [Bindable(event="propertyChange")]
        public function get btnReqAdd():BasicGlowButton
        {
            return (this._551112863btnReqAdd);
        }

        public function set newBlackButton(_arg_1:Button):void
        {
            var _local_2:Object = this._436740689newBlackButton;
            if (_local_2 !== _arg_1)
            {
                this._436740689newBlackButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newBlackButton", _local_2, _arg_1));
            };
        }

        private function brotherClick():void
        {
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}]);
        }

        public function __tabBtn5_click(_arg_1:MouseEvent):void
        {
            tabClick(5);
        }

        private function _IMPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "num";
            _local_1.sortCompareFunction = friendlySortFunc;
            _local_1.width = 60;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn5", _IMPanel_DataGridColumn5);
            return (_local_1);
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

        private function upTeacher():void
        {
            _core.remote.nc.call("upTeacher", new Responder(onUpTeacher));
        }

        public function __brotherList_itemClick(_arg_1:ListEvent):void
        {
            brotherClick();
        }

        private function blackClick():void
        {
            menuPop([{"label":GamePredef.MENU_INFO}, {"label":GamePredef.GUILD_DEL}]);
        }

        public function __upTeacherButton_click(_arg_1:MouseEvent):void
        {
            upTeacher();
        }

        public function ___IMPanel_BasicGlowButton14_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_CHATMANAGER);
        }

        private function isSameLine():Boolean
        {
            return (curItem["line"].toString() == ((Number(_core.lineInfo.id) + 1).toString() + Language.IMPANEL_U[27]));
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                initView();
                if (firstTimeFlag)
                {
                    firstTimeFlag = false;
                    if (vTabNavigator.selectedIndex == 3)
                    {
                        initTS();
                    };
                };
            };
        }

        public function ___IMPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_CHATMANAGER);
        }

        [Bindable(event="propertyChange")]
        public function get selfTeacherInfo():Label
        {
            return (this._260999996selfTeacherInfo);
        }

        public function isBlack(_arg_1:String):Boolean
        {
            if (!blackAR)
            {
                return (false);
            };
            if (!blackAR[_arg_1])
            {
                return (false);
            };
            return (true);
        }

        public function set findTeacherButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._335479685findTeacherButton;
            if (_local_2 !== _arg_1)
            {
                this._335479685findTeacherButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "findTeacherButton", _local_2, _arg_1));
            };
        }

        private function _IMPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "state";
            _local_1.sortDescending = true;
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn4", _IMPanel_DataGridColumn4);
            return (_local_1);
        }

        public function onInitGroupList(_arg_1:Object):void
        {
            var _local_5:Object;
            var _local_2:* = _arg_1.lineid;
            var _local_3:* = _arg_1.grplist.head;
            var _local_4:ArrayCollection = new ArrayCollection();
            while (_local_3)
            {
                _local_5 = {};
                _local_5["line"] = ((Number(_local_3.obj.lineId) + 1) + Language.IMPANEL_U[27]);
                _local_5["map"] = GameData.d[GamePredef.TBL_MAP][_core.player.posMapId].name;
                _local_5["lid"] = _local_3.obj.lId;
                _local_5["lname"] = _local_3.obj.lName;
                _local_5["llevel"] = _local_3.obj.lLevel;
                _local_5["gnum"] = _local_3.obj.num;
                _local_5["pos"] = (((("(" + Number((_local_3.obj.posX / 10))) + ",") + Number((_local_3.obj.posY / 10))) + ")");
                _local_4.addItem(_local_5);
                _local_3 = _local_3.next;
            };
            updateViewGroupList(_local_2, _local_4);
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function set tabBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        public function __delTeacherButton_click(_arg_1:MouseEvent):void
        {
            Alert.show(Language.IMPANEL_S[61], "", 3, this, delTeacher);
        }

        public function addEnemyBtnClick():void
        {
            var _local_1:InputPanel = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
            _local_1.showInput(Language.IMPANEL_S[77], Language.IMPANEL_S[78], addEnemy);
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function onDelST(_arg_1:Object):void
        {
            var _local_2:* = "";
            if (_arg_1)
            {
                if (_arg_1.t == 1)
                {
                    if (studentList)
                    {
                        delete studentList[_arg_1.i];
                        updateViewTS();
                    };
                }
                else
                {
                    if (_arg_1.t == 2)
                    {
                        _core.player.ti = -1;
                        _core.player.tn = "";
                        updateViewTS();
                    };
                };
                _local_2 = Language.IMPANEL_S[29];
                _local_2 = _local_2.replace("{nameLink}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.i) + "|") + _arg_1.n) + "|0|0|0]")));
                _core.sysMsg(_local_2);
            };
        }

        public function __stGrid_itemClick(_arg_1:ListEvent):void
        {
            stClick();
        }

        public function set tabBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141553tabBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1554141553tabBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn6", _local_2, _arg_1));
            };
        }

        public function set tabBtn7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141552tabBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1554141552tabBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn7", _local_2, _arg_1));
            };
        }

        public function set tabBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        private function reqAddGroup():void
        {
            var _local_1:Number;
            if (isSameLine())
            {
                _local_1 = ToolKit.getDisByXY(targetX, targetY, (_core.player.normalView.posX / 10), (_core.player.normalView.posY / 10));
                if (_local_1 <= GamePredef.VALID_DIS_ADD_GROUP)
                {
                    _core.remote.groupRequest(_core.player.id, Number(curItem["lid"]));
                }
                else
                {
                    Alert.show(Language.IMPANEL_U[29], "");
                };
            }
            else
            {
                Alert.show(Language.IMPANEL_U[28].toString().replace("{line}", curItem["line"]), "");
            };
        }

        private function levelSortFunc(_arg_1:Object, _arg_2:Object):int
        {
            if (int(_arg_1.level) > int(_arg_2.level))
            {
                return (1);
            };
            if (int(_arg_1.level) == int(_arg_2.level))
            {
                return (0);
            };
            return (-1);
        }

        public function __findTeacherButton_click(_arg_1:MouseEvent):void
        {
            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.IMPANEL_S[62], "", findTeacher, "");
        }

        public function set tabBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141554tabBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1554141554tabBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn5", _local_2, _arg_1));
            };
        }

        private function openMarriagePanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_MARRIAGE);
            if (!_local_1.visible)
            {
                _local_1.show();
            }
            else
            {
                _local_1.hide();
            };
        }

        public function ___IMPanel_BasicGlowButton7_click(_arg_1:MouseEvent):void
        {
            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.IMPANEL_S[67], "", findStudent, "");
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get newFriendButton():Button
        {
            return (this._1966193968newFriendButton);
        }

        public function set connectionList(_arg_1:List):void
        {
            var _local_2:Object = this._1269957788connectionList;
            if (_local_2 !== _arg_1)
            {
                this._1269957788connectionList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "connectionList", _local_2, _arg_1));
            };
        }

        private function _IMPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "level";
            _local_1.sortCompareFunction = levelSortFunc;
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn3", _IMPanel_DataGridColumn3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get blackList():List
        {
            return (this._1332059453blackList);
        }

        public function set btnReqAdd(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._551112863btnReqAdd;
            if (_local_2 !== _arg_1)
            {
                this._551112863btnReqAdd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnReqAdd", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stGrid():DataGrid
        {
            return (this._893258425stGrid);
        }

        private function connectionClick():void
        {
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}, {"label":GamePredef.MENU_ADDF}]);
        }

        public function reset():void
        {
            firstTimeFlag = true;
            tsInitialized = false;
            studentList = null;
        }

        private function delTeacher(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                if (_core.player.ti > 0)
                {
                    _core.remote.delTeacher();
                };
            };
        }

        private function addFriBtnClick():void
        {
            var _local_1:InputPanel = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
            _local_1.showInput(Language.IMPANEL_S[10], Language.IMPANEL_S[11], addFriend);
        }

        public function __reportButton_click(_arg_1:MouseEvent):void
        {
            reportTS();
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabClick(4);
        }

        private function _IMPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "class";
            _local_1.width = 60;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn2", _IMPanel_DataGridColumn2);
            return (_local_1);
        }

        public function initCP(_arg_1:Object):void
        {
            var _local_3:Array;
            var _local_4:*;
            var _local_5:String;
            var _local_6:String;
            var _local_2:* = "";
            if (!_arg_1)
            {
                if (loverInfoTA)
                {
                    loverInfoTA.htmlText = Language.IMPANEL_S[56];
                };
            }
            else
            {
                _local_3 = [];
                if (_core.player.gender == 0)
                {
                    _local_3[0] = _arg_1.femaleId;
                    _local_3[1] = _arg_1.femaleName;
                }
                else
                {
                    _local_3[0] = _arg_1.maleId;
                    _local_3[1] = _arg_1.maleName;
                };
                _core.player.cpid = _local_3[0];
                _local_4 = ((_local_3[0] + "|") + _local_3[1]);
                if (loverInfoTA)
                {
                    _local_5 = "";
                    _local_6 = String(_arg_1.time).substr(0, 10);
                    switch (Number(_arg_1.type))
                    {
                        case 1:
                            _local_5 = Language.ACTIVEPANEL_S[42];
                            break;
                        case 2:
                            _local_5 = Language.ACTIVEPANEL_S[43];
                            break;
                        case 3:
                            _local_5 = Language.ACTIVEPANEL_S[44];
                            break;
                        default:
                            _local_6 = "";
                    };
                    _local_2 = Language.IMPANEL_S[57];
                    _local_2 = _local_2.replace("{player.cp}", _local_4).replace("{arr[1]}", _local_3[1]);
                    _local_2 = (_local_2 + ("\n" + Language.IMPANEL_S[87].replace("{dateStr}", _local_6)));
                    _local_2 = (_local_2 + ("\n" + Language.IMPANEL_S[88].replace("{wedType}", _local_5)));
                    loverInfoTA.htmlText = _local_2;
                };
            };
        }

        private function addRelationship(_arg_1:String, _arg_2:int):void
        {
            _core.remote.addRelationByName(_arg_1, _arg_2);
        }

        [Bindable(event="propertyChange")]
        public function get brotherList():DataGrid
        {
            return (this._1413572990brotherList);
        }

        [Bindable(event="propertyChange")]
        public function get reportButton():BasicGlowButton
        {
            return (this._117682566reportButton);
        }

        public function set selfTeacherInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._260999996selfTeacherInfo;
            if (_local_2 !== _arg_1)
            {
                this._260999996selfTeacherInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfTeacherInfo", _local_2, _arg_1));
            };
        }

        private function friendClick(_arg_1:ListEvent):void
        {
            if (_arg_1.columnIndex == 5)
            {
                return;
            };
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}, {"label":GamePredef.GUILD_DEL}]);
        }

        public function __enemyList_itemClick(_arg_1:ListEvent):void
        {
            enemyClick(_arg_1);
        }

        public function onAddRelationship(_arg_1:Object):void
        {
            if (!relationShipList)
            {
                relationShipList = {};
            };
            relationShipList[_arg_1.id] = _arg_1;
            updateView();
            if (_arg_1.type == GamePredef.RELATIONSHIP_TYPE[0])
            {
                _core.sysMidNote((((((((GamePredef.SYS_MSG_ADDFRIEND + "[@") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.otherId) + "|") + _arg_1.name) + "|0|0|0]"));
            }
            else
            {
                if (_arg_1.type == GamePredef.RELATIONSHIP_TYPE[1])
                {
                    _core.sysMidNote((((((((GamePredef.SYS_MSG_ADDBLACK + "[@") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.otherId) + "|") + _arg_1.name) + "|0|0|0]"));
                }
                else
                {
                    if (_arg_1.type == GamePredef.RELATIONSHIP_TYPE[2])
                    {
                        _core.sysMidNote((((((((GamePredef.SYS_MSG_ADDENEMY + "[@") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.otherId) + "|") + _arg_1.name) + "|0|0|0]"));
                    };
                };
            };
        }

        private function getBlaNum():int
        {
            var _local_2:*;
            var _local_1:int;
            if (blackAR)
            {
                for each (_local_2 in blackAR)
                {
                    if (_local_2)
                    {
                        _local_1++;
                    };
                };
            };
            return (_local_1);
        }

        private function onUpTeacher(_arg_1:Object):void
        {
        }

        public function ___IMPanel_BasicGlowButton13_click(_arg_1:MouseEvent):void
        {
            openMarriagePanel();
        }

        public function ___IMPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_CHATMANAGER);
        }

        public function set upTeacherButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1323557593upTeacherButton;
            if (_local_2 !== _arg_1)
            {
                this._1323557593upTeacherButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upTeacherButton", _local_2, _arg_1));
            };
        }

        public function onSetClose(_arg_1:String, _arg_2:Number):void
        {
            if (((isFriend(_arg_1)) && (friendList)))
            {
                if (_arg_2 < 0)
                {
                    friendAR[_arg_1].num = (friendAR[_arg_1].num - -(_arg_2));
                }
                else
                {
                    friendAR[_arg_1].num = _arg_2;
                };
                friendList.dataProvider = friendAC;
            };
        }

        private function _IMPanel_DataGridColumn19_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn19 = _local_1;
            _local_1.dataField = "gnum";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn19", _IMPanel_DataGridColumn19);
            return (_local_1);
        }

        private function traceGroupTeam():void
        {
            if (isSameLine())
            {
                _core.player.closeTo((targetX * 10), (targetY * 10));
            }
            else
            {
                Alert.show(Language.IMPANEL_U[28].toString().replace("{line}", curItem["line"]), "");
            };
        }

        public function onReportTS(_arg_1:Object):void
        {
            var _local_2:* = "";
            if (_arg_1)
            {
                if (_arg_1.t == 1)
                {
                    _local_2 = Language.IMPANEL_S[49];
                    _local_2 = _local_2.replace("{charactor}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.i) + "|") + _arg_1.n) + "|0|0|0]")));
                    _core.sysMsg(_local_2);
                    _core.player.tp = _arg_1.tp;
                    if (((studentList) && (studentList[_arg_1.i])))
                    {
                        studentList[_arg_1.i].ll = _arg_1.ll;
                    };
                    updateViewTS();
                }
                else
                {
                    if (_arg_1.t == 2)
                    {
                        if (_arg_1.f == 1)
                        {
                            _core.sysMsg(Language.IMPANEL_S[51]);
                            _core.player.ll = _arg_1.ll;
                            updateViewTS();
                        }
                        else
                        {
                            if (_arg_1.f == 2)
                            {
                                _core.sysMsg(Language.IMPANEL_S[52]);
                            }
                            else
                            {
                                if (_arg_1.f == 3)
                                {
                                    _core.sysMsg(Language.IMPANEL_S[53]);
                                }
                                else
                                {
                                    if (_arg_1.f == 4)
                                    {
                                        _core.sysMsg(Language.IMPANEL_S[54]);
                                    }
                                    else
                                    {
                                        if (_arg_1.f == 5)
                                        {
                                            _core.sysMsg(Language.IMPANEL_S[55]);
                                        }
                                        else
                                        {
                                            if (_arg_1.f == 6)
                                            {
                                                _core.sysMsg(Language.IMPANEL_S[85]);
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

        private function _IMPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn1", _IMPanel_DataGridColumn1);
            return (_local_1);
        }

        private function qeuryGroupInfo():void
        {
        }

        public function ___IMPanel_Button2_click(_arg_1:MouseEvent):void
        {
            delFriBtnClick();
        }

        public function __blackList_itemClick(_arg_1:ListEvent):void
        {
            blackClick();
        }

        [Bindable(event="propertyChange")]
        public function get vTabNavigator():ViewStack
        {
            return (this._163943896vTabNavigator);
        }

        public function __newFriendButton_click(_arg_1:MouseEvent):void
        {
            addFriBtnClick();
        }

        private function delRelationship(id:Number, type:Number):void
        {
            var func:Function;
            var msgString:String;
            if (relationShipList[id])
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.delRelationship(id);
                    };
                };
                msgString = "";
                if (type == GamePredef.RELATIONSHIP_TYPE[0])
                {
                    msgString = Language.IMPANEL_S[71].toString();
                    msgString = msgString.replace("{relationShipListNum}", relationShipList[id].num);
                    msgString = msgString.replace("{relationShipListName}", relationShipList[id].name);
                }
                else
                {
                    if (type == GamePredef.RELATIONSHIP_TYPE[1])
                    {
                        msgString = Language.IMPANEL_S[83].toString();
                        msgString = msgString.replace("{relationShipListName}", relationShipList[id].name);
                    }
                    else
                    {
                        if (type == GamePredef.RELATIONSHIP_TYPE[2])
                        {
                            msgString = Language.IMPANEL_S[82].toString();
                            msgString = msgString.replace("{relationShipListName}", relationShipList[id].name);
                        };
                    };
                };
                Alert.show(msgString, "", (Alert.YES | Alert.NO), this, func);
            };
        }

        public function delEnemyBtnClick():void
        {
            if (enemyList.selectedItem)
            {
                delRelationship(enemyList.selectedItem.id, GamePredef.RELATIONSHIP_TYPE[2]);
            }
            else
            {
                Alert.show(Language.IMPANEL_S[81]);
            };
        }

        public function set loverInfoTA(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._554409723loverInfoTA;
            if (_local_2 !== _arg_1)
            {
                this._554409723loverInfoTA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loverInfoTA", _local_2, _arg_1));
            };
        }

        public function __friendList_itemClick(_arg_1:ListEvent):void
        {
            friendClick(_arg_1);
        }

        public function __newBlackButton_click(_arg_1:MouseEvent):void
        {
            addBlackBtnClick();
        }

        private function _IMPanel_DataGridColumn18_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn18 = _local_1;
            _local_1.dataField = "llevel";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn18", _IMPanel_DataGridColumn18);
            return (_local_1);
        }

        public function onDelRelationship(_arg_1:Number):void
        {
            if (relationShipList[_arg_1].type == GamePredef.RELATIONSHIP_TYPE[0])
            {
                _core.sysMidNote((((((((GamePredef.SYS_MSG_DELFRIEND + "[@") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + relationShipList[_arg_1].otherId) + "|") + relationShipList[_arg_1].name) + "|0|0|0]"));
            }
            else
            {
                if (relationShipList[_arg_1].type == GamePredef.RELATIONSHIP_TYPE[1])
                {
                    _core.sysMidNote((((((((GamePredef.SYS_MSG_DELBLACK + "[@") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + relationShipList[_arg_1].otherId) + "|") + relationShipList[_arg_1].name) + "|0|0|0]"));
                }
                else
                {
                    if (relationShipList[_arg_1].type == GamePredef.RELATIONSHIP_TYPE[2])
                    {
                        _core.sysMidNote((((((((GamePredef.SYS_MSG_DELENEMY + "[@") + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + relationShipList[_arg_1].otherId) + "|") + relationShipList[_arg_1].name) + "|0|0|0]"));
                    };
                };
            };
            delete relationShipList[_arg_1];
            updateView();
        }

        public function __btnReqAdd_click(_arg_1:MouseEvent):void
        {
            reqAddGroup();
        }

        public function updateViewTS():void
        {
            var _local_3:int;
            var _local_4:ArrayCollection;
            var _local_5:Object;
            var _local_6:Array;
            var _local_1:* = "";
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (_core.player.ti > 0)
            {
                _local_3 = _core.player.ll.split("|")[0];
                teacherInfo.htmlText = ((((((((Language.IMPANEL_S[16] + _core.player.tn) + "<br>") + Language.IMPANEL_S[17]) + _local_3) + "<br>") + Language.IMPANEL_S[18]) + _core.player.level) + "<br>");
                reportButton.visible = true;
                if (_core.player.level > _local_3)
                {
                    reportButton.enabled = true;
                }
                else
                {
                    reportButton.enabled = false;
                };
                delTeacherButton.visible = true;
                delTeacherButton.includeInLayout = true;
                findTeacherButton.visible = false;
                findTeacherButton.includeInLayout = false;
            }
            else
            {
                teacherInfo.htmlText = Language.IMPANEL_S[19];
                reportButton.visible = false;
                delTeacherButton.visible = false;
                delTeacherButton.includeInLayout = false;
                findTeacherButton.visible = true;
                findTeacherButton.includeInLayout = true;
            };
            _local_1 = Language.IMPANEL_S[20];
            _local_1 = _local_1.replace("{teacherTitle}", GamePredef.TEACHER_TITLE[_core.player.tl]);
            _local_1 = _local_1.replace("{player.tp}", _core.player.tp);
            selfTeacherInfo.htmlText = _local_1.replace("{studentNum}", GamePredef.STUDENT_NUM[_core.player.tl]);
            var _local_2:* = "";
            if (((_core.player.tl > 0) && (_core.player.tl < 6)))
            {
                upTeacherButton.visible = true;
                switch (_core.player.tl)
                {
                    case 1:
                        _local_2 = Language.IMPANEL_S[23];
                        if (_core.player.tp >= 200000)
                        {
                            upTeacherButton.enabled = true;
                        }
                        else
                        {
                            upTeacherButton.enabled = false;
                        };
                        break;
                    case 2:
                        _local_2 = Language.IMPANEL_S[24];
                        if (_core.player.tp >= 800000)
                        {
                            upTeacherButton.enabled = true;
                        }
                        else
                        {
                            upTeacherButton.enabled = false;
                        };
                        break;
                    case 3:
                        _local_2 = Language.IMPANEL_S[25];
                        if (_core.player.tp >= 20000000)
                        {
                            upTeacherButton.enabled = true;
                        }
                        else
                        {
                            upTeacherButton.enabled = false;
                        };
                        break;
                    case 4:
                        _local_2 = Language.IMPANEL_S[26];
                        if (_core.player.tp >= 200000000)
                        {
                            upTeacherButton.enabled = true;
                        }
                        else
                        {
                            upTeacherButton.enabled = false;
                        };
                        break;
                    case 5:
                        _local_2 = Language.IMPANEL_S[27];
                        if (_core.player.tp >= 0x3B9ACA00)
                        {
                            upTeacherButton.enabled = true;
                        }
                        else
                        {
                            upTeacherButton.enabled = false;
                        };
                        break;
                    case 6:
                        upTeacherButton.visible = true;
                        break;
                };
            }
            else
            {
                upTeacherButton.visible = false;
            };
            upTeacherButton.toolTip = _local_2;
            if (studentList)
            {
                _local_4 = new ArrayCollection();
                for each (_local_5 in studentList)
                {
                    if (_local_5)
                    {
                        _local_6 = _local_5.ll.split("|");
                        _local_4.addItem({
                            "data":_local_5,
                            "name":_local_5.name,
                            "lastLevel":_local_6[0],
                            "exp":_local_6[1],
                            "honor":_local_5.honor
                        });
                    };
                };
                stGrid.dataProvider = _local_4;
            }
            else
            {
                stGrid.dataProvider = null;
            };
        }

        public function set tsTabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._541082870tsTabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._541082870tsTabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tsTabBtn0", _local_2, _arg_1));
            };
        }

        public function set tsTabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._541082869tsTabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._541082869tsTabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tsTabBtn1", _local_2, _arg_1));
            };
        }

        public function __connectionList_itemClick(_arg_1:ListEvent):void
        {
            connectionClick();
        }

        private function _IMPanel_DataGridColumn17_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn17 = _local_1;
            _local_1.dataField = "lname";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn17", _IMPanel_DataGridColumn17);
            return (_local_1);
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabClick(3);
        }

        public function set newEnemyButton(_arg_1:Button):void
        {
            var _local_2:Object = this._96327450newEnemyButton;
            if (_local_2 !== _arg_1)
            {
                this._96327450newEnemyButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newEnemyButton", _local_2, _arg_1));
            };
        }

        private function findStudent(_arg_1:String):void
        {
            if (_core.player.tl > 0)
            {
                _core.remote.call("findStudent", new Responder(onFindStudent), _arg_1);
            }
            else
            {
                _core.sysMsg(Language.IMPANEL_S[37]);
            };
        }

        public function set tsViewStack(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1302685476tsViewStack;
            if (_local_2 !== _arg_1)
            {
                this._1302685476tsViewStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tsViewStack", _local_2, _arg_1));
            };
        }

        public function onInitTS(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                studentList = {};
                for each (_local_2 in _arg_1)
                {
                    if (_local_2)
                    {
                        studentList[_local_2.id] = _local_2;
                    };
                };
                tsInitialized = true;
                updateViewTS();
            };
        }

        [Bindable(event="propertyChange")]
        public function get newBlackButton():Button
        {
            return (this._436740689newBlackButton);
        }

        public function ___IMPanel_BasicGlowButton12_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_CHATMANAGER);
        }

        public function set newFriendButton(_arg_1:Button):void
        {
            var _local_2:Object = this._1966193968newFriendButton;
            if (_local_2 !== _arg_1)
            {
                this._1966193968newFriendButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newFriendButton", _local_2, _arg_1));
            };
        }

        private function _IMPanel_DataGridColumn16_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn16 = _local_1;
            _local_1.width = 70;
            _local_1.dataField = "map";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn16", _IMPanel_DataGridColumn16);
            return (_local_1);
        }

        public function set blackList(_arg_1:List):void
        {
            var _local_2:Object = this._1332059453blackList;
            if (_local_2 !== _arg_1)
            {
                this._1332059453blackList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "blackList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        private function addBlackBtnClick():void
        {
            var _local_1:InputPanel = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
            _local_1.showInput(Language.IMPANEL_S[12], Language.IMPANEL_S[13], addBlack);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicGlowButton
        {
            return (this._1554141555tabBtn4);
        }

        public function set stGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._893258425stGrid;
            if (_local_2 !== _arg_1)
            {
                this._893258425stGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stGrid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn6():BasicGlowButton
        {
            return (this._1554141553tabBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn7():BasicGlowButton
        {
            return (this._1554141552tabBtn7);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        private function tsTabClick(_arg_1:uint):void
        {
            tsViewStack.selectedIndex = _arg_1;
            tsTabBtn0.selected = false;
            tsTabBtn1.selected = false;
            this[("tsTabBtn" + _arg_1)].selected = true;
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn5():BasicGlowButton
        {
            return (this._1554141554tabBtn5);
        }

        public function addFriend(_arg_1:String):void
        {
            var _local_2:* = "";
            if (isBlack(_arg_1))
            {
                Alert.show(Language.IMPANEL_S[0], "", Alert.OK);
            }
            else
            {
                if (!friendAR)
                {
                    friendAR = {};
                };
                if (!friendAR[_arg_1])
                {
                    if (getFriNum() < GamePredef.RELATIONSHIP_SIZE[0])
                    {
                        addRelationship(_arg_1, GamePredef.RELATIONSHIP_TYPE[0]);
                    }
                    else
                    {
                        _local_2 = Language.IMPANEL_S[1];
                        _local_2 = _local_2.replace("{num}", GamePredef.RELATIONSHIP_SIZE[0]);
                        Alert.show(_local_2, "", Alert.OK);
                    };
                }
                else
                {
                    Alert.show(Language.IMPANEL_S[3], "", Alert.OK);
                };
            };
        }

        public function ___IMPanel_BasicGlowButton17_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        private function _IMPanel_DataGridColumn15_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn15 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "line";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn15", _IMPanel_DataGridColumn15);
            return (_local_1);
        }

        private function reportTS():void
        {
            var _local_1:int;
            if (_core.player.ti > 0)
            {
                _local_1 = _core.player.ll.split("|")[0];
                if (_core.player.level > _local_1)
                {
                    _core.remote.call("reportTS", new Responder(onReportTS));
                };
            };
        }

        public function addConnectionAC(_arg_1:Object):void
        {
            if (connectionAR[_arg_1.id] == null)
            {
                if (connectionAC.length < GamePredef.RELATIONSHIP_SIZE[2])
                {
                    connectionAC.addItem(_arg_1);
                    connectionAR[_arg_1.id] = _arg_1;
                }
                else
                {
                    connectionAR[connectionAC.source.shift().id] = null;
                    delete connectionAR[_arg_1.id];
                    connectionAC.addItem(_arg_1);
                    connectionAR[_arg_1.id] = _arg_1;
                };
                updateView();
            };
        }

        public function ___IMPanel_Button6_click(_arg_1:MouseEvent):void
        {
            delEnemyBtnClick();
        }

        private function _IMPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_IMPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas1.label = _arg_1;
            }, "_IMPanel_SimpleCanvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn1.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn1.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn2.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn2.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[73];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn3.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn3.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[74];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn4.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn4.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[60];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn5.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn5.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[90];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn6.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn6.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton1.label = _arg_1;
            }, "_IMPanel_BasicGlowButton1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas2.label = _arg_1;
            }, "_IMPanel_SimpleCanvas2.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton2.label = _arg_1;
            }, "_IMPanel_BasicGlowButton2.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas3.label = _arg_1;
            }, "_IMPanel_SimpleCanvas3.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton3.label = _arg_1;
            }, "_IMPanel_BasicGlowButton3.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas4.label = _arg_1;
            }, "_IMPanel_SimpleCanvas4.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas5.label = _arg_1;
            }, "_IMPanel_SimpleCanvas5.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reportButton.label = _arg_1;
            }, "reportButton.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                delTeacherButton.label = _arg_1;
            }, "delTeacherButton.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                findTeacherButton.label = _arg_1;
            }, "findTeacherButton.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas6.label = _arg_1;
            }, "_IMPanel_SimpleCanvas6.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[63];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn7.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn7.headerText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[64];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn8.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn8.headerText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[65];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn9.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn9.headerText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton7.label = _arg_1;
            }, "_IMPanel_BasicGlowButton7.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upTeacherButton.toolTip = _arg_1;
            }, "upTeacherButton.toolTip");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upTeacherButton.label = _arg_1;
            }, "upTeacherButton.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tsTabBtn0.label = _arg_1;
            }, "tsTabBtn0.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tsTabBtn1.label = _arg_1;
            }, "tsTabBtn1.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton11.label = _arg_1;
            }, "_IMPanel_BasicGlowButton11.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas7.label = _arg_1;
            }, "_IMPanel_SimpleCanvas7.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton12.label = _arg_1;
            }, "_IMPanel_BasicGlowButton12.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton13.label = _arg_1;
            }, "_IMPanel_BasicGlowButton13.label");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas8.label = _arg_1;
            }, "_IMPanel_SimpleCanvas8.label");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[75];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn10.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn10.headerText");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn11.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn11.headerText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[73];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn12.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn12.headerText");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[74];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn13.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn13.headerText");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[76];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn14.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn14.headerText");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton14.label = _arg_1;
            }, "_IMPanel_BasicGlowButton14.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas9.label = _arg_1;
            }, "_IMPanel_SimpleCanvas9.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn15.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn15.headerText");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn16.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn16.headerText");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn17.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn17.headerText");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn18.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn18.headerText");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn19.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn19.headerText");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn20.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn20.headerText");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnReqAdd.label = _arg_1;
            }, "btnReqAdd.label");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnQuery.label = _arg_1;
            }, "btnQuery.label");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicDelayButton1.label = _arg_1;
            }, "_IMPanel_BasicDelayButton1.label");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_BasicGlowButton17.label = _arg_1;
            }, "_IMPanel_BasicGlowButton17.label");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_SimpleCanvas10.label = _arg_1;
            }, "_IMPanel_SimpleCanvas10.label");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[89];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn21.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn21.headerText");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn22.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn22.headerText");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[73];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn23.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn23.headerText");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[74];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn24.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn24.headerText");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_S[60];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _IMPanel_DataGridColumn25.headerText = _arg_1;
            }, "_IMPanel_DataGridColumn25.headerText");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn5.label = _arg_1;
            }, "tabBtn5.label");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn6.label = _arg_1;
            }, "tabBtn6.label");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.IMPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn7.label = _arg_1;
            }, "tabBtn7.label");
            result[62] = binding;
            return (result);
        }

        public function set delTeacherButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1185989481delTeacherButton;
            if (_local_2 !== _arg_1)
            {
                this._1185989481delTeacherButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delTeacherButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upTeacherButton():BasicGlowButton
        {
            return (this._1323557593upTeacherButton);
        }

        public function enemyClick(_arg_1:ListEvent):void
        {
            if (_arg_1.columnIndex == 4)
            {
                return;
            };
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}, {"label":GamePredef.GUILD_DEL}]);
        }

        public function onFindStudent(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (_arg_1.t == 1)
                {
                    if (_arg_1.f == 1)
                    {
                        _core.sysMsg(Language.IMPANEL_S[38]);
                    }
                    else
                    {
                        if (_arg_1.f == 2)
                        {
                            _core.sysMsg(Language.IMPANEL_S[39]);
                        }
                        else
                        {
                            if (_arg_1.f == 3)
                            {
                                _core.sysMsg(Language.IMPANEL_S[40]);
                            }
                            else
                            {
                                if (_arg_1.f == 4)
                                {
                                    _core.sysMsg(Language.IMPANEL_S[41]);
                                }
                                else
                                {
                                    if (_arg_1.f == 5)
                                    {
                                        _core.sysMsg(Language.IMPANEL_S[42]);
                                    }
                                    else
                                    {
                                        if (_arg_1.f == 6)
                                        {
                                            _core.sysMsg(Language.IMPANEL_S[43]);
                                        }
                                        else
                                        {
                                            if (_arg_1.f == 7)
                                            {
                                                _core.sysMsg(Language.IMPANEL_S[44]);
                                            }
                                            else
                                            {
                                                if (_arg_1.f == 8)
                                                {
                                                    _core.sysMsg(Language.IMPANEL_S[86]);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    if (_arg_1.t == 2)
                    {
                        _core.addWarn({
                            "warnType":GamePredef.WARN_TYPE_FINDSTUDENT,
                            "teacherId":_arg_1.i,
                            "teacherName":_arg_1.n
                        });
                    };
                };
            };
        }

        private function _IMPanel_DataGridColumn14_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn14 = _local_1;
            _local_1.dataField = "revenge";
            _local_1.itemRenderer = _IMPanel_ClassFactory2_c();
            _local_1.width = 60;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn14", _IMPanel_DataGridColumn14);
            return (_local_1);
        }

        private function tabClick(_arg_1:uint):void
        {
            vTabNavigator.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < panelNum)
            {
                this[("tabBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("tabBtn" + _arg_1)].selected = true;
            if (_arg_1 == 3)
            {
                if (!tsInitialized)
                {
                    initTS();
                }
                else
                {
                    updateViewTS();
                };
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        [Bindable(event="propertyChange")]
        public function get loverInfoTA():LinkTextArea
        {
            return (this._554409723loverInfoTA);
        }

        public function set brotherList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1413572990brotherList;
            if (_local_2 !== _arg_1)
            {
                this._1413572990brotherList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "brotherList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tsTabBtn0():BasicGlowButton
        {
            return (this._541082870tsTabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tsTabBtn1():BasicGlowButton
        {
            return (this._541082869tsTabBtn1);
        }

        public function set reportButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._117682566reportButton;
            if (_local_2 !== _arg_1)
            {
                this._117682566reportButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reportButton", _local_2, _arg_1));
            };
        }

        private function _IMPanel_DataGridColumn25_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn25 = _local_1;
            _local_1.dataField = "num";
            _local_1.sortCompareFunction = friendlySortFunc;
            _local_1.width = 65;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn25", _IMPanel_DataGridColumn25);
            return (_local_1);
        }

        private function wisperChat(_arg_1:String):void
        {
            _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(_arg_1);
        }

        public function updateView():void
        {
            var _local_2:*;
            friendAR = {};
            friendAC = new ArrayCollection();
            blackAR = {};
            blackAC = new ArrayCollection();
            enemyAR = {};
            enemyAC = new ArrayCollection();
            tutorAR = {};
            tutorAC = new ArrayCollection();
            brotherAC = new ArrayCollection();
            if (relationShipList != null)
            {
                for each (_local_2 in relationShipList)
                {
                    if (((!(_local_2 == undefined)) && (!(_local_2 == null))))
                    {
                        _local_2["level"] = null;
                        _local_2["class"] = null;
                        if (((_local_2.type == GamePredef.RELATIONSHIP_TYPE[0]) || (_local_2.type == GamePredef.RELATIONSHIP_TYPE[5])))
                        {
                            if (_local_2.data)
                            {
                                _local_2["level"] = String(_core.basic.expToLevel(_local_2["data"]["exp"]));
                                _local_2["class"] = GameData.d[GamePredef.TBL_CLASS][_local_2["data"]["classId"]].name;
                                _local_2["state"] = Language.IMPANEL_S[69];
                            }
                            else
                            {
                                _local_2["state"] = Language.IMPANEL_S[70];
                            };
                            _local_2["isFriend"] = true;
                            _local_2["revenge"] = _local_2;
                            friendAC.addItem(_local_2);
                            friendAR[_local_2.name] = _local_2;
                        }
                        else
                        {
                            if (_local_2.type == GamePredef.RELATIONSHIP_TYPE[1])
                            {
                                blackAC.addItem(_local_2);
                                blackAR[_local_2.name] = _local_2;
                            }
                            else
                            {
                                if (_local_2.type == GamePredef.RELATIONSHIP_TYPE[2])
                                {
                                    if (_local_2.data)
                                    {
                                        _local_2["level"] = String(_core.basic.expToLevel(_local_2["data"]["exp"]));
                                        _local_2["class"] = GameData.d[GamePredef.TBL_CLASS][_local_2["data"]["classId"]].name;
                                        _local_2["state"] = Language.IMPANEL_S[69];
                                    }
                                    else
                                    {
                                        _local_2["state"] = Language.IMPANEL_S[70];
                                    };
                                    _local_2["revenge"] = _local_2;
                                    enemyAC.addItem(_local_2);
                                    enemyAR[_local_2.name] = _local_2;
                                }
                                else
                                {
                                    if (_local_2.type == GamePredef.RELATIONSHIP_TYPE[4])
                                    {
                                        if (_local_2.data)
                                        {
                                            _local_2["level"] = String(_core.basic.expToLevel(_local_2["data"]["exp"]));
                                            _local_2["class"] = GameData.d[GamePredef.TBL_CLASS][_local_2["data"]["classId"]].name;
                                            _local_2["state"] = Language.IMPANEL_S[69];
                                        }
                                        else
                                        {
                                            _local_2["state"] = Language.IMPANEL_S[70];
                                        };
                                        tutorAC.addItem(_local_2);
                                        tutorAR[_local_2.name] = _local_2;
                                    };
                                };
                            };
                        };
                        if (_local_2.type == GamePredef.RELATIONSHIP_TYPE[5])
                        {
                            if (_local_2.data)
                            {
                                _local_2["level"] = String(_core.basic.expToLevel(_local_2["data"]["exp"]));
                                _local_2["class"] = GameData.d[GamePredef.TBL_CLASS][_local_2["data"]["classId"]].name;
                                _local_2["state"] = Language.IMPANEL_S[69];
                            }
                            else
                            {
                                _local_2["state"] = Language.IMPANEL_S[70];
                            };
                            brotherAC.addItem(_local_2);
                        };
                    };
                };
            };
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            friendList.dataProvider = friendAC;
            blackList.dataProvider = blackAC;
            connectionList.dataProvider = connectionAC;
            enemyList.dataProvider = enemyAC;
            brotherList.dataProvider = brotherAC;
            var _local_1:DataGridEvent = new DataGridEvent(DataGridEvent.HEADER_RELEASE, false, true, 3, "state", 0, null, null, 0);
            friendList.dispatchEvent(_local_1);
        }

        private function _IMPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.IMPANEL_U[14];
            _local_1 = Language.IMPANEL_U[7];
            _local_1 = Language.IMPANEL_S[59];
            _local_1 = Language.IMPANEL_S[72];
            _local_1 = Language.IMPANEL_S[73];
            _local_1 = Language.IMPANEL_S[74];
            _local_1 = Language.IMPANEL_S[60];
            _local_1 = Language.IMPANEL_S[90];
            _local_1 = Language.IMPANEL_U[15];
            _local_1 = Language.IMPANEL_U[8];
            _local_1 = Language.IMPANEL_U[15];
            _local_1 = Language.IMPANEL_U[9];
            _local_1 = Language.IMPANEL_U[15];
            _local_1 = Language.IMPANEL_U[10];
            _local_1 = Language.IMPANEL_U[5];
            _local_1 = Language.IMPANEL_U[0];
            _local_1 = Language.IMPANEL_U[1];
            _local_1 = Language.IMPANEL_U[2];
            _local_1 = Language.IMPANEL_U[6];
            _local_1 = Language.IMPANEL_S[63];
            _local_1 = Language.IMPANEL_S[64];
            _local_1 = Language.IMPANEL_S[65];
            _local_1 = Language.IMPANEL_U[3];
            _local_1 = Language.IMPANEL_S[68];
            _local_1 = Language.IMPANEL_U[4];
            _local_1 = Language.IMPANEL_U[5];
            _local_1 = Language.IMPANEL_U[6];
            _local_1 = Language.IMPANEL_U[15];
            _local_1 = Language.IMPANEL_U[11];
            _local_1 = Language.IMPANEL_U[15];
            _local_1 = Language.IMPANEL_U[32];
            _local_1 = Language.IMPANEL_U[12];
            _local_1 = Language.IMPANEL_S[75];
            _local_1 = Language.IMPANEL_S[72];
            _local_1 = Language.IMPANEL_S[73];
            _local_1 = Language.IMPANEL_S[74];
            _local_1 = Language.IMPANEL_S[76];
            _local_1 = Language.IMPANEL_U[15];
            _local_1 = Language.IMPANEL_U[31];
            _local_1 = Language.IMPANEL_U[17];
            _local_1 = Language.IMPANEL_U[18];
            _local_1 = Language.IMPANEL_U[19];
            _local_1 = Language.IMPANEL_U[20];
            _local_1 = Language.IMPANEL_U[21];
            _local_1 = Language.IMPANEL_U[22];
            _local_1 = Language.IMPANEL_U[23];
            _local_1 = Language.IMPANEL_U[25];
            _local_1 = Language.IMPANEL_U[24];
            _local_1 = Language.IMPANEL_U[26];
            _local_1 = Language.IMPANEL_U[33];
            _local_1 = Language.IMPANEL_S[89];
            _local_1 = Language.IMPANEL_S[72];
            _local_1 = Language.IMPANEL_S[73];
            _local_1 = Language.IMPANEL_S[74];
            _local_1 = Language.IMPANEL_S[60];
            _local_1 = Language.IMPANEL_U[7];
            _local_1 = Language.IMPANEL_U[8];
            _local_1 = Language.IMPANEL_U[9];
            _local_1 = Language.IMPANEL_U[10];
            _local_1 = Language.IMPANEL_U[11];
            _local_1 = Language.IMPANEL_U[12];
            _local_1 = Language.IMPANEL_U[16];
            _local_1 = Language.IMPANEL_U[33];
        }

        public function ___IMPanel_BasicGlowButton11_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_CHATMANAGER);
        }

        [Bindable(event="propertyChange")]
        public function get newEnemyButton():Button
        {
            return (this._96327450newEnemyButton);
        }

        private function refreshGroupList():void
        {
            initGroupList();
        }

        [Bindable(event="propertyChange")]
        public function get tsViewStack():ViewStack
        {
            return (this._1302685476tsViewStack);
        }

        private function _IMPanel_DataGridColumn13_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn13 = _local_1;
            _local_1.dataField = "state";
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn13", _IMPanel_DataGridColumn13);
            return (_local_1);
        }

        public function __btnQuery_click(_arg_1:MouseEvent):void
        {
            qeuryGroupInfo();
        }

        public function __tabBtn7_click(_arg_1:MouseEvent):void
        {
            tabClick(7);
        }

        private function friendlySortFunc(_arg_1:Object, _arg_2:Object):int
        {
            if (int(_arg_1.num) > int(_arg_2.num))
            {
                return (1);
            };
            if (int(_arg_1.num) == int(_arg_2.num))
            {
                return (0);
            };
            return (-1);
        }

        private function _IMPanel_DataGridColumn24_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn24 = _local_1;
            _local_1.dataField = "state";
            _local_1.sortDescending = true;
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn24", _IMPanel_DataGridColumn24);
            return (_local_1);
        }

        private function delBlackBtnClick():void
        {
            if (blackList.selectedItem)
            {
                delRelationship(blackList.selectedItem.id, GamePredef.RELATIONSHIP_TYPE[1]);
            }
            else
            {
                Alert.show(Language.IMPANEL_S[15]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get delTeacherButton():BasicGlowButton
        {
            return (this._1185989481delTeacherButton);
        }

        public function addEnemy(_arg_1:String):void
        {
            var _local_2:String;
            if (!isEnemy(_arg_1))
            {
                if (getEneNum() < GamePredef.RELATIONSHIP_SIZE[3])
                {
                    addRelationship(_arg_1, GamePredef.RELATIONSHIP_TYPE[2]);
                }
                else
                {
                    _local_2 = Language.IMPANEL_S[80].toString().replace("{number}", GamePredef.RELATIONSHIP_SIZE[3]);
                    Alert.show(_local_2, "", Alert.OK);
                };
            }
            else
            {
                Alert.show(Language.IMPANEL_S[79], "", Alert.OK);
            };
        }

        private function _IMPanel_DataGridColumn12_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn12 = _local_1;
            _local_1.dataField = "level";
            _local_1.sortCompareFunction = levelSortFunc;
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn12", _IMPanel_DataGridColumn12);
            return (_local_1);
        }

        public function __tsTabBtn1_click(_arg_1:MouseEvent):void
        {
            tsTabClick(1);
        }

        public function set teacherInfo(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1659364272teacherInfo;
            if (_local_2 !== _arg_1)
            {
                this._1659364272teacherInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "teacherInfo", _local_2, _arg_1));
            };
        }

        public function set groupList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1483226179groupList;
            if (_local_2 !== _arg_1)
            {
                this._1483226179groupList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupList", _local_2, _arg_1));
            };
        }

        public function onAddRelationByName(_arg_1:Number, _arg_2:int):void
        {
            if (_arg_1 == -1)
            {
                Alert.show(Language.IMPANEL_S[9], "", Alert.OK);
            };
        }

        private function _IMPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = EnemyHBox;
            return (_local_1);
        }

        private function _IMPanel_DataGridColumn23_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn23 = _local_1;
            _local_1.dataField = "level";
            _local_1.sortCompareFunction = levelSortFunc;
            _local_1.width = 50;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn23", _IMPanel_DataGridColumn23);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:IMPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _IMPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_IMPanelWatcherSetupUtil");
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

        private function initTS():void
        {
            _core.remote.initTS();
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            if (vTabNavigator.selectedIndex == 0)
            {
                initView();
                if (!friendList.selectedItem)
                {
                    return;
                };
                if (_arg_1.index == 0)
                {
                    wisperChat(friendList.selectedItem.name);
                }
                else
                {
                    if (_arg_1.index == 1)
                    {
                        ChatPanelUtil.createChatPanel(friendList.selectedItem.otherId);
                    }
                    else
                    {
                        if (_arg_1.index == 2)
                        {
                            _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(friendList.selectedItem.otherId);
                        }
                        else
                        {
                            if (_arg_1.index == 3)
                            {
                                delRelationship(friendList.selectedItem.id, GamePredef.RELATIONSHIP_TYPE[0]);
                            };
                        };
                    };
                };
            }
            else
            {
                if (vTabNavigator.selectedIndex == 1)
                {
                    if (!blackList.selectedItem)
                    {
                        return;
                    };
                    if (_arg_1.index == 0)
                    {
                        _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(blackList.selectedItem.otherId);
                    }
                    else
                    {
                        if (_arg_1.index == 1)
                        {
                            delRelationship(blackList.selectedItem.id, GamePredef.RELATIONSHIP_TYPE[1]);
                        };
                    };
                }
                else
                {
                    if (vTabNavigator.selectedIndex == 2)
                    {
                        if (_arg_1.index == 0)
                        {
                            wisperChat(connectionList.selectedItem.name);
                        }
                        else
                        {
                            if (_arg_1.index == 1)
                            {
                                ChatPanelUtil.createChatPanel(connectionList.selectedItem.id);
                            }
                            else
                            {
                                if (_arg_1.index == 2)
                                {
                                    _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(connectionList.selectedItem.id);
                                }
                                else
                                {
                                    if (_arg_1.index == 3)
                                    {
                                        addFriend(connectionList.selectedItem.name);
                                    };
                                };
                            };
                        };
                    }
                    else
                    {
                        if (vTabNavigator.selectedIndex == 3)
                        {
                            if (_arg_1.index == 0)
                            {
                                _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(stGrid.selectedItem.name);
                            }
                            else
                            {
                                if (_arg_1.index == 1)
                                {
                                    ChatPanelUtil.createChatPanel(stGrid.selectedItem.data.id);
                                }
                                else
                                {
                                    if (_arg_1.index == 2)
                                    {
                                        _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(stGrid.selectedItem.data.id);
                                    }
                                    else
                                    {
                                        if (_arg_1.item.flag == "delST")
                                        {
                                            Alert.show(Language.IMPANEL_S[8], "", 3, this, delST);
                                        };
                                    };
                                };
                            };
                        }
                        else
                        {
                            if (vTabNavigator.selectedIndex == 5)
                            {
                                initView();
                                if (!enemyList.selectedItem)
                                {
                                    return;
                                };
                                if (_arg_1.index == 0)
                                {
                                    wisperChat(enemyList.selectedItem.name);
                                }
                                else
                                {
                                    if (_arg_1.index == 1)
                                    {
                                        ChatPanelUtil.createChatPanel(enemyList.selectedItem.otherId);
                                    }
                                    else
                                    {
                                        if (_arg_1.index == 2)
                                        {
                                            _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(enemyList.selectedItem.otherId);
                                        }
                                        else
                                        {
                                            if (_arg_1.index == 3)
                                            {
                                                delRelationship(enemyList.selectedItem.id, GamePredef.RELATIONSHIP_TYPE[2]);
                                            };
                                        };
                                    };
                                };
                            }
                            else
                            {
                                if (vTabNavigator.selectedIndex == 6)
                                {
                                    traceGroupTeam();
                                }
                                else
                                {
                                    if (vTabNavigator.selectedIndex == 7)
                                    {
                                        initView();
                                        if (!brotherList.selectedItem)
                                        {
                                            return;
                                        };
                                        if (_arg_1.index == 0)
                                        {
                                            wisperChat(brotherList.selectedItem.name);
                                        }
                                        else
                                        {
                                            if (_arg_1.index == 1)
                                            {
                                                ChatPanelUtil.createChatPanel(brotherList.selectedItem.otherId);
                                            }
                                            else
                                            {
                                                if (_arg_1.index == 2)
                                                {
                                                    _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(brotherList.selectedItem.otherId);
                                                }
                                                else
                                                {
                                                    if (_arg_1.index == 3)
                                                    {
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
            };
            Menu(_arg_1.target).removeEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        private function addRelationByName(_arg_1:String, _arg_2:int):void
        {
            _core.remote.addRelationByName(_arg_1, _arg_2);
        }

        private function stClick():void
        {
            var _local_1:Array;
            if (((stGrid) && (stGrid.selectedItem)))
            {
                _local_1 = [];
                _local_1.push({"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO});
                _local_1.push({"type":"separator"}, {
                    "label":Language.IMPANEL_S[28],
                    "flag":"delST"
                });
                menuPop(_local_1);
            };
        }

        private function delST(_arg_1:CloseEvent):void
        {
            if (((_arg_1.detail == Alert.YES) && (stGrid.selectedItem)))
            {
                _core.remote.delST(stGrid.selectedItem.data.id);
            };
        }

        private function _IMPanel_DataGridColumn11_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn11 = _local_1;
            _local_1.dataField = "class";
            _local_1.width = 60;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn11", _IMPanel_DataGridColumn11);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get teacherInfo():TextArea
        {
            return (this._1659364272teacherInfo);
        }

        public function onMakeTS(_arg_1:Object):void
        {
            var _local_2:* = "";
            if (_arg_1)
            {
                if (_arg_1.t == 1)
                {
                    _local_2 = Language.IMPANEL_S[45];
                    _local_2 = _local_2.replace("{charactor}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.i) + "|") + _arg_1.n) + "|0|0|0]")));
                    _core.sysMsg(_local_2);
                    if (!studentList)
                    {
                        studentList = {};
                    };
                    studentList[_arg_1.i] = {};
                    studentList[_arg_1.i].id = _arg_1.i;
                    studentList[_arg_1.i].name = _arg_1.n;
                    studentList[_arg_1.i].ll = (_arg_1.l + "|0");
                    studentList[_arg_1.i].honor = 0;
                }
                else
                {
                    if (_arg_1.t == 2)
                    {
                        _local_2 = Language.IMPANEL_S[47];
                        _local_2 = _local_2.replace("{charactor}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.i) + "|") + _arg_1.n) + "|0|0|0]")));
                        _core.sysMsg(_local_2);
                        _core.player.ti = _arg_1.i;
                        _core.player.tn = _arg_1.n;
                        _core.player.ll = (_arg_1.l + "|0");
                    };
                };
                updateViewTS();
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get groupList():DataGrid
        {
            return (this._1483226179groupList);
        }

        private function delFriBtnClick():void
        {
            if (friendList.selectedItem)
            {
                delRelationship(friendList.selectedItem.id, GamePredef.RELATIONSHIP_TYPE[0]);
            }
            else
            {
                Alert.show(Language.IMPANEL_S[14]);
            };
        }

        private function _IMPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn9 = _local_1;
            _local_1.dataField = "exp";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn9", _IMPanel_DataGridColumn9);
            return (_local_1);
        }

        private function _IMPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = EnemyHBox;
            return (_local_1);
        }

        public function set vTabNavigator(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._163943896vTabNavigator;
            if (_local_2 !== _arg_1)
            {
                this._163943896vTabNavigator = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vTabNavigator", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnQuery():BasicGlowButton
        {
            return (this._2095530956btnQuery);
        }

        public function set btnQuery(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2095530956btnQuery;
            if (_local_2 !== _arg_1)
            {
                this._2095530956btnQuery = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnQuery", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.initViewImC();
            btnQuery.enabled = false;
            btnReqAdd.enabled = false;
        }

        private function _IMPanel_DataGridColumn22_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn22 = _local_1;
            _local_1.dataField = "class";
            _local_1.width = 60;
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn22", _IMPanel_DataGridColumn22);
            return (_local_1);
        }

        public function addBlack(_arg_1:String):void
        {
            var _local_2:* = "";
            if (isFriend(_arg_1))
            {
                Alert.show(Language.IMPANEL_S[4], "", Alert.OK);
            }
            else
            {
                if (!blackAR)
                {
                    blackAR = {};
                };
                if (!blackAR[_arg_1])
                {
                    if (getBlaNum() < GamePredef.RELATIONSHIP_SIZE[1])
                    {
                        addRelationship(_arg_1, GamePredef.RELATIONSHIP_TYPE[1]);
                    }
                    else
                    {
                        _local_2 = Language.IMPANEL_S[5];
                        _local_2 = _local_2.replace("{num}", GamePredef.RELATIONSHIP_SIZE[1]);
                        Alert.show(_local_2, "", Alert.OK);
                    };
                }
                else
                {
                    Alert.show(Language.IMPANEL_S[7], "", Alert.OK);
                };
            };
        }

        private function selectGroupTeam():void
        {
            curItem = groupList.selectedItem;
            var _local_1:String = curItem["pos"];
            targetX = Number(_local_1.substring(1, _local_1.indexOf(",")));
            targetY = Number(_local_1.substring((_local_1.indexOf(",") + 1), _local_1.indexOf(")")));
            if ((((!(isSameLine())) || (Number(groupList.selectedItem["gnum"]) >= GamePredef.MAX_GROUP_MEM_NUM)) || (_core.getCharactor(Number(curItem["lid"])).state == GamePredef.ST_BATTLE)))
            {
                btnReqAdd.enabled = false;
            }
            else
            {
                btnReqAdd.enabled = true;
            };
            menuPop([{"label":Language.IMPANEL_U[30]}]);
        }

        private function findTeacher(_arg_1:String):void
        {
            if (_core.player.ti < 0)
            {
                _core.remote.call("findTeacher", new Responder(onFindTeacher), _arg_1);
            };
        }

        private function tutorClick():void
        {
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}]);
        }

        private function _IMPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn10 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn10", _IMPanel_DataGridColumn10);
            return (_local_1);
        }

        public function __tabBtn6_click(_arg_1:MouseEvent):void
        {
            tabClick(6);
        }

        private function _IMPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _IMPanel_DataGridColumn8 = _local_1;
            _local_1.dataField = "lastLevel";
            BindingManager.executeBindings(this, "_IMPanel_DataGridColumn8", _IMPanel_DataGridColumn8);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

