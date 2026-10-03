// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TreasurePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.TreasureSlot;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.containers.Canvas;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import mx.managers.PopUpManager;
    import mx.events.CloseEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.net.Responder;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.binding.Binding;
    import com.qeedoo.game.utils.TextUtil;
    import mx.collections.SortField;
    import mx.collections.Sort;
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

    public class TreasurePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const ITEM_COUNT_PER_PAGE:int = 20;
        private var _3463n5:Label;
        private var _1141924040shopSlot15:TreasureSlot;
        private var _3524p4:Label;
        private var _3647t3:Label;
        public var _TreasurePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3773vs:ViewStack;
        private var _2115046236shopSlot8:TreasureSlot;
        private var _2115046240shopSlot4:TreasureSlot;
        private var _97826bt4:Button;
        private var _3650t6:Label;
        private var _3459n1:Label;
        private var _3309i6:ItemSlot;
        private var _3462n4:Label;
        private var _3523p3:Label;
        private var _3646t2:Label;
        private var _1141924043shopSlot12:TreasureSlot;
        private var _2115046238shopSlot6:TreasureSlot;
        private var _2062978849idInfoCanvas:Canvas;
        private var _2115046242shopSlot2:TreasureSlot;
        private var _960253463idSystemAll:Canvas;
        private var _alert:Alert;
        private var _3308i5:ItemSlot;
        private var _3461n3:Label;
        private var _97827bt5:Button;
        private var _3645t1:Label;
        private var _3522p2:Label;
        private var _2115046244shopSlot0:TreasureSlot;
        public var _TreasurePanel_RoundedLabel2:RoundedLabel;
        private var _1141924038shopSlot17:TreasureSlot;
        private var _3307i4:ItemSlot;
        private var _3460n2:Label;
        private var _3521p1:Label;
        private var _1141924041shopSlot14:TreasureSlot;
        private var _1102666777linkTA:LinkTextArea;
        private var _277229570idTabCanvas0:BasicGlowButton;
        private var _loadcid:Number = 0;
        private var _97828bt6:Button;
        private var _1133422559idReflashTime0:RoundedLabel;
        private var _3306i3:ItemSlot;
        private var _2115046235shopSlot9:TreasureSlot;
        private var _97823bt1:Button;
        private var _1141924044shopSlot11:TreasureSlot;
        private var _582286198introCon:IntroText;
        private var _upTime:Number = 0;
        private var _isRenRen:Boolean = false;
        private var _3305i2:ItemSlot;
        private var _1141924036shopSlot19:TreasureSlot;
        private var _277229568idTabCanvas2:BasicGlowButton;
        private var _2115046237shopSlot7:TreasureSlot;
        private var _2115046241shopSlot3:TreasureSlot;
        private var _1266436477freBtn:BasicDelayButton;
        private var _2016333467idSystemAllTile:Tile;
        private var _97824bt2:Button;
        private var _fm:Number = 0;
        private var _3304i1:ItemSlot;
        private var _ft:Number = 0;
        private var _1141924039shopSlot16:TreasureSlot;
        private var _2115046239shopSlot5:TreasureSlot;
        private var _2115046243shopSlot1:TreasureSlot;
        private var _1141924042shopSlot13:TreasureSlot;
        private var _3649t5:Label;
        private var _3526p6:Label;
        private var _607339634pageSelector:PageSelector;
        private var _1560582673idReflashTime:RoundedLabel;
        private var _277229569idTabCanvas1:BasicGlowButton;
        private var _97825bt3:Button;
        private var _1141924045shopSlot10:TreasureSlot;
        private var _3525p5:Label;
        private var _fmt:String = "p";
        private var _133132290idReflash:Canvas;
        private var _3464n6:Label;
        private var _1141924037shopSlot18:TreasureSlot;
        private var _3648t4:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":570,
                    "height":358,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_TreasurePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":358,
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 0;
                                        this.left = "45";
                                        this.top = "40";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"styleName":"HTabWrapper"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vs",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "60";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"idReflash",
                                                "events":{"mouseDown":"__idReflash_mouseDown"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "60";
                                                    this.left = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":274,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"i1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":19,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"i2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":145,
                                                                    "y":19,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"i3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":240,
                                                                    "y":19,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"i4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":123,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"i5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":145,
                                                                    "y":123,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"i6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":240,
                                                                    "y":123,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"idReflashTime",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.bottom = "15";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                                this.fontStyle = "normal";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"width":117});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"freBtn",
                                                            "events":{"click":"__freBtn_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "enabled":false,
                                                                    "clickDelay":3000,
                                                                    "styleName":"BtnStdRed",
                                                                    "label":"",
                                                                    "width":142,
                                                                    "x":182
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                                this.top = "10";
                                                                this.bottom = "18";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":213,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"_TreasurePanel_RoundedLabel2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "8";
                                                                            this.color = 0xFFFFFF;
                                                                            this.horizontalCenter = "0";
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkTextArea,
                                                                        "id":"linkTA",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.backgroundAlpha = 0.3;
                                                                            this.backgroundColor = 0;
                                                                            this.borderStyle = "none";
                                                                            this.color = 16774324;
                                                                            this.bottom = "5";
                                                                            this.left = "2";
                                                                            this.right = "2";
                                                                            this.top = "30";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "editable":false,
                                                                                "enabled":true,
                                                                                "selectable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"bt1",
                                                            "events":{"click":"__bt1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":33,
                                                                    "y":95,
                                                                    "width":47
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"bt2",
                                                            "events":{"click":"__bt2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":140,
                                                                    "y":95,
                                                                    "width":47
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"bt3",
                                                            "events":{"click":"__bt3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":244,
                                                                    "y":95,
                                                                    "width":47
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"bt4",
                                                            "events":{"click":"__bt4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":33,
                                                                    "y":204,
                                                                    "width":47
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"bt5",
                                                            "events":{"click":"__bt5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":140,
                                                                    "y":204,
                                                                    "width":47
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"bt6",
                                                            "events":{"click":"__bt6_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdRed",
                                                                    "x":244,
                                                                    "y":204,
                                                                    "width":47
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"t1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":71
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"p1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":45,
                                                                    "y":71,
                                                                    "text":"Label"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"t2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":117,
                                                                    "y":71
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"p2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":152,
                                                                    "y":71,
                                                                    "text":"Label"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"t3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":221,
                                                                    "y":71
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"p3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0100,
                                                                    "y":71,
                                                                    "text":"Label"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"t4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"p4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":45,
                                                                    "y":175,
                                                                    "text":"Label"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"t5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":117,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"p5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":152,
                                                                    "y":175,
                                                                    "text":"Label"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"t6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":221,
                                                                    "y":175
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"p6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 11;
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0100,
                                                                    "y":175,
                                                                    "text":"Label"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"n1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":55
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"n2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":117,
                                                                    "y":55
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"n3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":221,
                                                                    "y":55
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"n4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":159
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"n5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":117,
                                                                    "y":159
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"n6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":221,
                                                                    "y":159
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"idReflashTime0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "95";
                                                                this.bottom = "15";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                                this.textAlign = "center";
                                                                this.fontStyle = "normal";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"width":67});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"idSystemAll",
                                                "events":{"mouseDown":"__idSystemAll_mouseDown"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "60";
                                                    this.left = "15";
                                                    this.right = "9";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"idSystemAllTile",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "7";
                                                                this.right = "2";
                                                                this.top = "10";
                                                                this.bottom = "25";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot0"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot1"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot2"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot3"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot4"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot5"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot6"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot7"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot8"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot9"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot10"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot11"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot12"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot13"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot14"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot15"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot16"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot17"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot18"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TreasureSlot,
                                                                        "id":"shopSlot19"
                                                                    })]});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelector,
                                                            "id":"pageSelector",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":195,
                                                                    "y":252
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"idInfoCanvas",
                                                "events":{"mouseDown":"__idInfoCanvas_mouseDown"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "60";
                                                    this.left = "15";
                                                    this.right = "9";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introCon",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.top = "10";
                                                                this.left = "15";
                                                                this.right = "9";
                                                                this.bottom = "10";
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"idTabCanvas0",
                                    "events":{"click":"__idTabCanvas0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":60,
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "x":10,
                                            "y":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"idTabCanvas1",
                                    "events":{"click":"__idTabCanvas1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":60,
                                            "styleName":"HorizontalTab",
                                            "x":70,
                                            "y":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"idTabCanvas2",
                                    "events":{"click":"__idTabCanvas2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":60,
                                            "styleName":"HorizontalTab",
                                            "x":130,
                                            "y":40
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var TreasureItemObj:Object = new Object();
        private var shopItemList:ArrayCollection = new ArrayCollection();
        private var freObj:Object = new Object();
        private var _core:Core = Core.getInstance();
        public var treasureMsgArr:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TreasurePanel()
        {
            mx_internal::_document = this;
            this.width = 570;
            this.height = 358;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___TreasurePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TreasurePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get idTabCanvas2():BasicGlowButton
        {
            return (this._277229568idTabCanvas2);
        }

        [Bindable(event="propertyChange")]
        public function get idReflash():Canvas
        {
            return (this._133132290idReflash);
        }

        private function initTreasureItemObj():void
        {
            shopItemList = getTreasureItemObj();
        }

        public function set idTabCanvas1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229569idTabCanvas1;
            if (_local_2 !== _arg_1)
            {
                this._277229569idTabCanvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas1", _local_2, _arg_1));
            };
        }

        private function buyTreasureItem(index:int):void
        {
            var str:String;
            var _tid:Number;
            var _giid:Number;
            var _index:Number;
            var func:Function;
            if ((((this[("i" + index)]) && (this[("i" + index)].slotData)) && (freObj[index])))
            {
                str = Language.TREASURE_PANEL_U[5].replace("{num}", this[("p" + index)].text).replace("{iname}", this[("i" + index)].slotData.name);
                _tid = this[("i" + index)].type;
                _giid = this[("i" + index)].giid;
                _index = freObj[index];
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("buyTreasureItemSer", null, _index, _tid, _giid);
                    };
                };
                _alert = Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
            };
        }

        public function set idTabCanvas2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229568idTabCanvas2;
            if (_local_2 !== _arg_1)
            {
                this._277229568idTabCanvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas2", _local_2, _arg_1));
            };
        }

        public function __bt3_click(_arg_1:MouseEvent):void
        {
            buyTreasureItem(3);
        }

        [Bindable(event="propertyChange")]
        public function get p6():Label
        {
            return (this._3526p6);
        }

        [Bindable(event="propertyChange")]
        public function get idSystemAll():Canvas
        {
            return (this._960253463idSystemAll);
        }

        [Bindable(event="propertyChange")]
        public function get bt2():Button
        {
            return (this._97824bt2);
        }

        [Bindable(event="propertyChange")]
        public function get bt3():Button
        {
            return (this._97825bt3);
        }

        [Bindable(event="propertyChange")]
        public function get bt6():Button
        {
            return (this._97828bt6);
        }

        [Bindable(event="propertyChange")]
        public function get idReflashTime0():RoundedLabel
        {
            return (this._1133422559idReflashTime0);
        }

        [Bindable(event="propertyChange")]
        public function get bt4():Button
        {
            return (this._97826bt4);
        }

        [Bindable(event="propertyChange")]
        public function get idTabCanvas1():BasicGlowButton
        {
            return (this._277229569idTabCanvas1);
        }

        [Bindable(event="propertyChange")]
        public function get bt1():Button
        {
            return (this._97823bt1);
        }

        public function set idReflash(_arg_1:Canvas):void
        {
            var _local_2:Object = this._133132290idReflash;
            if (_local_2 !== _arg_1)
            {
                this._133132290idReflash = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idReflash", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bt5():Button
        {
            return (this._97827bt5);
        }

        public function set idSystemAll(_arg_1:Canvas):void
        {
            var _local_2:Object = this._960253463idSystemAll;
            if (_local_2 !== _arg_1)
            {
                this._960253463idSystemAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSystemAll", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t3():Label
        {
            return (this._3647t3);
        }

        public function set bt2(_arg_1:Button):void
        {
            var _local_2:Object = this._97824bt2;
            if (_local_2 !== _arg_1)
            {
                this._97824bt2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t5():Label
        {
            return (this._3649t5);
        }

        [Bindable(event="propertyChange")]
        public function get t4():Label
        {
            return (this._3648t4);
        }

        public function set bt6(_arg_1:Button):void
        {
            var _local_2:Object = this._97828bt6;
            if (_local_2 !== _arg_1)
            {
                this._97828bt6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt6", _local_2, _arg_1));
            };
        }

        public function set bt4(_arg_1:Button):void
        {
            var _local_2:Object = this._97826bt4;
            if (_local_2 !== _arg_1)
            {
                this._97826bt4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt4", _local_2, _arg_1));
            };
        }

        public function set bt3(_arg_1:Button):void
        {
            var _local_2:Object = this._97825bt3;
            if (_local_2 !== _arg_1)
            {
                this._97825bt3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt3", _local_2, _arg_1));
            };
        }

        public function onFreshCharTreasureBowl(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:*;
            if (_arg_1)
            {
                if (ToolKit.isEqual(_arg_1.type, 2))
                {
                    _core.sysMidNote(Language.TREASURE_PANEL_U[8]);
                    onInitTreasureBowlWithList(_arg_1.info);
                }
                else
                {
                    if (ToolKit.isEqual(_arg_1.type, 1))
                    {
                        _local_2 = 1;
                        while (_local_2 <= 6)
                        {
                            cleanItemSlotData(_local_2);
                            _local_2++;
                        };
                        _local_3 = 1;
                        for (_local_4 in _arg_1.info)
                        {
                            if (_arg_1.info[_local_4])
                            {
                                setItemSlotData(_arg_1.info[_local_4], _local_3);
                                _local_3++;
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get t1():Label
        {
            return (this._3645t1);
        }

        public function set shopSlot10(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924045shopSlot10;
            if (_local_2 !== _arg_1)
            {
                this._1141924045shopSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot10", _local_2, _arg_1));
            };
        }

        private function onInitTreasureBowl(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:*;
            freObj = null;
            freObj = new Object();
            if (!_arg_1)
            {
                this.visible = false;
            }
            else
            {
                if ((((_core.player) && (_core.player.id)) && (!(ToolKit.isEqual(_core.player.id, _loadcid)))))
                {
                    _core.remote.call("initTreasureBowlMsgArr", new Responder(onInitTreasureBowlMsgArr));
                };
                if (ToolKit.isSmallThan(_upTime, _arg_1.uTime))
                {
                    TreasureItemObj = null;
                    TreasureItemObj = new Object();
                    _core.remote.call("initTreasureBowlWithList", new Responder(onInitTreasureBowlWithList));
                    return;
                };
                _local_2 = 1;
                while (_local_2 <= 6)
                {
                    cleanItemSlotData(_local_2);
                    _local_2++;
                };
                _local_3 = 1;
                for (_local_4 in _arg_1.rconf)
                {
                    if (_arg_1.rconf[_local_4])
                    {
                        setItemSlotData(_arg_1.rconf[_local_4], _local_3);
                        _local_3++;
                    };
                };
                freBtn.enabled = true;
                _fm = _arg_1.fm;
                setFreshTime(_ft, _arg_1.rft);
                if (((_arg_1.cf) && (ToolKit.isEqual(_arg_1.cf, 2))))
                {
                    Language.TREASURE_PANEL_U[2] = Language.TREASURE_PANEL_U[10];
                };
                freBtn.label = Language.TREASURE_PANEL_U[6].replace("{num}", _fm);
                if (_fmt != "g")
                {
                    freBtn.label = Language.TREASURE_PANEL_U[16].replace("{num}", _fm);
                    if (_isRenRen)
                    {
                        freBtn.label = Language.TREASURE_PANEL_U[18].replace("{num}", (_fm / 10));
                    };
                };
            };
        }

        public function set bt5(_arg_1:Button):void
        {
            var _local_2:Object = this._97827bt5;
            if (_local_2 !== _arg_1)
            {
                this._97827bt5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt5", _local_2, _arg_1));
            };
        }

        public function set bt1(_arg_1:Button):void
        {
            var _local_2:Object = this._97823bt1;
            if (_local_2 !== _arg_1)
            {
                this._97823bt1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt1", _local_2, _arg_1));
            };
        }

        public function set shopSlot13(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924042shopSlot13;
            if (_local_2 !== _arg_1)
            {
                this._1141924042shopSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot13", _local_2, _arg_1));
            };
        }

        public function set shopSlot14(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924041shopSlot14;
            if (_local_2 !== _arg_1)
            {
                this._1141924041shopSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot14", _local_2, _arg_1));
            };
        }

        public function set idInfoCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2062978849idInfoCanvas;
            if (_local_2 !== _arg_1)
            {
                this._2062978849idInfoCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idInfoCanvas", _local_2, _arg_1));
            };
        }

        public function __idTabCanvas2_click(_arg_1:MouseEvent):void
        {
            setTab(2);
        }

        public function set shopSlot12(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924043shopSlot12;
            if (_local_2 !== _arg_1)
            {
                this._1141924043shopSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot12", _local_2, _arg_1));
            };
        }

        public function set shopSlot16(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924039shopSlot16;
            if (_local_2 !== _arg_1)
            {
                this._1141924039shopSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot16", _local_2, _arg_1));
            };
        }

        public function set shopSlot17(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924038shopSlot17;
            if (_local_2 !== _arg_1)
            {
                this._1141924038shopSlot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot17", _local_2, _arg_1));
            };
        }

        public function ___TreasurePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function set shopSlot18(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924037shopSlot18;
            if (_local_2 !== _arg_1)
            {
                this._1141924037shopSlot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot18", _local_2, _arg_1));
            };
        }

        public function set shopSlot11(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924044shopSlot11;
            if (_local_2 !== _arg_1)
            {
                this._1141924044shopSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot11", _local_2, _arg_1));
            };
        }

        public function set shopSlot19(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924036shopSlot19;
            if (_local_2 !== _arg_1)
            {
                this._1141924036shopSlot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot19", _local_2, _arg_1));
            };
        }

        public function set idReflashTime0(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1133422559idReflashTime0;
            if (_local_2 !== _arg_1)
            {
                this._1133422559idReflashTime0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idReflashTime0", _local_2, _arg_1));
            };
        }

        private function clearPage():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                this[("shopSlot" + _local_1)].visible = false;
                _local_1++;
            };
        }

        private function setItemSlotData(_arg_1:Object, _arg_2:Number):void
        {
            if (((!(_arg_1)) || (!(_arg_1["idx"]))))
            {
            };
            var _local_3:Number = Number(_arg_1["idx"]);
            if ((((!(this[("i" + _arg_2)])) || (!(TreasureItemObj))) || (!(TreasureItemObj[_local_3]))))
            {
                return;
            };
            if (((!(ToolKit.isEqual(TreasureItemObj[_local_3].tid, _arg_1.tid))) || (!(ToolKit.isEqual(TreasureItemObj[_local_3].iid, _arg_1.iid)))))
            {
                return;
            };
            this[("i" + _arg_2)].slotData = TreasureItemObj[_local_3].temp;
            this[("i" + _arg_2)].type = TreasureItemObj[_local_3].tid;
            this[("i" + _arg_2)].giid = TreasureItemObj[_local_3].iid;
            this[("p" + _arg_2)].visible = true;
            this[("t" + _arg_2)].visible = true;
            this[("n" + _arg_2)].visible = true;
            if (!_isRenRen)
            {
                this[("p" + _arg_2)].text = (((String(TreasureItemObj[_local_3].p)) && (ToolKit.isBigThan(TreasureItemObj[_local_3].p, 0))) ? (TreasureItemObj[_local_3].p.toString() + Language.TREASURE_PANEL_U[2]) : (TreasureItemObj[_local_3].g.toString() + Language.TREASURE_PANEL_U[1]));
            }
            else
            {
                this[("p" + _arg_2)].text = (((String((TreasureItemObj[_local_3].p / 10))) && (ToolKit.isBigThan((TreasureItemObj[_local_3].p / 10), 0))) ? ((TreasureItemObj[_local_3].p / 10).toString() + Language.TREASURE_PANEL_U[10]) : (TreasureItemObj[_local_3].g.toString() + Language.TREASURE_PANEL_U[1]));
            };
            this[("bt" + _arg_2)].visible = true;
            var _local_4:Object = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_arg_1.iid];
            this[("n" + _arg_2)].text = _local_4.name;
            freObj[_arg_2] = _local_3;
        }

        public function set shopSlot15(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._1141924040shopSlot15;
            if (_local_2 !== _arg_1)
            {
                this._1141924040shopSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot15", _local_2, _arg_1));
            };
        }

        public function set t1(_arg_1:Label):void
        {
            var _local_2:Object = this._3645t1;
            if (_local_2 !== _arg_1)
            {
                this._3645t1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1", _local_2, _arg_1));
            };
        }

        public function set t5(_arg_1:Label):void
        {
            var _local_2:Object = this._3649t5;
            if (_local_2 !== _arg_1)
            {
                this._3649t5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t5", _local_2, _arg_1));
            };
        }

        public function set t3(_arg_1:Label):void
        {
            var _local_2:Object = this._3647t3;
            if (_local_2 !== _arg_1)
            {
                this._3647t3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t3", _local_2, _arg_1));
            };
        }

        private function _TreasurePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TreasurePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_TreasurePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idReflashTime.text = _arg_1;
            }, "idReflashTime.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TreasurePanel_RoundedLabel2.text = _arg_1;
            }, "_TreasurePanel_RoundedLabel2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt1.label = _arg_1;
            }, "bt1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt2.label = _arg_1;
            }, "bt2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt3.label = _arg_1;
            }, "bt3.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt4.label = _arg_1;
            }, "bt4.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt5.label = _arg_1;
            }, "bt5.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt6.label = _arg_1;
            }, "bt6.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t1.text = _arg_1;
            }, "t1.text");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                t1.filters = _arg_1;
            }, "t1.filters");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                p1.filters = _arg_1;
            }, "p1.filters");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t2.text = _arg_1;
            }, "t2.text");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                t2.filters = _arg_1;
            }, "t2.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                p2.filters = _arg_1;
            }, "p2.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t3.text = _arg_1;
            }, "t3.text");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                t3.filters = _arg_1;
            }, "t3.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                p3.filters = _arg_1;
            }, "p3.filters");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t4.text = _arg_1;
            }, "t4.text");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                t4.filters = _arg_1;
            }, "t4.filters");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                p4.filters = _arg_1;
            }, "p4.filters");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t5.text = _arg_1;
            }, "t5.text");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                t5.filters = _arg_1;
            }, "t5.filters");
            result[22] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                p5.filters = _arg_1;
            }, "p5.filters");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t6.text = _arg_1;
            }, "t6.text");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                t6.filters = _arg_1;
            }, "t6.filters");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                p6.filters = _arg_1;
            }, "p6.filters");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                n1.text = _arg_1;
            }, "n1.text");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                n1.filters = _arg_1;
            }, "n1.filters");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                n2.text = _arg_1;
            }, "n2.text");
            result[29] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                n2.filters = _arg_1;
            }, "n2.filters");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                n3.text = _arg_1;
            }, "n3.text");
            result[31] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                n3.filters = _arg_1;
            }, "n3.filters");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                n4.text = _arg_1;
            }, "n4.text");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                n4.filters = _arg_1;
            }, "n4.filters");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                n5.text = _arg_1;
            }, "n5.text");
            result[35] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                n5.filters = _arg_1;
            }, "n5.filters");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                n6.text = _arg_1;
            }, "n6.text");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                n6.filters = _arg_1;
            }, "n6.filters");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idReflashTime0.text = _arg_1;
            }, "idReflashTime0.text");
            result[39] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                idReflashTime0.filters = _arg_1;
            }, "idReflashTime0.filters");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idSystemAllTile.label = _arg_1;
            }, "idSystemAllTile.label");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas0.label = _arg_1;
            }, "idTabCanvas0.label");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas1.label = _arg_1;
            }, "idTabCanvas1.label");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TREASURE_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas2.label = _arg_1;
            }, "idTabCanvas2.label");
            result[44] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get t6():Label
        {
            return (this._3650t6);
        }

        public function __bt5_click(_arg_1:MouseEvent):void
        {
            buyTreasureItem(5);
        }

        public function set t6(_arg_1:Label):void
        {
            var _local_2:Object = this._3650t6;
            if (_local_2 !== _arg_1)
            {
                this._3650t6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t6", _local_2, _arg_1));
            };
        }

        private function freshCanBuyItem():*
        {
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("freshCharTreasureBowl", new Responder(onFreshCharTreasureBowl), _upTime);
                };
            };
            var str:String = Language.TREASURE_PANEL_U[14];
            if (_fmt != "g")
            {
                str = Language.TREASURE_PANEL_U[15];
                if (_isRenRen)
                {
                    str = Language.TREASURE_PANEL_U[17];
                };
            };
            _alert = Alert.show(str, str, (Alert.YES | Alert.NO), null, func);
        }

        public function set t4(_arg_1:Label):void
        {
            var _local_2:Object = this._3648t4;
            if (_local_2 !== _arg_1)
            {
                this._3648t4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get freBtn():BasicDelayButton
        {
            return (this._1266436477freBtn);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot0():TreasureSlot
        {
            return (this._2115046244shopSlot0);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot1():TreasureSlot
        {
            return (this._2115046243shopSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot2():TreasureSlot
        {
            return (this._2115046242shopSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot3():TreasureSlot
        {
            return (this._2115046241shopSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot4():TreasureSlot
        {
            return (this._2115046240shopSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot5():TreasureSlot
        {
            return (this._2115046239shopSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot7():TreasureSlot
        {
            return (this._2115046237shopSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot8():TreasureSlot
        {
            return (this._2115046236shopSlot8);
        }

        public function onSynTreasureBowlClient(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:*;
            if (((((_arg_1) && (initialized)) && (visible)) && (!(ToolKit.isEqual(_upTime, 0)))))
            {
                if (ToolKit.isSmallThan(_upTime, _arg_1.uTime))
                {
                    TreasureItemObj = null;
                    TreasureItemObj = new Object();
                    _core.remote.call("initTreasureBowlWithList", new Responder(onInitTreasureBowlWithList));
                    return;
                };
                _local_2 = 1;
                while (_local_2 <= 6)
                {
                    cleanItemSlotData(_local_2);
                    _local_2++;
                };
                _local_3 = 1;
                for (_local_4 in _arg_1.list)
                {
                    if (_arg_1.list[_local_4])
                    {
                        setItemSlotData(_arg_1.list[_local_4], _local_3);
                        _local_3++;
                    };
                };
                setFreshTime(_ft, _arg_1.rft);
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot6():TreasureSlot
        {
            return (this._2115046238shopSlot6);
        }

        public function __freBtn_click(_arg_1:MouseEvent):void
        {
            freshCanBuyItem();
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot9():TreasureSlot
        {
            return (this._2115046235shopSlot9);
        }

        public function set t2(_arg_1:Label):void
        {
            var _local_2:Object = this._3646t2;
            if (_local_2 !== _arg_1)
            {
                this._3646t2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t2", _local_2, _arg_1));
            };
        }

        public function broadCastTreasureMsg(_arg_1:Object):void
        {
            var _local_4:String;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Object;
            var _local_8:int;
            var _local_9:String;
            if (!_arg_1)
            {
                return;
            };
            treasureMsgArr.push(_arg_1);
            if (treasureMsgArr.length > 10)
            {
                treasureMsgArr.shift();
            };
            var _local_2:* = "";
            var _local_3:* = ToolKit.minus(treasureMsgArr.length, 1);
            while (_local_3 >= 0)
            {
                _local_4 = "";
                _local_5 = _core.data.getGameData(treasureMsgArr[_local_3].ti, treasureMsgArr[_local_3].ii);
                if (!_local_5)
                {
                    return;
                };
                if (((!(_local_5.color)) || (_local_5.color < 0)))
                {
                    _local_5.color = 0;
                };
                _local_4 = Language.TREASURE_PANEL_U[11];
                if (!_local_4)
                {
                    return;
                };
                _local_4 = _local_4.replace("{name}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + treasureMsgArr[_local_3].c) + "|") + treasureMsgArr[_local_3].name) + "|0|0|0]")));
                if (treasureMsgArr[_local_3].ti == GamePredef.TBL_EQUIPT_TEMPLATE)
                {
                    if (!treasureMsgArr[_local_3].cl)
                    {
                        if (_local_5.color > 0)
                        {
                            treasureMsgArr[_local_3].cl = _local_5.color;
                        }
                        else
                        {
                            treasureMsgArr[_local_3].cl = 0;
                        };
                    };
                    _local_7 = _core.data.gameData[treasureMsgArr[_local_3].ti][treasureMsgArr[_local_3].ii];
                    if (_local_7.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
                    {
                        _local_8 = ((Number(_arg_1.q) * 10) + 6);
                        _local_4 = _local_4.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + treasureMsgArr[_local_3].ii) + "|") + _local_5.name) + "|") + treasureMsgArr[_local_3].cl) + "|") + 0) + "|") + _local_8) + "]")));
                    }
                    else
                    {
                        _local_4 = _local_4.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + treasureMsgArr[_local_3].ii) + "|") + _local_5.name) + "|") + treasureMsgArr[_local_3].cl) + "|") + 0) + "|") + 0) + "]")));
                    };
                }
                else
                {
                    if (treasureMsgArr[_local_3].ti == GamePredef.TBL_ITEM_TEMPLATE)
                    {
                        if (!treasureMsgArr[_local_3].cl)
                        {
                            if (_local_5.color > 0)
                            {
                                treasureMsgArr[_local_3].cl = _local_5.color;
                            }
                            else
                            {
                                treasureMsgArr[_local_3].cl = 0;
                            };
                        };
                        _local_4 = _local_4.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ITEM_TEMPLATE]) + "|") + treasureMsgArr[_local_3].ii) + "|") + _local_5.name) + "|") + treasureMsgArr[_local_3].cl) + "|") + 0) + "|") + 0) + "]")));
                    }
                    else
                    {
                        if (treasureMsgArr[_local_3].ti == GamePredef.TBL_CREATURE)
                        {
                            _local_9 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(treasureMsgArr[_local_3].q)]) + "'>[") + _local_5.name) + "]</font>");
                            _local_4 = _local_4.replace("{item}", _local_9);
                        };
                    };
                };
                _local_6 = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[6]) + "'>") + TextUtil.decode(_local_4)) + "</font><br/>");
                _local_2 = (_local_2 + _local_6);
                _local_3--;
            };
            if (initialized)
            {
                clearBuyLog();
                linkTA.htmlText = _local_2;
            };
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        public function set idSystemAllTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._2016333467idSystemAllTile;
            if (_local_2 !== _arg_1)
            {
                this._2016333467idSystemAllTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSystemAllTile", _local_2, _arg_1));
            };
        }

        public function __bt2_click(_arg_1:MouseEvent):void
        {
            buyTreasureItem(2);
        }

        private function _TreasurePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TREASURE_PANEL_U[0];
            _local_1 = Language.TREASURE_PANEL_U[9];
            _local_1 = Language.VIPSHOPPANEL_U[3];
            _local_1 = Language.TREASURE_PANEL_U[4];
            _local_1 = Language.TREASURE_PANEL_U[4];
            _local_1 = Language.TREASURE_PANEL_U[4];
            _local_1 = Language.TREASURE_PANEL_U[4];
            _local_1 = Language.TREASURE_PANEL_U[4];
            _local_1 = Language.TREASURE_PANEL_U[4];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[3];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TREASURE_PANEL_U[9];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.VIPSHOPPANEL_U[1];
            _local_1 = Language.VIPSHOPPANEL_U[1];
            _local_1 = Language.VIPSHOPPANEL_U[2];
            _local_1 = Language.TREASURE_PANEL_U[12];
        }

        [Bindable(event="propertyChange")]
        public function get t2():Label
        {
            return (this._3646t2);
        }

        public function __idSystemAll_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function setFreshTime(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:Date = new Date(ToolKit.add(_arg_2, ((_arg_1 * 60) * 1000)));
            idReflashTime0.text = ((_local_3.getHours() + ":") + _local_3.getMinutes());
        }

        [Bindable(event="propertyChange")]
        public function get i2():ItemSlot
        {
            return (this._3305i2);
        }

        [Bindable(event="propertyChange")]
        public function get i3():ItemSlot
        {
            return (this._3306i3);
        }

        [Bindable(event="propertyChange")]
        public function get i4():ItemSlot
        {
            return (this._3307i4);
        }

        [Bindable(event="propertyChange")]
        public function get i5():ItemSlot
        {
            return (this._3308i5);
        }

        [Bindable(event="propertyChange")]
        public function get i6():ItemSlot
        {
            return (this._3309i6);
        }

        public function set introCon(_arg_1:IntroText):void
        {
            var _local_2:Object = this._582286198introCon;
            if (_local_2 !== _arg_1)
            {
                this._582286198introCon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introCon", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get i1():ItemSlot
        {
            return (this._3304i1);
        }

        private function getTreasureItemObj():ArrayCollection
        {
            return (addDataToList(TreasureItemObj));
        }

        private function onInitTreasureBowlWithList(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:Number;
            var _local_6:*;
            if (!_arg_1)
            {
                this.visible = false;
                return;
            };
            var _local_2:Number = 1;
            while (_local_2 <= 6)
            {
                cleanItemSlotData(_local_2);
                _local_2++;
            };
            _upTime = _arg_1.uTime;
            for (_local_3 in _arg_1.tconf)
            {
                if (_arg_1.tconf[_local_3])
                {
                    _local_6 = _core.data.gameData[_arg_1.tconf[_local_3].tid][_arg_1.tconf[_local_3].iid];
                    if (_local_6)
                    {
                        TreasureItemObj[_arg_1.tconf[_local_3]["i"]] = new Object();
                        TreasureItemObj[_arg_1.tconf[_local_3]["i"]] = _arg_1.tconf[_local_3];
                        TreasureItemObj[_arg_1.tconf[_local_3]["i"]].temp = _local_6;
                    };
                };
            };
            initTreasureItemObj();
            _local_4 = 1;
            if (((_arg_1.cf) && (ToolKit.isEqual(_arg_1.cf, 2))))
            {
                _isRenRen = true;
            };
            if (((_arg_1.fmt) && (_arg_1.fmt == "g")))
            {
                _fmt = "g";
            }
            else
            {
                _fmt = "p";
            };
            for (_local_3 in _arg_1.rconf)
            {
                if (_arg_1.rconf[_local_3])
                {
                    setItemSlotData(_arg_1.rconf[_local_3], _local_4);
                    _local_4++;
                };
            };
            freBtn.enabled = true;
            freBtn.label = Language.TREASURE_PANEL_U[6].replace("{num}", _arg_1.fm);
            if (_fmt != "g")
            {
                freBtn.label = Language.TREASURE_PANEL_U[16].replace("{num}", _arg_1.fm);
                if (_isRenRen)
                {
                    freBtn.label = Language.TREASURE_PANEL_U[18].replace("{num}", (_arg_1.fm / 10));
                };
            };
            _fm = _arg_1.fm;
            _ft = _arg_1.ft;
            setFreshTime(_ft, _arg_1.rft);
            var _local_5:* = Language.TREASURE_PANEL_U[13].replace("{hours}", (_ft / 60)).replace("{pg}", (_arg_1.fm + Language.TREASURE_PANEL_U[1]));
            if (_fmt != "g")
            {
                _local_5 = Language.TREASURE_PANEL_U[13].replace("{hours}", (_ft / 60)).replace("{pg}", (_arg_1.fm + Language.TREASURE_PANEL_U[2]));
                if (_isRenRen)
                {
                    _local_5 = Language.TREASURE_PANEL_U[13].replace("{hours}", (_ft / 60)).replace("{pg}", ((_arg_1.fm / 10) + Language.TREASURE_PANEL_U[10]));
                };
            };
            introCon.htmlText = _local_5;
        }

        public function set n2(_arg_1:Label):void
        {
            var _local_2:Object = this._3460n2;
            if (_local_2 !== _arg_1)
            {
                this._3460n2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "n2", _local_2, _arg_1));
            };
        }

        public function set n4(_arg_1:Label):void
        {
            var _local_2:Object = this._3462n4;
            if (_local_2 !== _arg_1)
            {
                this._3462n4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "n4", _local_2, _arg_1));
            };
        }

        public function set n5(_arg_1:Label):void
        {
            var _local_2:Object = this._3463n5;
            if (_local_2 !== _arg_1)
            {
                this._3463n5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "n5", _local_2, _arg_1));
            };
        }

        public function __idReflash_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set n6(_arg_1:Label):void
        {
            var _local_2:Object = this._3464n6;
            if (_local_2 !== _arg_1)
            {
                this._3464n6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "n6", _local_2, _arg_1));
            };
        }

        public function set n3(_arg_1:Label):void
        {
            var _local_2:Object = this._3461n3;
            if (_local_2 !== _arg_1)
            {
                this._3461n3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "n3", _local_2, _arg_1));
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idInfoCanvas():Canvas
        {
            return (this._2062978849idInfoCanvas);
        }

        public function __idTabCanvas1_click(_arg_1:MouseEvent):void
        {
            setTab(1);
        }

        public function set freBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._1266436477freBtn;
            if (_local_2 !== _arg_1)
            {
                this._1266436477freBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "freBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot12():TreasureSlot
        {
            return (this._1141924043shopSlot12);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot13():TreasureSlot
        {
            return (this._1141924042shopSlot13);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot14():TreasureSlot
        {
            return (this._1141924041shopSlot14);
        }

        public function __idInfoCanvas_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot16():TreasureSlot
        {
            return (this._1141924039shopSlot16);
        }

        public function set shopSlot1(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046243shopSlot1;
            if (_local_2 !== _arg_1)
            {
                this._2115046243shopSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot11():TreasureSlot
        {
            return (this._1141924044shopSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot19():TreasureSlot
        {
            return (this._1141924036shopSlot19);
        }

        public function set shopSlot3(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046241shopSlot3;
            if (_local_2 !== _arg_1)
            {
                this._2115046241shopSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot3", _local_2, _arg_1));
            };
        }

        public function set n1(_arg_1:Label):void
        {
            var _local_2:Object = this._3459n1;
            if (_local_2 !== _arg_1)
            {
                this._3459n1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "n1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot17():TreasureSlot
        {
            return (this._1141924038shopSlot17);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot10():TreasureSlot
        {
            return (this._1141924045shopSlot10);
        }

        public function set shopSlot2(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046242shopSlot2;
            if (_local_2 !== _arg_1)
            {
                this._2115046242shopSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot2", _local_2, _arg_1));
            };
        }

        public function set shopSlot7(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046237shopSlot7;
            if (_local_2 !== _arg_1)
            {
                this._2115046237shopSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot7", _local_2, _arg_1));
            };
        }

        public function set shopSlot0(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046244shopSlot0;
            if (_local_2 !== _arg_1)
            {
                this._2115046244shopSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot0", _local_2, _arg_1));
            };
        }

        public function set shopSlot8(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046236shopSlot8;
            if (_local_2 !== _arg_1)
            {
                this._2115046236shopSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot8", _local_2, _arg_1));
            };
        }

        public function set shopSlot5(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046239shopSlot5;
            if (_local_2 !== _arg_1)
            {
                this._2115046239shopSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot18():TreasureSlot
        {
            return (this._1141924037shopSlot18);
        }

        public function __bt4_click(_arg_1:MouseEvent):void
        {
            buyTreasureItem(4);
        }

        public function set shopSlot4(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046240shopSlot4;
            if (_local_2 !== _arg_1)
            {
                this._2115046240shopSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot15():TreasureSlot
        {
            return (this._1141924040shopSlot15);
        }

        public function set shopSlot9(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046235shopSlot9;
            if (_local_2 !== _arg_1)
            {
                this._2115046235shopSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot9", _local_2, _arg_1));
            };
        }

        public function set shopSlot6(_arg_1:TreasureSlot):void
        {
            var _local_2:Object = this._2115046238shopSlot6;
            if (_local_2 !== _arg_1)
            {
                this._2115046238shopSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot6", _local_2, _arg_1));
            };
        }

        public function initTreasurePanel():*
        {
            initView();
            visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get idSystemAllTile():Tile
        {
            return (this._2016333467idSystemAllTile);
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get introCon():IntroText
        {
            return (this._582286198introCon);
        }

        private function addDataToList(_arg_1:Object):ArrayCollection
        {
            var _local_3:Object;
            var _local_4:SortField;
            var _local_5:Sort;
            var _local_6:Object;
            var _local_2:ArrayCollection = new ArrayCollection();
            for each (_local_3 in TreasureItemObj)
            {
                if (_local_3 != null)
                {
                    _local_6 = new Object();
                    _local_6.slotData = _local_3.temp;
                    _local_6.type = _local_3.tid;
                    _local_6.giid = _local_3.iid;
                    _local_6.position = _local_3.i;
                    _local_2.addItem(_local_6);
                };
            };
            _local_4 = new SortField();
            _local_4.name = "position";
            _local_5 = new Sort();
            _local_5.fields = [_local_4];
            _local_4.numeric = true;
            _local_2.sort = _local_5;
            _local_2.refresh();
            return (_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get n5():Label
        {
            return (this._3463n5);
        }

        public function set p1(_arg_1:Label):void
        {
            var _local_2:Object = this._3521p1;
            if (_local_2 !== _arg_1)
            {
                this._3521p1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "p1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get n4():Label
        {
            return (this._3462n4);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        public function __bt1_click(_arg_1:MouseEvent):void
        {
            buyTreasureItem(1);
        }

        override public function initialize():void
        {
            var target:TreasurePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TreasurePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TreasurePanelWatcherSetupUtil");
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
        public function get n3():Label
        {
            return (this._3461n3);
        }

        public function set p3(_arg_1:Label):void
        {
            var _local_2:Object = this._3523p3;
            if (_local_2 !== _arg_1)
            {
                this._3523p3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "p3", _local_2, _arg_1));
            };
        }

        private function clearBuyLog():void
        {
            if (initialized)
            {
                linkTA.htmlText = "";
            };
        }

        private function onInitTreasureBowlMsgArr(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:String;
            var _local_4:*;
            var _local_5:String;
            var _local_6:Object;
            var _local_7:String;
            var _local_8:Object;
            var _local_9:int;
            var _local_10:String;
            if (_arg_1)
            {
                treasureMsgArr = new Array();
                for (_local_2 in _arg_1)
                {
                    if (_arg_1[_local_2])
                    {
                        treasureMsgArr.push(_arg_1[_local_2]);
                    };
                };
                _local_3 = "";
                _local_2 = ToolKit.minus(treasureMsgArr.length, 1);
                while (_local_2 >= 0)
                {
                    _local_4 = treasureMsgArr[_local_2];
                    _local_5 = "";
                    _local_6 = _core.data.getGameData(_local_4.ti, _local_4.ii);
                    if (!_local_6)
                    {
                        return;
                    };
                    if (((!(_local_6.color)) || (_local_6.color < 0)))
                    {
                        _local_6.color = 0;
                    };
                    _local_5 = Language.TREASURE_PANEL_U[11];
                    if (!_local_5)
                    {
                        return;
                    };
                    _local_5 = _local_5.replace("{name}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _local_4.c) + "|") + _local_4.name) + "|0|0|0]")));
                    if (_local_4.ti == GamePredef.TBL_EQUIPT_TEMPLATE)
                    {
                        if (!_local_4.cl)
                        {
                            if (_local_6.color > 0)
                            {
                                _local_4.cl = _local_6.color;
                            }
                            else
                            {
                                _local_4.cl = 0;
                            };
                        };
                        _local_8 = _core.data.gameData[_local_4.ti][_local_4.ii];
                        if (_local_8.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
                        {
                            _local_9 = ((Number(_local_4.q) * 10) + 6);
                            _local_5 = _local_5.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _local_4.ii) + "|") + _local_6.name) + "|") + _local_4.cl) + "|") + 0) + "|") + _local_9) + "]")));
                        }
                        else
                        {
                            _local_5 = _local_5.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _local_4.ii) + "|") + _local_6.name) + "|") + _local_4.cl) + "|") + 0) + "|") + 0) + "]")));
                        };
                    }
                    else
                    {
                        if (_local_4.ti == GamePredef.TBL_ITEM_TEMPLATE)
                        {
                            if (!_local_4.cl)
                            {
                                if (_local_6.color > 0)
                                {
                                    _local_4.cl = _local_6.color;
                                }
                                else
                                {
                                    _local_4.cl = 0;
                                };
                            };
                            _local_5 = _local_5.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ITEM_TEMPLATE]) + "|") + _local_4.ii) + "|") + _local_6.name) + "|") + _local_4.cl) + "|") + 0) + "|") + 0) + "]")));
                        }
                        else
                        {
                            if (_local_4.ti == GamePredef.TBL_CREATURE)
                            {
                                _local_10 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(_local_4.q)]) + "'>[") + _local_6.name) + "]</font>");
                                _local_5 = _local_5.replace("{item}", _local_10);
                            };
                        };
                    };
                    _local_7 = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[6]) + "'>") + TextUtil.decode(_local_5)) + "</font><br/>");
                    _local_3 = (_local_3 + _local_7);
                    _local_2--;
                };
                if (initialized)
                {
                    clearBuyLog();
                    linkTA.htmlText = _local_3;
                };
                _loadcid = _core.player.id;
            };
        }

        public function set p5(_arg_1:Label):void
        {
            var _local_2:Object = this._3525p5;
            if (_local_2 !== _arg_1)
            {
                this._3525p5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "p5", _local_2, _arg_1));
            };
        }

        public function set p6(_arg_1:Label):void
        {
            var _local_2:Object = this._3526p6;
            if (_local_2 !== _arg_1)
            {
                this._3526p6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "p6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get n1():Label
        {
            return (this._3459n1);
        }

        [Bindable(event="propertyChange")]
        public function get n2():Label
        {
            return (this._3460n2);
        }

        [Bindable(event="propertyChange")]
        public function get n6():Label
        {
            return (this._3464n6);
        }

        public function set p2(_arg_1:Label):void
        {
            var _local_2:Object = this._3522p2;
            if (_local_2 !== _arg_1)
            {
                this._3522p2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "p2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get p1():Label
        {
            return (this._3521p1);
        }

        [Bindable(event="propertyChange")]
        public function get p2():Label
        {
            return (this._3522p2);
        }

        [Bindable(event="propertyChange")]
        public function get p4():Label
        {
            return (this._3524p4);
        }

        public function __bt6_click(_arg_1:MouseEvent):void
        {
            buyTreasureItem(6);
        }

        public function set i1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3304i1;
            if (_local_2 !== _arg_1)
            {
                this._3304i1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i1", _local_2, _arg_1));
            };
        }

        public function set i2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3305i2;
            if (_local_2 !== _arg_1)
            {
                this._3305i2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i2", _local_2, _arg_1));
            };
        }

        private function setTab(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            var _local_2:int = 3;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("idTabCanvas" + _local_3)].selected = false;
                _local_3++;
            };
            this[("idTabCanvas" + _arg_1)].selected = true;
            if (_arg_1 == 1)
            {
                initTreasureItemObj();
                pageSelector.onPageChanged = onPageChanged;
                pageSelector.onPageCleared = clearPage;
                pageSelector.initPageSeletor(shopItemList.length, ITEM_COUNT_PER_PAGE);
            };
        }

        public function set i3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3306i3;
            if (_local_2 !== _arg_1)
            {
                this._3306i3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i3", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initTreasureBowl", new Responder(onInitTreasureBowl));
        }

        public function set i4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3307i4;
            if (_local_2 !== _arg_1)
            {
                this._3307i4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i4", _local_2, _arg_1));
            };
        }

        public function set i5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3308i5;
            if (_local_2 !== _arg_1)
            {
                this._3308i5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get p3():Label
        {
            return (this._3523p3);
        }

        public function set p4(_arg_1:Label):void
        {
            var _local_2:Object = this._3524p4;
            if (_local_2 !== _arg_1)
            {
                this._3524p4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "p4", _local_2, _arg_1));
            };
        }

        public function set linkTA(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1102666777linkTA;
            if (_local_2 !== _arg_1)
            {
                this._1102666777linkTA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "linkTA", _local_2, _arg_1));
            };
        }

        public function set i6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3309i6;
            if (_local_2 !== _arg_1)
            {
                this._3309i6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i6", _local_2, _arg_1));
            };
        }

        private function cleanItemSlotData(_arg_1:Number):void
        {
            this[("i" + _arg_1)].reset();
            freObj[_arg_1] = null;
            this[("p" + _arg_1)].visible = false;
            this[("t" + _arg_1)].visible = false;
            this[("bt" + _arg_1)].visible = false;
            this[("n" + _arg_1)].visible = false;
        }

        public function set idReflashTime(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1560582673idReflashTime;
            if (_local_2 !== _arg_1)
            {
                this._1560582673idReflashTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idReflashTime", _local_2, _arg_1));
            };
        }

        public function __idTabCanvas0_click(_arg_1:MouseEvent):void
        {
            setTab(0);
        }

        [Bindable(event="propertyChange")]
        public function get linkTA():LinkTextArea
        {
            return (this._1102666777linkTA);
        }

        [Bindable(event="propertyChange")]
        public function get idReflashTime():RoundedLabel
        {
            return (this._1560582673idReflashTime);
        }

        [Bindable(event="propertyChange")]
        public function get p5():Label
        {
            return (this._3525p5);
        }

        public function updateAllLineCharTreasureBowl(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:*;
            if (((initialized) && (visible)))
            {
                if (ToolKit.isSmallThan(_upTime, _arg_1.uTime))
                {
                    TreasureItemObj = null;
                    TreasureItemObj = new Object();
                    _core.remote.call("initTreasureBowlWithList", new Responder(onInitTreasureBowlWithList));
                    return;
                };
                _local_2 = 1;
                while (_local_2 <= 6)
                {
                    cleanItemSlotData(_local_2);
                    _local_2++;
                };
                _local_3 = 1;
                for (_local_4 in _arg_1.rconf)
                {
                    if (_arg_1.rconf[_local_4])
                    {
                        setItemSlotData(_arg_1.rconf[_local_4], _local_3);
                        _local_3++;
                    };
                };
                freBtn.enabled = true;
                _fm = _arg_1.fm;
                setFreshTime(_ft, _arg_1.rft);
            };
        }

        public function set idTabCanvas0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229570idTabCanvas0;
            if (_local_2 !== _arg_1)
            {
                this._277229570idTabCanvas0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idTabCanvas0():BasicGlowButton
        {
            return (this._277229570idTabCanvas0);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                this[("shopSlot" + _local_4)].type = shopItemList[_local_3].type;
                this[("shopSlot" + _local_4)].giid = shopItemList[_local_3].giid;
                this[("shopSlot" + _local_4)].slotData = shopItemList[_local_3].slotData;
                this[("shopSlot" + _local_4)].visible = true;
                _local_4++;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

