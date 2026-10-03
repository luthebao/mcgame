// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.BossDailyPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.RadioButton;
    import com.qeedoo.ui.view.comp.BossDailyRect;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
    import flash.net.Responder;
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

    public class BossDailyPanel extends DragableCanvas implements IBindingClient 
    {

        public static var total_num:int = 10;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3586r4:RadioButton;
        private var _3088b2:BossDailyRect;
        private var _3091b5:BossDailyRect;
        private var selectIndex:int = -1;
        private var _3585r3:RadioButton;
        public var _BossDailyPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3087b1:BossDailyRect;
        private var _3589r7:RadioButton;
        private var _3090b4:BossDailyRect;
        private var _55427583leftNum:Label;
        private var flag:Object;
        private var _3584r2:RadioButton;
        private var _3588r6:RadioButton;
        private var _3086b0:BossDailyRect;
        private var ITEM_COUNT_PER_PAGE:int = 8;
        public var _BossDailyPanel_Image1:Image;
        public var _BossDailyPanel_Image2:Image;
        private var _607339634pageSelector:PageSelector;
        private var _3093b7:BossDailyRect;
        private var _1718255140leftNumC:Canvas;
        private var _3583r1:RadioButton;
        private var _3587r5:RadioButton;
        private var _3089b3:BossDailyRect;
        private var _3590r8:RadioButton;
        private var _3092b6:BossDailyRect;
        private var _3582r0:RadioButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":660,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_BossDailyPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":36,
                                "width":640,
                                "height":445,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_BossDailyPanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":1,
                                            "y":1
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"leftNumC",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":3,
                                            "y":38,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_BossDailyPanel_Image2"
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"leftNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":158,
                                                        "y":2
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
                                            "x":5,
                                            "y":41,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BossDailyRect,
                                                "id":"b4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":180
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BossDailyRect,
                                                "id":"b5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":125,
                                                        "y":180
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BossDailyRect,
                                                "id":"b6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":250,
                                                        "y":180
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BossDailyRect,
                                                "id":"b7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":375,
                                                        "y":180
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BossDailyRect,
                                                "id":"b0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BossDailyRect,
                                                "id":"b1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":125,
                                                        "y":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BossDailyRect,
                                                "id":"b2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":250,
                                                        "y":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BossDailyRect,
                                                "id":"b3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":375,
                                                        "y":0
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageSelector",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"x":200});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":500,
                                            "y":30,
                                            "width":135,
                                            "height":435,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r0",
                                                "events":{"click":"__r0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":48,
                                                        "selected":true,
                                                        "groupName":"select"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r1",
                                                "events":{"click":"__r1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":78,
                                                        "groupName":"select"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r2",
                                                "events":{"click":"__r2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":108,
                                                        "groupName":"select"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r3",
                                                "events":{"click":"__r3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":138,
                                                        "groupName":"select"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r4",
                                                "events":{"click":"__r4_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":168,
                                                        "groupName":"select"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r5",
                                                "events":{"click":"__r5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":198,
                                                        "groupName":"select"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r6",
                                                "events":{"click":"__r6_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":228,
                                                        "groupName":"select"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r7",
                                                "events":{"click":"__r7_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":258,
                                                        "groupName":"select"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"r8",
                                                "events":{"click":"__r8_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":12,
                                                        "y":288,
                                                        "groupName":"select"
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
        private var bosses:Array = new Array();
        private var BOSS_DAILY_CONFIG:Object = BOSS_DAILY_CONFIG = {
            "2204":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý"
            },
            "2205":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý"
            },
            "2206":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý"
            },
            "2207":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý"
            },
            "2208":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý"
            },
            "2209":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý"
            },
            "2210":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý"
            },
            "2211":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý"
            },
            "2212":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý"
            },
            "2213":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý"
            },
            "2214":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý"
            },
            "2215":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý"
            },
            "2216":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý"
            },
            "2217":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý"
            },
            "2218":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2219":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2220":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2221":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2222":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2223":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2224":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2225":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2226":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2227":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2228":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2229":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2230":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2231":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2232":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2233":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2234":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2235":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2236":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2237":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2238":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2239":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2240":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2241":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2242":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2243":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2244":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2245":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2246":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2247":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2248":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2249":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2250":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2251":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2252":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2253":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2254":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2255":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2256":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2257":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2258":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2259":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2260":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2261":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item quý\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2262":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2263":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":0.7,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2264":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2265":{
                "type":2,
                "isSuper":1,
                "step":((((3 * 24) * 60) * 60) * 1000),
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2266":{
                "type":2,
                "isSuper":1,
                "step":((((3 * 24) * 60) * 60) * 1000),
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2267":{
                "type":2,
                "isSuper":1,
                "step":((((3 * 24) * 60) * 60) * 1000),
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2268":{
                "type":2,
                "isSuper":1,
                "step":((((3 * 24) * 60) * 60) * 1000),
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2269":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Item quý, Thần khí phụ, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2270":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2271":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2272":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Item quý, Thần khí phụ, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2273":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Item quý, Thần khí phụ, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2274":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Item quý, Thần khí phụ, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2275":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Có cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item quý, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2455":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item hiếm\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2456":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item hiếm\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2457":{
                "type":1,
                "isSuper":0,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item hiếm\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2458":{
                "type":1,
                "isSuper":0,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Cơ hội nhận:\n    Nguyên liệu, Lông vũ, Thần khí phụ, Item hiếm\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2468":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item hiếm, Cánh Ánh Sáng\n    Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2567":{
                "type":1,
                "isSuper":1,
                "num":4,
                "s":1,
                "x":1,
                "y":0,
                "award":"Cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item hiếm, Cánh Ánh Sáng \n Bụi Vô Hạn, Bụi Ma Pháp"
            },
            "2568":{
                "type":1,
                "isSuper":1,
                "num":2,
                "s":1,
                "x":1,
                "y":0,
                "award":"Cơ hội nhận:\n    Nguyên liệu, Bảo thạch, Item hiếm, Cánh Ánh Sáng \nBụi Vô Hạn, Bụi Ma Pháp"
            }
        };
        private var BOSS_DAILY_CONFIG_WILD_LIST:Array = [2262, 2263, 2264, 2269, 2270, 2271, 2272, 2273, 2274, 2275, 2468];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function BossDailyPanel()
        {
            mx_internal::_document = this;
            this.width = 660;
            this.height = 500;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___BossDailyPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BossDailyPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get r2():RadioButton
        {
            return (this._3584r2);
        }

        public function set r0(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3582r0;
            if (_local_2 !== _arg_1)
            {
                this._3582r0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r0", _local_2, _arg_1));
            };
        }

        public function set r4(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3586r4;
            if (_local_2 !== _arg_1)
            {
                this._3586r4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r0():RadioButton
        {
            return (this._3582r0);
        }

        [Bindable(event="propertyChange")]
        public function get r1():RadioButton
        {
            return (this._3583r1);
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get r3():RadioButton
        {
            return (this._3585r3);
        }

        public function set r3(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3585r3;
            if (_local_2 !== _arg_1)
            {
                this._3585r3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r6():RadioButton
        {
            return (this._3588r6);
        }

        public function set r1(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3583r1;
            if (_local_2 !== _arg_1)
            {
                this._3583r1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get b0():BossDailyRect
        {
            return (this._3086b0);
        }

        [Bindable(event="propertyChange")]
        public function get b1():BossDailyRect
        {
            return (this._3087b1);
        }

        [Bindable(event="propertyChange")]
        public function get b3():BossDailyRect
        {
            return (this._3089b3);
        }

        [Bindable(event="propertyChange")]
        public function get b4():BossDailyRect
        {
            return (this._3090b4);
        }

        [Bindable(event="propertyChange")]
        public function get b5():BossDailyRect
        {
            return (this._3091b5);
        }

        [Bindable(event="propertyChange")]
        public function get b6():BossDailyRect
        {
            return (this._3092b6);
        }

        [Bindable(event="propertyChange")]
        public function get b7():BossDailyRect
        {
            return (this._3093b7);
        }

        [Bindable(event="propertyChange")]
        public function get b2():BossDailyRect
        {
            return (this._3088b2);
        }

        public function set r7(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3589r7;
            if (_local_2 !== _arg_1)
            {
                this._3589r7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r5():RadioButton
        {
            return (this._3587r5);
        }

        public function set b0(_arg_1:BossDailyRect):void
        {
            var _local_2:Object = this._3086b0;
            if (_local_2 !== _arg_1)
            {
                this._3086b0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r7():RadioButton
        {
            return (this._3589r7);
        }

        public function set b1(_arg_1:BossDailyRect):void
        {
            var _local_2:Object = this._3087b1;
            if (_local_2 !== _arg_1)
            {
                this._3087b1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b1", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.setNextBtnStyle("bossDailyButton");
            pageSelector.setLastBtnStyle("bossDailyButton");
            pageSelector.setMidTextStyle("PageIndicator1");
        }

        public function set b2(_arg_1:BossDailyRect):void
        {
            var _local_2:Object = this._3088b2;
            if (_local_2 !== _arg_1)
            {
                this._3088b2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b2", _local_2, _arg_1));
            };
        }

        public function set b3(_arg_1:BossDailyRect):void
        {
            var _local_2:Object = this._3089b3;
            if (_local_2 !== _arg_1)
            {
                this._3089b3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b3", _local_2, _arg_1));
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

        public function set b4(_arg_1:BossDailyRect):void
        {
            var _local_2:Object = this._3090b4;
            if (_local_2 !== _arg_1)
            {
                this._3090b4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b4", _local_2, _arg_1));
            };
        }

        public function set b5(_arg_1:BossDailyRect):void
        {
            var _local_2:Object = this._3091b5;
            if (_local_2 !== _arg_1)
            {
                this._3091b5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b5", _local_2, _arg_1));
            };
        }

        public function __r1_click(_arg_1:MouseEvent):void
        {
            selectChange(2);
        }

        public function set b7(_arg_1:BossDailyRect):void
        {
            var _local_2:Object = this._3093b7;
            if (_local_2 !== _arg_1)
            {
                this._3093b7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get leftNumC():Canvas
        {
            return (this._1718255140leftNumC);
        }

        public function set r2(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3584r2;
            if (_local_2 !== _arg_1)
            {
                this._3584r2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r2", _local_2, _arg_1));
            };
        }

        public function set r8(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3590r8;
            if (_local_2 !== _arg_1)
            {
                this._3590r8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r8", _local_2, _arg_1));
            };
        }

        public function set b6(_arg_1:BossDailyRect):void
        {
            var _local_2:Object = this._3092b6;
            if (_local_2 !== _arg_1)
            {
                this._3092b6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b6", _local_2, _arg_1));
            };
        }

        public function __r5_click(_arg_1:MouseEvent):void
        {
            selectChange(6);
        }

        public function set r6(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3588r6;
            if (_local_2 !== _arg_1)
            {
                this._3588r6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r4():RadioButton
        {
            return (this._3586r4);
        }

        private function getVisibleBossByAward():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            bosses.length = 0;
            var _local_1:int = _core.player.level;
            for (_local_2 in BOSS_DAILY_CONFIG)
            {
                _local_3 = BOSS_DAILY_CONFIG[_local_2];
                _local_4 = GameData.d[GamePredef.TBL_NPC][_local_2];
                if ((_local_1 - int(_local_4.lv)) <= 10)
                {
                    bosses.push({"id":_local_2});
                };
            };
            bosses.sortOn("id", Array.NUMERIC);
        }

        public function onGetData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            selectIndex = -1;
            r0.selected = true;
            var _local_2:int = 1;
            while (_local_2 < 9)
            {
                this[("r" + _local_2)].selected = false;
                _local_2++;
            };
            flag = _arg_1["data"];
            total_num = int(_arg_1["total"]);
            flag["now"] = _arg_1["t"];
            var _local_3:int = (int(_arg_1["total"]) - int(flag["n"]));
            leftNum.text = ((_local_3 < 0) ? "0" : _local_3.toString());
            selectChange(1);
            visible = true;
        }

        public function set leftNumC(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1718255140leftNumC;
            if (_local_2 !== _arg_1)
            {
                this._1718255140leftNumC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftNumC", _local_2, _arg_1));
            };
        }

        public function set r5(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3587r5;
            if (_local_2 !== _arg_1)
            {
                this._3587r5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r8():RadioButton
        {
            return (this._3590r8);
        }

        private function getVisibleBossByLevel(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            bosses.length = 0;
            for (_local_3 in BOSS_DAILY_CONFIG)
            {
                _local_4 = BOSS_DAILY_CONFIG[_local_3];
                _local_5 = GameData.d[GamePredef.TBL_NPC][_local_3];
                if (((int(_local_5.lv) >= _arg_1) && (int(_local_5.lv) <= _arg_2)))
                {
                    bosses.push({"id":_local_3});
                };
            };
            bosses.sortOn("id", Array.NUMERIC);
        }

        public function __r6_click(_arg_1:MouseEvent):void
        {
            selectChange(7);
        }

        public function __r2_click(_arg_1:MouseEvent):void
        {
            selectChange(3);
        }

        private function _BossDailyPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BossDailyPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_BossDailyPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000490));
            }, function (_arg_1:Object):void
            {
                _BossDailyPanel_Image1.source = _arg_1;
            }, "_BossDailyPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000491));
            }, function (_arg_1:Object):void
            {
                _BossDailyPanel_Image2.source = _arg_1;
            }, "_BossDailyPanel_Image2.source");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                leftNum.filters = _arg_1;
            }, "leftNum.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r0.label = _arg_1;
            }, "r0.label");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r0.filters = _arg_1;
            }, "r0.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r1.label = _arg_1;
            }, "r1.label");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r1.filters = _arg_1;
            }, "r1.filters");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r2.label = _arg_1;
            }, "r2.label");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r2.filters = _arg_1;
            }, "r2.filters");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r3.label = _arg_1;
            }, "r3.label");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r3.filters = _arg_1;
            }, "r3.filters");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r4.label = _arg_1;
            }, "r4.label");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r4.filters = _arg_1;
            }, "r4.filters");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r5.label = _arg_1;
            }, "r5.label");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r5.filters = _arg_1;
            }, "r5.filters");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r6.label = _arg_1;
            }, "r6.label");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r6.filters = _arg_1;
            }, "r6.filters");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r7.label = _arg_1;
            }, "r7.label");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r7.filters = _arg_1;
            }, "r7.filters");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BOSS_DAILY_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                r8.label = _arg_1;
            }, "r8.label");
            result[20] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                r8.filters = _arg_1;
            }, "r8.filters");
            result[21] = binding;
            return (result);
        }

        private function clearPage():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                this[("b" + _local_1)].clean();
                _local_1++;
            };
        }

        override public function initialize():void
        {
            var target:BossDailyPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BossDailyPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_BossDailyPanelWatcherSetupUtil");
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
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        private function getVisibleBossByBoss():void
        {
            var _local_1:Object;
            var _local_2:Object;
            bosses.length = 0;
            for (_local_1 in BOSS_DAILY_CONFIG)
            {
                _local_2 = BOSS_DAILY_CONFIG[_local_1];
                if (_local_2["isSuper"] == 1)
                {
                    bosses.push({"id":_local_1});
                };
            };
            bosses.sortOn("id", Array.NUMERIC);
        }

        public function __r7_click(_arg_1:MouseEvent):void
        {
            selectChange(8);
        }

        public function __r3_click(_arg_1:MouseEvent):void
        {
            selectChange(4);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_3:int;
            while (_local_3 < ITEM_COUNT_PER_PAGE)
            {
                _local_4 = bosses[(_local_3 + _arg_1)];
                if (_local_4)
                {
                    this[("b" + _local_3)].refresh(_local_4, flag, BOSS_DAILY_CONFIG[_local_4["id"]]);
                }
                else
                {
                    this[("b" + _local_3)].clean();
                };
                _local_3++;
            };
        }

        private function selectChange(_arg_1:int):void
        {
            if (selectIndex == _arg_1)
            {
                return;
            };
            selectIndex = _arg_1;
            if (_arg_1 == 1)
            {
                getVisibleBossByAward();
            }
            else
            {
                if (_arg_1 == 2)
                {
                    getVisibleBossByBoss();
                }
                else
                {
                    if (_arg_1 == 3)
                    {
                        getVisibleBossByLevel(0, 49);
                    }
                    else
                    {
                        if (_arg_1 == 4)
                        {
                            getVisibleBossByLevel(50, 79);
                        }
                        else
                        {
                            if (_arg_1 == 5)
                            {
                                getVisibleBossByLevel(80, 99);
                            }
                            else
                            {
                                if (_arg_1 == 6)
                                {
                                    getVisibleBossByLevel(100, 119);
                                }
                                else
                                {
                                    if (_arg_1 == 7)
                                    {
                                        getVisibleBossByLevel(120, 139);
                                    }
                                    else
                                    {
                                        if (_arg_1 == 8)
                                        {
                                            getVisibleBossByLevel(140, 150);
                                        }
                                        else
                                        {
                                            if (_arg_1 == 9)
                                            {
                                                getVisibleBossByLevel(151, 170);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            onPageChanged(0, (bosses.length % ITEM_COUNT_PER_PAGE));
            pageSelector.initPageSeletor(bosses.length, ITEM_COUNT_PER_PAGE);
        }

        public function ___BossDailyPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("bossDailyGetData", new Responder(onGetData));
        }

        public function __r0_click(_arg_1:MouseEvent):void
        {
            selectChange(1);
        }

        private function _BossDailyPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.BOSS_DAILY_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220000490);
            _local_1 = ResManager.getIconUrl(4130220000491);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[5];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[6];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[7];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[8];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[9];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[10];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[11];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[12];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.BOSS_DAILY_PANEL[19];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        public function __r4_click(_arg_1:MouseEvent):void
        {
            selectChange(5);
        }

        public function __r8_click(_arg_1:MouseEvent):void
        {
            selectChange(9);
        }

        public function set leftNum(_arg_1:Label):void
        {
            var _local_2:Object = this._55427583leftNum;
            if (_local_2 !== _arg_1)
            {
                this._55427583leftNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get leftNum():Label
        {
            return (this._55427583leftNum);
        }


    }
}//package com.qeedoo.ui.view.compDragable

