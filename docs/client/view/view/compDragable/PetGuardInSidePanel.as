// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetGuardInSidePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.GuardSlot;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Alert;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import flash.events.MouseEvent;
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

    public class PetGuardInSidePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1464427280showCombine2:Label;
        private var _3437300pet3:GuardSlot;
        private var _3437302pet5:GuardSlot;
        public var _PetGuardInSidePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _helpAlert:Alert;
        private var _1091440169lvText:Label;
        private var _738692350propText2:Label;
        public var _PetGuardInSidePanel_LinkButton1:LinkButton;
        private var _865666787needText:Label;
        private var _3437298pet1:GuardSlot;
        private var _738692347propText5:Label;
        private var _738692351propText1:Label;
        private var _alert:Alert;
        private var _1464427278showCombine4:Label;
        private var _1840576088nameText:Label;
        private var _738692348propText4:Label;
        private var _505171265openBtn1:BasicGlowButton;
        private var _1464427281showCombine1:Label;
        private var _3437301pet4:GuardSlot;
        private var _1969543397titleWrapper:Canvas;
        private var _975883165nameAddText:Label;
        private var _738692349propText3:Label;
        private var _454209194mainBackImag:Image;
        private var _3521p1:GuardSlot;
        private var max_lev:* = 30;
        private var _index:int = 1;
        public var _PetGuardInSidePanel_Label4:Label;
        public var _PetGuardInSidePanel_Label5:Label;
        public var _PetGuardInSidePanel_Label6:Label;
        public var _PetGuardInSidePanel_Label7:Label;
        public var _PetGuardInSidePanel_Label2:Label;
        private var _3437299pet2:GuardSlot;
        private var _1464427279showCombine3:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":530,
                    "height":330,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetGuardInSidePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "38";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "width":510,
                                "height":270,
                                "x":9,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"mainBackImag",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":510,
                                            "height":270
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
                                "styleName":"CanvasBorder",
                                "width":320,
                                "height":250,
                                "x":18,
                                "y":46,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lvText",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":45,
                                            "y":111,
                                            "width":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetGuardInSidePanel_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":12,
                                            "y":160,
                                            "width":99
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"needText",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":116,
                                            "y":160,
                                            "width":80,
                                            "text":""
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetGuardInSidePanel_Label4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":11,
                                            "y":183,
                                            "width":96
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetGuardInSidePanel_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":116,
                                            "y":183,
                                            "width":80
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_PetGuardInSidePanel_LinkButton1",
                                    "events":{"click":"___PetGuardInSidePanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                        this.textDecoration = "underline";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":22,
                                            "y":205,
                                            "width":106
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":GuardSlot,
                                    "id":"pet1",
                                    "events":{"click":"__pet1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":31,
                                            "acceptable":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":GuardSlot,
                                    "id":"pet2",
                                    "events":{"click":"__pet2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":72,
                                            "acceptable":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":GuardSlot,
                                    "id":"pet3",
                                    "events":{"click":"__pet3_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":114,
                                            "acceptable":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":GuardSlot,
                                    "id":"pet4",
                                    "events":{"click":"__pet4_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":157,
                                            "acceptable":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":GuardSlot,
                                    "id":"pet5",
                                    "events":{"click":"__pet5_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":201,
                                            "acceptable":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetGuardInSidePanel_Label6",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "right";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":127,
                                            "y":10,
                                            "width":106
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_PetGuardInSidePanel_Label7",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "right";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":185,
                                            "y":10,
                                            "width":106
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"propText1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":215,
                                            "y":38,
                                            "width":108
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"propText2",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":215,
                                            "y":81,
                                            "width":108
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"propText3",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":215,
                                            "y":122,
                                            "width":108
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"propText4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":215,
                                            "y":163,
                                            "width":108
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"propText5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.textAlign = "left";
                                        this.color = 0xF9F900;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":215,
                                            "y":205,
                                            "width":108
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
                                "styleName":"CanvasBorder",
                                "width":170,
                                "height":250,
                                "x":342,
                                "y":46,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"titleWrapper",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":15,
                                            "y":9,
                                            "styleName":"StandardTitle",
                                            "width":150,
                                            "x":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"nameAddText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xF9F900;
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":8,
                                            "width":103,
                                            "x":34
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HRule,
                                    "stylesFactory":function ():void
                                    {
                                        this.themeColor = 40447;
                                        this.strokeColor = 847355;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":33,
                                            "width":150
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"showCombine1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":43,
                                            "text":"Label",
                                            "width":150
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"showCombine2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":69,
                                            "text":"Label",
                                            "width":150
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"showCombine3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":11,
                                            "y":91,
                                            "text":"Label",
                                            "width":149
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"showCombine4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":11,
                                            "y":116,
                                            "text":"Label",
                                            "width":149
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nameText",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "left";
                            this.color = 0xF9F900;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":22,
                                "y":53
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":65,
                                "height":65,
                                "x":63,
                                "y":89
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":GuardSlot,
                        "id":"p1",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":78,
                                "y":104,
                                "acceptable":false,
                                "sid":1
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"openBtn1",
                        "events":{"click":"__openBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":177,
                                "styleName":"BtnStdRed",
                                "x":71
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var petGuardObj:* = {
            "lvData":{},
            "petData":{}
        };
        private var PET_GUARD_INDEX_SID:Object = {
            "11":{
                "1":{
                    "val":0,
                    "per":0.0016
                },
                "2":{
                    "val":0,
                    "per":0.08
                },
                "3":{
                    "val":0,
                    "per":0.4
                },
                "4":{
                    "val":0,
                    "per":2
                },
                "5":{
                    "val":0,
                    "per":10
                }
            },
            "21":{
                "1":{
                    "val":0,
                    "per":0.0016
                },
                "2":{
                    "val":0,
                    "per":0.08
                },
                "3":{
                    "val":0,
                    "per":0.4
                },
                "4":{
                    "val":0,
                    "per":2
                },
                "5":{
                    "val":0,
                    "per":10
                }
            },
            "31":{
                "1":{
                    "val":0,
                    "per":0.0016
                },
                "2":{
                    "val":0,
                    "per":0.08
                },
                "3":{
                    "val":0,
                    "per":0.4
                },
                "4":{
                    "val":0,
                    "per":2
                },
                "5":{
                    "val":0,
                    "per":10
                }
            },
            "41":{
                "1":{
                    "val":0,
                    "per":0.0016
                },
                "2":{
                    "val":0,
                    "per":0.08
                },
                "3":{
                    "val":0,
                    "per":0.4
                },
                "4":{
                    "val":0,
                    "per":2
                },
                "5":{
                    "val":0,
                    "per":10
                }
            }
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetGuardInSidePanel()
        {
            mx_internal::_document = this;
            this.width = 530;
            this.height = 330;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetGuardInSidePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get propText5():Label
        {
            return (this._738692347propText5);
        }

        [Bindable(event="propertyChange")]
        public function get propText1():Label
        {
            return (this._738692351propText1);
        }

        [Bindable(event="propertyChange")]
        public function get pet2():GuardSlot
        {
            return (this._3437299pet2);
        }

        [Bindable(event="propertyChange")]
        public function get pet4():GuardSlot
        {
            return (this._3437301pet4);
        }

        public function set propText4(_arg_1:Label):void
        {
            var _local_2:Object = this._738692348propText4;
            if (_local_2 !== _arg_1)
            {
                this._738692348propText4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText4", _local_2, _arg_1));
            };
        }

        public function set propText1(_arg_1:Label):void
        {
            var _local_2:Object = this._738692351propText1;
            if (_local_2 !== _arg_1)
            {
                this._738692351propText1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propText3():Label
        {
            return (this._738692349propText3);
        }

        public function onInitPetSolt():void
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:int;
            p1.clean();
            pet1.clean();
            pet2.clean();
            pet3.clean();
            pet4.clean();
            pet5.clean();
            var _local_1:int = _index;
            if (((petGuardObj["petData"][_local_1]) && (petGuardObj["petData"][_local_1] > 0)))
            {
                for each (_local_3 in _core.player.petList)
                {
                    if (_local_3)
                    {
                        _local_4 = _core.getTemplateData(GamePredef.TBL_CREATURE, _local_3.tid, false);
                        if (!(((!(_local_4)) || (!(Number(_local_4.classIds) == 10))) || (Number(_local_4.useLv) < 50)))
                        {
                            if (_local_3.id == petGuardObj["petData"][_local_1])
                            {
                                this["p1"].type = GamePredef.TBL_PET;
                                this["p1"].slotData = _local_3;
                                this["p1"].stackNum = 1;
                                this["p1"].giid = _local_3.id;
                                break;
                            };
                        };
                    };
                };
            };
            _local_1 = (_index * 10);
            var _local_2:* = 1;
            while (_local_2 <= 5)
            {
                this[("propText" + _local_2)].visible = false;
                _local_5 = (_local_1 + _local_2);
                if (((petGuardObj["petData"][_local_5]) && (petGuardObj["petData"][_local_5] > 0)))
                {
                    for each (_local_3 in _core.player.petList)
                    {
                        if (_local_3)
                        {
                            _local_4 = _core.getTemplateData(GamePredef.TBL_CREATURE, _local_3.tid, false);
                            if (!(((!(_local_4)) || (!(Number(_local_4.classIds) == 10))) || (Number(_local_4.useLv) < 50)))
                            {
                                if (_local_3.id == petGuardObj["petData"][_local_5])
                                {
                                    this[("pet" + _local_2)].type = GamePredef.TBL_PET;
                                    this[("pet" + _local_2)].slotData = _local_3;
                                    this[("pet" + _local_2)].stackNum = 1;
                                    this[("pet" + _local_2)].giid = _local_3.id;
                                    _local_6 = _core.basic.colorByGrowRate(_local_3.growRate);
                                    this[("propText" + _local_2)].setStyle("color", GamePredef.CODE_ITEM_COLOR[_local_6]);
                                    this[("propText" + _local_2)].text = (((Language.PANEL_PETGUARDINSIDE[2] + " +") + PET_GUARD_INDEX_SID[(_local_1 + 1)][(_local_6 + 1)]["per"]) + "%");
                                    this[("propText" + _local_2)].visible = true;
                                    break;
                                };
                            };
                        };
                    };
                };
                _local_2++;
            };
        }

        public function set propText3(_arg_1:Label):void
        {
            var _local_2:Object = this._738692349propText3;
            if (_local_2 !== _arg_1)
            {
                this._738692349propText3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText3", _local_2, _arg_1));
            };
        }

        public function set pet5(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437302pet5;
            if (_local_2 !== _arg_1)
            {
                this._3437302pet5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet5", _local_2, _arg_1));
            };
        }

        private function _PetGuardInSidePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARDINSIDE[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardInSidePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PetGuardInSidePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000811")));
            }, function (_arg_1:Object):void
            {
                mainBackImag.source = _arg_1;
            }, "mainBackImag.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lvText.text = _arg_1;
            }, "lvText.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARDINSIDE[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardInSidePanel_Label2.text = _arg_1;
            }, "_PetGuardInSidePanel_Label2.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARDINSIDE[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardInSidePanel_Label4.text = _arg_1;
            }, "_PetGuardInSidePanel_Label4.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.petguardin;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardInSidePanel_Label5.text = _arg_1;
            }, "_PetGuardInSidePanel_Label5.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARDINSIDE[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardInSidePanel_LinkButton1.label = _arg_1;
            }, "_PetGuardInSidePanel_LinkButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet1.slotType = _arg_1;
            }, "pet1.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet2.slotType = _arg_1;
            }, "pet2.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet3.slotType = _arg_1;
            }, "pet3.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet4.slotType = _arg_1;
            }, "pet4.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                pet5.slotType = _arg_1;
            }, "pet5.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARDINSIDE[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardInSidePanel_Label6.text = _arg_1;
            }, "_PetGuardInSidePanel_Label6.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARDINSIDE[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetGuardInSidePanel_Label7.text = _arg_1;
            }, "_PetGuardInSidePanel_Label7.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propText1.text = _arg_1;
            }, "propText1.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propText2.text = _arg_1;
            }, "propText2.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propText3.text = _arg_1;
            }, "propText3.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propText4.text = _arg_1;
            }, "propText4.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propText5.text = _arg_1;
            }, "propText5.text");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                nameAddText.filters = _arg_1;
            }, "nameAddText.filters");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARD[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nameText.text = _arg_1;
            }, "nameText.text");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                p1.slotType = _arg_1;
            }, "p1.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PANEL_PETGUARDINSIDE[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                openBtn1.label = _arg_1;
            }, "openBtn1.label");
            result[22] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get titleWrapper():Canvas
        {
            return (this._1969543397titleWrapper);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine4():Label
        {
            return (this._1464427278showCombine4);
        }

        public function set propText5(_arg_1:Label):void
        {
            var _local_2:Object = this._738692347propText5;
            if (_local_2 !== _arg_1)
            {
                this._738692347propText5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propText2():Label
        {
            return (this._738692350propText2);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine1():Label
        {
            return (this._1464427281showCombine1);
        }

        public function upInGuardSid():void
        {
            var ct:int;
            var temp:Object;
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var gfunc:Function;
            var handler:Function;
            var str:String;
            var lev:int = petGuardObj["lvData"][_index];
            if (lev >= 30)
            {
                return;
            };
            ct = 2;
            var gold:Number = 0;
            for each (temp in _core.data.gameDataIndex[GamePredef.TBL_PET_GUARD][_index])
            {
                if (Number(temp.lev) == lev)
                {
                    if (temp.num > _core.player.petguardin)
                    {
                        bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                        goldLockFlag = bagPanel.goldLockFlag;
                        if (((goldLockFlag) || (!(bagPanel))))
                        {
                            gfunc = function (_arg_1:String):void
                            {
                                _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                            };
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                            return;
                        };
                        ct = 1;
                        gold = temp["gold"];
                    };
                    if (ct == 1)
                    {
                        handler = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("upGuardSid", null, _index, ct);
                            };
                        };
                        if (_alert)
                        {
                            PopUpManager.removePopUp(_alert);
                            _alert = null;
                        };
                        str = Language.PANEL_PETGUARDINSIDE[13].toString().replace("{num}", gold).replace("{name}", GamePredef.GUARD_NAME[_index]);
                        _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                        return;
                    };
                    _core.remote.call("upGuardSid", null, _index, ct);
                };
            };
        }

        public function __pet2_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(2);
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

        public function onGetPetGuardData(_arg_1:Object):void
        {
            if (!initialized)
            {
                return;
            };
            if (_arg_1)
            {
                petGuardObj["lvData"] = _arg_1["lvData"];
                petGuardObj["petData"] = _arg_1["petData"];
                onInit();
            };
        }

        public function set titleWrapper(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1969543397titleWrapper;
            if (_local_2 !== _arg_1)
            {
                this._1969543397titleWrapper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleWrapper", _local_2, _arg_1));
            };
        }

        public function set propText2(_arg_1:Label):void
        {
            var _local_2:Object = this._738692350propText2;
            if (_local_2 !== _arg_1)
            {
                this._738692350propText2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propText2", _local_2, _arg_1));
            };
        }

        public function set mainBackImag(_arg_1:Image):void
        {
            var _local_2:Object = this._454209194mainBackImag;
            if (_local_2 !== _arg_1)
            {
                this._454209194mainBackImag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainBackImag", _local_2, _arg_1));
            };
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function __pet3_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(3);
        }

        [Bindable(event="propertyChange")]
        public function get nameAddText():Label
        {
            return (this._975883165nameAddText);
        }

        [Bindable(event="propertyChange")]
        public function get nameText():Label
        {
            return (this._1840576088nameText);
        }

        [Bindable(event="propertyChange")]
        public function get propText4():Label
        {
            return (this._738692348propText4);
        }

        public function set openBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._505171265openBtn1;
            if (_local_2 !== _arg_1)
            {
                this._505171265openBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openBtn1", _local_2, _arg_1));
            };
        }

        public function onInit():void
        {
            var _local_2:Object;
            var _local_3:Object;
            onInitPetSolt();
            lvText.text = ("Lv" + petGuardObj["lvData"][_index]);
            var _local_1:int = petGuardObj["lvData"][_index];
            needText.text = "0";
            for each (_local_3 in _core.data.gameDataIndex[GamePredef.TBL_PET_GUARD][_index])
            {
                if (Number(_local_3.lev) == _local_1)
                {
                    _local_2 = _local_3;
                    needText.text = _local_3["num"];
                    break;
                };
            };
            openBtn1.enabled = true;
            if (needText.text == "0")
            {
                openBtn1.enabled = false;
            };
            nameText.text = GamePredef.GUARD_NAME[_index];
            nameAddText.text = (GamePredef.GUARD_NAME[_index] + Language.PANEL_PETGUARDINSIDE[12]);
            getProp(_local_2);
        }

        override public function initialize():void
        {
            var target:PetGuardInSidePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetGuardInSidePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetGuardInSidePanelWatcherSetupUtil");
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

        public function set p1(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3521p1;
            if (_local_2 !== _arg_1)
            {
                this._3521p1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "p1", _local_2, _arg_1));
            };
        }

        private function _PetGuardInSidePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PANEL_PETGUARDINSIDE[1];
            _local_1 = ResManager.getIconUrl(parseInt("4130220000811"));
            _local_1 = Language.PANEL_PETGUARD[3];
            _local_1 = Language.PANEL_PETGUARDINSIDE[4];
            _local_1 = Language.PANEL_PETGUARDINSIDE[5];
            _local_1 = _core.player.petguardin;
            _local_1 = Language.PANEL_PETGUARDINSIDE[14];
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Language.PANEL_PETGUARDINSIDE[6];
            _local_1 = Language.PANEL_PETGUARDINSIDE[7];
            _local_1 = Language.PANEL_PETGUARD[3];
            _local_1 = Language.PANEL_PETGUARD[3];
            _local_1 = Language.PANEL_PETGUARD[3];
            _local_1 = Language.PANEL_PETGUARD[3];
            _local_1 = Language.PANEL_PETGUARD[3];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.PANEL_PETGUARD[3];
            _local_1 = Slot.SLOT_GUARD;
            _local_1 = Language.PANEL_PETGUARDINSIDE[3];
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.PANEL_PETGUARDINSIDE[22].toString();
            _helpAlert = Alert.show(_local_1, Language.PANEL_PETGUARDINSIDE[14].toString(), Alert.YES, null, null);
        }

        public function __pet4_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(4);
        }

        [Bindable(event="propertyChange")]
        public function get mainBackImag():Image
        {
            return (this._454209194mainBackImag);
        }

        public function set lvText(_arg_1:Label):void
        {
            var _local_2:Object = this._1091440169lvText;
            if (_local_2 !== _arg_1)
            {
                this._1091440169lvText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lvText", _local_2, _arg_1));
            };
        }

        public function set nameText(_arg_1:Label):void
        {
            var _local_2:Object = this._1840576088nameText;
            if (_local_2 !== _arg_1)
            {
                this._1840576088nameText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameText", _local_2, _arg_1));
            };
        }

        public function resetPetBagSlot(_arg_1:int):*
        {
            _arg_1 = ((_index * 10) + _arg_1);
            if (((petGuardObj["petData"][_arg_1]) && (Number(petGuardObj["petData"][_arg_1]) > 0)))
            {
                _core.remote.call("putDownPet", null, _arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get openBtn1():BasicGlowButton
        {
            return (this._505171265openBtn1);
        }

        public function set nameAddText(_arg_1:Label):void
        {
            var _local_2:Object = this._975883165nameAddText;
            if (_local_2 !== _arg_1)
            {
                this._975883165nameAddText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameAddText", _local_2, _arg_1));
            };
        }

        public function openGuardInSidePanel(_arg_1:int):void
        {
            _index = _arg_1;
            initView();
            visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get p1():GuardSlot
        {
            return (this._3521p1);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            var _local_1:* = 1;
            while (_local_1 <= 5)
            {
                this[("pet" + _local_1)].sid = ((_index * 10) + _local_1);
                _local_1++;
            };
            _core.remote.call("getPetGuardData", null);
        }

        [Bindable(event="propertyChange")]
        public function get lvText():Label
        {
            return (this._1091440169lvText);
        }

        private function getProp(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Number = (_index * 10);
            var _local_3:Number = 0;
            _local_4 = 1;
            while (_local_4 <= 5)
            {
                _local_5 = (_local_2 + _local_4);
                if (((petGuardObj["petData"][_local_5]) && (petGuardObj["petData"][_local_5] > 0)))
                {
                    _local_6 = getPetColor(petGuardObj["petData"][_local_5]);
                    if (_local_6 != -1)
                    {
                        _local_3 = (Number(_local_3) + Number(PET_GUARD_INDEX_SID[(_local_2 + 1)][(_local_6 + 1)]["per"]));
                    };
                };
                _local_4++;
            };
            _local_4 = 1;
            while (_local_4 <= 4)
            {
                _local_7 = _arg_1[("propVal" + _local_4)];
                _local_7 = ((_local_7 / 10000) * (1 + (_local_3 / 100)));
                this[("showCombine" + _local_4)].text = (Language.TIP_MONSTER_H[_arg_1[("prop" + _local_4)]] + _local_7.toFixed(4));
                if (((((_arg_1[("prop" + _local_4)] == 59) || (_arg_1[("prop" + _local_4)] == 60)) || (_arg_1[("prop" + _local_4)] == 62)) || (_arg_1[("prop" + _local_4)] == 63)))
                {
                    this[("showCombine" + _local_4)].text = ((Language.TIP_MONSTER_H[_arg_1[("prop" + _local_4)]] + Number((_local_7 * 100)).toFixed(4)) + "%");
                };
                _local_4++;
            };
        }

        public function __pet1_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(1);
        }

        public function set showCombine2(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427280showCombine2;
            if (_local_2 !== _arg_1)
            {
                this._1464427280showCombine2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine2", _local_2, _arg_1));
            };
        }

        public function set showCombine3(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427279showCombine3;
            if (_local_2 !== _arg_1)
            {
                this._1464427279showCombine3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needText():Label
        {
            return (this._865666787needText);
        }

        public function set pet1(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437298pet1;
            if (_local_2 !== _arg_1)
            {
                this._3437298pet1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet1", _local_2, _arg_1));
            };
        }

        public function set showCombine1(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427281showCombine1;
            if (_local_2 !== _arg_1)
            {
                this._1464427281showCombine1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine1", _local_2, _arg_1));
            };
        }

        public function __pet5_click(_arg_1:MouseEvent):void
        {
            resetPetBagSlot(5);
        }

        public function set pet4(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437301pet4;
            if (_local_2 !== _arg_1)
            {
                this._3437301pet4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet4", _local_2, _arg_1));
            };
        }

        public function set showCombine4(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427278showCombine4;
            if (_local_2 !== _arg_1)
            {
                this._1464427278showCombine4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine4", _local_2, _arg_1));
            };
        }

        public function __openBtn1_click(_arg_1:MouseEvent):void
        {
            upInGuardSid();
        }

        [Bindable(event="propertyChange")]
        public function get showCombine2():Label
        {
            return (this._1464427280showCombine2);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine3():Label
        {
            return (this._1464427279showCombine3);
        }

        public function ___PetGuardInSidePanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        [Bindable(event="propertyChange")]
        public function get pet3():GuardSlot
        {
            return (this._3437300pet3);
        }

        public function set pet2(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437299pet2;
            if (_local_2 !== _arg_1)
            {
                this._3437299pet2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet2", _local_2, _arg_1));
            };
        }

        public function set pet3(_arg_1:GuardSlot):void
        {
            var _local_2:Object = this._3437300pet3;
            if (_local_2 !== _arg_1)
            {
                this._3437300pet3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pet3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pet1():GuardSlot
        {
            return (this._3437298pet1);
        }

        private function getPetColor(_arg_1:Number):int
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:int;
            for each (_local_2 in _core.player.petList)
            {
                if (_local_2)
                {
                    _local_3 = _core.getTemplateData(GamePredef.TBL_CREATURE, _local_2.tid, false);
                    if (!(((!(_local_3)) || (!(Number(_local_3.classIds) == 10))) || (Number(_local_3.useLv) < 50)))
                    {
                        if (_local_2.id == _arg_1)
                        {
                            _local_4 = _core.basic.colorByGrowRate(_local_2.growRate);
                            return (_local_4);
                        };
                    };
                };
            };
            return (-1);
        }

        [Bindable(event="propertyChange")]
        public function get pet5():GuardSlot
        {
            return (this._3437302pet5);
        }

        public function set needText(_arg_1:Label):void
        {
            var _local_2:Object = this._865666787needText;
            if (_local_2 !== _arg_1)
            {
                this._865666787needText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needText", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

