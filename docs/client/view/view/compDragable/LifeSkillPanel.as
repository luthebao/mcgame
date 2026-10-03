// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.LifeSkillPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.ProgressBarCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.ComboBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.LifeListItemRenderer;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import flash.events.Event;
    import mx.events.ListEvent;
    import mx.binding.Binding;
    import flash.utils.setTimeout;
    import com.qeedoo.ui.event.GameEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.utils.ToolKit;
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
    import com.qeedoo.ui.view.comp.*;
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

    public class LifeSkillPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _385185496medicineLevelList:List;
        public var _LifeSkillPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1624210112cookCanvas:Canvas;
        private var _75035704medicineRequire3:ItemSlot;
        private var _40272812makeList:List;
        private var _75035706medicineRequire1:ItemSlot;
        private var _717053516progressBar2:ProgressBarCanvas;
        private var _75035705medicineRequire2:ItemSlot;
        private var _1505392340cookRequire1:ItemSlot;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _3059528cook:BasicGlowButton;
        private var _114581tab:ViewStack;
        private var _189736949cookAward:ItemSlot;
        private var _1319233554cookAwardLabel1:BasicTxtButton;
        private var _9686830classType:ComboBox;
        public var initFlag:* = false;
        private var _1329203267medicineAward:ItemSlot;
        private var MAXLEVEL:int = 7;
        private var cid:Number = -1;
        private var _1505392341cookRequire2:ItemSlot;
        private var _1586878172cookAward1:ItemSlot;
        private var _494206780cookInputItem1:ItemSlot;
        private var _510997000medicineList:List;
        private var _218813920medicineAwardLabel1:BasicTxtButton;
        private var _1505392342cookRequire3:ItemSlot;
        private var _2121277359medicineInputItem2:ItemSlot;
        private var flag:Boolean = false;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _494206781cookInputItem2:ItemSlot;
        private var _2121277358medicineInputItem1:ItemSlot;
        private var currentSkillId:Number = -1;
        public var _LifeSkillPanel_BasicGlowButton1:BasicGlowButton;
        private var _1754248235medicineAllBtn:BasicGlowButton;
        public var _LifeSkillPanel_BasicGlowButton4:BasicGlowButton;
        private var _547753978cookList:List;
        public var _LifeSkillPanel_BasicTxtButton1:BasicTxtButton;
        public var _LifeSkillPanel_BasicTxtButton3:BasicTxtButton;
        public var _LifeSkillPanel_BasicTxtButton4:BasicTxtButton;
        public var _LifeSkillPanel_BasicTxtButton5:BasicTxtButton;
        public var _LifeSkillPanel_BasicTxtButton7:BasicTxtButton;
        public var _LifeSkillPanel_BasicTxtButton8:BasicTxtButton;
        private var _1131509414progressBar:ProgressBarCanvas;
        private var _494206782cookInputItem3:ItemSlot;
        private var _952151353cookAll:BasicGlowButton;
        private var _2121277360medicineInputItem3:ItemSlot;
        private var _2061716930medicineBtn:BasicGlowButton;
        private var _300291680classType2:ComboBox;
        private var _1707039694medicineCanvas:Canvas;
        private var _1744371634medicineAward1:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":397,
                    "height":355,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_LifeSkillPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tab",
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.top = "60";
                            this.right = "15";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"cookCanvas",
                                    "events":{"creationComplete":"__cookCanvas_creationComplete"},
                                    "stylesFactory":function ():void
                                    {
                                        this.disabledOverlayAlpha = 0.1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "creationPolicy":"auto",
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"makeList",
                                                "events":{"itemClick":"__makeList_itemClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "7";
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":70,
                                                        "styleName":"CSSBorder",
                                                        "height":230
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":List,
                                                "id":"cookList",
                                                "events":{"itemClick":"__cookList_itemClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":81,
                                                        "y":5,
                                                        "width":95,
                                                        "height":200,
                                                        "styleName":"CSSBorder",
                                                        "labelField":"name",
                                                        "itemRenderer":_LifeSkillPanel_ClassFactory1_c()
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ComboBox,
                                                "id":"classType",
                                                "events":{"change":"__classType_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":81,
                                                        "width":95,
                                                        "editable":false,
                                                        "y":210,
                                                        "rowCount":2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":5,
                                                        "height":230,
                                                        "styleName":"CanvasBorder",
                                                        "width":181,
                                                        "x":179,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_LifeSkillPanel_BasicTxtButton1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":7,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"cookAwardLabel1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":98,
                                                                    "y":7,
                                                                    "height":18,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_LifeSkillPanel_BasicTxtButton3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":69,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_LifeSkillPanel_BasicTxtButton4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":134,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"cookAward",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.top = "30";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"movable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"cookAward1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "30";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "movable":false,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"cookRequire1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":95,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"cookRequire2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":55,
                                                                    "y":95,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"cookRequire3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "y":95,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"cookInputItem1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":160,
                                                                    "slotType":19,
                                                                    "movable":true,
                                                                    "creationPolicy":"auto"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"cookInputItem2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":55,
                                                                    "y":160,
                                                                    "slotType":19,
                                                                    "movable":true,
                                                                    "creationPolicy":"auto"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"cookInputItem3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "y":160,
                                                                    "slotType":19,
                                                                    "movable":true,
                                                                    "creationPolicy":"auto"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_LifeSkillPanel_BasicGlowButton1",
                                                            "events":{"click":"___LifeSkillPanel_BasicGlowButton1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "styleName":"BtnNormalRed",
                                                                    "y":204,
                                                                    "width":99
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                    this.left = "7";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":35,
                                                        "y":238,
                                                        "styleName":"CanvasBorder",
                                                        "width":353,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ProgressBarCanvas,
                                                            "id":"progressBar",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x212121;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":10,
                                                                    "width":200,
                                                                    "showCancelButton":false,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"cook",
                                                            "events":{"click":"__cook_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "90";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "enabled":false,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":50,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"cookAll",
                                                            "events":{"click":"__cookAll_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":80,
                                                                    "enabled":false,
                                                                    "y":5
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
                                    "id":"medicineCanvas",
                                    "events":{"creationComplete":"__medicineCanvas_creationComplete"},
                                    "stylesFactory":function ():void
                                    {
                                        this.disabledOverlayAlpha = 0.1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "creationPolicy":"auto",
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"medicineLevelList",
                                                "events":{"itemClick":"__medicineLevelList_itemClick"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "7";
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":70,
                                                        "styleName":"CSSBorder",
                                                        "height":230
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":List,
                                                "id":"medicineList",
                                                "events":{"itemClick":"__medicineList_itemClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "itemRenderer":_LifeSkillPanel_ClassFactory2_c(),
                                                        "x":81,
                                                        "y":5,
                                                        "width":95,
                                                        "height":200,
                                                        "styleName":"CSSBorder",
                                                        "labelField":"name"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ComboBox,
                                                "id":"classType2",
                                                "events":{"change":"__classType2_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":81,
                                                        "width":95,
                                                        "editable":false,
                                                        "y":210,
                                                        "rowCount":2
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":5,
                                                        "height":230,
                                                        "styleName":"CanvasBorder",
                                                        "width":181,
                                                        "x":179,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_LifeSkillPanel_BasicTxtButton5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":7,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"medicineAwardLabel1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":98,
                                                                    "y":7,
                                                                    "height":18,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_LifeSkillPanel_BasicTxtButton7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":69,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_LifeSkillPanel_BasicTxtButton8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":134,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"medicineAward",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.top = "30";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"movable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"medicineAward1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "30";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "movable":false,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"medicineRequire1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":95,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"medicineRequire2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":55,
                                                                    "y":95,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"medicineRequire3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "y":95,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"medicineInputItem1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":160,
                                                                    "slotType":19,
                                                                    "movable":true,
                                                                    "creationPolicy":"auto"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"medicineInputItem2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":55,
                                                                    "y":160,
                                                                    "slotType":19,
                                                                    "movable":true,
                                                                    "creationPolicy":"auto"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"medicineInputItem3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "y":160,
                                                                    "slotType":19,
                                                                    "movable":true,
                                                                    "creationPolicy":"auto"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_LifeSkillPanel_BasicGlowButton4",
                                                            "events":{"click":"___LifeSkillPanel_BasicGlowButton4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "styleName":"BtnNormalRed",
                                                                    "y":204,
                                                                    "width":99
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                    this.left = "7";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":35,
                                                        "y":238,
                                                        "styleName":"CanvasBorder",
                                                        "width":353,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ProgressBarCanvas,
                                                            "id":"progressBar2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x212121;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":15,
                                                                    "y":10,
                                                                    "width":200,
                                                                    "showCancelButton":false,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"medicineBtn",
                                                            "events":{"click":"__medicineBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "90";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "enabled":false,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":50,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"medicineAllBtn",
                                                            "events":{"click":"__medicineAllBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "width":80,
                                                                    "enabled":false,
                                                                    "y":5
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
                        "type":HBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":66,
                                            "styleName":"HorizontalTab",
                                            "selected":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":66,
                                            "styleName":"HorizontalTab"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var cookListAC:Array = new Array();
        private var cookLearnedListAC:Array = new Array();
        private var medicineListAC:Array = new Array();
        private var medicineLearnedListAC:Array = new Array();
        public var learnedSkillArray:Array = new Array();
        private var _core:Core = Core.getInstance();
        private var _dm:DataManager = DataManager.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LifeSkillPanel()
        {
            mx_internal::_document = this;
            this.width = 397;
            this.height = 355;
            this.x = 250;
            this.y = 100;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LifeSkillPanel._watcherSetupUtil = _arg_1;
        }


        public function ___LifeSkillPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            autoInputCook(1);
        }

        [Bindable(event="propertyChange")]
        public function get cookList():List
        {
            return (this._547753978cookList);
        }

        public function set medicineList(_arg_1:List):void
        {
            var _local_2:Object = this._510997000medicineList;
            if (_local_2 !== _arg_1)
            {
                this._510997000medicineList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineList", _local_2, _arg_1));
            };
        }

        public function set cookList(_arg_1:List):void
        {
            var _local_2:Object = this._547753978cookList;
            if (_local_2 !== _arg_1)
            {
                this._547753978cookList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cookAwardLabel1():BasicTxtButton
        {
            return (this._1319233554cookAwardLabel1);
        }

        private function _LifeSkillPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = LifeListItemRenderer;
            return (_local_1);
        }

        private function completeCook():void
        {
            if (this.visible == false)
            {
                flag = false;
                cookCanvas.enabled = true;
                return;
            };
            if (-1 == cookAward.giid)
            {
                flag = false;
                cookCanvas.enabled = true;
                return;
            };
            cookCanvas.enabled = true;
            startNewCook();
        }

        private function initList1(_arg_1:int):void
        {
            var _local_2:ArrayCollection;
            var _local_3:ArrayCollection;
            var _local_4:int;
            var _local_5:int;
            switch (_arg_1)
            {
                case 0:
                    _local_2 = new ArrayCollection();
                    _local_4 = 1;
                    while (_local_4 <= MAXLEVEL)
                    {
                        _local_2.addItem({
                            "id":_local_4,
                            "label":Language.LIFESKILLPANEL_S[_local_4]
                        });
                        _local_4++;
                    };
                    makeList.dataProvider = _local_2;
                    return;
                case 1:
                    _local_3 = new ArrayCollection();
                    _local_5 = 11;
                    while (_local_5 <= (10 + MAXLEVEL))
                    {
                        _local_3.addItem({
                            "id":(_local_5 - 10),
                            "label":Language.LIFESKILLPANEL_S[_local_5]
                        });
                        _local_5++;
                    };
                    medicineLevelList.dataProvider = _local_3;
                    return;
            };
        }

        public function initList2(_arg_1:int):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:Boolean;
            var _local_5:Object;
            switch (_arg_1)
            {
                case 0:
                    _local_2 = 1;
                    while (_local_2 <= 10)
                    {
                        cookListAC[_local_2] = new ArrayCollection();
                        cookLearnedListAC[_local_2] = new ArrayCollection();
                        _local_2++;
                    };
                    for each (_local_3 in _core.data.gameData[GamePredef.TBL_SKILL])
                    {
                        if (((_local_3) && (_local_3.type == GamePredef.SKILL_TYPE_COOKBOOK)))
                        {
                            _local_4 = false;
                            for each (_local_5 in learnedSkillArray)
                            {
                                if (_local_3.id == _local_5)
                                {
                                    _local_4 = true;
                                    cookLearnedListAC[_local_3.level].addItem({
                                        "id":_local_3.id,
                                        "name":_local_3.name,
                                        "useItemId":_local_3.useItemId,
                                        "useItemType":_local_3.useItemType,
                                        "isLearned":_local_4
                                    });
                                };
                            };
                            cookListAC[_local_3.level].addItem({
                                "id":_local_3.id,
                                "name":_local_3.name,
                                "useItemId":_local_3.useItemId,
                                "useItemType":_local_3.useItemType,
                                "isLearned":_local_4
                            });
                        };
                    };
                    return;
                case 1:
                    _local_2 = 1;
                    while (_local_2 <= 10)
                    {
                        medicineListAC[_local_2] = new ArrayCollection();
                        medicineLearnedListAC[_local_2] = new ArrayCollection();
                        _local_2++;
                    };
                    for each (_local_3 in _core.data.gameData[GamePredef.TBL_SKILL])
                    {
                        if (((_local_3) && (_local_3.type == GamePredef.SKILL_TYPE_MEDICINEBOOK)))
                        {
                            _local_4 = false;
                            for each (_local_5 in learnedSkillArray)
                            {
                                if (_local_3.id == _local_5)
                                {
                                    _local_4 = true;
                                    medicineLearnedListAC[_local_3.level].addItem({
                                        "id":_local_3.id,
                                        "name":_local_3.name,
                                        "useItemId":_local_3.useItemId,
                                        "useItemType":_local_3.useItemType,
                                        "isLearned":_local_4
                                    });
                                };
                            };
                            medicineListAC[_local_3.level].addItem({
                                "id":_local_3.id,
                                "name":_local_3.name,
                                "useItemId":_local_3.useItemId,
                                "useItemType":_local_3.useItemType,
                                "isLearned":_local_4
                            });
                        };
                    };
                    return;
            };
        }

        private function onNewCook(_arg_1:Object):void
        {
            var _local_2:int;
            trace(_arg_1);
            if (_arg_1)
            {
                this[("cookInputItem" + 1)].stackNum = (this[("cookInputItem" + 1)].stackNum - this[("cookRequire" + 1)].stackNum);
                this[("cookInputItem" + 2)].stackNum = (this[("cookInputItem" + 2)].stackNum - this[("cookRequire" + 2)].stackNum);
                this[("cookInputItem" + 3)].stackNum = (this[("cookInputItem" + 3)].stackNum - this[("cookRequire" + 3)].stackNum);
                if (flag)
                {
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        if (0 == this[("cookInputItem" + _local_2)].stackNum)
                        {
                            this[("cookInputItem" + _local_2)].clean();
                        };
                        _local_2++;
                    };
                    cook.enabled = false;
                    cookAll.enabled = false;
                    flag = false;
                    newCookAll();
                }
                else
                {
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        this[("cookInputItem" + _local_2)].clean();
                        _local_2++;
                    };
                    cook.enabled = false;
                    cookAll.enabled = false;
                };
            }
            else
            {
                _local_2 = 1;
                while (_local_2 <= 3)
                {
                    this[("cookInputItem" + _local_2)].clean();
                    _local_2++;
                };
                cook.enabled = false;
                cookAll.enabled = false;
            };
        }

        public function set cookAwardLabel1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1319233554cookAwardLabel1;
            if (_local_2 !== _arg_1)
            {
                this._1319233554cookAwardLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookAwardLabel1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medicineCanvas():Canvas
        {
            return (this._1707039694medicineCanvas);
        }

        private function startNewMedicine():void
        {
            var _local_1:Object = {};
            var _local_2:int = 1;
            while (_local_2 <= 3)
            {
                if (this[("medicineInputItem" + _local_2)].slotData)
                {
                    _local_1[_local_2] = this[("medicineInputItem" + _local_2)].slotData.id;
                };
                _local_2++;
            };
            _core.remote.call("newMedicine", new Responder(onNewMedicine), _local_1, currentSkillId, 18);
        }

        public function ___LifeSkillPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            autoInputCook(0);
        }

        private function cookViewClear():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 3)
            {
                this[("cookRequire" + _local_1)].clean();
                this[("cookInputItem" + _local_1)].clean();
                _local_1++;
            };
            cookAward.clean();
            cookAward1.clean();
            cookAward1.visible = false;
            cookAwardLabel1.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get medicineAward():ItemSlot
        {
            return (this._1329203267medicineAward);
        }

        private function startNewCook():void
        {
            var _local_1:Object = {};
            var _local_2:int = 1;
            while (_local_2 <= 3)
            {
                if (this[("cookInputItem" + _local_2)].slotData)
                {
                    _local_1[_local_2] = this[("cookInputItem" + _local_2)].slotData.id;
                    trace(("fdjfhdhfjdd" + _local_1[_local_2]));
                };
                _local_2++;
            };
            _core.remote.call("newCook", new Responder(onNewCook), _local_1, currentSkillId, GamePredef.SKILL_TYPE_COOK);
        }

        [Bindable(event="propertyChange")]
        public function get progressBar2():ProgressBarCanvas
        {
            return (this._717053516progressBar2);
        }

        private function _LifeSkillPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = LifeSkillPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get medicineAward1():ItemSlot
        {
            return (this._1744371634medicineAward1);
        }

        public function set medicineLevelList(_arg_1:List):void
        {
            var _local_2:Object = this._385185496medicineLevelList;
            if (_local_2 !== _arg_1)
            {
                this._385185496medicineLevelList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineLevelList", _local_2, _arg_1));
            };
        }

        public function set medicineCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1707039694medicineCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1707039694medicineCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineCanvas", _local_2, _arg_1));
            };
        }

        private function initTab(_arg_1:int):void
        {
            initLearnedSkill();
        }

        private function classTypeSelect():void
        {
            var _local_1:int;
            if (0 == classType.selectedItem.type)
            {
                if (makeList.selectedItem != null)
                {
                    _local_1 = 1;
                    while (_local_1 <= 10)
                    {
                        if (makeList.selectedItem.id == _local_1)
                        {
                            cookList.dataProvider = cookLearnedListAC[_local_1];
                        };
                        _local_1++;
                    };
                };
            }
            else
            {
                if (1 == classType.selectedItem.type)
                {
                    if (makeList.selectedItem != null)
                    {
                        _local_1 = 1;
                        while (_local_1 <= 10)
                        {
                            if (makeList.selectedItem.id == _local_1)
                            {
                                cookList.dataProvider = cookListAC[_local_1];
                            };
                            _local_1++;
                        };
                    };
                };
            };
            if (0 == classType2.selectedItem.type)
            {
                if (medicineLevelList.selectedItem != null)
                {
                    _local_1 = 1;
                    while (_local_1 <= 10)
                    {
                        if (medicineLevelList.selectedItem.id == _local_1)
                        {
                            medicineList.dataProvider = medicineLearnedListAC[_local_1];
                        };
                        _local_1++;
                    };
                };
            }
            else
            {
                if (1 == classType2.selectedItem.type)
                {
                    if (medicineLevelList.selectedItem != null)
                    {
                        _local_1 = 1;
                        while (_local_1 <= 10)
                        {
                            if (medicineLevelList.selectedItem.id == _local_1)
                            {
                                medicineList.dataProvider = medicineListAC[_local_1];
                            };
                            _local_1++;
                        };
                    };
                };
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            BtnClick(0);
        }

        private function medicineInputItemChange(_arg_1:Event):void
        {
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:Object;
            if (!medicineList.selectedItem)
            {
                return;
            };
            var _local_2:int = 1;
            while (_local_2 <= 3)
            {
                if (-1 == this[("medicineInputItem" + _local_2)].giid)
                {
                    medicineBtn.enabled = false;
                    medicineAllBtn.enabled = false;
                    return;
                };
                _local_2++;
            };
            var _local_3:int = 1;
            while (_local_3 <= 3)
            {
                if (this[("medicineInputItem" + _local_3)].stackNum < this[("medicineRequire" + _local_3)].stackNum)
                {
                    medicineBtn.enabled = false;
                    medicineAllBtn.enabled = false;
                    return;
                };
                _local_3++;
            };
            var _local_4:int = 1;
            while (_local_4 <= 3)
            {
                _local_5 = this[("medicineInputItem" + _local_4)].giid;
                _local_6 = _core.data.getData(GamePredef.TBL_ITEM_INSTANCE, _local_5);
                _local_7 = _local_6.tid;
                if (this[("medicineRequire" + _local_4)].giid != _local_7)
                {
                    medicineBtn.enabled = false;
                    medicineAllBtn.enabled = false;
                    return;
                };
                _local_4++;
            };
            medicineBtn.enabled = true;
            medicineAllBtn.enabled = true;
        }

        public function set cookInputItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._494206780cookInputItem1;
            if (_local_2 !== _arg_1)
            {
                this._494206780cookInputItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookInputItem1", _local_2, _arg_1));
            };
        }

        public function set cookAll(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._952151353cookAll;
            if (_local_2 !== _arg_1)
            {
                this._952151353cookAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookAll", _local_2, _arg_1));
            };
        }

        public function set cookInputItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._494206781cookInputItem2;
            if (_local_2 !== _arg_1)
            {
                this._494206781cookInputItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookInputItem2", _local_2, _arg_1));
            };
        }

        public function makeListChange():void
        {
            var _local_1:int;
            if (makeList.selectedItem != null)
            {
                _local_1 = 1;
                while (_local_1 <= 10)
                {
                    if (makeList.selectedItem.id == _local_1)
                    {
                        if (classType.selectedItem.type == 0)
                        {
                            cookList.dataProvider = cookLearnedListAC[_local_1];
                        }
                        else
                        {
                            cookList.dataProvider = cookListAC[_local_1];
                        };
                    };
                    _local_1++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        public function set cookInputItem3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._494206782cookInputItem3;
            if (_local_2 !== _arg_1)
            {
                this._494206782cookInputItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookInputItem3", _local_2, _arg_1));
            };
        }

        public function __medicineList_itemClick(_arg_1:ListEvent):void
        {
            medicineListChange();
        }

        public function set cook(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3059528cook;
            if (_local_2 !== _arg_1)
            {
                this._3059528cook = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cook", _local_2, _arg_1));
            };
        }

        private function completeMedicine():void
        {
            if (this.visible == false)
            {
                flag = false;
                medicineCanvas.enabled = true;
                return;
            };
            if (-1 == medicineAward.giid)
            {
                flag = false;
                medicineCanvas.enabled = true;
                return;
            };
            medicineCanvas.enabled = true;
            startNewMedicine();
        }

        private function initComboBox(_arg_1:int):void
        {
            var _local_2:ArrayCollection = new ArrayCollection();
            _local_2.addItem({
                "type":1,
                "label":Language.LIFESKILLPANEL_S[42]
            });
            _local_2.addItem({
                "type":0,
                "label":Language.LIFESKILLPANEL_S[41]
            });
            switch (_arg_1)
            {
                case 0:
                    classType.dataProvider = _local_2;
                    return;
                case 1:
                    classType2.dataProvider = _local_2;
                    return;
            };
        }

        public function set medicineAward(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1329203267medicineAward;
            if (_local_2 !== _arg_1)
            {
                this._1329203267medicineAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineAward", _local_2, _arg_1));
            };
        }

        public function set progressBar2(_arg_1:ProgressBarCanvas):void
        {
            var _local_2:Object = this._717053516progressBar2;
            if (_local_2 !== _arg_1)
            {
                this._717053516progressBar2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressBar2", _local_2, _arg_1));
            };
        }

        private function _LifeSkillPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_LifeSkillPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cookCanvas.label = _arg_1;
            }, "cookCanvas.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicTxtButton1.label = _arg_1;
            }, "_LifeSkillPanel_BasicTxtButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cookAwardLabel1.label = _arg_1;
            }, "cookAwardLabel1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicTxtButton3.label = _arg_1;
            }, "_LifeSkillPanel_BasicTxtButton3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicTxtButton4.label = _arg_1;
            }, "_LifeSkillPanel_BasicTxtButton4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicGlowButton1.label = _arg_1;
            }, "_LifeSkillPanel_BasicGlowButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cook.label = _arg_1;
            }, "cook.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cookAll.label = _arg_1;
            }, "cookAll.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medicineCanvas.label = _arg_1;
            }, "medicineCanvas.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicTxtButton5.label = _arg_1;
            }, "_LifeSkillPanel_BasicTxtButton5.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medicineAwardLabel1.label = _arg_1;
            }, "medicineAwardLabel1.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicTxtButton7.label = _arg_1;
            }, "_LifeSkillPanel_BasicTxtButton7.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicTxtButton8.label = _arg_1;
            }, "_LifeSkillPanel_BasicTxtButton8.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeSkillPanel_BasicGlowButton4.label = _arg_1;
            }, "_LifeSkillPanel_BasicGlowButton4.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medicineBtn.label = _arg_1;
            }, "medicineBtn.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medicineAllBtn.label = _arg_1;
            }, "medicineAllBtn.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LIFESKILLPANEL_S[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[18] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get progressBar():ProgressBarCanvas
        {
            return (this._1131509414progressBar);
        }

        private function onNewMedicine(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1)
            {
                this[("medicineInputItem" + 1)].stackNum = (this[("medicineInputItem" + 1)].stackNum - this[("medicineRequire" + 1)].stackNum);
                this[("medicineInputItem" + 2)].stackNum = (this[("medicineInputItem" + 2)].stackNum - this[("medicineRequire" + 2)].stackNum);
                this[("medicineInputItem" + 3)].stackNum = (this[("medicineInputItem" + 3)].stackNum - this[("medicineRequire" + 3)].stackNum);
                if (flag)
                {
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        if (0 == this[("medicineInputItem" + _local_2)].stackNum)
                        {
                            this[("medicineInputItem" + _local_2)].clean();
                        };
                        _local_2++;
                    };
                    medicineBtn.enabled = false;
                    medicineAllBtn.enabled = false;
                    flag = false;
                    newMedicineAll();
                }
                else
                {
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        this[("medicineInputItem" + _local_2)].clean();
                        _local_2++;
                    };
                    medicineBtn.enabled = false;
                    medicineAllBtn.enabled = false;
                };
            }
            else
            {
                _local_2 = 1;
                while (_local_2 <= 3)
                {
                    this[("medicineInputItem" + _local_2)].clean();
                    _local_2++;
                };
                medicineBtn.enabled = false;
                medicineAllBtn.enabled = false;
            };
        }

        public function __medicineAllBtn_click(_arg_1:MouseEvent):void
        {
            newMedicineAll();
        }

        private function BtnClick(_arg_1:int):void
        {
            tab.selectedIndex = _arg_1;
            activatePanel(_arg_1);
            var _local_2:int;
            while (_local_2 <= (tab.numChildren - 1))
            {
                if (_local_2 == _arg_1)
                {
                    this[("tabBtn" + _local_2)].selected = true;
                }
                else
                {
                    this[("tabBtn" + _local_2)].selected = false;
                };
                _local_2++;
            };
        }

        private function medicineListSelected(_arg_1:Event):void
        {
            if (!medicineList.selectedItem)
            {
                medicineBtn.enabled = false;
                medicineAllBtn.enabled = false;
            };
        }

        public function set medicineAward1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1744371634medicineAward1;
            if (_local_2 !== _arg_1)
            {
                this._1744371634medicineAward1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineAward1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cookCanvas():Canvas
        {
            return (this._1624210112cookCanvas);
        }

        private function cookListSelected(_arg_1:Event):void
        {
            if (!cookList.selectedItem)
            {
                cook.enabled = false;
                cookAll.enabled = false;
            };
        }

        public function learnedSkillSkip(_arg_1:Object):void
        {
            setTimeout(autoClick, 100, _arg_1);
        }

        private function activatePanel(_arg_1:int):void
        {
            var _local_2:int;
            switch (_arg_1)
            {
                case 0:
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        if (this[("cookInputItem" + _local_2)])
                        {
                            this[("cookInputItem" + _local_2)].addEventListener(GameEvent.SLOT_NUM_CHANGE, cookInputItemChange);
                        };
                        this[("cookInputItem" + _local_2)].stackNum = 0;
                        _local_2++;
                    };
                    cookList.addEventListener(MouseEvent.CLICK, cookListSelected);
                    makeList.addEventListener(MouseEvent.CLICK, cookListSelected);
                    return;
                case 1:
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        if (this[("medicineInputItem" + _local_2)])
                        {
                            this[("medicineInputItem" + _local_2)].addEventListener(GameEvent.SLOT_NUM_CHANGE, medicineInputItemChange);
                        };
                        this[("medicineInputItem" + _local_2)].stackNum = 0;
                        _local_2++;
                    };
                    medicineList.addEventListener(MouseEvent.CLICK, medicineListSelected);
                    medicineLevelList.addEventListener(MouseEvent.CLICK, medicineListSelected);
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get classType():ComboBox
        {
            return (this._9686830classType);
        }

        [Bindable(event="propertyChange")]
        public function get cookRequire1():ItemSlot
        {
            return (this._1505392340cookRequire1);
        }

        [Bindable(event="propertyChange")]
        public function get cookRequire2():ItemSlot
        {
            return (this._1505392341cookRequire2);
        }

        [Bindable(event="propertyChange")]
        public function get cookRequire3():ItemSlot
        {
            return (this._1505392342cookRequire3);
        }

        private function refresh(_arg_1:int):void
        {
            initList1(_arg_1);
            initList2(_arg_1);
            initComboBox(_arg_1);
            activatePanel(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get cookAward1():ItemSlot
        {
            return (this._1586878172cookAward1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                initFlag = true;
                if (cid == _core.player.id)
                {
                    cookViewClear();
                    medicineViewClear();
                    cid = _core.player.id;
                }
                else
                {
                    cid = _core.player.id;
                    cookList.dataProvider = null;
                    medicineList.dataProvider = null;
                    learnedSkillArray = new Array();
                    initTab(0);
                };
            };
        }

        private function delayFunc(_arg_1:int, _arg_2:int):void
        {
            if (_arg_2 == 0)
            {
                cookList.selectedIndex = _arg_1;
                cookList.selectedItem.isLearned = true;
                cookListChange();
            }
            else
            {
                if (_arg_2 == 1)
                {
                    medicineList.selectedIndex = _arg_1;
                    medicineList.selectedItem.isLearned = true;
                    medicineListChange();
                };
            };
        }

        public function __medicineBtn_click(_arg_1:MouseEvent):void
        {
            newMedicine();
        }

        public function __cookCanvas_creationComplete(_arg_1:FlexEvent):void
        {
            initTab(0);
        }

        public function medicineLevelListChange():void
        {
            var _local_1:int;
            if (medicineLevelList.selectedItem != null)
            {
                _local_1 = 1;
                while (_local_1 <= 10)
                {
                    if (medicineLevelList.selectedItem.id == _local_1)
                    {
                        trace(("the selectedItemId is：" + medicineLevelList.selectedItem.id));
                        if (classType2.selectedItem.type == 0)
                        {
                            medicineList.dataProvider = medicineLearnedListAC[_local_1];
                        }
                        else
                        {
                            medicineList.dataProvider = medicineListAC[_local_1];
                        };
                    };
                    _local_1++;
                };
            };
        }

        private function newCook():void
        {
            cookCanvas.enabled = false;
            progressBar.visible = true;
            progressBar.progressName = Language.LIFESKILLPANEL_S[53];
            progressBar.completeFunction = completeCook;
            progressBar.showByTime(2);
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

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        private function autoClick(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:Object;
            if (((_arg_1) && (_arg_1.type)))
            {
                if (_arg_1.type == 21)
                {
                    BtnClick(0);
                    if (_arg_1.level)
                    {
                        if (!makeList.dataProvider)
                        {
                            refresh(0);
                        };
                        makeList.selectedIndex = (_arg_1.level - 1);
                        classType.selectedIndex = 0;
                        makeListChange();
                        if (_arg_1.name)
                        {
                            _local_2 = 0;
                            for each (_local_3 in cookList.dataProvider)
                            {
                                if (_local_3.name == _arg_1.name)
                                {
                                    setTimeout(delayFunc, 100, _local_2, 0);
                                };
                                _local_2++;
                            };
                        };
                    };
                };
                if (_arg_1.type == 22)
                {
                    BtnClick(1);
                    if (_arg_1.level)
                    {
                        if (!medicineLevelList.dataProvider)
                        {
                            refresh(1);
                        };
                        medicineLevelList.selectedIndex = (_arg_1.level - 1);
                        classType.selectedIndex = 0;
                        medicineLevelListChange();
                        if (_arg_1.name)
                        {
                            _local_2 = 0;
                            for each (_local_3 in medicineList.dataProvider)
                            {
                                if (_local_3.name == _arg_1.name)
                                {
                                    setTimeout(delayFunc, 100, _local_2, 1);
                                };
                                _local_2++;
                            };
                        };
                    };
                };
            };
        }

        public function __cookList_itemClick(_arg_1:ListEvent):void
        {
            cookListChange();
        }

        public function __cookAll_click(_arg_1:MouseEvent):void
        {
            newCookAll();
        }

        [Bindable(event="propertyChange")]
        public function get medicineLevelList():List
        {
            return (this._385185496medicineLevelList);
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
        public function get cookAll():BasicGlowButton
        {
            return (this._952151353cookAll);
        }

        [Bindable(event="propertyChange")]
        public function get cookInputItem1():ItemSlot
        {
            return (this._494206780cookInputItem1);
        }

        [Bindable(event="propertyChange")]
        public function get cookInputItem2():ItemSlot
        {
            return (this._494206781cookInputItem2);
        }

        [Bindable(event="propertyChange")]
        public function get cookInputItem3():ItemSlot
        {
            return (this._494206782cookInputItem3);
        }

        public function __makeList_itemClick(_arg_1:ListEvent):void
        {
            makeListChange();
        }

        private function newMedicineAll():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 3)
            {
                if (this[("medicineInputItem" + _local_1)].giid == -1)
                {
                    return;
                };
                _local_1++;
            };
            if ((((this[("medicineInputItem" + 1)].stackNum >= this[("medicineRequire" + 1)].stackNum) && (this[("medicineInputItem" + 2)].stackNum >= this[("medicineRequire" + 2)].stackNum)) && (this[("medicineInputItem" + 3)].stackNum >= this[("medicineRequire" + 3)].stackNum)))
            {
                flag = true;
                newMedicine();
            };
        }

        public function set progressBar(_arg_1:ProgressBarCanvas):void
        {
            var _local_2:Object = this._1131509414progressBar;
            if (_local_2 !== _arg_1)
            {
                this._1131509414progressBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressBar", _local_2, _arg_1));
            };
        }

        public function __classType2_change(_arg_1:ListEvent):void
        {
            classTypeSelect();
        }

        private function autoInputCook(_arg_1:int):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:String;
            var _local_2:Object = _dm.sList;
            var _local_3:int = 1;
            while (_local_3 <= 3)
            {
                for each (_local_4 in _local_2)
                {
                    if ((((_local_4) && (ToolKit.isBigThan(_local_4.sid, GamePredef.SLOT_SID_BAG[0]))) && (ToolKit.isSmallOrEqual(_local_4.sid, GamePredef.SLOT_SID_BAG[7]))))
                    {
                        _local_5 = _core.getTemplateData(_local_4.type, _local_4.itemId);
                        if (_local_5)
                        {
                            switch (_arg_1)
                            {
                                case 0:
                                    _local_6 = "cookRequire";
                                    _local_7 = "cookInputItem";
                                    break;
                                case 1:
                                    _local_6 = "medicineRequire";
                                    _local_7 = "medicineInputItem";
                                    break;
                            };
                            if ((((ToolKit.isEqual(_local_4.type, (this[(_local_6 + _local_3)].type - 1))) && (ToolKit.isEqual(_local_5.id, this[(_local_6 + _local_3)].giid))) && (ToolKit.isBigOrEqual(_local_4.stackNum, this[(_local_6 + _local_3)].stackNum))))
                            {
                                this[(_local_7 + _local_3)].slotData = _local_4;
                                this[(_local_7 + _local_3)].type = _local_4.type;
                                this[(_local_7 + _local_3)].giid = _local_4.itemId;
                                this[(_local_7 + _local_3)].stackNum = _local_4.stackNum;
                                break;
                            };
                        };
                    };
                };
                _local_3++;
            };
        }

        private function cookListChange():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Array;
            var _local_4:Array;
            var _local_5:int;
            if (cookList.selectedItem != null)
            {
                cookViewClear();
                currentSkillId = cookList.selectedItem.id;
                _local_1 = cookList.selectedItem.useItemId;
                this["cookAward"].type = GamePredef.TBL_ITEM_TEMPLATE;
                this["cookAward"].giid = _local_1;
                this["cookAward"].stackNum = "1";
                trace(("this skill is learned?" + cookList.selectedItem.isLearned));
                if (cookList.selectedItem.isLearned)
                {
                    _local_2 = cookList.selectedItem.useItemType;
                    if (-1 != _local_2)
                    {
                        this["cookAward1"].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this["cookAward1"].giid = _local_2;
                        this["cookAward1"].stackNum = "1";
                        this["cookAward1"].visible = true;
                        cookAwardLabel1.visible = true;
                    };
                    _local_3 = new Array();
                    _local_4 = new Array();
                    _local_3[1] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].i1;
                    _local_3[2] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].i2;
                    _local_3[3] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].i3;
                    _local_4[1] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].n1;
                    _local_4[2] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].n2;
                    _local_4[3] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].n3;
                    _local_5 = 1;
                    while (_local_5 <= 3)
                    {
                        this[("cookRequire" + _local_5)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("cookRequire" + _local_5)].giid = _local_3[_local_5];
                        this[("cookRequire" + _local_5)].stackNum = _local_4[_local_5];
                        _local_5++;
                    };
                };
                cook.enabled = false;
                cookAll.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get cook():BasicGlowButton
        {
            return (this._3059528cook);
        }

        private function onInitLearnedSkill(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                learnedSkillArray[_local_2] = _arg_1[_local_2].sid;
            };
            refresh(0);
            refresh(1);
        }

        public function set makeList(_arg_1:List):void
        {
            var _local_2:Object = this._40272812makeList;
            if (_local_2 !== _arg_1)
            {
                this._40272812makeList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeList", _local_2, _arg_1));
            };
        }

        public function set classType2(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._300291680classType2;
            if (_local_2 !== _arg_1)
            {
                this._300291680classType2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classType2", _local_2, _arg_1));
            };
        }

        public function set medicineInputItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2121277358medicineInputItem1;
            if (_local_2 !== _arg_1)
            {
                this._2121277358medicineInputItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineInputItem1", _local_2, _arg_1));
            };
        }

        private function initLearnedSkill():void
        {
            _core.remote.call("initLearnedSkill", new Responder(onInitLearnedSkill), null);
        }

        public function set medicineInputItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2121277359medicineInputItem2;
            if (_local_2 !== _arg_1)
            {
                this._2121277359medicineInputItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineInputItem2", _local_2, _arg_1));
            };
        }

        public function set medicineInputItem3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2121277360medicineInputItem3;
            if (_local_2 !== _arg_1)
            {
                this._2121277360medicineInputItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineInputItem3", _local_2, _arg_1));
            };
        }

        private function newCookAll():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 3)
            {
                if (this[("cookInputItem" + _local_1)].giid == -1)
                {
                    return;
                };
                _local_1++;
            };
            if ((((this[("cookInputItem" + 1)].stackNum >= this[("cookRequire" + 1)].stackNum) && (this[("cookInputItem" + 2)].stackNum >= this[("cookRequire" + 2)].stackNum)) && (this[("cookInputItem" + 3)].stackNum >= this[("cookRequire" + 3)].stackNum)))
            {
                flag = true;
                newCook();
            };
        }

        public function set cookCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1624210112cookCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1624210112cookCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookCanvas", _local_2, _arg_1));
            };
        }

        public function set medicineBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2061716930medicineBtn;
            if (_local_2 !== _arg_1)
            {
                this._2061716930medicineBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineBtn", _local_2, _arg_1));
            };
        }

        public function set medicineRequire1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._75035706medicineRequire1;
            if (_local_2 !== _arg_1)
            {
                this._75035706medicineRequire1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineRequire1", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:LifeSkillPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LifeSkillPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_LifeSkillPanelWatcherSetupUtil");
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
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        private function medicineViewClear():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 3)
            {
                this[("medicineRequire" + _local_1)].clean();
                this[("medicineInputItem" + _local_1)].clean();
                _local_1++;
            };
            medicineAward.clean();
            medicineAward1.clean();
            medicineAward1.visible = false;
            medicineAwardLabel1.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get classType2():ComboBox
        {
            return (this._300291680classType2);
        }

        private function cookInputItemChange(_arg_1:Event):void
        {
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:Object;
            if (!cookList.selectedItem)
            {
                return;
            };
            var _local_2:int = 1;
            while (_local_2 <= 3)
            {
                if (-1 == this[("cookInputItem" + _local_2)].giid)
                {
                    cook.enabled = false;
                    cookAll.enabled = false;
                    return;
                };
                _local_2++;
            };
            var _local_3:int = 1;
            while (_local_3 <= 3)
            {
                if (this[("cookInputItem" + _local_3)].stackNum < this[("cookRequire" + _local_3)].stackNum)
                {
                    cook.enabled = false;
                    cookAll.enabled = false;
                    return;
                };
                _local_3++;
            };
            var _local_4:int = 1;
            while (_local_4 <= 3)
            {
                _local_5 = this[("cookInputItem" + _local_4)].giid;
                _local_6 = _core.data.getData(GamePredef.TBL_ITEM_INSTANCE, _local_5);
                _local_7 = _local_6.tid;
                if (this[("cookRequire" + _local_4)].giid != _local_7)
                {
                    cook.enabled = false;
                    cookAll.enabled = false;
                    return;
                };
                _local_4++;
            };
            cook.enabled = true;
            cookAll.enabled = true;
        }

        public function set medicineRequire2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._75035705medicineRequire2;
            if (_local_2 !== _arg_1)
            {
                this._75035705medicineRequire2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineRequire2", _local_2, _arg_1));
            };
        }

        public function set cookRequire1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1505392340cookRequire1;
            if (_local_2 !== _arg_1)
            {
                this._1505392340cookRequire1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookRequire1", _local_2, _arg_1));
            };
        }

        private function _LifeSkillPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.LIFESKILLPANEL_S[0];
            _local_1 = Language.LIFESKILLPANEL_S[43];
            _local_1 = Language.LIFESKILLPANEL_S[47];
            _local_1 = Language.LIFESKILLPANEL_S[54];
            _local_1 = Language.LIFESKILLPANEL_S[48];
            _local_1 = Language.LIFESKILLPANEL_S[49];
            _local_1 = Language.LIFESKILLPANEL_S[50];
            _local_1 = Language.LIFESKILLPANEL_S[51];
            _local_1 = Language.LIFESKILLPANEL_S[52];
            _local_1 = Language.LIFESKILLPANEL_S[44];
            _local_1 = Language.LIFESKILLPANEL_S[47];
            _local_1 = Language.LIFESKILLPANEL_S[54];
            _local_1 = Language.LIFESKILLPANEL_S[48];
            _local_1 = Language.LIFESKILLPANEL_S[49];
            _local_1 = Language.LIFESKILLPANEL_S[50];
            _local_1 = Language.LIFESKILLPANEL_S[51];
            _local_1 = Language.LIFESKILLPANEL_S[52];
            _local_1 = Language.LIFESKILLPANEL_S[43];
            _local_1 = Language.LIFESKILLPANEL_S[44];
        }

        public function set classType(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._9686830classType;
            if (_local_2 !== _arg_1)
            {
                this._9686830classType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classType", _local_2, _arg_1));
            };
        }

        public function __cook_click(_arg_1:MouseEvent):void
        {
            newCook();
        }

        public function __classType_change(_arg_1:ListEvent):void
        {
            classTypeSelect();
        }

        [Bindable(event="propertyChange")]
        public function get medicineInputItem2():ItemSlot
        {
            return (this._2121277359medicineInputItem2);
        }

        public function set cookAward1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1586878172cookAward1;
            if (_local_2 !== _arg_1)
            {
                this._1586878172cookAward1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookAward1", _local_2, _arg_1));
            };
        }

        public function set cookRequire2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1505392341cookRequire2;
            if (_local_2 !== _arg_1)
            {
                this._1505392341cookRequire2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookRequire2", _local_2, _arg_1));
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            BtnClick(1);
        }

        public function set cookRequire3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1505392342cookRequire3;
            if (_local_2 !== _arg_1)
            {
                this._1505392342cookRequire3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookRequire3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medicineInputItem1():ItemSlot
        {
            return (this._2121277358medicineInputItem1);
        }

        [Bindable(event="propertyChange")]
        public function get medicineInputItem3():ItemSlot
        {
            return (this._2121277360medicineInputItem3);
        }

        public function set medicineAwardLabel1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._218813920medicineAwardLabel1;
            if (_local_2 !== _arg_1)
            {
                this._218813920medicineAwardLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineAwardLabel1", _local_2, _arg_1));
            };
        }

        public function set medicineAllBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1754248235medicineAllBtn;
            if (_local_2 !== _arg_1)
            {
                this._1754248235medicineAllBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineAllBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get makeList():List
        {
            return (this._40272812makeList);
        }

        public function __medicineCanvas_creationComplete(_arg_1:FlexEvent):void
        {
            initTab(1);
        }

        [Bindable(event="propertyChange")]
        public function get medicineRequire1():ItemSlot
        {
            return (this._75035706medicineRequire1);
        }

        private function medicineListChange():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Array;
            var _local_4:Array;
            var _local_5:int;
            if (medicineList.selectedItem != null)
            {
                medicineViewClear();
                currentSkillId = medicineList.selectedItem.id;
                _local_1 = medicineList.selectedItem.useItemId;
                this["medicineAward"].type = GamePredef.TBL_ITEM_TEMPLATE;
                this["medicineAward"].giid = _local_1;
                this["medicineAward"].stackNum = "1";
                trace(("this skill is learned?" + medicineList.selectedItem.isLearned));
                if (medicineList.selectedItem.isLearned)
                {
                    _local_2 = medicineList.selectedItem.useItemType;
                    if (-1 != _local_2)
                    {
                        this["medicineAward1"].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this["medicineAward1"].giid = _local_2;
                        this["medicineAward1"].stackNum = "1";
                        this["medicineAward1"].visible = true;
                        medicineAwardLabel1.visible = true;
                    };
                    _local_3 = new Array();
                    _local_4 = new Array();
                    _local_3[1] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].i1;
                    _local_3[2] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].i2;
                    _local_3[3] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].i3;
                    _local_4[1] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].n1;
                    _local_4[2] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].n2;
                    _local_4[3] = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][_local_1].n3;
                    _local_5 = 1;
                    while (_local_5 <= 3)
                    {
                        this[("medicineRequire" + _local_5)].type = GamePredef.TBL_ITEM_TEMPLATE;
                        this[("medicineRequire" + _local_5)].giid = _local_3[_local_5];
                        this[("medicineRequire" + _local_5)].stackNum = _local_4[_local_5];
                        _local_5++;
                    };
                };
                medicineBtn.enabled = false;
                medicineAllBtn.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get medicineBtn():BasicGlowButton
        {
            return (this._2061716930medicineBtn);
        }

        [Bindable(event="propertyChange")]
        public function get medicineRequire2():ItemSlot
        {
            return (this._75035705medicineRequire2);
        }

        [Bindable(event="propertyChange")]
        public function get medicineRequire3():ItemSlot
        {
            return (this._75035704medicineRequire3);
        }

        [Bindable(event="propertyChange")]
        public function get medicineAllBtn():BasicGlowButton
        {
            return (this._1754248235medicineAllBtn);
        }

        public function set medicineRequire3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._75035704medicineRequire3;
            if (_local_2 !== _arg_1)
            {
                this._75035704medicineRequire3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medicineRequire3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medicineAwardLabel1():BasicTxtButton
        {
            return (this._218813920medicineAwardLabel1);
        }

        public function set cookAward(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._189736949cookAward;
            if (_local_2 !== _arg_1)
            {
                this._189736949cookAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cookAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cookAward():ItemSlot
        {
            return (this._189736949cookAward);
        }

        private function newMedicine():void
        {
            medicineCanvas.enabled = false;
            progressBar2.visible = true;
            progressBar2.progressName = Language.LIFESKILLPANEL_S[53];
            progressBar2.completeFunction = completeMedicine;
            progressBar2.showByTime(2);
        }

        public function __medicineLevelList_itemClick(_arg_1:ListEvent):void
        {
            medicineLevelListChange();
        }

        [Bindable(event="propertyChange")]
        public function get medicineList():List
        {
            return (this._510997000medicineList);
        }


    }
}//package com.qeedoo.ui.view.compDragable

