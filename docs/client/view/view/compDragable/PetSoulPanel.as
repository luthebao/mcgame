// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetSoulPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.PetSoulIcon;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.Canvas;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import mx.controls.Image;
    import mx.controls.LinkButton;
    import mx.controls.Menu;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.controls.List;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.Event;
    import mx.controls.Alert;
    import mx.events.MenuEvent;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.CustomMenuItemRenderer;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import com.qeedoo.game.logic.PetLogic;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.getDefinitionByName;
    import mx.events.ListEvent;
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

    public class PetSoulPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const PAGE_MAX_PET_NUM:int = 14;
        private var _389876312label_color:Label;
        private var _3708v2:Button;
        private var _470876863petSoul1:PetSoulIcon;
        private var _470876865petSoul3:PetSoulIcon;
        private var _470876867petSoul5:PetSoulIcon;
        private var _470876869petSoul7:PetSoulIcon;
        private var _1599591216resolveBtn:BasicGlowButton;
        private var selPetDataTemp:Object;
        private var _109757473star3:PetSoulIcon;
        private var _470876870petSoul8:PetSoulIcon;
        private var _1712280916petSoul13:PetSoulIcon;
        public var _PetSoulPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _3707v1:Button;
        private var _177868763styleAddName:String;
        private var _892485645star12:PetSoulIcon;
        public var _PetSoulPanel_Label1:Label;
        private var _1712280918petSoul15:PetSoulIcon;
        private var _1740021057soulInfo:Label;
        private var _553273472bagCanvas:Canvas;
        private var _109757477star7:PetSoulIcon;
        private var view:ViewManager;
        public var firstTimeFlag:Boolean = true;
        private var _892485642star15:PetSoulIcon;
        private var _109757474star4:PetSoulIcon;
        public var selectedPetId:int;
        private var _109757471star1:PetSoulIcon;
        private var _1712280913petSoul10:PetSoulIcon;
        private var _307382965showCanvas:CharactorShowCanvas;
        private var _892485647star10:PetSoulIcon;
        public var _PetSoulPanel_Image1:Image;
        private var _470876864petSoul2:PetSoulIcon;
        private var _470876866petSoul4:PetSoulIcon;
        public var _PetSoulPanel_BasicGlowButton3:BasicGlowButton;
        private var _470876868petSoul6:PetSoulIcon;
        private var _1712280915petSoul12:PetSoulIcon;
        private var _1739836639soulChip:LinkButton;
        private var _109757478star8:PetSoulIcon;
        private var _470876871petSoul9:PetSoulIcon;
        private var _892485644star13:PetSoulIcon;
        private var _109757475star5:PetSoulIcon;
        private var _1712280917petSoul14:PetSoulIcon;
        private var menu:Menu;
        private var _892485641star16:PetSoulIcon;
        private var _109757472star2:PetSoulIcon;
        private var petAC:ArrayCollection;
        private var _2022083798soulExp:Label;
        private var _1712280919petSoul16:PetSoulIcon;
        private var _607339634pageSelector:PageSelector;
        private var _892485646star11:PetSoulIcon;
        public var selPetData:Object;
        private var _1010174295optBtn:BasicGlowButton;
        private var _109757479star9:PetSoulIcon;
        public var _index:int;
        private var _579057063petDataList:List;
        private var _892485643star14:PetSoulIcon;
        private var _109757476star6:PetSoulIcon;
        private var soulBagAC:ArrayCollection;
        private var _1712280914petSoul11:PetSoulIcon;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":770,
                    "height":410,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetSoulPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":450,
                                "y":31,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetSoulPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.fontSize = 14;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":38,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":33,
                                            "width":128,
                                            "height":296,
                                            "styleName":"CSSBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"petDataList",
                                                "events":{
                                                    "itemClick":"__petDataList_itemClick",
                                                    "mouseDown":"__petDataList_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.right = "0";
                                                    this.borderStyle = "none";
                                                    this.left = "0";
                                                    this.verticalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "width":120,
                                                        "height":286,
                                                        "itemRenderer":_PetSoulPanel_ClassFactory1_c()
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
                                        this.left = "13";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":337,
                                            "width":126,
                                            "height":28
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"bagCanvas",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "140";
                                        this.right = "10";
                                        this.top = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "height":350,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_PetSoulPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":56
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":20,
                                                        "x":10,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":112,
                                                                    "y":2,
                                                                    "_index":101
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":204,
                                                                    "y":40,
                                                                    "_index":102
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":236,
                                                                    "y":123,
                                                                    "_index":103
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":204,
                                                                    "y":204,
                                                                    "_index":104
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":112,
                                                                    "y":242,
                                                                    "_index":105
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":32,
                                                                    "y":204,
                                                                    "_index":106
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":123,
                                                                    "_index":107
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":32,
                                                                    "y":40,
                                                                    "_index":108
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul9",
                                                            "events":{"click":"__petSoul9_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":112,
                                                                    "y":2,
                                                                    "_index":109
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul10",
                                                            "events":{"click":"__petSoul10_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":204,
                                                                    "y":40,
                                                                    "_index":110
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul11",
                                                            "events":{"click":"__petSoul11_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":236,
                                                                    "y":123,
                                                                    "_index":111
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul12",
                                                            "events":{"click":"__petSoul12_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":204,
                                                                    "y":204,
                                                                    "_index":112
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul13",
                                                            "events":{"click":"__petSoul13_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":112,
                                                                    "y":242,
                                                                    "_index":113
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul14",
                                                            "events":{"click":"__petSoul14_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":32,
                                                                    "y":204,
                                                                    "_index":114
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul15",
                                                            "events":{"click":"__petSoul15_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":123,
                                                                    "_index":115
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"petSoul16",
                                                            "events":{"click":"__petSoul16_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":32,
                                                                    "y":40,
                                                                    "_index":116
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"v1",
                                                            "events":{"click":"__v1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":215,
                                                                    "y":282,
                                                                    "label":"1",
                                                                    "styleName":"HorizontalTab"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"v2",
                                                            "events":{"click":"__v2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0101,
                                                                    "y":282,
                                                                    "label":"2",
                                                                    "styleName":"HorizontalTab"
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"showCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":160,
                                                        "y":217,
                                                        "height":13,
                                                        "width":10
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":23,
                                                        "width":290,
                                                        "height":286,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":5,
                                                                    "y":5,
                                                                    "_index":1
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":5,
                                                                    "_index":2
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":145,
                                                                    "y":5,
                                                                    "_index":3
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":215,
                                                                    "y":5,
                                                                    "_index":4
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":5,
                                                                    "y":75,
                                                                    "_index":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":75,
                                                                    "_index":6
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":145,
                                                                    "y":75,
                                                                    "_index":7
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":215,
                                                                    "y":75,
                                                                    "_index":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":5,
                                                                    "y":145,
                                                                    "_index":9
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":145,
                                                                    "_index":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":145,
                                                                    "y":145,
                                                                    "_index":11
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":215,
                                                                    "y":145,
                                                                    "_index":12
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":5,
                                                                    "y":215,
                                                                    "_index":13
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":75,
                                                                    "y":215,
                                                                    "_index":14
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":145,
                                                                    "y":215,
                                                                    "_index":15
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PetSoulIcon,
                                                            "id":"star16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":215,
                                                                    "y":215,
                                                                    "_index":16
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"soulInfo",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":30,
                                                        "y":9
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"soulExp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":200,
                                                        "y":8,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"soulChip",
                                                "events":{"click":"__soulChip_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16775802;
                                                    this.textDecoration = "underline";
                                                    this.fontSize = 12;
                                                    this.fontWeight = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":192,
                                                        "y":23,
                                                        "label":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"resolveBtn",
                                                "events":{"click":"__resolveBtn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "210";
                                                    this.bottom = "10";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":85,
                                                        "height":20,
                                                        "styleName":"BtnNormalRed"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"label_color",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "175";
                                                    this.bottom = "10";
                                                    this.color = 0xFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"Lục"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "120";
                                                    this.bottom = "10";
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"trở xuống"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"optBtn",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "160";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":16,
                                                        "height":18,
                                                        "styleName":"soulOperationBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_PetSoulPanel_BasicGlowButton3",
                                                "events":{"click":"___PetSoulPanel_BasicGlowButton3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "25";
                                                    this.bottom = "10";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":85,
                                                        "height":20,
                                                        "styleName":"BtnNormalRed"
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
        private var bgImage:Class = PetSoulPanel_bgImage;
        private var _core:Core = Core.getInstance();
        private var _1613040912petPageAc:ArrayCollection = new ArrayCollection();
        public var menuData:Array = [{"label":Language.PET_SOUL_S[1]}, {"label":Language.PET_SOUL_S[4]}];
        private var soulTipDict:Dictionary = new Dictionary();
        private var SOULNUM_PET_BAG_ADD:Object = {
            "1":20000,
            "2":25000,
            "3":30000,
            "4":35000,
            "5":40000,
            "6":45000,
            "7":50000,
            "8":55000
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetSoulPanel()
        {
            mx_internal::_document = this;
            this.width = 770;
            this.height = 410;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___PetSoulPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetSoulPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get star12():PetSoulIcon
        {
            return (this._892485645star12);
        }

        public function set star15(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._892485642star15;
            if (_local_2 !== _arg_1)
            {
                this._892485642star15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star15", _local_2, _arg_1));
            };
        }

        public function __soulChip_click(_arg_1:MouseEvent):void
        {
            goToExchangePanel();
        }

        public function set star16(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._892485641star16;
            if (_local_2 !== _arg_1)
            {
                this._892485641star16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star16", _local_2, _arg_1));
            };
        }

        private function onOpenSoulBag(_arg_1:Object):void
        {
            var _local_2:*;
            if (_arg_1)
            {
                _core.player.soulExp = _arg_1.soulExp;
                changeSoulPanelInfo(_core.player.soulExp, _core.player.soulChip);
                if (_core.player.petList)
                {
                    for each (_local_2 in _core.player.petList)
                    {
                        if (((_local_2) && (_local_2.id == _arg_1.pid)))
                        {
                            _local_2.soulInfo["openNum2"] = _arg_1.openNum2;
                            if (((!(selPetData == null)) && (_local_2.id == selPetData.id)))
                            {
                                updatePetSoulBagView();
                            };
                            break;
                        };
                    };
                };
            };
        }

        public function showBtn():void
        {
            if (!resolveBtn.enabled)
            {
                resolveBtn.enabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get star2():PetSoulIcon
        {
            return (this._109757472star2);
        }

        private function petDataListClick():void
        {
            if (petAC.length == 0)
            {
                return;
            };
            if (petDataList.selectedItem == null)
            {
                return;
            };
            selPetData = petDataList.selectedItem.petData;
            showSelPet();
            updatePetSoulBagView();
        }

        [Bindable(event="propertyChange")]
        public function get star6():PetSoulIcon
        {
            return (this._109757476star6);
        }

        [Bindable(event="propertyChange")]
        public function get star4():PetSoulIcon
        {
            return (this._109757474star4);
        }

        [Bindable(event="propertyChange")]
        public function get star8():PetSoulIcon
        {
            return (this._109757478star8);
        }

        private function set petPageAc(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1613040912petPageAc;
            if (_local_2 !== _arg_1)
            {
                this._1613040912petPageAc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPageAc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star3():PetSoulIcon
        {
            return (this._109757473star3);
        }

        [Bindable(event="propertyChange")]
        public function get star5():PetSoulIcon
        {
            return (this._109757475star5);
        }

        [Bindable(event="propertyChange")]
        public function get star9():PetSoulIcon
        {
            return (this._109757479star9);
        }

        [Bindable(event="propertyChange")]
        public function get star1():PetSoulIcon
        {
            return (this._109757471star1);
        }

        [Bindable(event="propertyChange")]
        public function get star7():PetSoulIcon
        {
            return (this._109757477star7);
        }

        public function __petSoul14_click(_arg_1:MouseEvent):void
        {
            openPetSoulBag(6);
        }

        public function updateSoulSlotView(_arg_1:int):void
        {
            var _local_2:Object;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (((_core.player.soulBagData) && (!(typeof(_core.player.soulBagData) == "string"))))
            {
                _local_2 = new Object();
                if (((_core.player.soulBagData["data"]) && (_core.player.soulBagData["data"][_arg_1])))
                {
                    _local_2 = _core.player.soulBagData["data"][_arg_1];
                    _local_2.soulId = _local_2.sid;
                }
                else
                {
                    _local_2.soulId = -1;
                };
                if (_arg_1 <= _core.player.soulBagData["open"])
                {
                    _local_2.state = 1;
                }
                else
                {
                    _local_2.state = 0;
                };
                _local_2._index = _arg_1;
                _local_2.isPet = false;
                this[("star" + _arg_1)].setSoulData(_local_2);
            };
        }

        public function set star2(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757472star2;
            if (_local_2 !== _arg_1)
            {
                this._109757472star2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star2", _local_2, _arg_1));
            };
        }

        public function set star3(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757473star3;
            if (_local_2 !== _arg_1)
            {
                this._109757473star3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star3", _local_2, _arg_1));
            };
        }

        public function set star4(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757474star4;
            if (_local_2 !== _arg_1)
            {
                this._109757474star4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star4", _local_2, _arg_1));
            };
        }

        private function _PetSoulPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PetSoulPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulPanel_Label1.text = _arg_1;
            }, "_PetSoulPanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (petPageAc);
            }, function (_arg_1:Object):void
            {
                petDataList.dataProvider = _arg_1;
            }, "petDataList.dataProvider");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                petDataList.setStyle("borderSkin", _arg_1);
            }, "petDataList.borderSkin");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bgImage);
            }, function (_arg_1:Object):void
            {
                _PetSoulPanel_Image1.source = _arg_1;
            }, "_PetSoulPanel_Image1.source");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 0)) ? Language.PET_SOUL_S[55] : "");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petSoul9.toolTip = _arg_1;
            }, "petSoul9.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 1)) ? Language.PET_SOUL_S[55] : "");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petSoul10.toolTip = _arg_1;
            }, "petSoul10.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 2)) ? Language.PET_SOUL_S[55] : "");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petSoul11.toolTip = _arg_1;
            }, "petSoul11.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 3)) ? Language.PET_SOUL_S[55] : "");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petSoul12.toolTip = _arg_1;
            }, "petSoul12.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 4)) ? Language.PET_SOUL_S[55] : "");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petSoul13.toolTip = _arg_1;
            }, "petSoul13.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 5)) ? Language.PET_SOUL_S[55] : "");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petSoul14.toolTip = _arg_1;
            }, "petSoul14.toolTip");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 6)) ? Language.PET_SOUL_S[55] : "");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petSoul15.toolTip = _arg_1;
            }, "petSoul15.toolTip");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 7)) ? Language.PET_SOUL_S[55] : "");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petSoul16.toolTip = _arg_1;
            }, "petSoul16.toolTip");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulInfo.text = _arg_1;
            }, "soulInfo.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulChip.toolTip = _arg_1;
            }, "soulChip.toolTip");
            result[14] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                soulChip.setStyle("overSkin", _arg_1);
            }, "soulChip.overSkin");
            result[15] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                soulChip.setStyle("upSkin", _arg_1);
            }, "soulChip.upSkin");
            result[16] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                soulChip.setStyle("downSkin", _arg_1);
            }, "soulChip.downSkin");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                resolveBtn.toolTip = _arg_1;
            }, "resolveBtn.toolTip");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                resolveBtn.label = _arg_1;
            }, "resolveBtn.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulPanel_BasicGlowButton3.label = _arg_1;
            }, "_PetSoulPanel_BasicGlowButton3.label");
            result[20] = binding;
            return (result);
        }

        public function set star8(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757478star8;
            if (_local_2 !== _arg_1)
            {
                this._109757478star8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star8", _local_2, _arg_1));
            };
        }

        public function set star1(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757471star1;
            if (_local_2 !== _arg_1)
            {
                this._109757471star1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star1", _local_2, _arg_1));
            };
        }

        public function set star9(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757479star9;
            if (_local_2 !== _arg_1)
            {
                this._109757479star9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star9", _local_2, _arg_1));
            };
        }

        public function changeSoulPanelInfo(_arg_1:int, _arg_2:int):void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            soulExp.text = (Language.PET_SOUL_S[11] + _arg_1);
            soulChip.label = (Language.PET_SOUL_S[12] + _arg_2);
            this.changeSlotBtnView();
            if (!resolveBtn.enabled)
            {
                resolveBtn.enabled = true;
            };
        }

        public function set star7(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757477star7;
            if (_local_2 !== _arg_1)
            {
                this._109757477star7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star7", _local_2, _arg_1));
            };
        }

        public function set soulExp(_arg_1:Label):void
        {
            var _local_2:Object = this._2022083798soulExp;
            if (_local_2 !== _arg_1)
            {
                this._2022083798soulExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulExp", _local_2, _arg_1));
            };
        }

        public function set star5(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757475star5;
            if (_local_2 !== _arg_1)
            {
                this._109757475star5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star5", _local_2, _arg_1));
            };
        }

        public function set star6(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._109757476star6;
            if (_local_2 !== _arg_1)
            {
                this._109757476star6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get label_color():Label
        {
            return (this._389876312label_color);
        }

        public function onPetLevelUp(_arg_1:int, _arg_2:int):void
        {
            var _local_3:*;
            if (_core.player.petList)
            {
                for each (_local_3 in _core.player.petList)
                {
                    if (((_local_3) && (_local_3.id == _arg_2)))
                    {
                        _local_3.soulInfo["openNum"] = _arg_1;
                        if (((!(selPetData == null)) && (_local_3.id == selPetData.id)))
                        {
                            updatePetSoulBagView();
                        };
                        break;
                    };
                };
            };
        }

        public function __petDataList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function changeView(_arg_1:Number):void
        {
            var _local_2:Number = 1;
            while (_local_2 <= 2)
            {
                this[("v" + _local_2)].selected = false;
                _local_2++;
            };
            this[("v" + _arg_1)].selected = true;
            updatePetSoulBagView();
        }

        public function rollOutHandler(_arg_1:Event):void
        {
            if (((soulTipDict[selPetData.id]) && (soulTipDict[selPetData.id].tip)))
            {
                soulTipDict[selPetData.id].tip.hide();
            };
        }

        private function clearPage():void
        {
            petPageAc.removeAll();
        }

        public function ___PetSoulPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            goToMakeSoulPanel();
        }

        public function updateSoulSlot(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Object;
            if (_arg_1.sid > 100)
            {
                _local_2 = this[("petSoul" + (_arg_1.sid - 100))].petSoul.acceptObj;
                _local_4 = (_arg_1.sid - 100);
            }
            else
            {
                _local_2 = this[("star" + _arg_1.sid)].petSoul.acceptObj;
                _local_4 = _arg_1.sid;
            };
            if (_arg_1.newSid > 100)
            {
                _local_3 = this[("petSoul" + (_arg_1.newSid - 100))].petSoul.acceptObj;
                _local_5 = (_arg_1.newSid - 100);
            }
            else
            {
                _local_3 = this[("star" + _arg_1.newSid)].petSoul.acceptObj;
                _local_5 = _arg_1.newSid;
            };
            switch (_arg_1.type)
            {
                case 1:
                    if (((_core.player.soulBagData["data"]) && (_core.player.soulBagData["data"][_local_4])))
                    {
                        _local_6 = _core.player.soulBagData["data"][_local_4];
                        _core.player.soulBagData["data"][_local_4] = _core.player.soulBagData["data"][_local_5];
                        _core.player.soulBagData["data"][_local_5] = _local_6;
                    };
                    updateSoulSlotView(_local_4);
                    updateSoulSlotView(_local_5);
                    return;
                case 2:
                    if (((selPetData.soulInfo["data"]) && (selPetData.soulInfo["data"][_local_4])))
                    {
                        _local_6 = selPetData.soulInfo["data"][_local_4];
                        selPetData.soulInfo["data"][_local_4] = selPetData.soulInfo["data"][_local_5];
                        selPetData.soulInfo["data"][_local_5] = _local_6;
                        _core.player.petList[selPetData.id] = selPetData;
                    };
                    updatePetSoulSlotView(_local_4);
                    updatePetSoulSlotView(_local_5);
                    return;
                case 3:
                    if (((selPetData.soulInfo["data"]) && (selPetData.soulInfo["data"][_local_4])))
                    {
                        _local_6 = selPetData.soulInfo["data"][_local_4];
                        selPetData.soulInfo["data"][_local_4] = _core.player.soulBagData["data"][_local_5];
                        _core.player.soulBagData["data"][_local_5] = _local_6;
                        _core.player.petList[selPetData.id] = selPetData;
                    };
                    if (soulTipDict[selPetData.id])
                    {
                        soulTipDict[selPetData.id].isChanged = true;
                    };
                    updatePetSoulSlotView(_local_4);
                    updateSoulSlotView(_local_5);
                    return;
                case 4:
                    if ((((selPetData.soulInfo["data"]) && (_core.player.soulBagData["data"])) && (_core.player.soulBagData["data"][_local_4])))
                    {
                        _local_6 = _core.player.soulBagData["data"][_local_4];
                        _core.player.soulBagData["data"][_local_4] = selPetData.soulInfo["data"][_local_5];
                        selPetData.soulInfo["data"][_local_5] = _local_6;
                        _core.player.petList[selPetData.id] = selPetData;
                    };
                    if (soulTipDict[selPetData.id])
                    {
                        soulTipDict[selPetData.id].isChanged = true;
                    };
                    updateSoulSlotView(_local_4);
                    updatePetSoulSlotView(_local_5);
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get v2():Button
        {
            return (this._3708v2);
        }

        public function set soulInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1740021057soulInfo;
            if (_local_2 !== _arg_1)
            {
                this._1740021057soulInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulInfo", _local_2, _arg_1));
            };
        }

        public function __petSoul11_click(_arg_1:MouseEvent):void
        {
            openPetSoulBag(3);
        }

        public function ___PetSoulPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get v1():Button
        {
            return (this._3707v1);
        }

        public function set petSoul10(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._1712280913petSoul10;
            if (_local_2 !== _arg_1)
            {
                this._1712280913petSoul10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul10", _local_2, _arg_1));
            };
        }

        public function __v1_click(_arg_1:MouseEvent):void
        {
            changeView(1);
        }

        private function menuHandler1(_arg_1:MenuEvent):void
        {
            if (_arg_1.item.label == "Trắng")
            {
                label_color.text = _arg_1.item.label;
                label_color.setStyle("color", 0xFFFFFF);
            }
            else
            {
                if (_arg_1.item.label == "Lục")
                {
                    label_color.text = _arg_1.item.label;
                    label_color.setStyle("color", 0xFF00);
                }
                else
                {
                    if (_arg_1.item.label == "Lam")
                    {
                        if (((_core.player.pmLevel) && (_core.player.pmLevel >= 5)))
                        {
                            label_color.text = _arg_1.item.label;
                            label_color.setStyle("color", 6591981);
                        }
                        else
                        {
                            Alert.show(Language.PET_SOUL_S[56], "", Alert.YES, null, null);
                            return;
                        };
                    };
                };
            };
        }

        public function set petSoul13(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._1712280916petSoul13;
            if (_local_2 !== _arg_1)
            {
                this._1712280916petSoul13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul13", _local_2, _arg_1));
            };
        }

        public function set petSoul14(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._1712280917petSoul14;
            if (_local_2 !== _arg_1)
            {
                this._1712280917petSoul14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul14", _local_2, _arg_1));
            };
        }

        public function set petSoul15(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._1712280918petSoul15;
            if (_local_2 !== _arg_1)
            {
                this._1712280918petSoul15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul15", _local_2, _arg_1));
            };
        }

        public function set petSoul12(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._1712280915petSoul12;
            if (_local_2 !== _arg_1)
            {
                this._1712280915petSoul12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul12", _local_2, _arg_1));
            };
        }

        public function set petSoul16(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._1712280919petSoul16;
            if (_local_2 !== _arg_1)
            {
                this._1712280919petSoul16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul16", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get optBtn():BasicGlowButton
        {
            return (this._1010174295optBtn);
        }

        public function set petSoul11(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._1712280914petSoul11;
            if (_local_2 !== _arg_1)
            {
                this._1712280914petSoul11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCanvas():CharactorShowCanvas
        {
            return (this._307382965showCanvas);
        }

        public function set label_color(_arg_1:Label):void
        {
            var _local_2:Object = this._389876312label_color;
            if (_local_2 !== _arg_1)
            {
                this._389876312label_color = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label_color", _local_2, _arg_1));
            };
        }

        public function goToMakeSoulPanel():void
        {
            _core.view.show(ViewManager.POPU_SOUL_PRODUCT);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul3():PetSoulIcon
        {
            return (this._470876865petSoul3);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul4():PetSoulIcon
        {
            return (this._470876866petSoul4);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul5():PetSoulIcon
        {
            return (this._470876867petSoul5);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul6():PetSoulIcon
        {
            return (this._470876868petSoul6);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul1():PetSoulIcon
        {
            return (this._470876863petSoul1);
        }

        public function __petSoul16_click(_arg_1:MouseEvent):void
        {
            openPetSoulBag(8);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul7():PetSoulIcon
        {
            return (this._470876869petSoul7);
        }

        private function initPageSelector():void
        {
            var _local_1:int;
            pageSelector.lastBtnLabel = Language.PAGE_SELECTOR[2];
            pageSelector.nextBtnLabel = Language.PAGE_SELECTOR[3];
            pageSelector.btnLastPage.width = 32;
            pageSelector.btnNextPage.width = 32;
            if (petAC.length >= PAGE_MAX_PET_NUM)
            {
                _local_1 = PAGE_MAX_PET_NUM;
            }
            else
            {
                _local_1 = petAC.length;
            };
            var _local_2:int;
            while (_local_2 < _local_1)
            {
                petPageAc.addItem(petAC.getItemAt(_local_2));
                _local_2++;
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(petAC.length, PAGE_MAX_PET_NUM);
        }

        [Bindable(event="propertyChange")]
        public function get resolveBtn():BasicGlowButton
        {
            return (this._1599591216resolveBtn);
        }

        public function updateSoulBagView():void
        {
            var _local_1:int;
            var _local_2:Object;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (((_core.player.soulBagData) && (!(typeof(_core.player.soulBagData) == "string"))))
            {
                _local_1 = 1;
                while (_local_1 <= 16)
                {
                    _local_2 = new Object();
                    if (((_core.player.soulBagData["data"]) && (_core.player.soulBagData["data"][_local_1])))
                    {
                        _local_2 = _core.player.soulBagData["data"][_local_1];
                        _local_2.soulId = _core.player.soulBagData["data"][_local_1]["sid"];
                    }
                    else
                    {
                        _local_2.soulId = -1;
                    };
                    if (_local_1 <= _core.player.soulBagData["open"])
                    {
                        _local_2.state = 1;
                    }
                    else
                    {
                        _local_2.state = 0;
                    };
                    _local_2._index = _local_1;
                    _local_2.isPet = false;
                    this[("star" + _local_1)].setSoulData(_local_2);
                    _local_1++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petSoul8():PetSoulIcon
        {
            return (this._470876870petSoul8);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul2():PetSoulIcon
        {
            return (this._470876864petSoul2);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul9():PetSoulIcon
        {
            return (this._470876871petSoul9);
        }

        private function openPetSoulBag(num:Number):void
        {
            if (ToolKit.isSmallThan(selPetData.soulInfo["openNum"], 5))
            {
                return;
            };
            if (ToolKit.isSmallOrEqual(num, selPetData.soulInfo["openNum2"]))
            {
                return;
            };
            var openNum:* = ToolKit.add(selPetData.soulInfo["openNum2"], 1);
            if (!SOULNUM_PET_BAG_ADD[openNum])
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("openPetSoulBag", new Responder(onOpenSoulBag), selPetData.id);
                };
            };
            Alert.show(Language.PET_SOUL_S[54].replace("{num}", SOULNUM_PET_BAG_ADD[openNum]), "", (Alert.YES | Alert.NO), null, func);
        }

        public function goToExchangePanel():void
        {
            _core.view.show(ViewManager.PANEL_SOUL_EXCHANGE);
        }

        [Bindable(event="propertyChange")]
        public function get soulChip():LinkButton
        {
            return (this._1739836639soulChip);
        }

        public function showOperation(_arg_1:MouseEvent):void
        {
            var _local_2:Array = [{
                "label":"Trắng",
                "textColor":"0xFFFFFF"
            }, {
                "label":"Lục",
                "textColor":"0x00FF00"
            }, {
                "label":"Lam",
                "textColor":"0x6495ED"
            }];
            menu = Menu.createMenu(this, _local_2, false);
            menu.width = 60;
            menu.rowHeight = 20;
            menu.addEventListener(MenuEvent.ITEM_CLICK, menuHandler1);
            menu.itemRenderer = new ClassFactory(CustomMenuItemRenderer);
            menu.show(_arg_1.stageX, _arg_1.stageY);
        }

        private function menuHandler(evt:MenuEvent):void
        {
            var temp:Object;
            var view:Object;
            var gfunc:Function;
            var func:Function;
            var exp:int;
            var obj:Object;
            switch (evt.item.label)
            {
                case Language.PET_SOUL_S[1]:
                case Language.PET_SOUL_S[5]:
                    lockSoul();
                    return;
                case Language.PET_SOUL_S[4]:
                    if (!_core.delPass)
                    {
                        gfunc = function (_arg_1:String):void
                        {
                            _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                        };
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                        return;
                    };
                    temp = GameData.d[GamePredef.TBL_PET_SOUL][this[("star" + _index)].petSoul.acceptObj.soulId];
                    if (Number(temp.color) > 1)
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("transformExp", null, _index, false);
                            };
                        };
                        Alert.show(Language.PET_SOUL_S[40].replace("{name}", temp.name), "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        _core.remote.call("transformExp", null, _index, false);
                    };
                    return;
                case Language.PET_SOUL_S[3]:
                    view = _core.view.getUI(ViewManager.PANEL_SOUL_EXP);
                    if (view)
                    {
                        if (((this[("star" + _index)].petSoul.acceptObj) && (!(this[("star" + _index)].petSoul.acceptObj.lock))))
                        {
                            temp = GameData.d[GamePredef.TBL_PET_SOUL][this[("star" + _index)].petSoul.acceptObj.soulId];
                            if (!temp)
                            {
                                return;
                            };
                            exp = (temp.upExp - this[("star" + _index)].petSoul.acceptObj.exp);
                            if (exp > _core.player.soulExp)
                            {
                                exp = _core.player.soulExp;
                            };
                            if (exp)
                            {
                                obj = new Object();
                                obj.needExp = exp;
                                obj.exp = (int(this[("star" + _index)].petSoul.acceptObj.exp) + int(temp.exp));
                                obj.upExp = (int(temp.upExp) + int(temp.exp));
                                obj.color = GamePredef.CODE_SOUL_COLOR[temp.color];
                                obj.name = ((temp.name + " Lv.") + temp.level);
                                view.expData = obj;
                                view.visible = true;
                            }
                            else
                            {
                                Alert.show(Language.PET_SOUL_S[37], "", Alert.YES, null, null);
                            };
                        };
                    };
                    return;
            };
        }

        public function set v2(_arg_1:Button):void
        {
            var _local_2:Object = this._3708v2;
            if (_local_2 !== _arg_1)
            {
                this._3708v2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "v2", _local_2, _arg_1));
            };
        }

        public function __petSoul13_click(_arg_1:MouseEvent):void
        {
            openPetSoulBag(5);
        }

        public function set bagCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._553273472bagCanvas;
            if (_local_2 !== _arg_1)
            {
                this._553273472bagCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagCanvas", _local_2, _arg_1));
            };
        }

        public function set v1(_arg_1:Button):void
        {
            var _local_2:Object = this._3707v1;
            if (_local_2 !== _arg_1)
            {
                this._3707v1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "v1", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                updatePetList();
            };
        }

        public function updateView(_arg_1:Number=-1):void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (this.visible)
            {
                updatePetList();
            };
            updateSoulBagView();
            soulExp.text = (Language.PET_SOUL_S[11] + _core.player.soulExp);
            soulChip.label = (Language.PET_SOUL_S[12] + _core.player.soulChip);
        }

        [Bindable(event="propertyChange")]
        private function get petPageAc():ArrayCollection
        {
            return (this._1613040912petPageAc);
        }

        public function rollOverHandler(_arg_1:Event):void
        {
            var _local_2:ArrayCollection;
            var _local_3:*;
            var _local_4:Sort;
            var _local_5:Array;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            if (((((soulTipDict[selPetData.id]) && (soulTipDict[selPetData.id].tip)) && (soulTipDict[selPetData.id].isChanged)) || (!(soulTipDict[selPetData.id]))))
            {
                _local_2 = new ArrayCollection();
                for (_local_3 in selPetData.soulInfo["data"])
                {
                    if (selPetData.soulInfo["data"][_local_3])
                    {
                        _local_7 = new Object();
                        _local_8 = GameData.d[GamePredef.TBL_PET_SOUL][selPetData.soulInfo["data"][_local_3]["sid"]];
                        _local_7.temp = _local_8;
                        _local_7.sort1 = _local_8.color;
                        _local_7.sort2 = _local_8.type;
                        _local_2.addItem(_local_7);
                    };
                };
                if (_local_2.length == 0)
                {
                    return;
                };
                _local_4 = new Sort();
                _local_4.fields = [new SortField("sort1", true, true, true), new SortField("sort2", true, false, true)];
                _local_2.sort = _local_4;
                _local_2.refresh();
                _local_5 = new Array();
                for (_local_3 in _local_2)
                {
                    if (_local_2[_local_3])
                    {
                        _local_7 = new Object();
                        _local_7.name = ((_local_2[_local_3].temp.name + " Lv.") + _local_2[_local_3].temp.level);
                        _local_7.color = GamePredef.CODE_SOUL_COLOR[_local_2[_local_3].temp.color];
                        _local_7.desc = _local_2[_local_3].temp.desc;
                        _local_5.push(_local_7);
                    };
                };
                _local_6 = getToolTip();
                _local_6.object = _local_5;
                if (!soulTipDict[selPetData.id])
                {
                    _local_7 = new Object();
                    _local_7.tip = _local_6;
                    _local_7.isChanged = false;
                    soulTipDict[selPetData.id] = _local_7;
                }
                else
                {
                    soulTipDict[selPetData.id].tip = _local_6;
                    soulTipDict[selPetData.id].isChanged = false;
                };
            };
            soulTipDict[selPetData.id].tip.show();
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
        public function get soulExp():Label
        {
            return (this._2022083798soulExp);
        }

        private function _PetSoulPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = PetSoulPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function __resolveBtn_click(_arg_1:MouseEvent):void
        {
            resolveAllSoul();
        }

        public function __petSoul10_click(_arg_1:MouseEvent):void
        {
            openPetSoulBag(2);
        }

        [Bindable(event="propertyChange")]
        public function get soulInfo():Label
        {
            return (this._1740021057soulInfo);
        }

        public function set petDataList(_arg_1:List):void
        {
            var _local_2:Object = this._579057063petDataList;
            if (_local_2 !== _arg_1)
            {
                this._579057063petDataList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petDataList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petSoul10():PetSoulIcon
        {
            return (this._1712280913petSoul10);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul12():PetSoulIcon
        {
            return (this._1712280915petSoul12);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul14():PetSoulIcon
        {
            return (this._1712280917petSoul14);
        }

        [Bindable(event="propertyChange")]
        public function get petSoul16():PetSoulIcon
        {
            return (this._1712280919petSoul16);
        }

        public function updatePetList():void
        {
            var _local_3:*;
            var _local_4:int;
            var _local_5:String;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:*;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            petAC = new ArrayCollection();
            var _local_1:int;
            if (_core.player.petList)
            {
                for each (_local_3 in _core.player.petList)
                {
                    if (((_local_3) && (_local_3.creatureData)))
                    {
                        _local_1++;
                        _local_4 = PetLogic.expToLv(_local_3.exp);
                        _local_5 = "";
                        _local_6 = ToolKit.getSpliceIndex(_local_3.petName, 40);
                        if (_local_6 >= 0)
                        {
                            _local_5 = (_local_3.petName.substr(0, _local_6) + "…");
                        }
                        else
                        {
                            _local_5 = _local_3.petName;
                        };
                        _local_5 = (_local_5 + (" Lv." + _local_4));
                        _local_7 = {
                            "id":_local_3.id,
                            "text":_local_5,
                            "sort1":_local_3.state,
                            "sort2":_local_3.growRate,
                            "sort3":_local_4,
                            "color":GamePredef.CODE_SOUL_COLOR[_core.basic.colorByGrowRate(_local_3.growRate)],
                            "petData":_local_3
                        };
                        if (_local_3.state == 1)
                        {
                            _local_7.icon = ResManager.ICON_PET_BATTLE;
                        }
                        else
                        {
                            if (_local_3.state == 2)
                            {
                                _local_7.icon = ResManager.ICON_PET_FOLLOW;
                            }
                            else
                            {
                                _local_7.icon = ResManager.ICON_PET_STANDBY;
                            };
                        };
                        petAC.addItem(_local_7);
                    };
                };
            };
            var _local_2:Sort = new Sort();
            _local_2.fields = [new SortField("sort1", true, false, true), new SortField("sort2", true, true, true), new SortField("sort3", true, true, true)];
            petAC.sort = _local_2;
            petAC.refresh();
            initPageSelector();
            if (((petAC.length > 0) && (selectedPetId)))
            {
                for (_local_8 in petAC)
                {
                    if (selectedPetId == petAC[_local_8].id)
                    {
                        if (_local_8 >= PAGE_MAX_PET_NUM)
                        {
                            pageSelector.pageNo = (_local_8 / PAGE_MAX_PET_NUM);
                            petDataList.selectedIndex = (_local_8 - (PAGE_MAX_PET_NUM * pageSelector.pageNo));
                        }
                        else
                        {
                            pageSelector.pageNo = 0;
                            petDataList.selectedIndex = _local_8;
                        };
                        selectedPetId = 0;
                    };
                };
            };
            petDataListClick();
        }

        public function set optBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1010174295optBtn;
            if (_local_2 !== _arg_1)
            {
                this._1010174295optBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "optBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petSoul13():PetSoulIcon
        {
            return (this._1712280916petSoul13);
        }

        public function reset():void
        {
            firstTimeFlag = true;
        }

        [Bindable(event="propertyChange")]
        public function get petSoul11():PetSoulIcon
        {
            return (this._1712280914petSoul11);
        }

        public function putInToExp(_arg_1:Number):void
        {
            _core.remote.call("putInToExp", null, _index, _arg_1);
        }

        public function set showCanvas(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._307382965showCanvas;
            if (_local_2 !== _arg_1)
            {
                this._307382965showCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCanvas", _local_2, _arg_1));
            };
        }

        public function changeSlotBtnView():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 16)
            {
                if (this[("star" + _local_1)])
                {
                    this[("star" + _local_1)].changeBtnState();
                };
                if (_local_1 <= 8)
                {
                    if (this[("petSoul" + _local_1)])
                    {
                        this[("petSoul" + _local_1)].changeBtnState();
                    };
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get petSoul15():PetSoulIcon
        {
            return (this._1712280918petSoul15);
        }

        public function __petSoul15_click(_arg_1:MouseEvent):void
        {
            openPetSoulBag(7);
        }

        [Bindable(event="propertyChange")]
        public function get bagCanvas():Canvas
        {
            return (this._553273472bagCanvas);
        }

        public function set petSoul4(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876866petSoul4;
            if (_local_2 !== _arg_1)
            {
                this._470876866petSoul4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul4", _local_2, _arg_1));
            };
        }

        public function set petSoul5(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876867petSoul5;
            if (_local_2 !== _arg_1)
            {
                this._470876867petSoul5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul5", _local_2, _arg_1));
            };
        }

        public function set petSoul2(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876864petSoul2;
            if (_local_2 !== _arg_1)
            {
                this._470876864petSoul2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul2", _local_2, _arg_1));
            };
        }

        public function set petSoul6(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876868petSoul6;
            if (_local_2 !== _arg_1)
            {
                this._470876868petSoul6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul6", _local_2, _arg_1));
            };
        }

        public function set petSoul3(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876865petSoul3;
            if (_local_2 !== _arg_1)
            {
                this._470876865petSoul3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul3", _local_2, _arg_1));
            };
        }

        public function set petSoul7(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876869petSoul7;
            if (_local_2 !== _arg_1)
            {
                this._470876869petSoul7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul7", _local_2, _arg_1));
            };
        }

        public function set petSoul1(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876863petSoul1;
            if (_local_2 !== _arg_1)
            {
                this._470876863petSoul1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:PetSoulPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetSoulPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetSoulPanelWatcherSetupUtil");
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

        public function updatePetSoulSlotView(_arg_1:int):void
        {
            var _local_2:Object;
            if (selPetData.soulInfo["data"])
            {
                _local_2 = new Object();
                if (selPetData.soulInfo["data"][_arg_1])
                {
                    _local_2 = selPetData.soulInfo["data"][_arg_1];
                    _local_2.soulId = _local_2.sid;
                }
                else
                {
                    _local_2.soulId = -1;
                };
                if (_arg_1 <= Number(selPetData.soulInfo["openNum"]))
                {
                    _local_2.state = 1;
                }
                else
                {
                    if (((_arg_1 > 8) && (_arg_1 <= ToolKit.add(selPetData.soulInfo["openNum2"], 8))))
                    {
                        _local_2.state = 1;
                    }
                    else
                    {
                        _local_2.state = 0;
                    };
                };
                _local_2._index = (_arg_1 + 100);
                _local_2.isPet = true;
                _local_2.petId = selPetData.id;
                this[("petSoul" + _arg_1)].setSoulData(_local_2);
            };
        }

        public function set petSoul9(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876871petSoul9;
            if (_local_2 !== _arg_1)
            {
                this._470876871petSoul9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul9", _local_2, _arg_1));
            };
        }

        public function set petSoul8(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._470876870petSoul8;
            if (_local_2 !== _arg_1)
            {
                this._470876870petSoul8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petSoul8", _local_2, _arg_1));
            };
        }

        public function set resolveBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1599591216resolveBtn;
            if (_local_2 !== _arg_1)
            {
                this._1599591216resolveBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolveBtn", _local_2, _arg_1));
            };
        }

        private function _PetSoulPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_SOUL_PANEL[0];
            _local_1 = Language.PET_SOUL_S[23];
            _local_1 = petPageAc;
            _local_1 = null;
            _local_1 = bgImage;
            _local_1 = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 0)) ? Language.PET_SOUL_S[55] : "");
            _local_1 = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 1)) ? Language.PET_SOUL_S[55] : "");
            _local_1 = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 2)) ? Language.PET_SOUL_S[55] : "");
            _local_1 = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 3)) ? Language.PET_SOUL_S[55] : "");
            _local_1 = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 4)) ? Language.PET_SOUL_S[55] : "");
            _local_1 = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 5)) ? Language.PET_SOUL_S[55] : "");
            _local_1 = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 6)) ? Language.PET_SOUL_S[55] : "");
            _local_1 = ((ToolKit.isBigThan(selPetData.soulInfo["openNum2"], 7)) ? Language.PET_SOUL_S[55] : "");
            _local_1 = Language.PET_SOUL_S[26];
            _local_1 = Language.PET_SOUL_S[42];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.PET_SOUL_S[41];
            _local_1 = Language.PET_SOUL_PANEL[1];
            _local_1 = Language.PET_SOUL_PANEL[2];
        }

        protected function getToolTip():Object
        {
            return (_core.view.getUI(ViewManager.TOOLTIP_ALL_SOUL));
        }

        [Bindable(event="propertyChange")]
        public function get petDataList():List
        {
            return (this._579057063petDataList);
        }

        public function resolveAllSoul():void
        {
            var _local_1:int = 1;
            if (label_color.text == "Lam")
            {
                _local_1 = 3;
                if (((_core.player.pmLevel) && (_core.player.pmLevel >= 5)))
                {
                    _core.remote.call("transformExp", null, _local_1, true);
                }
                else
                {
                    Alert.show(Language.PET_SOUL_S[56], "", Alert.YES, null, null);
                };
            }
            else
            {
                if (label_color.text == "Lục")
                {
                    _local_1 = 2;
                };
                if (((_core.player.pmLevel) && (_core.player.pmLevel > 0)))
                {
                    _core.remote.call("transformExp", null, _local_1, true);
                }
                else
                {
                    Alert.show(Language.PET_SOUL_S[44], "", Alert.YES, null, null);
                };
            };
        }

        public function __petSoul12_click(_arg_1:MouseEvent):void
        {
            openPetSoulBag(4);
        }

        public function __petDataList_itemClick(_arg_1:ListEvent):void
        {
            petDataListClick();
        }

        private function showSelPet():void
        {
            var _local_1:String;
            if (selPetData)
            {
                selPetDataTemp = selPetData.creatureData;
                if (selPetDataTemp)
                {
                    _local_1 = ResManager.getResUrl(selPetDataTemp.resCode);
                    if (showCanvas.url != _local_1)
                    {
                        showCanvas.url = _local_1;
                    };
                    showCanvas.color = ((selPetData.colorCode) ? selPetData.colorCode : selPetDataTemp.colorCode);
                }
                else
                {
                    return;
                };
            };
        }

        private function lockSoul():void
        {
            _core.remote.call("lockSoul", null, _index);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                petPageAc.addItem(petAC.getItemAt(_local_3));
                _local_4++;
            };
        }

        private function set styleAddName(_arg_1:String):void
        {
            var _local_2:Object = this._177868763styleAddName;
            if (_local_2 !== _arg_1)
            {
                this._177868763styleAddName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "styleAddName", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            var _local_1:int;
            v1.selected = true;
            v2.selected = false;
            updateView();
            if (((((petAC) && (petAC.length > 0)) && (selPetData)) && (!(petDataList.selectedItem))))
            {
                _local_1 = 0;
                while (_local_1 <= petAC.length)
                {
                    if (_local_1 >= PAGE_MAX_PET_NUM)
                    {
                        pageSelector.pageNo = (_local_1 / PAGE_MAX_PET_NUM);
                        petDataList.selectedIndex = (_local_1 - (PAGE_MAX_PET_NUM * pageSelector.pageNo));
                    }
                    else
                    {
                        pageSelector.pageNo = 0;
                        petDataList.selectedIndex = _local_1;
                    };
                    if (petDataList.selectedItem.petData.id == selPetData.id)
                    {
                        petDataListClick();
                        break;
                    };
                    _local_1++;
                };
            };
            soulInfo.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
            soulInfo.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
            optBtn.addEventListener(MouseEvent.CLICK, showOperation);
        }

        [Bindable(event="propertyChange")]
        private function get styleAddName():String
        {
            return (this._177868763styleAddName);
        }

        public function set soulChip(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._1739836639soulChip;
            if (_local_2 !== _arg_1)
            {
                this._1739836639soulChip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulChip", _local_2, _arg_1));
            };
        }

        public function set star10(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._892485647star10;
            if (_local_2 !== _arg_1)
            {
                this._892485647star10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star10", _local_2, _arg_1));
            };
        }

        private function updatePetSoulBagView():void
        {
            var _local_2:Object;
            var _local_1:int = 1;
            while (_local_1 <= 16)
            {
                if (((v2.selected) && (_local_1 >= 9)))
                {
                    this[("petSoul" + _local_1)].visible = true;
                }
                else
                {
                    if (((!(v2.selected)) && (_local_1 < 9)))
                    {
                        this[("petSoul" + _local_1)].visible = true;
                    }
                    else
                    {
                        this[("petSoul" + _local_1)].visible = false;
                    };
                };
                _local_2 = new Object();
                if (((selPetData.soulInfo["data"]) && (selPetData.soulInfo["data"][_local_1])))
                {
                    _local_2 = selPetData.soulInfo["data"][_local_1];
                    _local_2.soulId = _local_2.sid;
                }
                else
                {
                    _local_2.soulId = -1;
                };
                if (_local_1 <= Number(selPetData.soulInfo["openNum"]))
                {
                    _local_2.state = 1;
                }
                else
                {
                    if (((_local_1 > 8) && (_local_1 <= ToolKit.add(selPetData.soulInfo["openNum2"], 8))))
                    {
                        _local_2.state = 1;
                    }
                    else
                    {
                        _local_2.state = 0;
                    };
                };
                _local_2._index = (_local_1 + 100);
                _local_2.isPet = true;
                _local_2.petId = selPetData.id;
                this[("petSoul" + _local_1)].setSoulData(_local_2);
                _local_1++;
            };
        }

        public function __v2_click(_arg_1:MouseEvent):void
        {
            changeView(2);
        }

        public function set star12(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._892485645star12;
            if (_local_2 !== _arg_1)
            {
                this._892485645star12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star12", _local_2, _arg_1));
            };
        }

        public function set star13(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._892485644star13;
            if (_local_2 !== _arg_1)
            {
                this._892485644star13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star13", _local_2, _arg_1));
            };
        }

        public function set star14(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._892485643star14;
            if (_local_2 !== _arg_1)
            {
                this._892485643star14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star14", _local_2, _arg_1));
            };
        }

        public function __petSoul9_click(_arg_1:MouseEvent):void
        {
            openPetSoulBag(1);
        }

        [Bindable(event="propertyChange")]
        public function get star10():PetSoulIcon
        {
            return (this._892485647star10);
        }

        [Bindable(event="propertyChange")]
        public function get star11():PetSoulIcon
        {
            return (this._892485646star11);
        }

        public function set star11(_arg_1:PetSoulIcon):void
        {
            var _local_2:Object = this._892485646star11;
            if (_local_2 !== _arg_1)
            {
                this._892485646star11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star14():PetSoulIcon
        {
            return (this._892485643star14);
        }

        [Bindable(event="propertyChange")]
        public function get star13():PetSoulIcon
        {
            return (this._892485644star13);
        }

        public function showMenu(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            if (_arg_1 < 100)
            {
                if (this[("star" + _arg_1)].petSoul.acceptObj)
                {
                    if (this[("star" + _arg_1)].petSoul.acceptObj.lock)
                    {
                        menuData[0]["label"] = Language.PET_SOUL_S[5];
                    }
                    else
                    {
                        menuData[0]["label"] = Language.PET_SOUL_S[1];
                    };
                };
            };
            _index = _arg_1;
            menu = Menu.createMenu(this, menuData, false);
            menu.width = 60;
            menu.rowHeight = 20;
            if ((_arg_1 % 4) == 0)
            {
                _arg_2 = ((_arg_2 - 60) - 15);
            };
            if (Math.floor((_arg_1 / 4)) >= 3)
            {
                _arg_3 = (_arg_3 - (menu.rowHeight * menu.rowCount));
            };
            menu.addEventListener(MenuEvent.ITEM_CLICK, menuHandler);
            menu.show(_arg_2, _arg_3);
        }

        [Bindable(event="propertyChange")]
        public function get star15():PetSoulIcon
        {
            return (this._892485642star15);
        }

        [Bindable(event="propertyChange")]
        public function get star16():PetSoulIcon
        {
            return (this._892485641star16);
        }


    }
}//package com.qeedoo.ui.view.compDragable

