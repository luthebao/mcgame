// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.BattleSettingPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.HSlider;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.DescriptionLabel;
    import mx.controls.CheckBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.VRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.DragEvent;
    import mx.events.SliderEvent;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.binding.Binding;
    import flash.events.Event;
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

    public class BattleSettingPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _BattleSettingPanel_Label22:Label;
        public var _BattleSettingPanel_Label23:Label;
        public var _BattleSettingPanel_Label25:Label;
        public var _BattleSettingPanel_Label20:Label;
        public var _BattleSettingPanel_Label24:Label;
        private var _102472i10:ItemSlot;
        private var _103563hs6:HSlider;
        private var _3305i2:ItemSlot;
        private var _103566hs9:HSlider;
        private var _3309i6:ItemSlot;
        public var _BattleSettingPanel_BasicTxtButton1:BasicTxtButton;
        public var _BattleSettingPanel_BasicTxtButton3:BasicTxtButton;
        public var _BattleSettingPanel_BasicTxtButton4:BasicTxtButton;
        private var _103561hs4:HSlider;
        private var _3312i9:ItemSlot;
        public var _BattleSettingPanel_BasicTxtButton2:BasicTxtButton;
        private var _3304i1:ItemSlot;
        private var _103564hs7:HSlider;
        public var _BattleSettingPanel_Label1:Label;
        public var _BattleSettingPanel_Label2:Label;
        private var _3308i5:ItemSlot;
        public var _BattleSettingPanel_Label4:Label;
        public var _BattleSettingPanel_Label5:Label;
        public var _BattleSettingPanel_Label6:Label;
        public var _BattleSettingPanel_Label7:Label;
        public var _BattleSettingPanel_Label8:Label;
        public var _BattleSettingPanel_Label9:Label;
        public var _BattleSettingPanel_Label3:Label;
        public var _BattleSettingPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var isInited:Boolean = false;
        private var _3311i8:ItemSlot;
        public var _BattleSettingPanel_DescriptionLabel1:DescriptionLabel;
        public var _BattleSettingPanel_DescriptionLabel2:DescriptionLabel;
        private var _71506632chkPetAutoDefense:CheckBox;
        private var _103562hs5:HSlider;
        private var _3307i4:ItemSlot;
        private var _1774181354chkPlayerAutoDefense:CheckBox;
        private var _103559hs2:HSlider;
        private var _battleItemSlotSize:int = 10;
        private var _3310i7:ItemSlot;
        private var _103565hs8:HSlider;
        public var _BattleSettingPanel_Label10:Label;
        public var _BattleSettingPanel_Label11:Label;
        public var _BattleSettingPanel_Label12:Label;
        public var _BattleSettingPanel_Label15:Label;
        public var _BattleSettingPanel_Label16:Label;
        public var _BattleSettingPanel_Label18:Label;
        public var _BattleSettingPanel_Label19:Label;
        public var _BattleSettingPanel_Label13:Label;
        public var _BattleSettingPanel_Label14:Label;
        public var _BattleSettingPanel_Label17:Label;
        private var _103560hs3:HSlider;
        private var _3306i3:ItemSlot;
        public var _BattleSettingPanel_Label21:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":472,
                    "height":438,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_BattleSettingPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":31,
                                "width":226,
                                "height":384,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i1",
                                    "events":{"dragDrop":"__i1_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":118
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs2",
                                    "events":{"change":"__hs2_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":45,
                                            "y":132,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i7",
                                    "events":{"dragDrop":"__i7_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i9",
                                    "events":{"dragDrop":"__i9_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":188
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs3",
                                    "events":{"change":"__hs3_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":202,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i3",
                                    "events":{"dragDrop":"__i3_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":0x0101
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs4",
                                    "events":{"change":"__hs4_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":272,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i5",
                                    "events":{"dragDrop":"__i5_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":341
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs5",
                                    "events":{"change":"__hs5_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":356,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DescriptionLabel,
                                    "id":"_BattleSettingPanel_DescriptionLabel1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":58,
                                            "y":40,
                                            "selectable":false,
                                            "width":147,
                                            "height":39
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"chkPlayerAutoDefense",
                                    "events":{"change":"__chkPlayerAutoDefense_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":58,
                                            "y":80
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_BattleSettingPanel_BasicTxtButton1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":13,
                                            "y":10,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_BattleSettingPanel_BasicTxtButton2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":120,
                                            "y":10,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76,
                                            "y":100,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76,
                                            "y":169,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76,
                                            "y":237,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76,
                                            "y":320,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":125,
                                            "width":50,
                                            "height":18,
                                            "text":"0%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":125,
                                            "width":50,
                                            "height":18,
                                            "text":"100%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label7",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":194,
                                            "width":50,
                                            "height":18,
                                            "text":"0%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label8",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":194,
                                            "width":50,
                                            "height":18,
                                            "text":"100%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label9",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":262,
                                            "width":50,
                                            "height":18,
                                            "text":"0%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label10",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":262,
                                            "width":50,
                                            "height":18,
                                            "text":"100%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label11",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":345,
                                            "width":50,
                                            "height":18,
                                            "text":"0%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label12",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":345,
                                            "width":50,
                                            "height":18,
                                            "text":"100%"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":VRule,
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.bottom = "25";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":238});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":240,
                                "y":31,
                                "width":224,
                                "height":382,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i2",
                                    "events":{"dragDrop":"__i2_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":116
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs6",
                                    "events":{"change":"__hs6_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":131,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i8",
                                    "events":{"dragDrop":"__i8_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i10",
                                    "events":{"dragDrop":"__i10_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":186
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs7",
                                    "events":{"change":"__hs7_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":201,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i4",
                                    "events":{"dragDrop":"__i4_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":254
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs8",
                                    "events":{"change":"__hs8_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":271,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"i6",
                                    "events":{"dragDrop":"__i6_dragDrop"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":339
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"hs9",
                                    "events":{"change":"__hs9_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42,
                                            "y":355,
                                            "minimum":0,
                                            "maximum":100,
                                            "allowTrackClick":true,
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DescriptionLabel,
                                    "id":"_BattleSettingPanel_DescriptionLabel2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":58,
                                            "y":40,
                                            "selectable":false,
                                            "width":144,
                                            "height":38
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"chkPetAutoDefense",
                                    "events":{"change":"__chkPetAutoDefense_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":58,
                                            "y":80
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_BattleSettingPanel_BasicTxtButton3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":13,
                                            "y":10,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_BattleSettingPanel_BasicTxtButton4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":120,
                                            "y":10,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label13",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76,
                                            "y":100,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label14",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76,
                                            "y":169,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label15",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76,
                                            "y":237,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label16",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76,
                                            "y":320,
                                            "width":100,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label17",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":125,
                                            "width":50,
                                            "height":18,
                                            "text":"0%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label18",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":125,
                                            "width":50,
                                            "height":18,
                                            "text":"100%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label19",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":194,
                                            "width":50,
                                            "height":18,
                                            "text":"0%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label20",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":194,
                                            "width":50,
                                            "height":18,
                                            "text":"100%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label21",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":262,
                                            "width":50,
                                            "height":18,
                                            "text":"0%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label22",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":262,
                                            "width":50,
                                            "height":18,
                                            "text":"100%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label23",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":43,
                                            "y":345,
                                            "width":50,
                                            "height":18,
                                            "text":"0%"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleSettingPanel_Label24",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 15116365;
                                        this.fontSize = 14;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":345,
                                            "width":50,
                                            "height":18,
                                            "text":"100%"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_BattleSettingPanel_Label25",
                        "stylesFactory":function ():void
                        {
                            this.color = 0;
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":146,
                                "y":410,
                                "width":180,
                                "height":18
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function BattleSettingPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundColor = 14276567;
            };
            this.width = 472;
            this.height = 438;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___BattleSettingPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BattleSettingPanel._watcherSetupUtil = _arg_1;
        }


        public function __i2_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __hs6_change(_arg_1:SliderEvent):void
        {
            setProgress(6);
        }

        [Bindable(event="propertyChange")]
        public function get chkPlayerAutoDefense():CheckBox
        {
            return (this._1774181354chkPlayerAutoDefense);
        }

        public function set hs3(_arg_1:HSlider):void
        {
            var _local_2:Object = this._103560hs3;
            if (_local_2 !== _arg_1)
            {
                this._103560hs3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get i8():ItemSlot
        {
            return (this._3311i8);
        }

        public function set hs4(_arg_1:HSlider):void
        {
            var _local_2:Object = this._103561hs4;
            if (_local_2 !== _arg_1)
            {
                this._103561hs4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs4", _local_2, _arg_1));
            };
        }

        public function __i1_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function set hs5(_arg_1:HSlider):void
        {
            var _local_2:Object = this._103562hs5;
            if (_local_2 !== _arg_1)
            {
                this._103562hs5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs5", _local_2, _arg_1));
            };
        }

        public function updateView():void
        {
            initView();
        }

        public function set hs6(_arg_1:HSlider):void
        {
            var _local_2:Object = this._103563hs6;
            if (_local_2 !== _arg_1)
            {
                this._103563hs6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get i3():ItemSlot
        {
            return (this._3306i3);
        }

        public function set i9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3312i9;
            if (_local_2 !== _arg_1)
            {
                this._3312i9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i9", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            updateCharSetting();
            updatePetSetting();
        }

        public function set hs2(_arg_1:HSlider):void
        {
            var _local_2:Object = this._103559hs2;
            if (_local_2 !== _arg_1)
            {
                this._103559hs2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs2", _local_2, _arg_1));
            };
        }

        public function __hs4_change(_arg_1:SliderEvent):void
        {
            setProgress(4);
        }

        public function __i3_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function ___BattleSettingPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
            isInited = true;
        }

        public function set hs8(_arg_1:HSlider):void
        {
            var _local_2:Object = this._103565hs8;
            if (_local_2 !== _arg_1)
            {
                this._103565hs8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs8", _local_2, _arg_1));
            };
        }

        public function set i7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3310i7;
            if (_local_2 !== _arg_1)
            {
                this._3310i7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i7", _local_2, _arg_1));
            };
        }

        public function set i8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3311i8;
            if (_local_2 !== _arg_1)
            {
                this._3311i8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get i6():ItemSlot
        {
            return (this._3309i6);
        }

        public function __hs3_change(_arg_1:SliderEvent):void
        {
            setProgress(3);
        }

        public function set chkPlayerAutoDefense(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1774181354chkPlayerAutoDefense;
            if (_local_2 !== _arg_1)
            {
                this._1774181354chkPlayerAutoDefense = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chkPlayerAutoDefense", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get i9():ItemSlot
        {
            return (this._3312i9);
        }

        public function set hs9(_arg_1:HSlider):void
        {
            var _local_2:Object = this._103566hs9;
            if (_local_2 !== _arg_1)
            {
                this._103566hs9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs9", _local_2, _arg_1));
            };
        }

        public function set hs7(_arg_1:HSlider):void
        {
            var _local_2:Object = this._103564hs7;
            if (_local_2 !== _arg_1)
            {
                this._103564hs7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hs7", _local_2, _arg_1));
            };
        }

        private function _BattleSettingPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.BATTLESETTINGPANEL_U[0];
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Language.BATTLESETTINGPANEL_S[0];
            _local_1 = Language.BATTLESETTINGPANEL_S[2];
            _local_1 = Language.BATTLESETTINGPANEL_U[1];
            _local_1 = Language.BATTLESETTINGPANEL_U[2];
            _local_1 = Language.BATTLESETTINGPANEL_U[4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BATTLESETTINGPANEL_U[5];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BATTLESETTINGPANEL_U[6];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BATTLESETTINGPANEL_U[7];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Slot.SLOT_USERBAR;
            _local_1 = Language.BATTLESETTINGPANEL_S[1];
            _local_1 = Language.BATTLESETTINGPANEL_S[2];
            _local_1 = Language.BATTLESETTINGPANEL_U[3];
            _local_1 = Language.BATTLESETTINGPANEL_U[2];
            _local_1 = Language.BATTLESETTINGPANEL_U[4];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BATTLESETTINGPANEL_U[5];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BATTLESETTINGPANEL_U[6];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BATTLESETTINGPANEL_U[7];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BATTLESETTINGPANEL_U[8];
        }

        public function __i4_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get chkPetAutoDefense():CheckBox
        {
            return (this._71506632chkPetAutoDefense);
        }

        public function __i10_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get i1():ItemSlot
        {
            return (this._3304i1);
        }

        [Bindable(event="propertyChange")]
        public function get i7():ItemSlot
        {
            return (this._3310i7);
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

        public function __hs2_change(_arg_1:SliderEvent):void
        {
            setProgress(2);
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

        [Bindable(event="propertyChange")]
        public function get i10():ItemSlot
        {
            return (this._102472i10);
        }

        public function __i5_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __hs9_change(_arg_1:SliderEvent):void
        {
            setProgress(9);
        }

        public function updateSlot(_arg_1:Number):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:String;
            var _local_8:int;
            var _local_9:Object;
            var _local_2:Number = GamePredef.GLOBAL_SETTING[("bs" + _arg_1)];
            var _local_3:Object = this[("i" + _arg_1)];
            _local_3.stackNum = 0;
            if (_local_3.type == GamePredef.TBL_SKILL)
            {
                if (_core.player.awakenPointDict)
                {
                    _local_5 = _core.player.awakenPointDict;
                    _local_6 = GameData.d[GamePredef.TBL_SKILL][_local_2];
                    _local_7 = _local_6.codeName;
                    if (((_local_6) && (_local_5[_local_7])))
                    {
                        _local_8 = int(_local_5[_local_7]);
                        if (int(_local_6[("exSid" + _local_8)]) > 0)
                        {
                            _local_2 = _local_6[("exSid" + _local_8)];
                        };
                    };
                };
                _local_3.giid = _local_2;
                _local_4 = _core.getTemplateData(_local_3.type, _local_2, false);
                _local_3.alpha = (((_local_4) && (_core.checkSkillRequire(_local_4))) ? 1 : 0.5);
            }
            else
            {
                _local_3.giid = _local_2;
                _local_9 = _core.getItemNum(_local_3.type, _local_2);
                _local_3.stackNum = _local_9.num;
                _local_3.alpha = ((_local_3.stackNum > 0) ? 1 : 0.5);
            };
        }

        public function set chkPetAutoDefense(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._71506632chkPetAutoDefense;
            if (_local_2 !== _arg_1)
            {
                this._71506632chkPetAutoDefense = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chkPetAutoDefense", _local_2, _arg_1));
            };
        }

        public function __i6_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __hs8_change(_arg_1:SliderEvent):void
        {
            setProgress(8);
        }

        private function setSlot(_arg_1:DragEvent):void
        {
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:Number;
            var _local_13:Object;
            var _local_14:Object;
            var _local_15:Object;
            var _local_16:Object;
            var _local_17:Boolean;
            var _local_18:int;
            var _local_19:Object;
            var _local_20:int;
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            var _local_3:Object = _arg_1.dragSource.dataForFormat("slot");
            if (_local_2 == _local_3)
            {
                return;
            };
            var _local_4:* = "";
            var _local_5:* = "";
            var _local_6:String = _local_2.id.slice(1);
            var _local_7:Boolean;
            _local_4 = ("bs" + _local_6);
            _local_5 = ("bt" + _local_6);
            if ((Number(_local_6) % 2) == 0)
            {
                _local_7 = true;
            };
            if (_local_7)
            {
                if (!_core.battlePet)
                {
                    return;
                };
            };
            if ((((_local_3.type == GamePredef.TBL_ITEM_INSTANCE) && (!(Number(_local_6) == 7))) && (!(Number(_local_6) == 8))))
            {
                _local_8 = _core.getTemplateData(_local_3.type, _local_3.giid, false);
                if (!_local_8)
                {
                    return;
                };
                if (((_local_8.skillId <= 0) && ((!(_local_8.scriptUse)) || (_local_8.scriptUse.length <= 0))))
                {
                    return;
                };
                if ((((_local_7) && (!(_local_8.useType == 3))) && (!(_local_8.useType == 2))))
                {
                    return;
                };
                if ((((!(_local_7)) && (!(_local_8.useType == 3))) && (!(_local_8.useType == 1))))
                {
                    return;
                };
                _local_2.type = GamePredef.TBL_ITEM_TEMPLATE;
                if (Number(_local_6) < 7)
                {
                    _core.updateSettingNow(_local_5, GamePredef.TBL_ITEM_TEMPLATE, _local_7);
                };
                _core.updateSettingNow(_local_4, _local_8.id, _local_7);
            }
            else
            {
                if ((((_local_3.type == GamePredef.TBL_ITEM_TEMPLATE) && (!(Number(_local_6) == 7))) && (!(Number(_local_6) == 8))))
                {
                    _local_9 = _core.getTemplateData(_local_3.type, _local_3.giid, false);
                    if (!_local_9)
                    {
                        return;
                    };
                    if (((_local_9.skillId <= 0) && ((!(_local_9.scriptUse)) || (_local_9.scriptUse.length <= 0))))
                    {
                        return;
                    };
                    if ((((_local_7) && (!(_local_9.useType == 3))) && (!(_local_9.useType == 2))))
                    {
                        return;
                    };
                    if ((((!(_local_7)) && (!(_local_9.useType == 3))) && (!(_local_9.useType == 1))))
                    {
                        return;
                    };
                    _local_2.type = GamePredef.TBL_ITEM_TEMPLATE;
                    if (Number(_local_6) < 7)
                    {
                        _core.updateSettingNow(_local_5, GamePredef.TBL_ITEM_TEMPLATE, _local_7);
                    };
                    _core.updateSettingNow(_local_4, _local_9.id, _local_7);
                }
                else
                {
                    if ((((_local_3.type == GamePredef.TBL_SKILL) && (!(Number(_local_6) == 9))) && (!(Number(_local_6) == 10))))
                    {
                        _local_10 = (_arg_1.dragSource.dataForFormat("level") as int);
                        _local_2.type = GamePredef.TBL_SKILL;
                        _local_11 = _core.getTemplateData(_local_3.type, _local_3.giid, false);
                        if (!_local_11)
                        {
                            return;
                        };
                        if (!_local_7)
                        {
                            if (_local_11.reqClass.indexOf("|100|") >= 0)
                            {
                                return;
                            };
                        }
                        else
                        {
                            _local_15 = _core.battlePet;
                            _local_17 = false;
                            _local_18 = 1;
                            while (_local_18 <= 15)
                            {
                                _local_16 = _core.getTemplateData(GamePredef.TBL_SKILL, _local_15[("skill" + _local_18)], false);
                                if ((((_local_16) && (_local_16.codeName == _local_11.codeName)) && (_local_16.level >= _local_11.level)))
                                {
                                    _local_17 = true;
                                    break;
                                };
                                _local_18++;
                            };
                            if (!_local_17)
                            {
                                return;
                            };
                        };
                        _local_12 = _local_3.giid;
                        _local_13 = _core.player.awakenPointDict;
                        _local_14 = GameData.d[GamePredef.TBL_SKILL][_local_3.giid];
                        if ((((_local_13) && (_local_14)) && (_local_14.reqClass == "")))
                        {
                            for each (_local_11 in _core.player.skillList)
                            {
                                if (_local_11)
                                {
                                    _local_19 = GameData.d[GamePredef.TBL_SKILL][_local_11.sid];
                                    if (_local_19)
                                    {
                                        if (_local_13[_local_19.codeName])
                                        {
                                            _local_20 = _local_13[_local_19.codeName];
                                            if (!((!(_local_19[("exSid" + _local_20)])) || (Number(_local_19[("exSid" + _local_20)]) <= 0)))
                                            {
                                                if (Number(_local_19[("exSid" + _local_20)]) == _local_12)
                                                {
                                                    _local_12 = _local_19.id;
                                                    break;
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        _core.remote.skillSetBattle(_local_12, _local_10, _local_6, _local_7);
                        if (_local_7)
                        {
                            _core.updatePetSetting(_local_5, GamePredef.TBL_SKILL);
                            _core.updatePetSetting(_local_4, _local_3.giid);
                        }
                        else
                        {
                            _core.updateSetting(_local_5, GamePredef.TBL_SKILL);
                            _core.updateSetting(_local_4, _local_12);
                        };
                    };
                };
            };
            setNum();
        }

        [Bindable(event="propertyChange")]
        public function get hs3():HSlider
        {
            return (this._103560hs3);
        }

        [Bindable(event="propertyChange")]
        public function get hs4():HSlider
        {
            return (this._103561hs4);
        }

        private function _BattleSettingPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_BattleSettingPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i1.slotType = _arg_1;
            }, "i1.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i7.slotType = _arg_1;
            }, "i7.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i9.slotType = _arg_1;
            }, "i9.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i3.slotType = _arg_1;
            }, "i3.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i5.slotType = _arg_1;
            }, "i5.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_DescriptionLabel1.text = _arg_1;
            }, "_BattleSettingPanel_DescriptionLabel1.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                chkPlayerAutoDefense.label = _arg_1;
            }, "chkPlayerAutoDefense.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_BasicTxtButton1.label = _arg_1;
            }, "_BattleSettingPanel_BasicTxtButton1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_BasicTxtButton2.label = _arg_1;
            }, "_BattleSettingPanel_BasicTxtButton2.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label1.text = _arg_1;
            }, "_BattleSettingPanel_Label1.text");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label1.filters = _arg_1;
            }, "_BattleSettingPanel_Label1.filters");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label2.text = _arg_1;
            }, "_BattleSettingPanel_Label2.text");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label2.filters = _arg_1;
            }, "_BattleSettingPanel_Label2.filters");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label3.text = _arg_1;
            }, "_BattleSettingPanel_Label3.text");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label3.filters = _arg_1;
            }, "_BattleSettingPanel_Label3.filters");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label4.text = _arg_1;
            }, "_BattleSettingPanel_Label4.text");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label4.filters = _arg_1;
            }, "_BattleSettingPanel_Label4.filters");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label5.filters = _arg_1;
            }, "_BattleSettingPanel_Label5.filters");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label6.filters = _arg_1;
            }, "_BattleSettingPanel_Label6.filters");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label7.filters = _arg_1;
            }, "_BattleSettingPanel_Label7.filters");
            result[20] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label8.filters = _arg_1;
            }, "_BattleSettingPanel_Label8.filters");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label9.filters = _arg_1;
            }, "_BattleSettingPanel_Label9.filters");
            result[22] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label10.filters = _arg_1;
            }, "_BattleSettingPanel_Label10.filters");
            result[23] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label11.filters = _arg_1;
            }, "_BattleSettingPanel_Label11.filters");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label12.filters = _arg_1;
            }, "_BattleSettingPanel_Label12.filters");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i2.slotType = _arg_1;
            }, "i2.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i8.slotType = _arg_1;
            }, "i8.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i10.slotType = _arg_1;
            }, "i10.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i4.slotType = _arg_1;
            }, "i4.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_USERBAR);
            }, function (_arg_1:int):void
            {
                i6.slotType = _arg_1;
            }, "i6.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_DescriptionLabel2.text = _arg_1;
            }, "_BattleSettingPanel_DescriptionLabel2.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                chkPetAutoDefense.label = _arg_1;
            }, "chkPetAutoDefense.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_BasicTxtButton3.label = _arg_1;
            }, "_BattleSettingPanel_BasicTxtButton3.label");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_BasicTxtButton4.label = _arg_1;
            }, "_BattleSettingPanel_BasicTxtButton4.label");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label13.text = _arg_1;
            }, "_BattleSettingPanel_Label13.text");
            result[35] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label13.filters = _arg_1;
            }, "_BattleSettingPanel_Label13.filters");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label14.text = _arg_1;
            }, "_BattleSettingPanel_Label14.text");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label14.filters = _arg_1;
            }, "_BattleSettingPanel_Label14.filters");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label15.text = _arg_1;
            }, "_BattleSettingPanel_Label15.text");
            result[39] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label15.filters = _arg_1;
            }, "_BattleSettingPanel_Label15.filters");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label16.text = _arg_1;
            }, "_BattleSettingPanel_Label16.text");
            result[41] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label16.filters = _arg_1;
            }, "_BattleSettingPanel_Label16.filters");
            result[42] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label17.filters = _arg_1;
            }, "_BattleSettingPanel_Label17.filters");
            result[43] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label18.filters = _arg_1;
            }, "_BattleSettingPanel_Label18.filters");
            result[44] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label19.filters = _arg_1;
            }, "_BattleSettingPanel_Label19.filters");
            result[45] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label20.filters = _arg_1;
            }, "_BattleSettingPanel_Label20.filters");
            result[46] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label21.filters = _arg_1;
            }, "_BattleSettingPanel_Label21.filters");
            result[47] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label22.filters = _arg_1;
            }, "_BattleSettingPanel_Label22.filters");
            result[48] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label23.filters = _arg_1;
            }, "_BattleSettingPanel_Label23.filters");
            result[49] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _BattleSettingPanel_Label24.filters = _arg_1;
            }, "_BattleSettingPanel_Label24.filters");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESETTINGPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleSettingPanel_Label25.text = _arg_1;
            }, "_BattleSettingPanel_Label25.text");
            result[51] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get hs6():HSlider
        {
            return (this._103563hs6);
        }

        [Bindable(event="propertyChange")]
        public function get hs7():HSlider
        {
            return (this._103564hs7);
        }

        [Bindable(event="propertyChange")]
        public function get hs8():HSlider
        {
            return (this._103565hs8);
        }

        public function __chkPetAutoDefense_change(_arg_1:Event):void
        {
            setAttackAvailability(true);
        }

        override public function initialize():void
        {
            var target:BattleSettingPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BattleSettingPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_BattleSettingPanelWatcherSetupUtil");
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

        private function updateCharSetting():void
        {
            var _local_3:Number;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:int;
            var _local_1:int = 2;
            while (_local_1 < 6)
            {
                this[("hs" + _local_1)].value = GamePredef.GLOBAL_SETTING[("p" + _local_1)];
                _local_1++;
            };
            i7.type = GamePredef.TBL_SKILL;
            i9.type = GamePredef.TBL_ITEM_TEMPLATE;
            i1.type = GamePredef.GLOBAL_SETTING["bt1"];
            i3.type = GamePredef.GLOBAL_SETTING["bt3"];
            i5.type = GamePredef.GLOBAL_SETTING["bt5"];
            var _local_2:int = 1;
            while (_local_2 < 11)
            {
                _local_3 = GamePredef.GLOBAL_SETTING[("bs" + _local_2)];
                if (((_local_3 > 0) && (_core.player.awakenPointDict)))
                {
                    _local_4 = _core.player.awakenPointDict;
                    _local_5 = GameData.d[GamePredef.TBL_SKILL][_local_3];
                    if (((_local_5) && (_local_4[_local_5.codeName])))
                    {
                        _local_6 = _local_5.codeName;
                        _local_7 = int(_local_4[_local_6]);
                        if (int(_local_5[("exSid" + _local_7)]) > 0)
                        {
                            _local_3 = _local_5[("exSid" + _local_7)];
                        };
                    };
                };
                this[("i" + _local_2)].giid = _local_3;
                _local_2 = (_local_2 + 2);
            };
            setNum();
        }

        [Bindable(event="propertyChange")]
        public function get hs9():HSlider
        {
            return (this._103566hs9);
        }

        public function __i7_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get hs5():HSlider
        {
            return (this._103562hs5);
        }

        public function set i10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._102472i10;
            if (_local_2 !== _arg_1)
            {
                this._102472i10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hs2():HSlider
        {
            return (this._103559hs2);
        }

        public function __hs7_change(_arg_1:SliderEvent):void
        {
            setProgress(7);
        }

        private function setProgress(_arg_1:int):void
        {
            if (((_arg_1 >= 6) && (_arg_1 <= 9)))
            {
                _core.updateSettingNow(("p" + _arg_1), int(this[("hs" + _arg_1)].value), true);
            }
            else
            {
                _core.updateSettingNow(("p" + _arg_1), int(this[("hs" + _arg_1)].value));
            };
        }

        public function __i8_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        private function setAttackAvailability(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                GamePredef.BATTLE_AUTO_DEFENSE_PET = chkPetAutoDefense.selected;
                i8.enabled = (!(GamePredef.BATTLE_AUTO_DEFENSE_PET));
                i8.acceptable = i8.enabled;
            }
            else
            {
                GamePredef.BATTLE_AUTO_DEFENSE_PLAYER = chkPlayerAutoDefense.selected;
                i7.enabled = (!(GamePredef.BATTLE_AUTO_DEFENSE_PLAYER));
                i7.acceptable = i7.enabled;
            };
        }

        public function setNum():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_1:int = 1;
            while (_local_1 <= _battleItemSlotSize)
            {
                _local_2 = this[("i" + _local_1)];
                if (((_local_2) && (_local_2.type == GamePredef.TBL_ITEM_TEMPLATE)))
                {
                    _local_3 = _core.getItemNumNew(_local_2.type, _local_2.giid);
                    _local_2.stackNum = _local_3.num;
                    _local_2.alpha = ((_local_3.num <= 0) ? 0.5 : 1);
                };
                _local_1++;
            };
        }

        public function __i9_dragDrop(_arg_1:DragEvent):void
        {
            setSlot(_arg_1);
        }

        public function __chkPlayerAutoDefense_change(_arg_1:Event):void
        {
            setAttackAvailability(false);
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

        public function set i5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3308i5;
            if (_local_2 !== _arg_1)
            {
                this._3308i5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i5", _local_2, _arg_1));
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

        public function updatePetSetting():void
        {
            if (!_core.battlePet)
            {
                return;
            };
            var _local_1:int = 6;
            while (_local_1 < 10)
            {
                this[("hs" + _local_1)].value = GamePredef.GLOBAL_SETTING[("p" + _local_1)];
                _local_1++;
            };
            i8.type = GamePredef.TBL_SKILL;
            i10.type = GamePredef.TBL_ITEM_TEMPLATE;
            i2.type = GamePredef.GLOBAL_SETTING["bt2"];
            i4.type = GamePredef.GLOBAL_SETTING["bt4"];
            i6.type = GamePredef.GLOBAL_SETTING["bt6"];
            var _local_2:int = 2;
            while (_local_2 < 11)
            {
                this[("i" + _local_2)].giid = GamePredef.GLOBAL_SETTING[("bs" + _local_2)];
                _local_2 = (_local_2 + 2);
            };
            setNum();
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

        public function __hs5_change(_arg_1:SliderEvent):void
        {
            setProgress(5);
        }

        [Bindable(event="propertyChange")]
        public function get i2():ItemSlot
        {
            return (this._3305i2);
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


    }
}//package com.qeedoo.ui.view.compDragable

