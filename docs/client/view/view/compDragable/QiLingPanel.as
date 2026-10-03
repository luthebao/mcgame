// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.QiLingPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ItemSlotMaterial;
    import mx.controls.LinkButton;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.ItemSlotEquFunc;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import flash.events.Event;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.ui.view.comp.EquipFuncBag;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.ui.view.comp.ItemSlot;
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

    public class QiLingPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _98628co0:Label;
        private var _933747497tabBtnA1:BasicGlowButton;
        private var _1564727391QiLingMater:ItemSlotMaterial;
        private var _112175qr0:Label;
        private var _106940722prop5:Label;
        public var _QiLingPanel_LinkButton1:LinkButton;
        private var equipBagAdded:Boolean = false;
        private var _98599cn2:Label;
        public var _QiLingPanel_Label18:Label;
        public var _QiLingPanel_Label19:Label;
        private var _979804988prop12:Label;
        private var _alert:Alert;
        private var _98629co1:Label;
        public var _QiLingPanel_Label21:Label;
        public var _QiLingPanel_Label25:Label;
        public var _QiLingPanel_Label29:Label;
        private var _172225125ChongZhuEqu:ItemSlotEquFunc;
        private var _112176qr1:Label;
        public var _QiLingPanel_Label1:Label;
        public var _QiLingPanel_Label5:Label;
        public var _QiLingPanel_Label32:Label;
        public var _QiLingPanel_Label34:Label;
        public var _QiLingPanel_Label35:Label;
        public var _QiLingPanel_Label36:Label;
        public var _QiLingPanel_Label37:Label;
        public var _QiLingPanel_Label38:Label;
        private var _579513480chongzhuBtn:BasicGlowButton;
        public var _QiLingPanel_Label33:Label;
        private var _106940718prop1:Label;
        private var _98630co2:Label;
        public var _autoMatchSlots:Object;
        private var _106940726prop9:Label;
        private var _103145575lock2:CheckBox;
        private var _1007683640pTitle:BasicTitleCanvas;
        private var _106940723prop6:Label;
        private var _1177195105itemInfo:Label;
        private var _112177qr2:Label;
        private var _106940720prop3:Label;
        private var _933747498tabBtnA0:BasicGlowButton;
        private var _2132104687iteminfo2:Label;
        private var _helpAlert:Alert;
        private var _1988465623ChongZhuMater:ItemSlotMaterial;
        private var _106940719prop2:Label;
        private var _1345005914czauto:CheckBox;
        private var _979804990prop10:Label;
        private var _221842405QiLingEqu:ItemSlotEquFunc;
        private var _2067262411showBag:BasicGlowButton;
        private var _103145573lock0:CheckBox;
        private var _106940724prop7:Label;
        private var _98597cn0:Label;
        private var _alert1:Alert;
        private var _alert2:Alert;
        private var _106940721prop4:Label;
        private var _979804989prop11:Label;
        private var _865347172needInfo:Label;
        private var _957127094qlauto:CheckBox;
        private var _3552076tabA:ViewStack;
        private var _98598cn1:Label;
        private var _404500846qilingBtn:BasicGlowButton;
        private var _103145574lock1:CheckBox;
        private var _106940725prop8:Label;
        private var QL_LOCK_NUM:Number = 5;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":600,
                    "height":360,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pTitle",
                        "events":{"creationComplete":"__pTitle_creationComplete"}
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":23,
                                "y":34,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnA0",
                                    "events":{"click":"__tabBtnA0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnA1",
                                    "events":{"click":"__tabBtnA1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":66
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_QiLingPanel_LinkButton1",
                        "events":{"click":"___QiLingPanel_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.textDecoration = "underline";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":480,
                                "y":34,
                                "width":101
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tabA",
                        "stylesFactory":function ():void
                        {
                            this.top = "55";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":11,
                                "width":570,
                                "height":292,
                                "creationPolicy":"all",
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "width":570,
                                            "height":292,
                                            "x":0,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "28";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "width":260,
                                                        "height":100,
                                                        "x":19,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":10});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"qr0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":34,
                                                                    "width":231
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"qr1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":51,
                                                                    "width":231
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"qr2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":67,
                                                                    "width":231
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
                                                        "width":260,
                                                        "height":124,
                                                        "x":19,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "y":158,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":10});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":26,
                                                                    "text":"",
                                                                    "width":77.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":88.5,
                                                                    "y":26,
                                                                    "text":"",
                                                                    "width":77
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":173.5,
                                                                    "y":26,
                                                                    "text":"",
                                                                    "width":77.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":50,
                                                                    "text":"",
                                                                    "width":77.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":88.5,
                                                                    "y":50,
                                                                    "text":"",
                                                                    "width":77
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":173.5,
                                                                    "y":50,
                                                                    "text":"",
                                                                    "width":77.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":76,
                                                                    "text":"",
                                                                    "width":77.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":88.5,
                                                                    "y":76,
                                                                    "text":"",
                                                                    "width":77
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":173.5,
                                                                    "y":76,
                                                                    "text":"",
                                                                    "width":77.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":100,
                                                                    "text":"",
                                                                    "width":77.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":88.5,
                                                                    "y":100,
                                                                    "text":"",
                                                                    "width":77
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"prop12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "left";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":173.5,
                                                                    "y":100,
                                                                    "text":"",
                                                                    "width":77.5
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
                                                        "width":260,
                                                        "height":265,
                                                        "x":294,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "y":15,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label18",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":100,
                                                                    "y":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label19",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":79,
                                                                    "y":139,
                                                                    "width":121
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"iteminfo2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"",
                                                                    "x":79,
                                                                    "y":113,
                                                                    "width":121
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"QiLingEqu",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":63,
                                                                    "movable":false,
                                                                    "x":110
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"qilingBtn",
                                                            "events":{"click":"__qilingBtn_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":105,
                                                                    "width":50,
                                                                    "y":182
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"qlauto",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":240,
                                                                    "y":213,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotMaterial,
                                                            "id":"QiLingMater",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":60,
                                                                    "movable":false,
                                                                    "x":166,
                                                                    "visible":false
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
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "width":570,
                                            "height":292,
                                            "x":0,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "28";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "width":260,
                                                        "height":100,
                                                        "x":19,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label21",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":10});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"cn0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":34,
                                                                    "width":231,
                                                                    "htmlText":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"cn1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":51,
                                                                    "width":231,
                                                                    "htmlText":""
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"cn2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":67,
                                                                    "width":231,
                                                                    "htmlText":""
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
                                                        "width":260,
                                                        "height":100,
                                                        "x":19,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "y":158,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label25",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":97,
                                                                    "y":10,
                                                                    "width":63
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"co0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":34,
                                                                    "width":231
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"co1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":51,
                                                                    "width":231
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"co2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":19,
                                                                    "y":67,
                                                                    "width":231
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"lock0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":228,
                                                                    "y":29,
                                                                    "label":"",
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"lock1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":228,
                                                                    "y":49,
                                                                    "label":"",
                                                                    "width":22,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"lock2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":228,
                                                                    "y":69,
                                                                    "label":"",
                                                                    "width":22,
                                                                    "height":22
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
                                                        "width":260,
                                                        "height":265,
                                                        "x":294,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "y":15,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label29",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":91,
                                                                    "y":97
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"needInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":183});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"itemInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"",
                                                                    "x":73,
                                                                    "y":161,
                                                                    "width":121
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label32",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":24,
                                                                    "y":36,
                                                                    "width":107
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label33",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":24,
                                                                    "y":58,
                                                                    "width":107
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label34",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":24,
                                                                    "y":80,
                                                                    "width":107
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label35",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":139,
                                                                    "y":36,
                                                                    "width":111
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label36",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":139,
                                                                    "y":58,
                                                                    "width":111
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label37",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":139,
                                                                    "y":80,
                                                                    "width":111
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotEquFunc,
                                                            "id":"ChongZhuEqu",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":119,
                                                                    "movable":false,
                                                                    "x":111
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"chongzhuBtn",
                                                            "events":{"click":"__chongzhuBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "y":205
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":CheckBox,
                                                            "id":"czauto",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":240,
                                                                    "y":230,
                                                                    "height":22
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotMaterial,
                                                            "id":"ChongZhuMater",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":137,
                                                                    "movable":false,
                                                                    "x":161,
                                                                    "visible":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_QiLingPanel_Label38",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xF9F900;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":24,
                                                                    "y":14,
                                                                    "width":236
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
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "width":570,
                                            "height":292,
                                            "x":0,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"showBag",
                        "events":{"click":"__showBag_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":582,
                                "y":117,
                                "height":155,
                                "width":12,
                                "styleName":"EquipBagRight"
                            });
                        }
                    })]
                });
            }
        });
        public var equipBag:Object = {};
        private var _itemList:Object = {
            "val":new Number(-1),
            "type":new Number(-1),
            "idList":new Array()
        };
        private var _core:Core = Core.getInstance();
        private var qiLingPlan:Object = {
            "0":{
                "0":{
                    "t":32,
                    "r":100
                },
                "1":{
                    "t":71,
                    "r":100
                },
                "2":{
                    "t":62,
                    "r":100
                },
                "3":{
                    "t":63,
                    "r":100
                },
                "4":{
                    "t":1,
                    "r":100
                },
                "5":{
                    "t":58,
                    "r":100
                },
                "6":{
                    "t":9,
                    "r":100
                },
                "7":{
                    "t":6,
                    "r":100
                },
                "8":{
                    "t":7,
                    "r":100
                },
                "9":{
                    "t":2,
                    "r":100
                }
            },
            "1":{
                "0":{
                    "t":62,
                    "r":100
                },
                "1":{
                    "t":63,
                    "r":100
                },
                "2":{
                    "t":11,
                    "r":100
                },
                "3":{
                    "t":72,
                    "r":100
                },
                "4":{
                    "t":59,
                    "r":100
                },
                "5":{
                    "t":60,
                    "r":100
                },
                "6":{
                    "t":31,
                    "r":100
                },
                "7":{
                    "t":9,
                    "r":100
                },
                "8":{
                    "t":6,
                    "r":100
                },
                "9":{
                    "t":7,
                    "r":100
                },
                "10":{
                    "t":2,
                    "r":100
                }
            },
            "2":{
                "0":{
                    "t":32,
                    "r":100
                },
                "1":{
                    "t":13,
                    "r":100
                },
                "2":{
                    "t":4,
                    "r":100
                },
                "3":{
                    "t":5,
                    "r":100
                },
                "4":{
                    "t":72,
                    "r":100
                },
                "5":{
                    "t":58,
                    "r":100
                },
                "6":{
                    "t":34,
                    "r":100
                },
                "7":{
                    "t":6,
                    "r":100
                },
                "8":{
                    "t":7,
                    "r":100
                },
                "9":{
                    "t":2,
                    "r":100
                }
            },
            "3":{
                "0":{
                    "t":14,
                    "r":10
                },
                "1":{
                    "t":32,
                    "r":10
                },
                "2":{
                    "t":4,
                    "r":10
                },
                "3":{
                    "t":5,
                    "r":10
                },
                "4":{
                    "t":8,
                    "r":10
                },
                "5":{
                    "t":59,
                    "r":10
                },
                "6":{
                    "t":60,
                    "r":10
                },
                "7":{
                    "t":6,
                    "r":10
                },
                "8":{
                    "t":7,
                    "r":10
                },
                "9":{
                    "t":2,
                    "r":10
                }
            },
            "4":{
                "0":{
                    "t":14,
                    "r":100
                },
                "1":{
                    "t":32,
                    "r":100
                },
                "2":{
                    "t":4,
                    "r":100
                },
                "3":{
                    "t":5,
                    "r":100
                },
                "4":{
                    "t":8,
                    "r":100
                },
                "5":{
                    "t":58,
                    "r":100
                },
                "6":{
                    "t":61,
                    "r":100
                },
                "7":{
                    "t":31,
                    "r":100
                },
                "8":{
                    "t":6,
                    "r":100
                },
                "9":{
                    "t":7,
                    "r":100
                },
                "10":{
                    "t":2,
                    "r":100
                }
            },
            "5":{
                "0":{
                    "t":71,
                    "r":100
                },
                "1":{
                    "t":13,
                    "r":100
                },
                "2":{
                    "t":11,
                    "r":100
                },
                "3":{
                    "t":1,
                    "r":100
                },
                "4":{
                    "t":58,
                    "r":100
                },
                "5":{
                    "t":61,
                    "r":100
                },
                "6":{
                    "t":6,
                    "r":100
                },
                "7":{
                    "t":7,
                    "r":100
                },
                "8":{
                    "t":2,
                    "r":100
                },
                "9":{
                    "t":34,
                    "r":10
                }
            }
        };
        private var qlflag:Object = {};
        private var czflag:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function QiLingPanel()
        {
            mx_internal::_document = this;
            this.width = 600;
            this.height = 360;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            QiLingPanel._watcherSetupUtil = _arg_1;
        }


        public function __tabBtnA1_click(_arg_1:MouseEvent):void
        {
            tabBtnAClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get iteminfo2():Label
        {
            return (this._2132104687iteminfo2);
        }

        private function getQiLingIndex(_arg_1:Number, _arg_2:Number):Number
        {
            if (((_arg_1 == GamePredef.ITEM_KIND_MAINHAND) || (_arg_1 == GamePredef.ITEM_KIND_SUBHAND)))
            {
                return (0);
            };
            if (_arg_1 == GamePredef.ITEM_KIND_DEFENCE)
            {
                if (((_arg_2 == GamePredef.ITEM_TYPE_HAT) || (_arg_2 == GamePredef.ITEM_TYPE_CLOTHES)))
                {
                    return (3);
                };
                if (((_arg_2 == GamePredef.ITEM_TYPE_TROUSERS) || (_arg_2 == GamePredef.ITEM_TYPE_BELT)))
                {
                    return (4);
                };
                if (((_arg_2 == GamePredef.ITEM_TYPE_SHOE) || (_arg_2 == GamePredef.ITEM_TYPE_SHOULDER)))
                {
                    return (5);
                };
            }
            else
            {
                if (_arg_1 == GamePredef.ITEM_KIND_JEWELRY)
                {
                    if (((_arg_2 == GamePredef.ITEM_TYPE_NECKLACE) || (_arg_2 == GamePredef.ITEM_TYPE_RING)))
                    {
                        return (1);
                    };
                    if (((_arg_2 == GamePredef.ITEM_TYPE_JEWELRY1) || (_arg_2 == GamePredef.ITEM_TYPE_JEWELRY2)))
                    {
                        return (2);
                    };
                };
            };
            return (-1);
        }

        [Bindable(event="propertyChange")]
        public function get QiLingEqu():ItemSlotEquFunc
        {
            return (this._221842405QiLingEqu);
        }

        public function __chongzhuBtn_click(_arg_1:MouseEvent):void
        {
            chongZhuProp();
        }

        public function set iteminfo2(_arg_1:Label):void
        {
            var _local_2:Object = this._2132104687iteminfo2;
            if (_local_2 !== _arg_1)
            {
                this._2132104687iteminfo2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iteminfo2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ChongZhuMater():ItemSlotMaterial
        {
            return (this._1988465623ChongZhuMater);
        }

        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get qr2():Label
        {
            return (this._112177qr2);
        }

        public function __showBag_click(_arg_1:MouseEvent):void
        {
            changeBagVis();
        }

        public function set QiLingEqu(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object = this._221842405QiLingEqu;
            if (_local_2 !== _arg_1)
            {
                this._221842405QiLingEqu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "QiLingEqu", _local_2, _arg_1));
            };
        }

        public function onGetChongZhuProp(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:Number;
            var _local_5:String;
            var _local_6:*;
            var _local_7:*;
            chongzhuBtn.enabled = true;
            this["cn0"].htmlText = "";
            this["cn1"].htmlText = "";
            this["cn2"].htmlText = "";
            if (_arg_1)
            {
                czflag = _arg_1;
                _local_3 = 0;
                while (_local_3 < 3)
                {
                    _local_4 = (_arg_1[_local_3]["v"] / _arg_1[_local_3]["max"]);
                    _local_5 = "#FFFFFF";
                    _local_6 = 0;
                    while (_local_6 < GamePredef.QILING_COLOR.length)
                    {
                        if (_local_4 >= (GamePredef.QILING_COLOR[_local_6] / 100))
                        {
                            _local_5 = GamePredef.QILING_COLOR_CODE[_local_6];
                            break;
                        };
                        _local_6++;
                    };
                    _local_7 = "";
                    if (_arg_1[_local_3]["v"] == _arg_1[_local_3]["max"])
                    {
                        _local_7 = Language.QILING_PANEL[4];
                    };
                    if (GamePredef.PROP_SUFFIX[_arg_1[_local_3]["t"]])
                    {
                        if (GamePredef.PROP_SUFFIX[_arg_1[_local_3]["t"]] == 1)
                        {
                            this[("co" + _local_3)].htmlText = ((((((((((Language.TIP_QILING_H[_arg_1[_local_3]["t"]] + "  <font color='") + _local_5) + "'>") + Math.ceil(_arg_1[_local_3]["v"])) + _local_7) + "</font> (") + (_arg_1[_local_3]["max"] / 10)) + "-") + _arg_1[_local_3]["max"]) + ")");
                        }
                        else
                        {
                            if (GamePredef.PROP_SUFFIX[_arg_1[_local_3]["t"]] == 2)
                            {
                                this[("co" + _local_3)].htmlText = ((((((((((Language.TIP_QILING_H[_arg_1[_local_3]["t"]] + "  <font color='") + _local_5) + "'>") + Number(_arg_1[_local_3]["v"]).toFixed(3)) + _local_7) + "</font> (") + (_arg_1[_local_3]["max"] / 10)) + "-") + _arg_1[_local_3]["max"]) + ")");
                            }
                            else
                            {
                                this[("co" + _local_3)].htmlText = ((((((((((((Language.TIP_QILING_H[_arg_1[_local_3]["t"]] + "  <font color='") + _local_5) + "'>") + Number((_arg_1[_local_3]["v"] * 100)).toFixed(3)) + "%") + _local_7) + "</font> (") + ((_arg_1[_local_3]["max"] / 10) * 100)) + "%-") + (_arg_1[_local_3]["max"] * 100)) + "%") + ")");
                            };
                        };
                    }
                    else
                    {
                        this[("co" + _local_3)].htmlText = ((((((((((Language.TIP_QILING_H[_arg_1[_local_3]["t"]] + "  <font color='") + _local_5) + "'>") + _arg_1[_local_3]["v"]) + _local_7) + "</font> (") + (_arg_1[_local_3]["max"] / 10)) + "-") + _arg_1[_local_3]["max"]) + ")");
                    };
                    _local_3++;
                };
            }
            else
            {
                this["co0"].htmlText = Language.QILING_PANEL[5];
                this["co1"].htmlText = Language.QILING_PANEL[5];
                this["co2"].htmlText = Language.QILING_PANEL[5];
                czflag = {};
            };
            var _local_2:int = _core.getItemNum(29, GamePredef.QI_LING_ITEM).num;
            iteminfo2.text = (Language.QILING_PANEL[3] + _local_2);
            itemInfo.text = (Language.QILING_PANEL[3] + _local_2);
        }

        [Bindable(event="propertyChange")]
        public function get qr1():Label
        {
            return (this._112176qr1);
        }

        private function _QiLingPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.QILING_PANEL[0];
            _local_1 = Language.QILING_PANEL[23];
            _local_1 = Language.QILING_PANEL[24];
            _local_1 = Language.PANEL_PETGUARD[19];
            _local_1 = Language.QILING_PANEL[6];
            _local_1 = Language.QILING_PANEL[7];
            _local_1 = Language.QILING_PANEL[8];
            _local_1 = Language.QILING_PANEL[9];
            _local_1 = Language.QILING_PANEL[23];
            _local_1 = Language.QILING_PANEL[10];
            _local_1 = Language.QILING_PANEL[11];
            _local_1 = Language.QILING_PANEL[12];
            _local_1 = Language.QILING_PANEL[13];
            _local_1 = Language.QILING_PANEL[14];
            _local_1 = Language.QILING_PANEL[15];
            _local_1 = Language.QILING_PANEL[16];
            _local_1 = Language.QILING_PANEL[17];
            _local_1 = Language.QILING_PANEL[18];
            _local_1 = Language.QILING_PANEL[19];
            _local_1 = Language.QILING_PANEL[20];
            _local_1 = Language.QILING_PANEL[24];
            _local_1 = Language.QILING_PANEL[10];
            _local_1 = Language.QILING_PANEL[21];
            _local_1 = Language.EQUIPTFUNCPANEL_S[97];
        }

        [Bindable(event="propertyChange")]
        public function get qr0():Label
        {
            return (this._112175qr0);
        }

        private function _updateChongZhuSlot():void
        {
            if (getEquiptIndex1() != -1)
            {
                _core.remote.call("getChongZhuProp", new Responder(onGetChongZhuProp), ChongZhuEqu.slotData.id);
                chongzhuBtn.enabled = false;
            }
            else
            {
                ChongZhuEqu.clean();
            };
        }

        public function set cn1(_arg_1:Label):void
        {
            var _local_2:Object = this._98598cn1;
            if (_local_2 !== _arg_1)
            {
                this._98598cn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cn1", _local_2, _arg_1));
            };
        }

        public function set cn2(_arg_1:Label):void
        {
            var _local_2:Object = this._98599cn2;
            if (_local_2 !== _arg_1)
            {
                this._98599cn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cn2", _local_2, _arg_1));
            };
        }

        public function set ChongZhuMater(_arg_1:ItemSlotMaterial):void
        {
            var _local_2:Object = this._1988465623ChongZhuMater;
            if (_local_2 !== _arg_1)
            {
                this._1988465623ChongZhuMater = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ChongZhuMater", _local_2, _arg_1));
            };
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function set cn0(_arg_1:Label):void
        {
            var _local_2:Object = this._98597cn0;
            if (_local_2 !== _arg_1)
            {
                this._98597cn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cn0", _local_2, _arg_1));
            };
        }

        public function set prop1(_arg_1:Label):void
        {
            var _local_2:Object = this._106940718prop1;
            if (_local_2 !== _arg_1)
            {
                this._106940718prop1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get QiLingMater():ItemSlotMaterial
        {
            return (this._1564727391QiLingMater);
        }

        [Bindable(event="propertyChange")]
        public function get itemInfo():Label
        {
            return (this._1177195105itemInfo);
        }

        public function set prop4(_arg_1:Label):void
        {
            var _local_2:Object = this._106940721prop4;
            if (_local_2 !== _arg_1)
            {
                this._106940721prop4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ChongZhuEqu():ItemSlotEquFunc
        {
            return (this._172225125ChongZhuEqu);
        }

        [Bindable(event="propertyChange")]
        public function get lock2():CheckBox
        {
            return (this._103145575lock2);
        }

        public function set prop7(_arg_1:Label):void
        {
            var _local_2:Object = this._106940724prop7;
            if (_local_2 !== _arg_1)
            {
                this._106940724prop7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop7", _local_2, _arg_1));
            };
        }

        public function set qr2(_arg_1:Label):void
        {
            var _local_2:Object = this._112177qr2;
            if (_local_2 !== _arg_1)
            {
                this._112177qr2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qr2", _local_2, _arg_1));
            };
        }

        public function set prop8(_arg_1:Label):void
        {
            var _local_2:Object = this._106940725prop8;
            if (_local_2 !== _arg_1)
            {
                this._106940725prop8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lock0():CheckBox
        {
            return (this._103145573lock0);
        }

        private function updateEquipt(_arg_1:Object, _arg_2:Number):void
        {
            if (_arg_2 == 0)
            {
                QiLingEqu.slotData = _arg_1;
                QiLingEqu.type = _arg_1.type;
                QiLingEqu.giid = _arg_1.itemId;
                QiLingEqu.stackNum = _arg_1.stackNum;
            }
            else
            {
                if (_arg_2 == 1)
                {
                    ChongZhuEqu.slotData = _arg_1;
                    ChongZhuEqu.type = _arg_1.type;
                    ChongZhuEqu.giid = _arg_1.itemId;
                    ChongZhuEqu.stackNum = _arg_1.stackNum;
                };
            };
        }

        private function menuPop(_arg_1:Object):void
        {
            var _local_2:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_2.show(stage.mouseX, stage.mouseY);
            _local_2.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        [Bindable(event="propertyChange")]
        public function get lock1():CheckBox
        {
            return (this._103145574lock1);
        }

        public function set prop2(_arg_1:Label):void
        {
            var _local_2:Object = this._106940719prop2;
            if (_local_2 !== _arg_1)
            {
                this._106940719prop2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop2", _local_2, _arg_1));
            };
        }

        public function set prop3(_arg_1:Label):void
        {
            var _local_2:Object = this._106940720prop3;
            if (_local_2 !== _arg_1)
            {
                this._106940720prop3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop3", _local_2, _arg_1));
            };
        }

        public function set prop9(_arg_1:Label):void
        {
            var _local_2:Object = this._106940726prop9;
            if (_local_2 !== _arg_1)
            {
                this._106940726prop9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop9", _local_2, _arg_1));
            };
        }

        public function onChongZhuRes(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            var _local_7:*;
            var _local_8:Number;
            var _local_9:String;
            var _local_10:*;
            var _local_11:*;
            if (_arg_1)
            {
                if (_arg_1["use"])
                {
                    _local_3 = _arg_1["use"];
                    _local_4 = ((lock0.selected) ? "lock" : "");
                    _local_5 = ((lock1.selected) ? "lock" : "");
                    _local_6 = ((lock2.selected) ? "lock" : "");
                    if (((!(_local_4 == "lock")) && (_local_3[0]["v"] == _local_3[0]["max"])))
                    {
                        newPropAlert();
                    }
                    else
                    {
                        if (((!(_local_5 == "lock")) && (_local_3[1]["v"] == _local_3[1]["max"])))
                        {
                            newPropAlert();
                        }
                        else
                        {
                            if (((!(_local_6 == "lock")) && (_local_3[2]["v"] == _local_3[2]["max"])))
                            {
                                newPropAlert();
                            };
                        };
                    };
                };
            };
            chongzhuBtn.enabled = true;
            var _local_2:int = _core.getItemNum(29, GamePredef.QI_LING_ITEM).num;
            iteminfo2.text = (Language.QILING_PANEL[3] + _local_2);
            itemInfo.text = (Language.QILING_PANEL[3] + _local_2);
            if (_arg_1["cz"])
            {
                _local_3 = _arg_1["cz"];
                _local_7 = 0;
                while (_local_7 < 3)
                {
                    _local_8 = (_local_3[_local_7]["v"] / _local_3[_local_7]["max"]);
                    _local_9 = "#FFFFFF";
                    _local_10 = 0;
                    while (_local_10 < GamePredef.QILING_COLOR.length)
                    {
                        if (_local_8 >= (GamePredef.QILING_COLOR[_local_10] / 100))
                        {
                            _local_9 = GamePredef.QILING_COLOR_CODE[_local_10];
                            break;
                        };
                        _local_10++;
                    };
                    _local_11 = "";
                    if (_local_3[_local_7]["v"] == _local_3[_local_7]["max"])
                    {
                        _local_11 = Language.QILING_PANEL[4];
                    };
                    if (GamePredef.PROP_SUFFIX[_local_3[_local_7]["t"]])
                    {
                        if (GamePredef.PROP_SUFFIX[_local_3[_local_7]["t"]] == 1)
                        {
                            this[("cn" + _local_7)].htmlText = ((((((((((Language.TIP_QILING_H[_local_3[_local_7]["t"]] + "  <font color='") + _local_9) + "'>") + Math.ceil(_local_3[_local_7]["v"])) + _local_11) + "</font> (") + (_local_3[_local_7]["max"] / 10)) + "-") + _local_3[_local_7]["max"]) + ")");
                        }
                        else
                        {
                            if (GamePredef.PROP_SUFFIX[_local_3[_local_7]["t"]] == 2)
                            {
                                this[("cn" + _local_7)].htmlText = ((((((((((Language.TIP_QILING_H[_local_3[_local_7]["t"]] + "  <font color='") + _local_9) + "'>") + Number(_local_3[_local_7]["v"]).toFixed(3)) + _local_11) + "</font> (") + (_local_3[_local_7]["max"] / 10)) + "-") + _local_3[_local_7]["max"]) + ")");
                            }
                            else
                            {
                                this[("cn" + _local_7)].htmlText = ((((((((((((Language.TIP_QILING_H[_local_3[_local_7]["t"]] + "  <font color='") + _local_9) + "'>") + Number((_local_3[_local_7]["v"] * 100)).toFixed(3)) + "%") + _local_11) + "</font> (") + ((_local_3[_local_7]["max"] * 100) / 10)) + "%-") + (_local_3[_local_7]["max"] * 100)) + "%") + ")");
                            };
                        };
                    }
                    else
                    {
                        this[("cn" + _local_7)].htmlText = ((((((((((Language.TIP_QILING_H[_local_3[_local_7]["t"]] + "  <font color='") + _local_9) + "'>") + _local_3[_local_7]["v"]) + _local_11) + "</font> (") + (_local_3[_local_7]["max"] / 10)) + "-") + _local_3[_local_7]["max"]) + ")");
                    };
                    _local_7++;
                };
            };
            if (_arg_1["use"])
            {
                _local_3 = _arg_1["use"];
                czflag = _local_3;
                _local_7 = 0;
                while (_local_7 < 3)
                {
                    _local_8 = (_local_3[_local_7]["v"] / _local_3[_local_7]["max"]);
                    _local_9 = "#FFFFFF";
                    _local_10 = 0;
                    while (_local_10 < GamePredef.QILING_COLOR.length)
                    {
                        if (_local_8 >= (GamePredef.QILING_COLOR[_local_10] / 100))
                        {
                            _local_9 = GamePredef.QILING_COLOR_CODE[_local_10];
                            break;
                        };
                        _local_10++;
                    };
                    _local_11 = "";
                    if (_local_3[_local_7]["v"] == _local_3[_local_7]["max"])
                    {
                        _local_11 = Language.QILING_PANEL[4];
                    };
                    if (GamePredef.PROP_SUFFIX[_local_3[_local_7]["t"]])
                    {
                        if (GamePredef.PROP_SUFFIX[_local_3[_local_7]["t"]] == 1)
                        {
                            this[("co" + _local_7)].htmlText = ((((((((((Language.TIP_QILING_H[_local_3[_local_7]["t"]] + "  <font color='") + _local_9) + "'>") + Math.ceil(_local_3[_local_7]["v"])) + _local_11) + "</font> (") + (_local_3[_local_7]["max"] / 10)) + "-") + _local_3[_local_7]["max"]) + ")");
                        }
                        else
                        {
                            if (GamePredef.PROP_SUFFIX[_local_3[_local_7]["t"]] == 2)
                            {
                                this[("co" + _local_7)].htmlText = ((((((((((Language.TIP_QILING_H[_local_3[_local_7]["t"]] + "  <font color='") + _local_9) + "'>") + Number(_local_3[_local_7]["v"]).toFixed(3)) + _local_11) + "</font> (") + (_local_3[_local_7]["max"] / 10)) + "-") + _local_3[_local_7]["max"]) + ")");
                            }
                            else
                            {
                                this[("co" + _local_7)].htmlText = ((((((((((((Language.TIP_QILING_H[_local_3[_local_7]["t"]] + "  <font color='") + _local_9) + "'>") + Number((_local_3[_local_7]["v"] * 100)).toFixed(3)) + "%") + _local_11) + "</font> (") + ((_local_3[_local_7]["max"] / 10) * 100)) + "%-") + (_local_3[_local_7]["max"] * 100)) + "%") + ")");
                            };
                        };
                    }
                    else
                    {
                        this[("co" + _local_7)].htmlText = ((((((((((Language.TIP_QILING_H[_local_3[_local_7]["t"]] + "  <font color='") + _local_9) + "'>") + _local_3[_local_7]["v"]) + _local_11) + "</font> (") + (_local_3[_local_7]["max"] / 10)) + "-") + _local_3[_local_7]["max"]) + ")");
                    };
                    _local_7++;
                };
            };
        }

        public function set qr0(_arg_1:Label):void
        {
            var _local_2:Object = this._112175qr0;
            if (_local_2 !== _arg_1)
            {
                this._112175qr0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qr0", _local_2, _arg_1));
            };
        }

        public function onQiLingRes(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:Number;
            var _local_5:String;
            var _local_6:*;
            var _local_7:*;
            qilingBtn.enabled = true;
            var _local_2:int = _core.getItemNum(29, GamePredef.QI_LING_ITEM).num;
            iteminfo2.text = (Language.QILING_PANEL[3] + _local_2);
            itemInfo.text = (Language.QILING_PANEL[3] + _local_2);
            if (_arg_1)
            {
                qlflag = _arg_1;
                _local_3 = 0;
                while (_local_3 < 3)
                {
                    _local_4 = (_arg_1[_local_3]["v"] / _arg_1[_local_3]["max"]);
                    _local_5 = "#FFFFFF";
                    _local_6 = 0;
                    while (_local_6 < GamePredef.QILING_COLOR.length)
                    {
                        if (_local_4 >= (GamePredef.QILING_COLOR[_local_6] / 100))
                        {
                            _local_5 = GamePredef.QILING_COLOR_CODE[_local_6];
                            break;
                        };
                        _local_6++;
                    };
                    _local_7 = "";
                    if (_arg_1[_local_3]["v"] == _arg_1[_local_3]["max"])
                    {
                        _local_7 = Language.QILING_PANEL[4];
                    };
                    if (GamePredef.PROP_SUFFIX[_arg_1[_local_3]["t"]])
                    {
                        if (GamePredef.PROP_SUFFIX[_arg_1[_local_3]["t"]] == 1)
                        {
                            this[("qr" + _local_3)].htmlText = ((((((((((Language.TIP_QILING_H[_arg_1[_local_3]["t"]] + "  <font color='") + _local_5) + "'>") + Math.ceil(_arg_1[_local_3]["v"])) + _local_7) + "</font> (") + (_arg_1[_local_3]["max"] / 10)) + "-") + _arg_1[_local_3]["max"]) + ")");
                        }
                        else
                        {
                            if (GamePredef.PROP_SUFFIX[_arg_1[_local_3]["t"]] == 2)
                            {
                                this[("qr" + _local_3)].htmlText = ((((((((((Language.TIP_QILING_H[_arg_1[_local_3]["t"]] + "  <font color='") + _local_5) + "'>") + Number(_arg_1[_local_3]["v"]).toFixed(3)) + _local_7) + "</font> (") + (_arg_1[_local_3]["max"] / 10)) + "-") + _arg_1[_local_3]["max"]) + ")");
                            }
                            else
                            {
                                this[("qr" + _local_3)].htmlText = ((((((((((((Language.TIP_QILING_H[_arg_1[_local_3]["t"]] + "  <font color='") + _local_5) + "'>") + Number((_arg_1[_local_3]["v"] * 100)).toFixed(3)) + "%") + _local_7) + "</font> (") + ((_arg_1[_local_3]["max"] / 10) * 100)) + "%-") + (_arg_1[_local_3]["max"] * 100)) + "%") + ")");
                            };
                        };
                    }
                    else
                    {
                        this[("qr" + _local_3)].htmlText = ((((((((((Language.TIP_QILING_H[_arg_1[_local_3]["t"]] + "  <font color='") + _local_5) + "'>") + _arg_1[_local_3]["v"]) + _local_7) + "</font> (") + (_arg_1[_local_3]["max"] / 10)) + "-") + _arg_1[_local_3]["max"]) + ")");
                    };
                    _local_3++;
                };
            }
            else
            {
                qlflag = {};
            };
        }

        private function changeQiLingEqu(_arg_1:Event):void
        {
            _updateQiLingSlot();
        }

        [Bindable(event="propertyChange")]
        public function get needInfo():Label
        {
            return (this._865347172needInfo);
        }

        public function set co0(_arg_1:Label):void
        {
            var _local_2:Object = this._98628co0;
            if (_local_2 !== _arg_1)
            {
                this._98628co0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "co0", _local_2, _arg_1));
            };
        }

        public function set co1(_arg_1:Label):void
        {
            var _local_2:Object = this._98629co1;
            if (_local_2 !== _arg_1)
            {
                this._98629co1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "co1", _local_2, _arg_1));
            };
        }

        public function set qr1(_arg_1:Label):void
        {
            var _local_2:Object = this._112176qr1;
            if (_local_2 !== _arg_1)
            {
                this._112176qr1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qr1", _local_2, _arg_1));
            };
        }

        public function set prop5(_arg_1:Label):void
        {
            var _local_2:Object = this._106940722prop5;
            if (_local_2 !== _arg_1)
            {
                this._106940722prop5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop5", _local_2, _arg_1));
            };
        }

        public function set qlauto(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._957127094qlauto;
            if (_local_2 !== _arg_1)
            {
                this._957127094qlauto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qlauto", _local_2, _arg_1));
            };
        }

        public function set co2(_arg_1:Label):void
        {
            var _local_2:Object = this._98630co2;
            if (_local_2 !== _arg_1)
            {
                this._98630co2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "co2", _local_2, _arg_1));
            };
        }

        public function set tabA(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3552076tabA;
            if (_local_2 !== _arg_1)
            {
                this._3552076tabA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabA", _local_2, _arg_1));
            };
        }

        public function set prop6(_arg_1:Label):void
        {
            var _local_2:Object = this._106940723prop6;
            if (_local_2 !== _arg_1)
            {
                this._106940723prop6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get czauto():CheckBox
        {
            return (this._1345005914czauto);
        }

        internal function qiLingProp():*
        {
            var auto:String;
            var gfunc:Function;
            var i:* = undefined;
            var handler:Function;
            var str:String;
            if (QiLingEqu.slotData == null)
            {
                return;
            };
            var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var goldLockFlag:Boolean = bagPanel.goldLockFlag;
            if (((goldLockFlag) || (!(bagPanel))))
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                return;
            };
            auto = ((qlauto.selected) ? "auto" : "");
            if (((qlflag) && (qlflag["0"])))
            {
                i = 0;
                while (i < 3)
                {
                    if (qlflag[i]["v"] == qlflag[i]["max"])
                    {
                        handler = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("updateQiLingProp", new Responder(onQilingBtnState), QiLingEqu.slotData.id, auto);
                                qilingBtn.enabled = false;
                                return;
                            };
                        };
                        if (_alert)
                        {
                            PopUpManager.removePopUp(_alert);
                            _alert = null;
                        };
                        str = Language.QILING_PANEL[1];
                        _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                        return;
                    };
                    i++;
                };
            };
            _core.remote.call("updateQiLingProp", new Responder(onQilingBtnState), QiLingEqu.slotData.id, auto);
            qilingBtn.enabled = false;
        }

        private function changeChongZhuEqu(_arg_1:Event):void
        {
            _updateChongZhuSlot();
        }

        [Bindable(event="propertyChange")]
        public function get qlauto():CheckBox
        {
            return (this._957127094qlauto);
        }

        public function set QiLingMater(_arg_1:ItemSlotMaterial):void
        {
            var _local_2:Object = this._1564727391QiLingMater;
            if (_local_2 !== _arg_1)
            {
                this._1564727391QiLingMater = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "QiLingMater", _local_2, _arg_1));
            };
        }

        private function lockEventChange(_arg_1:Event):void
        {
            var _local_2:Number = 6;
            if (lock0.selected)
            {
                _local_2 = (_local_2 + QL_LOCK_NUM);
            };
            if (lock1.selected)
            {
                _local_2 = (_local_2 + QL_LOCK_NUM);
            };
            if (lock2.selected)
            {
                _local_2 = (_local_2 + QL_LOCK_NUM);
            };
            needInfo.text = (Language.QILING_PANEL[14] + _local_2);
        }

        private function resetItemList():void
        {
        }

        public function set itemInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1177195105itemInfo;
            if (_local_2 !== _arg_1)
            {
                this._1177195105itemInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get prop11():Label
        {
            return (this._979804989prop11);
        }

        [Bindable(event="propertyChange")]
        public function get prop12():Label
        {
            return (this._979804988prop12);
        }

        private function changeBagVis():void
        {
            if (!equipBagAdded)
            {
                equipBag = null;
                equipBag = new EquipFuncBag();
                equipBag.x = 605;
                equipBag.y = 34;
                width = 850;
                addChild((equipBag as EquipFuncBag));
                equipBag.eFuncPanel = this;
                equipBagAdded = true;
                showBag.styleName = "EquipBagLeft";
            }
            else
            {
                if (equipBag.visible)
                {
                    equipBag.visible = false;
                    showBag.styleName = "EquipBagRight";
                    width = 600;
                }
                else
                {
                    equipBag.visible = true;
                    width = 850;
                    showBag.styleName = "EquipBagLeft";
                };
            };
            if (equipBag.visible)
            {
                _itemList.type = 1;
                _itemList.idList = [GamePredef.QILING_ITEMID];
                equipBag.showItem(99, _itemList);
            };
        }

        public function set ChongZhuEqu(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object = this._172225125ChongZhuEqu;
            if (_local_2 !== _arg_1)
            {
                this._172225125ChongZhuEqu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ChongZhuEqu", _local_2, _arg_1));
            };
        }

        public function ___QiLingPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function __tabBtnA0_click(_arg_1:MouseEvent):void
        {
            tabBtnAClick(0);
        }

        public function set needInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._865347172needInfo;
            if (_local_2 !== _arg_1)
            {
                this._865347172needInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needInfo", _local_2, _arg_1));
            };
        }

        public function set lock0(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._103145573lock0;
            if (_local_2 !== _arg_1)
            {
                this._103145573lock0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock0", _local_2, _arg_1));
            };
        }

        public function set lock2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._103145575lock2;
            if (_local_2 !== _arg_1)
            {
                this._103145575lock2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnA1():BasicGlowButton
        {
            return (this._933747497tabBtnA1);
        }

        [Bindable(event="propertyChange")]
        public function get prop10():Label
        {
            return (this._979804990prop10);
        }

        public function set lock1(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._103145574lock1;
            if (_local_2 !== _arg_1)
            {
                this._103145574lock1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock1", _local_2, _arg_1));
            };
        }

        public function set qilingBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._404500846qilingBtn;
            if (_local_2 !== _arg_1)
            {
                this._404500846qilingBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qilingBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnA0():BasicGlowButton
        {
            return (this._933747498tabBtnA0);
        }

        private function _QiLingPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pTitle.text = _arg_1;
            }, "pTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnA0.label = _arg_1;
            }, "tabBtnA0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnA1.label = _arg_1;
            }, "tabBtnA1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_LinkButton1.label = _arg_1;
            }, "_QiLingPanel_LinkButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label1.text = _arg_1;
            }, "_QiLingPanel_Label1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label5.text = _arg_1;
            }, "_QiLingPanel_Label5.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label18.text = _arg_1;
            }, "_QiLingPanel_Label18.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label19.text = _arg_1;
            }, "_QiLingPanel_Label19.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                qilingBtn.label = _arg_1;
            }, "qilingBtn.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                qlauto.label = _arg_1;
            }, "qlauto.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label21.text = _arg_1;
            }, "_QiLingPanel_Label21.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label25.text = _arg_1;
            }, "_QiLingPanel_Label25.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label29.text = _arg_1;
            }, "_QiLingPanel_Label29.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                needInfo.text = _arg_1;
            }, "needInfo.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label32.text = _arg_1;
            }, "_QiLingPanel_Label32.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label33.text = _arg_1;
            }, "_QiLingPanel_Label33.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label34.text = _arg_1;
            }, "_QiLingPanel_Label34.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label35.text = _arg_1;
            }, "_QiLingPanel_Label35.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label36.text = _arg_1;
            }, "_QiLingPanel_Label36.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label37.text = _arg_1;
            }, "_QiLingPanel_Label37.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                chongzhuBtn.label = _arg_1;
            }, "chongzhuBtn.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                czauto.label = _arg_1;
            }, "czauto.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.QILING_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _QiLingPanel_Label38.text = _arg_1;
            }, "_QiLingPanel_Label38.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_S[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showBag.toolTip = _arg_1;
            }, "showBag.toolTip");
            result[23] = binding;
            return (result);
        }

        public function __pTitle_creationComplete(_arg_1:FlexEvent):void
        {
            tabBtnAClick(0);
        }

        public function set chongzhuBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._579513480chongzhuBtn;
            if (_local_2 !== _arg_1)
            {
                this._579513480chongzhuBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chongzhuBtn", _local_2, _arg_1));
            };
        }

        internal function initLockEvent():*
        {
            if (((lock0) && (!(lock0.hasEventListener(Event.CHANGE)))))
            {
                lock0.addEventListener(Event.CHANGE, lockEventChange);
            };
            if (((lock1) && (!(lock1.hasEventListener(Event.CHANGE)))))
            {
                lock1.addEventListener(Event.CHANGE, lockEventChange);
            };
            if (((lock2) && (!(lock2.hasEventListener(Event.CHANGE)))))
            {
                lock2.addEventListener(Event.CHANGE, lockEventChange);
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function onGetQiLingProp(_arg_1:Object):void
        {
            var _local_4:*;
            if (_arg_1)
            {
                onQiLingRes(_arg_1);
            }
            else
            {
                qilingBtn.enabled = true;
                this["qr0"].htmlText = Language.QILING_PANEL[5];
                this["qr1"].htmlText = Language.QILING_PANEL[5];
                this["qr2"].htmlText = Language.QILING_PANEL[5];
            };
            var _local_2:Number = getEquiptIndex();
            if (_local_2 != -1)
            {
                _local_4 = 1;
                while (_local_4 <= 12)
                {
                    this[("prop" + _local_4)].text = "";
                    _local_4++;
                };
                if (qiLingPlan[_local_2])
                {
                    _local_4 = 1;
                    while (_local_4 <= 12)
                    {
                        if (qiLingPlan[_local_2][(_local_4 - 1)])
                        {
                            this[("prop" + _local_4)].text = Language.TIP_QILING_H[qiLingPlan[_local_2][(_local_4 - 1)]["t"]];
                        };
                        _local_4++;
                    };
                };
            }
            else
            {
                _local_4 = 1;
                while (_local_4 <= 12)
                {
                    this[("prop" + _local_4)].text = "";
                    _local_4++;
                };
            };
            var _local_3:int = _core.getItemNum(29, GamePredef.QI_LING_ITEM).num;
            iteminfo2.text = (Language.QILING_PANEL[3] + _local_3);
            itemInfo.text = (Language.QILING_PANEL[3] + _local_3);
        }

        internal function tabBtnAClick(_arg_1:int):*
        {
            var _local_3:Number;
            var _local_2:int = ((tabA) ? tabA.selectedIndex : 0);
            this[("tabBtnA" + _local_2)].selected = false;
            tabA.selectedIndex = _arg_1;
            this[("tabBtnA" + _arg_1)].selected = true;
            resetItemList();
            switch (_arg_1)
            {
                case 0:
                    _updateQiLingSlot();
                    _itemList.type = 1;
                    _itemList.idList = [GamePredef.QILING_ITEMID];
                    ((QiLingEqu) && (QiLingEqu.addEventListener(GameEvent.SLOT_GIID_CHANGE, changeQiLingEqu)));
                    return;
                case 1:
                    _updateChongZhuSlot();
                    initLockEvent();
                    _itemList.type = 1;
                    _itemList.idList = [GamePredef.QILING_ITEMID];
                    ((ChongZhuEqu) && (ChongZhuEqu.addEventListener(GameEvent.SLOT_GIID_CHANGE, changeChongZhuEqu)));
                    _local_3 = 6;
                    if (lock0.selected)
                    {
                        _local_3 = (_local_3 + QL_LOCK_NUM);
                    };
                    if (lock1.selected)
                    {
                        _local_3 = (_local_3 + QL_LOCK_NUM);
                    };
                    if (lock2.selected)
                    {
                        _local_3 = (_local_3 + QL_LOCK_NUM);
                    };
                    needInfo.text = (Language.QILING_PANEL[14] + _local_3);
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get cn1():Label
        {
            return (this._98598cn1);
        }

        [Bindable(event="propertyChange")]
        public function get cn2():Label
        {
            return (this._98599cn2);
        }

        [Bindable(event="propertyChange")]
        public function get prop1():Label
        {
            return (this._106940718prop1);
        }

        [Bindable(event="propertyChange")]
        public function get prop6():Label
        {
            return (this._106940723prop6);
        }

        [Bindable(event="propertyChange")]
        public function get cn0():Label
        {
            return (this._98597cn0);
        }

        [Bindable(event="propertyChange")]
        public function get prop8():Label
        {
            return (this._106940725prop8);
        }

        [Bindable(event="propertyChange")]
        public function get prop2():Label
        {
            return (this._106940719prop2);
        }

        [Bindable(event="propertyChange")]
        public function get prop3():Label
        {
            return (this._106940720prop3);
        }

        [Bindable(event="propertyChange")]
        public function get prop4():Label
        {
            return (this._106940721prop4);
        }

        [Bindable(event="propertyChange")]
        public function get prop5():Label
        {
            return (this._106940722prop5);
        }

        [Bindable(event="propertyChange")]
        public function get prop7():Label
        {
            return (this._106940724prop7);
        }

        [Bindable(event="propertyChange")]
        public function get prop9():Label
        {
            return (this._106940726prop9);
        }

        [Bindable(event="propertyChange")]
        public function get co0():Label
        {
            return (this._98628co0);
        }

        [Bindable(event="propertyChange")]
        public function get co1():Label
        {
            return (this._98629co1);
        }

        public function set czauto(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1345005914czauto;
            if (_local_2 !== _arg_1)
            {
                this._1345005914czauto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "czauto", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get co2():Label
        {
            return (this._98630co2);
        }

        [Bindable(event="propertyChange")]
        public function get tabA():ViewStack
        {
            return (this._3552076tabA);
        }

        private function _updateQiLingSlot():void
        {
            if (getEquiptIndex() != -1)
            {
                _core.remote.call("getQiLingProp", new Responder(onGetQiLingProp), QiLingEqu.slotData.id);
                qilingBtn.enabled = false;
            }
            else
            {
                QiLingEqu.clean();
            };
        }

        public function funcBagClickHandler(_arg_1:Event):void
        {
            var _local_7:Array;
            var _local_8:String;
            var _local_9:ItemSlot;
            var _local_10:Boolean;
            var _local_11:String;
            setAutoMatchSlots();
            var _local_2:Object = _arg_1.currentTarget.slotData;
            if (!_local_2)
            {
                return;
            };
            var _local_3:Number = Number(_local_2.sid);
            var _local_4:Object = _core.getTemplateData(_local_2.type, _local_2.itemId);
            if (!_local_4)
            {
                return;
            };
            var _local_5:int = ((tabA) ? tabA.selectedIndex : 0);
            if (_local_5 == 2)
            {
                return;
            };
            var _local_6:Array = _autoMatchSlots.inputSlots;
            if (((_autoMatchSlots.hasReq) && (_autoMatchSlots.reqSlots)))
            {
                _local_7 = _autoMatchSlots.reqSlots;
                for (_local_8 in _local_7)
                {
                    if (((_local_2.type == _local_7[_local_8].type) && (_local_4.id == _local_7[_local_8].id)))
                    {
                        _local_9 = _autoMatchSlots.inputSlots[_local_8];
                        _local_9.slotData = _local_2;
                        _local_9.type = _local_2.type;
                        _local_9.giid = _local_2.itemId;
                        _local_9.stackNum = _local_2.stackNum;
                    };
                };
            }
            else
            {
                _local_7 = _autoMatchSlots.reqSlots;
                if (!_local_7)
                {
                    _local_9 = _autoMatchSlots.inputSlots[0];
                    _local_9.slotData = _local_2;
                    _local_9.type = _local_2.type;
                    _local_9.giid = _local_2.itemId;
                    _local_9.stackNum = _local_2.stackNum;
                }
                else
                {
                    for (_local_8 in _local_7)
                    {
                        _local_10 = true;
                        for (_local_11 in _local_7[_local_8])
                        {
                            if (_local_11 == "itemType")
                            {
                                if (_local_2.type != _local_7[_local_8][_local_11])
                                {
                                    _local_10 = false;
                                    break;
                                };
                            }
                            else
                            {
                                if (((!(_local_4.hasOwnProperty(_local_11))) || (!(_local_4[_local_11] == _local_7[_local_8][_local_11]))))
                                {
                                    _local_10 = false;
                                    break;
                                };
                            };
                        };
                        if (_local_10)
                        {
                            if ((((_autoMatchSlots.orderPut) && (_autoMatchSlots.menuArr)) && (_local_2.type == _autoMatchSlots.orderType)))
                            {
                                for (_local_8 in _autoMatchSlots.menuArr)
                                {
                                    _autoMatchSlots.menuArr[_local_8].data.sData = _local_2;
                                };
                                menuPop(_autoMatchSlots.menuArr);
                            }
                            else
                            {
                                if (_autoMatchSlots.inputSlots[_local_8])
                                {
                                    _local_9 = _autoMatchSlots.inputSlots[_local_8];
                                    _local_9.slotData = _local_2;
                                    _local_9.type = _local_2.type;
                                    _local_9.giid = _local_2.itemId;
                                    _local_9.stackNum = _local_2.stackNum;
                                };
                            };
                            break;
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get qilingBtn():BasicGlowButton
        {
            return (this._404500846qilingBtn);
        }

        private function getEquiptIndex1():*
        {
            var _local_1:Object;
            var _local_2:*;
            if (ChongZhuEqu.slotData)
            {
                _local_1 = _core.getTemplateData(ChongZhuEqu.slotData.type, ChongZhuEqu.slotData.itemId, false);
                if (_local_1)
                {
                    if (ToolKit.isSmallOrEqual(_local_1["reqLevel"], 150))
                    {
                        _core.sysMsg(Language.QILING_PANEL[25]);
                        return (-1);
                    };
                    _local_2 = getQiLingIndex(Number(_local_1["kind"]), Number(_local_1["type"]));
                    if (_local_2 != -1)
                    {
                        return (_local_2);
                    };
                    if (_local_2 == -1)
                    {
                        _core.sysMsg(Language.QILING_PANEL[25]);
                        return (-1);
                    };
                };
            };
            return (-1);
        }

        public function setAutoMatchSlots():void
        {
            var _local_1:int = tabA.selectedIndex;
            _autoMatchSlots = new Object();
            var _local_2:Array = [];
            var _local_3:Array = [];
            switch (_local_1)
            {
                case 0:
                    _local_2.push(QiLingEqu);
                    _local_2.push(QiLingMater);
                    _local_3.push({"itemType":GamePredef.TBL_EQUIPT_INSTANCE});
                    _local_3.push({
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_QILINGSTORE
                    });
                    break;
                case 1:
                    _local_2.push(ChongZhuEqu);
                    _local_2.push(ChongZhuMater);
                    _local_3.push({"itemType":GamePredef.TBL_EQUIPT_INSTANCE});
                    _local_3.push({
                        "itemType":GamePredef.TBL_ITEM_INSTANCE,
                        "type":GamePredef.ITEM_TYPE_QILINGSTORE
                    });
                    break;
            };
            _autoMatchSlots.reqSlots = _local_3;
            _autoMatchSlots.inputSlots = _local_2;
        }

        public function onQilingBtnState(_arg_1:Object):void
        {
            qilingBtn.enabled = true;
        }

        public function set prop10(_arg_1:Label):void
        {
            var _local_2:Object = this._979804990prop10;
            if (_local_2 !== _arg_1)
            {
                this._979804990prop10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop10", _local_2, _arg_1));
            };
        }

        public function set prop11(_arg_1:Label):void
        {
            var _local_2:Object = this._979804989prop11;
            if (_local_2 !== _arg_1)
            {
                this._979804989prop11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get chongzhuBtn():BasicGlowButton
        {
            return (this._579513480chongzhuBtn);
        }

        public function set prop12(_arg_1:Label):void
        {
            var _local_2:Object = this._979804988prop12;
            if (_local_2 !== _arg_1)
            {
                this._979804988prop12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prop12", _local_2, _arg_1));
            };
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.QILING_PANEL[22].toString();
            _helpAlert = Alert.show(_local_1, Language.PANEL_PETGUARD[19].toString(), Alert.YES, null, null);
        }

        override public function initialize():void
        {
            var target:QiLingPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _QiLingPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_QiLingPanelWatcherSetupUtil");
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

        public function __qilingBtn_click(_arg_1:MouseEvent):void
        {
            qiLingProp();
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            var _local_2:ItemSlot = _arg_1.item.data.slot;
            var _local_3:Object = _arg_1.item.data.sData;
            _local_2.slotData = _local_3;
            _local_2.type = _local_3.type;
            _local_2.giid = _local_3.itemId;
            _local_2.stackNum = _local_3.stackNum;
            Menu(_arg_1.target).removeEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        public function set showBag(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2067262411showBag;
            if (_local_2 !== _arg_1)
            {
                this._2067262411showBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBag", _local_2, _arg_1));
            };
        }

        public function set pTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1007683640pTitle;
            if (_local_2 !== _arg_1)
            {
                this._1007683640pTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pTitle", _local_2, _arg_1));
            };
        }

        public function set tabBtnA0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._933747498tabBtnA0;
            if (_local_2 !== _arg_1)
            {
                this._933747498tabBtnA0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnA0", _local_2, _arg_1));
            };
        }

        internal function chongZhuProp():*
        {
            var flag0:String;
            var flag1:String;
            var flag2:String;
            var auto:String;
            var gfunc:Function;
            var popAlert:Boolean;
            var i:* = undefined;
            var handler:Function;
            var str:String;
            if (ChongZhuEqu.slotData == null)
            {
                return;
            };
            flag0 = ((lock0.selected) ? "lock" : "");
            flag1 = ((lock1.selected) ? "lock" : "");
            flag2 = ((lock2.selected) ? "lock" : "");
            auto = ((czauto.selected) ? "auto" : "");
            var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var goldLockFlag:Boolean = bagPanel.goldLockFlag;
            if (((goldLockFlag) || (!(bagPanel))))
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                return;
            };
            if (((czflag) && (czflag["0"])))
            {
                popAlert = false;
                i = 0;
                while (i < 3)
                {
                    if (czflag[i]["v"] == czflag[i]["max"])
                    {
                        if (!this[("lock" + i)].selected)
                        {
                            popAlert = true;
                        };
                    };
                    i++;
                };
                if (popAlert)
                {
                    handler = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("updateChongZhu", new Responder(onChongZhuBtnState), ChongZhuEqu.slotData.id, flag0, flag1, flag2, auto);
                            chongzhuBtn.enabled = false;
                            return;
                        };
                    };
                    if (_alert)
                    {
                        PopUpManager.removePopUp(_alert);
                        _alert = null;
                    };
                    str = Language.QILING_PANEL[2];
                    _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                    return;
                };
                _core.remote.call("updateChongZhu", new Responder(onChongZhuBtnState), ChongZhuEqu.slotData.id, flag0, flag1, flag2, auto);
                chongzhuBtn.enabled = false;
            };
        }

        public function set tabBtnA1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._933747497tabBtnA1;
            if (_local_2 !== _arg_1)
            {
                this._933747497tabBtnA1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnA1", _local_2, _arg_1));
            };
        }

        private function getEquiptIndex():*
        {
            var _local_1:Object;
            var _local_2:*;
            if (QiLingEqu.slotData)
            {
                _local_1 = _core.getTemplateData(QiLingEqu.slotData.type, QiLingEqu.slotData.itemId, false);
                if (_local_1)
                {
                    if (ToolKit.isSmallOrEqual(_local_1["reqLevel"], 150))
                    {
                        _core.sysMsg(Language.QILING_PANEL[25]);
                        return (-1);
                    };
                    _local_2 = getQiLingIndex(Number(_local_1["kind"]), Number(_local_1["type"]));
                    if (_local_2 != -1)
                    {
                        return (_local_2);
                    };
                    if (_local_2 == -1)
                    {
                        _core.sysMsg(Language.QILING_PANEL[25]);
                        return (-1);
                    };
                };
            };
            return (-1);
        }

        [Bindable(event="propertyChange")]
        public function get pTitle():BasicTitleCanvas
        {
            return (this._1007683640pTitle);
        }

        [Bindable(event="propertyChange")]
        public function get showBag():BasicGlowButton
        {
            return (this._2067262411showBag);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _itemList.type = 1;
            _itemList.idList = [GamePredef.QILING_ITEMID];
            visible = true;
        }

        public function onChongZhuBtnState(_arg_1:Object):void
        {
            chongzhuBtn.enabled = true;
        }

        private function newPropAlert():void
        {
            if (_alert2)
            {
                PopUpManager.removePopUp(_alert2);
                _alert2 = null;
            };
            var _local_1:String = Language.QILING_PANEL[26].toString();
            _alert2 = Alert.show(_local_1, Language.PANEL_PETGUARD[19].toString(), Alert.YES, null, null);
        }


    }
}//package com.qeedoo.ui.view.compDragable

