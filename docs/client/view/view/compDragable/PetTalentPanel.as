// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetTalentPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.TalentSlot;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.CheckBox;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import mx.managers.PopUpManager;
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

    public class PetTalentPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3401l5:Image;
        private var _102472i10:TalentSlot;
        public var _PetTalentPanel_LinkButton1:LinkButton;
        public var _PetTalentPanel_LinkButton2:LinkButton;
        public var _PetTalentPanel_LinkButton3:LinkButton;
        private var _3398l2:Image;
        private var _3309i6:TalentSlot;
        private var _3317767left:BasicGlowButton;
        private var _114004u10:Button;
        private var _1184715790inText:IntroText;
        private var _3400l4:Image;
        private var _3312i9:TalentSlot;
        private var _alert:Alert;
        private var _3684u9:Button;
        private var _3397l1:Image;
        private var _102473i11:TalentSlot;
        private var _3308i5:TalentSlot;
        private var _3311i8:TalentSlot;
        private var _105355l10:Image;
        private var _114005u11:Button;
        private var _pi:Number = 1;
        private var _1447937396_totalPowerL:Number = 0;
        private var _108511772right:BasicGlowButton;
        private var _688048580pTalentTitle:BasicTitleCanvas;
        private var _91227583_rate:Number = 0;
        private var _3307i4:TalentSlot;
        private var _3683u8:Button;
        private var _1468352367_point:Number = 0;
        private var _3679u4:Button;
        private var _3310i7:TalentSlot;
        private var _3682u7:Button;
        private var _105356l11:Image;
        private var _3306i3:TalentSlot;
        private var _3678u3:Button;
        public var _firstLoadCid:Number = 0;
        private var _3405l9:Image;
        private var _3681u6:Button;
        private var _3305i2:TalentSlot;
        private var _helpAlert:Alert;
        private var _100319048imgbg:Image;
        private var _3677u2:Button;
        private var panelInfoAdded:Boolean = false;
        private var _3404l8:Image;
        private var _3680u5:Button;
        private var _3304i1:TalentSlot;
        private var _3676u1:Button;
        private var _3403l7:Image;
        private var _goldPoint:Number = 0.0666666666666667;
        private var _148398364useGood:CheckBox;
        private var _1945386050infoCan:Canvas;
        public var _PetTalentPanel_Label1:Label;
        private var _3399l3:Image;
        public var _PetTalentPanel_Label4:Label;
        public var _PetTalentPanel_Label5:Label;
        public var _PetTalentPanel_Label6:Label;
        public var _PetTalentPanel_Label2:Label;
        private var _3402l6:Image;
        public var _PetTalentPanel_Label3:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":600,
                    "height":390,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"pTalentTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":30,
                                "width":600,
                                "height":360,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"imgbg",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":4,
                                            "y":3,
                                            "width":596,
                                            "height":352
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_PetTalentPanel_LinkButton1",
                                    "events":{"click":"___PetTalentPanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16775802;
                                        this.textDecoration = "underline";
                                        this.fontSize = 12;
                                        this.fontWeight = "normal";
                                        this.textAlign = "left";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":20,
                                            "x":7,
                                            "y":80
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_PetTalentPanel_LinkButton2",
                                    "events":{"click":"___PetTalentPanel_LinkButton2_click"},
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
                                            "width":88,
                                            "height":20,
                                            "x":488,
                                            "y":326
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"right",
                                    "events":{"click":"__right_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":542,
                                            "y":160,
                                            "height":45,
                                            "width":53,
                                            "styleName":"talentRightBtn"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetTalentPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16775802;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":20,
                                            "y":10,
                                            "width":88,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetTalentPanel_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16775802;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":20,
                                            "y":32,
                                            "width":88,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetTalentPanel_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16775802;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":20,
                                            "y":327,
                                            "width":88,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetTalentPanel_Label4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":72,
                                            "y":327,
                                            "width":88,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetTalentPanel_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":104,
                                            "y":10,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_PetTalentPanel_LinkButton3",
                                    "events":{"click":"___PetTalentPanel_LinkButton3_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16775802;
                                        this.textDecoration = "underline";
                                        this.fontSize = 12;
                                        this.fontWeight = "normal";
                                        this.textAlign = "left";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":20,
                                            "x":7,
                                            "y":54
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":82,
                                            "y":136,
                                            "sid":10001,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u1",
                                    "events":{"click":"__u1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":117,
                                            "y":139,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":117,
                                            "y":153,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":73,
                                            "y":274,
                                            "sid":10002,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u2",
                                    "events":{"click":"__u2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":108,
                                            "y":277,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":108,
                                            "y":291,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":169,
                                            "y":65,
                                            "sid":10003,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u3",
                                    "events":{"click":"__u3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":204,
                                            "y":69,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":204,
                                            "y":83,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":167,
                                            "y":208,
                                            "sid":10004,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u4",
                                    "events":{"click":"__u4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":202,
                                            "y":211,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":202,
                                            "y":225,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":340,
                                            "y":135,
                                            "sid":10005,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u5",
                                    "events":{"click":"__u5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":373,
                                            "y":138,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":373,
                                            "y":152,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":335,
                                            "y":273,
                                            "sid":10006,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u6",
                                    "events":{"click":"__u6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":370,
                                            "y":276,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":370,
                                            "y":290,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":428,
                                            "y":65,
                                            "sid":10007,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u7",
                                    "events":{"click":"__u7_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":463,
                                            "y":69,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":463,
                                            "y":83,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":430,
                                            "y":208,
                                            "sid":10008,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u8",
                                    "events":{"click":"__u8_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":465,
                                            "y":211,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":465,
                                            "y":225,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":488,
                                            "y":136,
                                            "sid":10009,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u9",
                                    "events":{"click":"__u9_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":522,
                                            "y":139,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":522,
                                            "y":153,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":230,
                                            "y":135,
                                            "sid":10010
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u10",
                                    "events":{"click":"__u10_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":265,
                                            "y":138,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":265,
                                            "y":152,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TalentSlot,
                                    "id":"i11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":488,
                                            "y":274,
                                            "sid":10011
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"u11",
                                    "events":{"click":"__u11_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"talentUpBtn",
                                            "x":522,
                                            "y":277,
                                            "width":14,
                                            "height":14
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"l11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":522,
                                            "y":292,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"left",
                                    "events":{"click":"__left_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":160,
                                            "height":45,
                                            "width":53,
                                            "styleName":"talentLeftBtn"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetTalentPanel_Label6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":104,
                                            "y":32,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"useGood",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":184.8,
                                            "y":327,
                                            "width":228.2
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"infoCan",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":156,
                                "height":360,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"inText",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":160,
                                "height":354,
                                "visible":false
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var mianInfo:Object = new Object();
        private var power_rate:Array = [[850, 10], [700, 8], [400, 6], [200, 4], [100, 2]];
        private var _imageResCode:Array = [4130220000334, 4130220000335, 4130220000336, 4130220000337];
        private var _needCheckProp:Array = [1, 2, 6, 7, 4, 5, 9, 8, 13, 31, 11, 10, 61, 58, 32, 59, 60, 62, 63];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetTalentPanel()
        {
            mx_internal::_document = this;
            this.width = 600;
            this.height = 390;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetTalentPanel._watcherSetupUtil = _arg_1;
        }


        private function _updateTalentDataTal(_arg_1:Object):void
        {
            var _local_2:*;
            if (_arg_1)
            {
                if (!_core.player.petTalentData)
                {
                    _core.player.petTalentData = new Object();
                };
                if (!_core.player.petTalentData.tal)
                {
                    _core.player.petTalentData.tal = new Object();
                };
                for (_local_2 in _arg_1)
                {
                    if (_arg_1[_local_2])
                    {
                        _core.player.petTalentData.tal[_local_2] = Number(_arg_1[_local_2]);
                    };
                };
            };
        }

        private function upTalentSlot(index:Number):void
        {
            var _index:Number;
            var _check:Boolean;
            var temp:Object;
            _index = index;
            var str:String = Language.TALENT_PANEL_U[6];
            if (useGood.selected)
            {
                if (((_core.player.petTalentData) && ((!(_core.player.petTalentData.tal)) || (!(_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)])))))
                {
                    temp = getNextTalentSlotData(_index, 1);
                    if (!temp)
                    {
                        return;
                    };
                    str = Language.TALENT_PANEL_U[11].replace("{num}", Math.ceil((temp.upExp * _goldPoint)));
                }
                else
                {
                    if ((((_core.player.petTalentData) && (_core.player.petTalentData.tal)) && (_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)])))
                    {
                        temp = _core.data.gameData[GamePredef.TBL_PET_TALENT][_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)]];
                        temp = getNextTalentSlotData(_index, ToolKit.add(temp.lv, 1));
                        if (!temp)
                        {
                            return;
                        };
                        str = Language.TALENT_PANEL_U[11].replace("{num}", Math.ceil((temp.upExp * _goldPoint)));
                    };
                };
            };
            _check = useGood.selected;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:Object;
                var _local_3:Boolean;
                if (_arg_1.detail == Alert.YES)
                {
                    if (_check)
                    {
                        if (((_core.player.petTalentData) && ((!(_core.player.petTalentData.tal)) || (!(_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)])))))
                        {
                            _local_2 = getNextTalentSlotData(_index, 1);
                            if (!_local_2)
                            {
                                return;
                            };
                            if (((_index == 10) || (_index == 11)))
                            {
                                _local_3 = checkSpecSlotUp(_index);
                                if (!_local_3)
                                {
                                    return;
                                };
                            };
                        }
                        else
                        {
                            if ((((_core.player.petTalentData) && (_core.player.petTalentData.tal)) && (_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)])))
                            {
                                _local_2 = _core.data.gameData[GamePredef.TBL_PET_TALENT][_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)]];
                                _local_2 = getNextTalentSlotData(_index, ToolKit.add(_local_2.lv, 1));
                                if (!_local_2)
                                {
                                    return;
                                };
                                if (((_index == 10) || (_index == 11)))
                                {
                                    _local_3 = checkSpecSlotUp(_index);
                                    if (!_local_3)
                                    {
                                        return;
                                    };
                                };
                            };
                        };
                    }
                    else
                    {
                        if (((_core.player.petTalentData) && ((!(_core.player.petTalentData.tal)) || (!(_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)])))))
                        {
                            _local_2 = getNextTalentSlotData(_index, 1);
                            if (!_local_2)
                            {
                                return;
                            };
                            if (((!(_core.player.pvePoint)) || (ToolKit.isSmallThan(_core.player.pvePoint, _local_2.upExp))))
                            {
                                _core.sysMidNote(Language.TALENT_PANEL_U[7]);
                                return;
                            };
                            if (((_index == 10) || (_index == 11)))
                            {
                                _local_3 = checkSpecSlotUp(_index);
                                if (!_local_3)
                                {
                                    return;
                                };
                            };
                        }
                        else
                        {
                            if ((((_core.player.petTalentData) && (_core.player.petTalentData.tal)) && (_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)])))
                            {
                                _local_2 = _core.data.gameData[GamePredef.TBL_PET_TALENT][_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _index)]];
                                _local_2 = getNextTalentSlotData(_index, ToolKit.add(_local_2.lv, 1));
                                if (!_local_2)
                                {
                                    return;
                                };
                                if (((!(_core.player.pvePoint)) || (ToolKit.isSmallThan(_core.player.pvePoint, _local_2.upExp))))
                                {
                                    _core.sysMidNote(Language.TALENT_PANEL_U[7]);
                                    return;
                                };
                                if (((_index == 10) || (_index == 11)))
                                {
                                    _local_3 = checkSpecSlotUp(_index);
                                    if (!_local_3)
                                    {
                                        return;
                                    };
                                };
                            };
                        };
                    };
                    _core.remote.call("upTalentSlotLv", new Responder(onUpTalentSlotLv), ToolKit.add((_pi * 10000), _index), _check);
                };
            };
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get left():BasicGlowButton
        {
            return (this._3317767left);
        }

        private function setPage(_arg_1:Number):void
        {
            right.visible = true;
            left.visible = true;
            if (((ToolKit.isEqual(_arg_1, 1)) && (_pi < 4)))
            {
                _pi++;
                if (_pi == 4)
                {
                    right.visible = false;
                };
            }
            else
            {
                if (((ToolKit.isEqual(_arg_1, 2)) && (_pi >= 2)))
                {
                    _pi--;
                    if (_pi == 1)
                    {
                        left.visible = false;
                    };
                }
                else
                {
                    return;
                };
            };
            this.imgbg.source = ResManager.getIconUrl(_imageResCode[ToolKit.minus(_pi, 1)]);
            freshPanelData(3);
        }

        public function set left(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3317767left;
            if (_local_2 !== _arg_1)
            {
                this._3317767left = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left", _local_2, _arg_1));
            };
        }

        private function _getTotalPower():Number
        {
            var _local_1:*;
            var _local_2:Object;
            _totalPowerL = 0;
            if (((_core.player.petTalentData) && (_core.player.petTalentData.inTal)))
            {
                for (_local_1 in _core.player.petTalentData.inTal)
                {
                    if (_core.player.petTalentData.inTal[_local_1])
                    {
                        _local_2 = _core.data.gameData[GamePredef.TBL_PET_TALENT][Number(_core.player.petTalentData.inTal[_local_1])];
                        _totalPowerL = ToolKit.add(_totalPowerL, _local_2.p);
                    };
                };
            };
            _rate = 0;
            _local_1 = 0;
            while (_local_1 <= 4)
            {
                if (ToolKit.isBigOrEqual(_totalPowerL, power_rate[_local_1][0]))
                {
                    _rate = power_rate[_local_1][1];
                    return (_rate);
                };
                _local_1++;
            };
            return (_rate);
        }

        public function __u6_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(6);
        }

        private function _updateTalentDataInTal(_arg_1:Object):void
        {
            var _local_2:*;
            if (_arg_1)
            {
                if (!_core.player.petTalentData)
                {
                    _core.player.petTalentData = new Object();
                };
                if (_arg_1.a)
                {
                    if (!_core.player.petTalentData.inTal)
                    {
                        _core.player.petTalentData.inTal = new Object();
                    };
                    for (_local_2 in _arg_1.a)
                    {
                        if (_arg_1.a[_local_2])
                        {
                            _core.player.petTalentData.inTal[_local_2] = _arg_1.a[_local_2].tid;
                        };
                    };
                };
                if (_arg_1.d)
                {
                    for (_local_2 in _arg_1.d)
                    {
                        if (_arg_1.d[_local_2])
                        {
                            delete _core.player.petTalentData.inTal[_local_2];
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get right():BasicGlowButton
        {
            return (this._108511772right);
        }

        private function onUpTalentSlotLv(_arg_1:Object):void
        {
            if (_arg_1)
            {
                updateTalentDataTal(_arg_1);
                updatePropData();
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoCan():Canvas
        {
            return (this._1945386050infoCan);
        }

        [Bindable(event="propertyChange")]
        public function get pTalentTitle():BasicTitleCanvas
        {
            return (this._688048580pTalentTitle);
        }

        public function __u11_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(11);
        }

        [Bindable(event="propertyChange")]
        public function get inText():IntroText
        {
            return (this._1184715790inText);
        }

        [Bindable(event="propertyChange")]
        public function get i11():TalentSlot
        {
            return (this._102473i11);
        }

        public function updatePoint():void
        {
            if (initialized)
            {
                _point = ((_core.player.pvePoint) ? _core.player.pvePoint : 0);
            };
        }

        public function ___PetTalentPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            showFuncPanel();
        }

        [Bindable(event="propertyChange")]
        public function get i10():TalentSlot
        {
            return (this._102472i10);
        }

        private function freshPanelData(_arg_1:int):void
        {
            var _local_2:int;
            if (_arg_1 != 2)
            {
                _local_2 = 1;
                while (_local_2 <= 9)
                {
                    this[("i" + _local_2)].reset();
                    this[("i" + _local_2)].sid = ToolKit.add((_pi * 10000), _local_2);
                    _local_2++;
                };
                _local_2 = 10;
                while (_local_2 <= 11)
                {
                    this[("i" + _local_2)].sid = ToolKit.add((_pi * 10000), _local_2);
                    if ((((!(_core.player.petTalentData)) || (!(_core.player.petTalentData.inTal))) || (!(_core.player.petTalentData.inTal[this[("i" + _local_2)].sid]))))
                    {
                        this[("i" + _local_2)].reset();
                    };
                    _local_2++;
                };
                if (((_core.player.petTalentData) && (_core.player.petTalentData.tal)))
                {
                    freshTalentSlotData(_core.player.petTalentData.tal);
                }
                else
                {
                    freshTalentSlotData(new Object());
                };
            };
            if (_arg_1 != 1)
            {
                _local_2 = 10;
                while (_local_2 <= 11)
                {
                    this[("i" + _local_2)].reset();
                    this[("i" + _local_2)].sid = ToolKit.add((_pi * 10000), _local_2);
                    _local_2++;
                };
                if (((_core.player.petTalentData) && (_core.player.petTalentData.inTal)))
                {
                    freshTalentStoneData(_core.player.petTalentData.inTal);
                }
                else
                {
                    freshTalentStoneData(new Object());
                };
                _getTotalPower();
            };
        }

        [Bindable(event="propertyChange")]
        public function get u1():Button
        {
            return (this._3676u1);
        }

        [Bindable(event="propertyChange")]
        public function get u3():Button
        {
            return (this._3678u3);
        }

        public function __u3_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(3);
        }

        private function _PetTalentPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TALENT_PANEL_U[0];
            _local_1 = Language.TALENT_PANEL_U[3];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.TALENT_PANEL_U[14];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.TALENT_PANEL_U[1];
            _local_1 = Language.TALENT_PANEL_U[12];
            _local_1 = Language.TALENT_PANEL_U[2];
            _local_1 = Language.TALENT_PANEL_U[13];
            _local_1 = Language.TALENT_PANEL_U[5];
            _local_1 = _point;
            _local_1 = (_totalPowerL + "/850");
            _local_1 = Language.TALENT_PANEL_U[4];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = Slot.SLOT_TALENT;
            _local_1 = (_rate + "%");
            _local_1 = Language.TALENT_PANEL_U[10];
            _local_1 = Language.TALENT_PANEL_U[10];
        }

        [Bindable(event="propertyChange")]
        public function get u6():Button
        {
            return (this._3681u6);
        }

        [Bindable(event="propertyChange")]
        public function get u8():Button
        {
            return (this._3683u8);
        }

        [Bindable(event="propertyChange")]
        public function get u2():Button
        {
            return (this._3677u2);
        }

        public function set right(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._108511772right;
            if (_local_2 !== _arg_1)
            {
                this._108511772right = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get u4():Button
        {
            return (this._3679u4);
        }

        [Bindable(event="propertyChange")]
        public function get u5():Button
        {
            return (this._3680u5);
        }

        [Bindable(event="propertyChange")]
        public function get u9():Button
        {
            return (this._3684u9);
        }

        public function set pTalentTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._688048580pTalentTitle;
            if (_local_2 !== _arg_1)
            {
                this._688048580pTalentTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pTalentTitle", _local_2, _arg_1));
            };
        }

        public function set infoCan(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1945386050infoCan;
            if (_local_2 !== _arg_1)
            {
                this._1945386050infoCan = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoCan", _local_2, _arg_1));
            };
        }

        public function set l1(_arg_1:Image):void
        {
            var _local_2:Object = this._3397l1;
            if (_local_2 !== _arg_1)
            {
                this._3397l1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l1", _local_2, _arg_1));
            };
        }

        public function __u8_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(8);
        }

        [Bindable(event="propertyChange")]
        private function get _point():Number
        {
            return (this._1468352367_point);
        }

        public function set i11(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._102473i11;
            if (_local_2 !== _arg_1)
            {
                this._102473i11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i11", _local_2, _arg_1));
            };
        }

        public function set l2(_arg_1:Image):void
        {
            var _local_2:Object = this._3398l2;
            if (_local_2 !== _arg_1)
            {
                this._3398l2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l2", _local_2, _arg_1));
            };
        }

        public function set i10(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._102472i10;
            if (_local_2 !== _arg_1)
            {
                this._102472i10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i10", _local_2, _arg_1));
            };
        }

        public function set l5(_arg_1:Image):void
        {
            var _local_2:Object = this._3401l5;
            if (_local_2 !== _arg_1)
            {
                this._3401l5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l5", _local_2, _arg_1));
            };
        }

        public function set l9(_arg_1:Image):void
        {
            var _local_2:Object = this._3405l9;
            if (_local_2 !== _arg_1)
            {
                this._3405l9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l9", _local_2, _arg_1));
            };
        }

        public function set l6(_arg_1:Image):void
        {
            var _local_2:Object = this._3402l6;
            if (_local_2 !== _arg_1)
            {
                this._3402l6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l6", _local_2, _arg_1));
            };
        }

        public function set l3(_arg_1:Image):void
        {
            var _local_2:Object = this._3399l3;
            if (_local_2 !== _arg_1)
            {
                this._3399l3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l3", _local_2, _arg_1));
            };
        }

        public function set imgbg(_arg_1:Image):void
        {
            var _local_2:Object = this._100319048imgbg;
            if (_local_2 !== _arg_1)
            {
                this._100319048imgbg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgbg", _local_2, _arg_1));
            };
        }

        private function freshTalentSlotData(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_2:int = 1;
            while (_local_2 <= 11)
            {
                this[("u" + _local_2)].visible = true;
                if (_arg_1[this[("i" + _local_2)].sid])
                {
                    _local_3 = _core.data.gameData[GamePredef.TBL_PET_TALENT][Number(_arg_1[this[("i" + _local_2)].sid])];
                    if (((_local_2 == 10) || (_local_2 == 11)))
                    {
                        if ((((!(_core.player.petTalentData)) || (!(_core.player.petTalentData.inTal))) || (!(_core.player.petTalentData.inTal[this[("i" + _local_2)].sid]))))
                        {
                            setTalentData(_local_3, _local_2);
                            if (_local_3)
                            {
                                this[("i" + _local_2)].movable = false;
                            };
                        };
                    }
                    else
                    {
                        setTalentData(_local_3, _local_2);
                    };
                    this[("l" + _local_2)].source = ResManager.getIconUrl(ToolKit.add(4130220000338, _local_3.lv));
                    if (ToolKit.isBigOrEqual(_local_3.lv, 5))
                    {
                        this[("u" + _local_2)].visible = false;
                    };
                }
                else
                {
                    _local_3 = getEmptyTalentSlotData(_local_2);
                    setTalentData(_local_3, _local_2);
                    this[("l" + _local_2)].source = ResManager.getIconUrl(4130220000338);
                    if (((_local_2 == 10) || (_local_2 == 11)))
                    {
                        if (_local_3)
                        {
                            this[("i" + _local_2)].movable = false;
                        };
                    };
                };
                _local_2++;
            };
        }

        private function _PetTalentPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                pTalentTitle.text = _arg_1;
            }, "pTalentTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_LinkButton1.label = _arg_1;
            }, "_PetTalentPanel_LinkButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton1.overSkin");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton1.upSkin");
            result[3] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton1.downSkin");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_LinkButton2.label = _arg_1;
            }, "_PetTalentPanel_LinkButton2.label");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton2.setStyle("overSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton2.overSkin");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton2.setStyle("upSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton2.upSkin");
            result[7] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton2.setStyle("downSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton2.downSkin");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_Label1.text = _arg_1;
            }, "_PetTalentPanel_Label1.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_Label1.toolTip = _arg_1;
            }, "_PetTalentPanel_Label1.toolTip");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_Label2.text = _arg_1;
            }, "_PetTalentPanel_Label2.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_Label2.toolTip = _arg_1;
            }, "_PetTalentPanel_Label2.toolTip");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_Label3.text = _arg_1;
            }, "_PetTalentPanel_Label3.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _point;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_Label4.text = _arg_1;
            }, "_PetTalentPanel_Label4.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (_totalPowerL + "/850");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_Label5.text = _arg_1;
            }, "_PetTalentPanel_Label5.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_LinkButton3.label = _arg_1;
            }, "_PetTalentPanel_LinkButton3.label");
            result[16] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton3.setStyle("overSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton3.overSkin");
            result[17] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton3.setStyle("upSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton3.upSkin");
            result[18] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetTalentPanel_LinkButton3.setStyle("downSkin", _arg_1);
            }, "_PetTalentPanel_LinkButton3.downSkin");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i1.slotType = _arg_1;
            }, "i1.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i2.slotType = _arg_1;
            }, "i2.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i3.slotType = _arg_1;
            }, "i3.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i4.slotType = _arg_1;
            }, "i4.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i5.slotType = _arg_1;
            }, "i5.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i6.slotType = _arg_1;
            }, "i6.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i7.slotType = _arg_1;
            }, "i7.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i8.slotType = _arg_1;
            }, "i8.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i9.slotType = _arg_1;
            }, "i9.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i10.slotType = _arg_1;
            }, "i10.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TALENT);
            }, function (_arg_1:int):void
            {
                i11.slotType = _arg_1;
            }, "i11.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (_rate + "%");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetTalentPanel_Label6.text = _arg_1;
            }, "_PetTalentPanel_Label6.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                useGood.label = _arg_1;
            }, "useGood.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TALENT_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                useGood.toolTip = _arg_1;
            }, "useGood.toolTip");
            result[33] = binding;
            return (result);
        }

        public function set u11(_arg_1:Button):void
        {
            var _local_2:Object = this._114005u11;
            if (_local_2 !== _arg_1)
            {
                this._114005u11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u11", _local_2, _arg_1));
            };
        }

        public function set l7(_arg_1:Image):void
        {
            var _local_2:Object = this._3403l7;
            if (_local_2 !== _arg_1)
            {
                this._3403l7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l7", _local_2, _arg_1));
            };
        }

        public function set l8(_arg_1:Image):void
        {
            var _local_2:Object = this._3404l8;
            if (_local_2 !== _arg_1)
            {
                this._3404l8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l8", _local_2, _arg_1));
            };
        }

        public function set l4(_arg_1:Image):void
        {
            var _local_2:Object = this._3400l4;
            if (_local_2 !== _arg_1)
            {
                this._3400l4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l4", _local_2, _arg_1));
            };
        }

        public function onInitTalentPanelData(_arg_1:Object):void
        {
            _core.player.petTalentData = _arg_1;
            _firstLoadCid = _core.player.id;
            _pi = 1;
            right.visible = true;
            left.visible = false;
            useGood.selected = false;
            this.imgbg.source = ResManager.getIconUrl(_imageResCode[ToolKit.minus(_pi, 1)]);
            initTalentPanelData(_core.player.petTalentData);
            updatePoint();
            updatePropData();
        }

        private function freshPanelDataByOneSlotOrStone(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            if (_arg_2 != 2)
            {
                if (_arg_1 <= 9)
                {
                    this[("i" + _arg_1)].reset();
                    this[("i" + _arg_1)].sid = ToolKit.add((_pi * 10000), _arg_1);
                }
                else
                {
                    if (((_arg_1 >= 10) && (_arg_1 <= 11)))
                    {
                        this[("i" + _arg_1)].sid = ToolKit.add((_pi * 10000), _arg_1);
                        if ((((!(_core.player.petTalentData)) || (!(_core.player.petTalentData.inTal))) || (!(_core.player.petTalentData.inTal[this[("i" + _local_3)].sid]))))
                        {
                            this[("i" + _arg_1)].reset();
                        };
                    };
                };
                if (((_core.player.petTalentData) && (_core.player.petTalentData.tal)))
                {
                    freshTalentSlotData(_core.player.petTalentData.tal);
                }
                else
                {
                    freshTalentSlotData(new Object());
                };
            };
            if (_arg_2 != 1)
            {
                _local_3 = 10;
                while (_local_3 <= 11)
                {
                    this[("i" + _local_3)].reset();
                    this[("i" + _local_3)].sid = ToolKit.add((_pi * 10000), _local_3);
                    _local_3++;
                };
                if (((_core.player.petTalentData) && (_core.player.petTalentData.inTal)))
                {
                    freshTalentStoneData(_core.player.petTalentData.inTal);
                }
                else
                {
                    freshTalentStoneData(new Object());
                };
                _getTotalPower();
            };
        }

        [Bindable(event="propertyChange")]
        public function get u7():Button
        {
            return (this._3682u7);
        }

        public function set u10(_arg_1:Button):void
        {
            var _local_2:Object = this._114004u10;
            if (_local_2 !== _arg_1)
            {
                this._114004u10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u10", _local_2, _arg_1));
            };
        }

        public function set u3(_arg_1:Button):void
        {
            var _local_2:Object = this._3678u3;
            if (_local_2 !== _arg_1)
            {
                this._3678u3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u3", _local_2, _arg_1));
            };
        }

        public function set u4(_arg_1:Button):void
        {
            var _local_2:Object = this._3679u4;
            if (_local_2 !== _arg_1)
            {
                this._3679u4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u4", _local_2, _arg_1));
            };
        }

        private function setTalentData(_arg_1:Object, _arg_2:Number):void
        {
            if (!_arg_1)
            {
                return;
            };
            this[("i" + _arg_2)].type = GamePredef.TBL_PET_TALENT;
            this[("i" + _arg_2)].giid = _arg_1.id;
            this[("i" + _arg_2)].stackNum = 1;
            this[("i" + _arg_2)].quality = 0;
            this[("i" + _arg_2)].slotData = _arg_1;
        }

        public function updateTalentDataTal(_arg_1:Object):void
        {
            _updateTalentDataTal(_arg_1);
            if (((!(initialized)) || (!(_arg_1))))
            {
                return;
            };
            freshPanelData(1);
        }

        public function set u2(_arg_1:Button):void
        {
            var _local_2:Object = this._3677u2;
            if (_local_2 !== _arg_1)
            {
                this._3677u2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u2", _local_2, _arg_1));
            };
        }

        public function set u6(_arg_1:Button):void
        {
            var _local_2:Object = this._3681u6;
            if (_local_2 !== _arg_1)
            {
                this._3681u6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _totalPowerL():Number
        {
            return (this._1447937396_totalPowerL);
        }

        public function set u8(_arg_1:Button):void
        {
            var _local_2:Object = this._3683u8;
            if (_local_2 !== _arg_1)
            {
                this._3683u8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u8", _local_2, _arg_1));
            };
        }

        public function set u1(_arg_1:Button):void
        {
            var _local_2:Object = this._3676u1;
            if (_local_2 !== _arg_1)
            {
                this._3676u1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u1", _local_2, _arg_1));
            };
        }

        public function set u9(_arg_1:Button):void
        {
            var _local_2:Object = this._3684u9;
            if (_local_2 !== _arg_1)
            {
                this._3684u9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u9", _local_2, _arg_1));
            };
        }

        public function set u5(_arg_1:Button):void
        {
            var _local_2:Object = this._3680u5;
            if (_local_2 !== _arg_1)
            {
                this._3680u5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u5", _local_2, _arg_1));
            };
        }

        public function ___PetTalentPanel_LinkButton3_click(_arg_1:MouseEvent):void
        {
            changePanelVis();
        }

        public function set u7(_arg_1:Button):void
        {
            var _local_2:Object = this._3682u7;
            if (_local_2 !== _arg_1)
            {
                this._3682u7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "u7", _local_2, _arg_1));
            };
        }

        public function __u5_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(5);
        }

        [Bindable(event="propertyChange")]
        public function get useGood():CheckBox
        {
            return (this._148398364useGood);
        }

        [Bindable(event="propertyChange")]
        public function get i1():TalentSlot
        {
            return (this._3304i1);
        }

        [Bindable(event="propertyChange")]
        public function get i2():TalentSlot
        {
            return (this._3305i2);
        }

        [Bindable(event="propertyChange")]
        public function get i3():TalentSlot
        {
            return (this._3306i3);
        }

        [Bindable(event="propertyChange")]
        public function get i4():TalentSlot
        {
            return (this._3307i4);
        }

        [Bindable(event="propertyChange")]
        public function get i5():TalentSlot
        {
            return (this._3308i5);
        }

        [Bindable(event="propertyChange")]
        public function get i6():TalentSlot
        {
            return (this._3309i6);
        }

        [Bindable(event="propertyChange")]
        public function get i7():TalentSlot
        {
            return (this._3310i7);
        }

        [Bindable(event="propertyChange")]
        public function get i8():TalentSlot
        {
            return (this._3311i8);
        }

        [Bindable(event="propertyChange")]
        public function get i9():TalentSlot
        {
            return (this._3312i9);
        }

        public function __u10_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(10);
        }

        public function __u2_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(2);
        }

        public function initTalentDataByClient():void
        {
            initView();
            visible = true;
        }

        private function freshTalentStoneData(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_2:int = 10;
            while (_local_2 <= 11)
            {
                if (_arg_1[this[("i" + _local_2)].sid])
                {
                    _local_3 = _core.data.gameData[GamePredef.TBL_PET_TALENT][Number(_arg_1[this[("i" + _local_2)].sid])];
                    setTalentData(_local_3, _local_2);
                    if (_local_3)
                    {
                        this[("i" + _local_2)].movable = true;
                    };
                }
                else
                {
                    if ((((_core.player.petTalentData) && (_core.player.petTalentData.tal)) && (_core.player.petTalentData.tal[this[("i" + _local_2)].sid])))
                    {
                        _local_3 = _core.data.gameData[GamePredef.TBL_PET_TALENT][Number(_core.player.petTalentData.tal[this[("i" + _local_2)].sid])];
                        setTalentData(_local_3, _local_2);
                        if (_local_3)
                        {
                            this[("i" + _local_2)].movable = false;
                        };
                    }
                    else
                    {
                        _local_3 = getEmptyTalentSlotData(_local_2);
                        setTalentData(_local_3, _local_2);
                        if (_local_3)
                        {
                            this[("i" + _local_2)].movable = false;
                        };
                    };
                };
                _local_2++;
            };
        }

        public function set l10(_arg_1:Image):void
        {
            var _local_2:Object = this._105355l10;
            if (_local_2 !== _arg_1)
            {
                this._105355l10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "l10", _local_2, _arg_1));
            };
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

        private function initTalentPanelData(_arg_1:Object):void
        {
            freshPanelData(3);
        }

        public function updateTalentDataInTal(_arg_1:Object):void
        {
            _updateTalentDataInTal(_arg_1);
            if (((!(initialized)) || (!(_arg_1))))
            {
                return;
            };
            freshPanelData(2);
        }

        private function set _totalPowerL(_arg_1:Number):void
        {
            var _local_2:Object = this._1447937396_totalPowerL;
            if (_local_2 !== _arg_1)
            {
                this._1447937396_totalPowerL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_totalPowerL", _local_2, _arg_1));
            };
        }

        private function set _point(_arg_1:Number):void
        {
            var _local_2:Object = this._1468352367_point;
            if (_local_2 !== _arg_1)
            {
                this._1468352367_point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_point", _local_2, _arg_1));
            };
        }

        private function showFuncPanel():void
        {
            var _local_1:*;
            if (((((_firstLoadCid) && (_core.player)) && (_core.player.id)) && (_firstLoadCid == _core.player.id)))
            {
                _local_1 = _core.view.getUI(ViewManager.PANEL_PET_TALENT_FUNC);
                if (_local_1)
                {
                    _local_1.showFuncPanel();
                };
            };
        }

        public function __left_click(_arg_1:MouseEvent):void
        {
            setPage(2);
        }

        [Bindable(event="propertyChange")]
        public function get l1():Image
        {
            return (this._3397l1);
        }

        [Bindable(event="propertyChange")]
        public function get l2():Image
        {
            return (this._3398l2);
        }

        [Bindable(event="propertyChange")]
        public function get l3():Image
        {
            return (this._3399l3);
        }

        [Bindable(event="propertyChange")]
        public function get l5():Image
        {
            return (this._3401l5);
        }

        private function getEmptyTalentSlotData(_arg_1:Number):Object
        {
            var _local_3:Object;
            var _local_2:Number = this[("i" + _arg_1)].sid;
            for each (_local_3 in _core.data.gameDataIndex2[GamePredef.TBL_PET_TALENT][_local_2])
            {
                if ((((_local_3) && (ToolKit.isEqual(_local_3.lv, 0))) && (ToolKit.isEqual(_local_3.exp, 0))))
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        private function changePanelVis():void
        {
            if (infoCan.visible)
            {
                inText.visible = false;
                infoCan.visible = false;
                width = 600;
            }
            else
            {
                infoCan.visible = true;
                width = 765;
                inText.x = 600;
                inText.y = 33;
                inText.visible = true;
            };
            pTalentTitle.text = pTalentTitle.text;
        }

        [Bindable(event="propertyChange")]
        public function get l9():Image
        {
            return (this._3405l9);
        }

        [Bindable(event="propertyChange")]
        public function get imgbg():Image
        {
            return (this._100319048imgbg);
        }

        [Bindable(event="propertyChange")]
        public function get l6():Image
        {
            return (this._3402l6);
        }

        public function __u7_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(7);
        }

        [Bindable(event="propertyChange")]
        public function get l8():Image
        {
            return (this._3404l8);
        }

        [Bindable(event="propertyChange")]
        public function get u10():Button
        {
            return (this._114004u10);
        }

        [Bindable(event="propertyChange")]
        public function get u11():Button
        {
            return (this._114005u11);
        }

        [Bindable(event="propertyChange")]
        public function get l4():Image
        {
            return (this._3400l4);
        }

        [Bindable(event="propertyChange")]
        public function get l7():Image
        {
            return (this._3403l7);
        }

        private function set _rate(_arg_1:Number):void
        {
            var _local_2:Object = this._91227583_rate;
            if (_local_2 !== _arg_1)
            {
                this._91227583_rate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_rate", _local_2, _arg_1));
            };
        }

        public function ___PetTalentPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        [Bindable(event="propertyChange")]
        public function get l10():Image
        {
            return (this._105355l10);
        }

        [Bindable(event="propertyChange")]
        public function get l11():Image
        {
            return (this._105356l11);
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.TALENT_PANEL_U[15].toString();
            _helpAlert = Alert.show(_local_1, Language.TALENT_PANEL_U[14].toString(), Alert.YES, null, null);
        }

        override public function initialize():void
        {
            var target:PetTalentPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetTalentPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetTalentPanelWatcherSetupUtil");
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

        public function updatePropData():void
        {
            var _local_4:Number;
            var _local_5:String;
            var _local_6:*;
            var _local_7:Object;
            var _local_8:*;
            if (!initialized)
            {
                return;
            };
            if (!_core.player.petTalentData)
            {
                inText.text = "";
                return;
            };
            inText.text = "";
            var _local_1:Number = 0;
            var _local_2:Boolean = true;
            var _local_3:* = 0;
            while (_local_3 <= ToolKit.minus(_needCheckProp.length, 1))
            {
                _local_4 = 0;
                _local_5 = "";
                if (_core.player.petTalentData.tal)
                {
                    for (_local_6 in _core.player.petTalentData.tal)
                    {
                        _local_7 = _core.data.gameData[GamePredef.TBL_PET_TALENT][Number(_core.player.petTalentData.tal[_local_6])];
                        if (((_local_7) && (ToolKit.isEqual(_local_7.propType, _needCheckProp[_local_3]))))
                        {
                            _local_4 = ToolKit.add(_local_4, _local_7.propVal);
                            if ((((!(_local_5)) && (_local_7.preflag)) && (_local_7.preflag == 1)))
                            {
                                _local_5 = "%";
                            };
                        };
                    };
                };
                if (_core.player.petTalentData.inTal)
                {
                    for (_local_8 in _core.player.petTalentData.inTal)
                    {
                        _local_7 = _core.data.gameData[GamePredef.TBL_PET_TALENT][Number(_core.player.petTalentData.inTal[_local_8])];
                        if (((_local_7) && (ToolKit.isEqual(_local_7.propType, _needCheckProp[_local_3]))))
                        {
                            _local_4 = ToolKit.add(_local_4, _local_7.propVal);
                            if ((((!(_local_5)) && (_local_7.preflag)) && (_local_7.preflag == 1)))
                            {
                                _local_5 = "%";
                            };
                        };
                    };
                };
                _local_2 = false;
                if (!ToolKit.isEqual(_local_4, 0))
                {
                    if (((_local_4 / 100) * (1 + (_rate / 100))).toString().indexOf(".") > 0)
                    {
                        inText.text = (((((inText.text + Language.TALENT_PANEL_INFOU[_local_3]) + "  +") + (Math.floor((_local_4 * (1 + (_rate / 100)))) / 100)) + _local_5) + "\n");
                    }
                    else
                    {
                        inText.text = (((((inText.text + Language.TALENT_PANEL_INFOU[_local_3]) + "  +") + ((_local_4 / 100) * (1 + (_rate / 100)))) + _local_5) + "\n");
                    };
                };
                _local_3++;
            };
        }

        private function getNextTalentSlotData(_arg_1:Number, _arg_2:Number):Object
        {
            var _local_4:Object;
            var _local_3:Number = this[("i" + _arg_1)].sid;
            for each (_local_4 in _core.data.gameDataIndex2[GamePredef.TBL_PET_TALENT][_local_3])
            {
                if ((((_local_4) && (ToolKit.isEqual(_local_4.lv, _arg_2))) && (ToolKit.isEqual(_local_4.exp, 0))))
                {
                    return (_local_4);
                };
            };
            return (null);
        }

        public function __u4_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(4);
        }

        [Bindable(event="propertyChange")]
        private function get _rate():Number
        {
            return (this._91227583_rate);
        }

        public function __right_click(_arg_1:MouseEvent):void
        {
            setPage(1);
        }

        public function __u9_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(9);
        }

        public function set useGood(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._148398364useGood;
            if (_local_2 !== _arg_1)
            {
                this._148398364useGood = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useGood", _local_2, _arg_1));
            };
        }

        public function __u1_click(_arg_1:MouseEvent):void
        {
            upTalentSlot(1);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if ((((_core.player) && (_core.player.id)) && (!(_core.player.id == _firstLoadCid))))
            {
                _core.player.petTalentData = new Object();
                _core.remote.call("initTalentPanelData", new Responder(onInitTalentPanelData));
            }
            else
            {
                if (((_core.player) && (!(_core.player.petTalentData))))
                {
                    _core.player.petTalentData = new Object();
                    _core.remote.call("initTalentPanelData", new Responder(onInitTalentPanelData));
                }
                else
                {
                    if ((((_core.player) && (_core.player.id)) && (_core.player.id == _firstLoadCid)))
                    {
                        initTalentPanelData(_core.player.petTalentData);
                    };
                };
            };
        }

        public function set i4(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3307i4;
            if (_local_2 !== _arg_1)
            {
                this._3307i4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i4", _local_2, _arg_1));
            };
        }

        public function set i1(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3304i1;
            if (_local_2 !== _arg_1)
            {
                this._3304i1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i1", _local_2, _arg_1));
            };
        }

        public function set i5(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3308i5;
            if (_local_2 !== _arg_1)
            {
                this._3308i5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i5", _local_2, _arg_1));
            };
        }

        public function set i2(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3305i2;
            if (_local_2 !== _arg_1)
            {
                this._3305i2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i2", _local_2, _arg_1));
            };
        }

        public function set i6(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3309i6;
            if (_local_2 !== _arg_1)
            {
                this._3309i6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i6", _local_2, _arg_1));
            };
        }

        public function set i3(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3306i3;
            if (_local_2 !== _arg_1)
            {
                this._3306i3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i3", _local_2, _arg_1));
            };
        }

        public function set i7(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3310i7;
            if (_local_2 !== _arg_1)
            {
                this._3310i7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i7", _local_2, _arg_1));
            };
        }

        public function set i8(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3311i8;
            if (_local_2 !== _arg_1)
            {
                this._3311i8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i8", _local_2, _arg_1));
            };
        }

        public function set i9(_arg_1:TalentSlot):void
        {
            var _local_2:Object = this._3312i9;
            if (_local_2 !== _arg_1)
            {
                this._3312i9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i9", _local_2, _arg_1));
            };
        }

        public function set inText(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1184715790inText;
            if (_local_2 !== _arg_1)
            {
                this._1184715790inText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inText", _local_2, _arg_1));
            };
        }

        private function getTalentStoneData(_arg_1:Number):Object
        {
            var _local_3:Object;
            var _local_2:Number = this[("i" + _arg_1)].sid;
            for each (_local_3 in _core.data.gameDataIndex2[GamePredef.TBL_PET_TALENT][_local_2])
            {
                if ((((_local_3) && (ToolKit.isEqual(_local_3.lv, 0))) && (ToolKit.isEqual(_local_3.exp, 0))))
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        private function checkSpecSlotUp(_arg_1:int):Boolean
        {
            var _local_2:Number;
            var _local_3:*;
            var _local_4:*;
            if (_arg_1 == 10)
            {
                _local_2 = 0;
                _local_3 = 1;
                while (_local_3 <= 4)
                {
                    if ((((_core.player.petTalentData) && (_core.player.petTalentData.tal)) && (_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _local_3)])))
                    {
                        _local_4 = _core.data.gameData[GamePredef.TBL_PET_TALENT][_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _local_3)]];
                        if (_local_4)
                        {
                            _local_2 = ToolKit.add(_local_2, _local_4.lv);
                        };
                    };
                    _local_3++;
                };
                if (_local_2 >= 20)
                {
                    return (true);
                };
                _core.sysMidNote(Language.TALENT_PANEL_U[8]);
            }
            else
            {
                _local_2 = 0;
                _local_3 = 1;
                while (_local_3 <= 9)
                {
                    if ((((_core.player.petTalentData) && (_core.player.petTalentData.tal)) && (_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _local_3)])))
                    {
                        _local_4 = _core.data.gameData[GamePredef.TBL_PET_TALENT][_core.player.petTalentData.tal[ToolKit.add((_pi * 10000), _local_3)]];
                        if (_local_4)
                        {
                            _local_2 = ToolKit.add(_local_2, _local_4.lv);
                        };
                    };
                    _local_3++;
                };
                if (_local_2 >= 35)
                {
                    return (true);
                };
                _core.sysMidNote(Language.TALENT_PANEL_U[9]);
            };
            return (false);
        }


    }
}//package com.qeedoo.ui.view.compDragable

