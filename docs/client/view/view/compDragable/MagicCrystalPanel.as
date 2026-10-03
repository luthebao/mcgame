// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MagicCrystalPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.MagicCrystalCanvas;
    import mx.controls.LinkButton;
    import mx.controls.Alert;
    import mx.controls.RadioButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.RadioButtonGroup;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.managers.PopUpManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
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

    public class MagicCrystalPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1464427280showCombine2:Label;
        private var _107869mc3:MagicCrystalCanvas;
        private var _1847394597showCombine14:Label;
        private var _1464427279showCombine3:Label;
        public var _MagicCrystalPanel_LinkButton1:LinkButton;
        private var _helpAlert:Alert;
        private var _107870mc4:MagicCrystalCanvas;
        public var _MagicCrystalPanel_RadioButton1:RadioButton;
        public var _MagicCrystalPanel_RadioButton2:RadioButton;
        private var max_num:* = 16;
        public var _MagicCrystalPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1847394594showCombine11:Label;
        private var _107867mc1:MagicCrystalCanvas;
        private var _517675181gameQuality:RadioButtonGroup;
        private var _1847394599showCombine16:Label;
        public var _MagicCrystalPanel_Label1:Label;
        public var _MagicCrystalPanel_Label2:Label;
        public var _MagicCrystalPanel_Label3:Label;
        public var _MagicCrystalPanel_Label4:Label;
        private var _1464427276showCombine6:Label;
        private var _1464427274showCombine8:Label;
        private var _1847394596showCombine13:Label;
        private var _1464427281showCombine1:Label;
        private var _1969543397titleWrapper:Canvas;
        private var _1464427278showCombine4:Label;
        private var _975883165nameAddText:Label;
        private var _1847394593showCombine10:Label;
        private var _107868mc2:MagicCrystalCanvas;
        private var _607339634pageSelector:PageSelector;
        private var firstLoad:Boolean = true;
        private var _1847394598showCombine15:Label;
        private var page_num:* = 4;
        private var _1847394595showCombine12:Label;
        public var _MagicCrystalPanel_Image1:Image;
        private var _1464427277showCombine5:Label;
        public var _MagicCrystalPanel_Label22:Label;
        public var _MagicCrystalPanel_Label23:Label;
        private var _1464427273showCombine9:Label;
        private var _1464427275showCombine7:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":660,
                    "height":530,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MagicCrystalPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":640,
                                "height":470,
                                "x":10,
                                "y":38,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_MagicCrystalPanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MagicCrystalCanvas,
                                    "id":"mc1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":34,
                                            "y":58
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MagicCrystalCanvas,
                                    "id":"mc2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":231,
                                            "y":58
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MagicCrystalCanvas,
                                    "id":"mc3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":34,
                                            "y":243
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":MagicCrystalCanvas,
                                    "id":"mc4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":231,
                                            "y":243
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "width":200,
                                            "height":105,
                                            "x":434,
                                            "y":6,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_MagicCrystalPanel_Label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":21,
                                                        "y":16,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_MagicCrystalPanel_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFF0000;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":128,
                                                        "y":36,
                                                        "width":82,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_MagicCrystalPanel_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFF00;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":128,
                                                        "y":16,
                                                        "width":82,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_MagicCrystalPanel_Label4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.fontSize = 12;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":21,
                                                        "y":36,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"_MagicCrystalPanel_RadioButton1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "groupName":"gameQuality",
                                                        "value":1,
                                                        "x":21,
                                                        "y":61,
                                                        "selected":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"_MagicCrystalPanel_RadioButton2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "groupName":"gameQuality",
                                                        "value":2,
                                                        "x":21,
                                                        "y":80
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
                                            "width":200,
                                            "height":350,
                                            "x":434,
                                            "y":114,
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
                                                        "width":180,
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
                                                        "width":153,
                                                        "x":29
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
                                                        "x":15,
                                                        "y":33,
                                                        "width":170
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":297,
                                                        "y":43,
                                                        "width":180,
                                                        "x":10,
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":5,
                                                                    "text":"Label",
                                                                    "width":158
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
                                                                    "x":12,
                                                                    "y":30,
                                                                    "text":"Label",
                                                                    "width":158
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
                                                                    "x":12,
                                                                    "y":55,
                                                                    "text":"Label",
                                                                    "width":158
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
                                                                    "x":12,
                                                                    "y":80,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":105,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":130,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":155,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":180,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":205,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":230,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":0xFF,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":280,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":305,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":330,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine15",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":355,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showCombine16",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":380,
                                                                    "text":"Label",
                                                                    "width":158
                                                                });
                                                            }
                                                        })]
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
                                        this.bottom = "20";
                                        this.horizontalCenter = "-100";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_MagicCrystalPanel_Label22",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":21,
                                            "y":16,
                                            "width":95,
                                            "height":21
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_MagicCrystalPanel_Label23",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":101,
                                            "y":16,
                                            "width":95,
                                            "height":21
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_MagicCrystalPanel_LinkButton1",
                                    "events":{"click":"___MagicCrystalPanel_LinkButton1_click"},
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
                                            "x":320,
                                            "y":15,
                                            "width":106
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var mcData:Object = {};
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MagicCrystalPanel()
        {
            mx_internal::_document = this;
            this.width = 660;
            this.height = 530;
            this.styleName = "StandardContent";
            _MagicCrystalPanel_RadioButtonGroup1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MagicCrystalPanel._watcherSetupUtil = _arg_1;
        }


        private function onUpdatePro():void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:Number;
            var _local_6:*;
            var _local_7:Number;
            var _local_1:* = 0;
            while (_local_1 < max_num)
            {
                if (mcData[_local_1])
                {
                    _local_2 = 1;
                    _local_3 = 0;
                    _local_4 = 0;
                    if (ToolKit.isEqual(mcData[_local_1]["a"], 1))
                    {
                        _local_2 = mcData[_local_1]["max"];
                        _local_3 = ToolKit.add(mcData[_local_1]["l"], mcData[_local_1]["s"]);
                        _local_4 = mcData[_local_1]["lv"];
                    };
                    _local_5 = (Math.floor((((GamePredef.MAGIC_CRYSTAL_UP[_local_1][_local_4]["v"] * _local_3) / _local_2) * 10000)) / 10000);
                    _local_6 = GamePredef.MAGIC_CRYSTAL_UP[_local_1][_local_4]["t"];
                    _local_7 = ToolKit.add(_local_1, 1);
                    this[("showCombine" + _local_7)].text = (Language.TIP_MONSTER_H[_local_6] + _local_5.toFixed(4));
                    if (((((_local_6 == 59) || (_local_6 == 60)) || (_local_6 == 62)) || (_local_6 == 63)))
                    {
                        this[("showCombine" + _local_7)].text = ((Language.TIP_MONSTER_H[_local_6] + _local_5.toFixed(4)) + "%");
                    };
                };
                _local_1++;
            };
        }

        public function set showCombine9(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427273showCombine9;
            if (_local_2 !== _arg_1)
            {
                this._1464427273showCombine9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine9", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            initView();
            visible = true;
        }

        public function ___MagicCrystalPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        [Bindable(event="propertyChange")]
        public function get showCombine5():Label
        {
            return (this._1464427277showCombine5);
        }

        public function getSelectPointType():String
        {
            return (gameQuality.selectedValue.toString());
        }

        [Bindable(event="propertyChange")]
        public function get titleWrapper():Canvas
        {
            return (this._1969543397titleWrapper);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine10():Label
        {
            return (this._1847394593showCombine10);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine13():Label
        {
            return (this._1847394596showCombine13);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine14():Label
        {
            return (this._1847394597showCombine14);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine11():Label
        {
            return (this._1847394594showCombine11);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine12():Label
        {
            return (this._1847394595showCombine12);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine15():Label
        {
            return (this._1847394598showCombine15);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine8():Label
        {
            return (this._1464427274showCombine8);
        }

        public function set showCombine8(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427274showCombine8;
            if (_local_2 !== _arg_1)
            {
                this._1464427274showCombine8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine8", _local_2, _arg_1));
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

        public function set titleWrapper(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1969543397titleWrapper;
            if (_local_2 !== _arg_1)
            {
                this._1969543397titleWrapper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleWrapper", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showCombine16():Label
        {
            return (this._1847394599showCombine16);
        }

        public function set showCombine12(_arg_1:Label):void
        {
            var _local_2:Object = this._1847394595showCombine12;
            if (_local_2 !== _arg_1)
            {
                this._1847394595showCombine12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine12", _local_2, _arg_1));
            };
        }

        public function set showCombine13(_arg_1:Label):void
        {
            var _local_2:Object = this._1847394596showCombine13;
            if (_local_2 !== _arg_1)
            {
                this._1847394596showCombine13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine13", _local_2, _arg_1));
            };
        }

        public function set showCombine10(_arg_1:Label):void
        {
            var _local_2:Object = this._1847394593showCombine10;
            if (_local_2 !== _arg_1)
            {
                this._1847394593showCombine10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine10", _local_2, _arg_1));
            };
        }

        public function set showCombine11(_arg_1:Label):void
        {
            var _local_2:Object = this._1847394594showCombine11;
            if (_local_2 !== _arg_1)
            {
                this._1847394594showCombine11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine11", _local_2, _arg_1));
            };
        }

        public function set showCombine14(_arg_1:Label):void
        {
            var _local_2:Object = this._1847394597showCombine14;
            if (_local_2 !== _arg_1)
            {
                this._1847394597showCombine14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine14", _local_2, _arg_1));
            };
        }

        public function set showCombine15(_arg_1:Label):void
        {
            var _local_2:Object = this._1847394598showCombine15;
            if (_local_2 !== _arg_1)
            {
                this._1847394598showCombine15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine15", _local_2, _arg_1));
            };
        }

        public function set showCombine16(_arg_1:Label):void
        {
            var _local_2:Object = this._1847394599showCombine16;
            if (_local_2 !== _arg_1)
            {
                this._1847394599showCombine16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine16", _local_2, _arg_1));
            };
        }

        public function set gameQuality(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._517675181gameQuality;
            if (_local_2 !== _arg_1)
            {
                this._517675181gameQuality = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gameQuality", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mc1():MagicCrystalCanvas
        {
            return (this._107867mc1);
        }

        [Bindable(event="propertyChange")]
        public function get mc2():MagicCrystalCanvas
        {
            return (this._107868mc2);
        }

        [Bindable(event="propertyChange")]
        public function get mc3():MagicCrystalCanvas
        {
            return (this._107869mc3);
        }

        [Bindable(event="propertyChange")]
        public function get mc4():MagicCrystalCanvas
        {
            return (this._107870mc4);
        }

        private function _MagicCrystalPanel_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            gameQuality = _local_1;
            _local_1.initialized(this, "gameQuality");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get nameAddText():Label
        {
            return (this._975883165nameAddText);
        }

        private function clearPage():void
        {
            var _local_1:int = 1;
            while (_local_1 <= page_num)
            {
                this[("mc" + _local_1)].visible = false;
                _local_1++;
            };
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.MAGIC_CRYSTAL_PANEL[19].toString();
            _helpAlert = Alert.show(_local_1, Language.MAGIC_CRYSTAL_PANEL[20].toString(), Alert.YES, null, null);
        }

        override public function initialize():void
        {
            var target:MagicCrystalPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MagicCrystalPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MagicCrystalPanelWatcherSetupUtil");
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

        private function _MagicCrystalPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MagicCrystalPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000897")));
            }, function (_arg_1:Object):void
            {
                _MagicCrystalPanel_Image1.source = _arg_1;
            }, "_MagicCrystalPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_Label1.text = _arg_1;
            }, "_MagicCrystalPanel_Label1.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.magiccystallimit;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_Label2.text = _arg_1;
            }, "_MagicCrystalPanel_Label2.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.magiccystalpre;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_Label3.text = _arg_1;
            }, "_MagicCrystalPanel_Label3.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_Label4.text = _arg_1;
            }, "_MagicCrystalPanel_Label4.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_RadioButton1.label = _arg_1;
            }, "_MagicCrystalPanel_RadioButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_RadioButton2.label = _arg_1;
            }, "_MagicCrystalPanel_RadioButton2.label");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                nameAddText.filters = _arg_1;
            }, "nameAddText.filters");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nameAddText.text = _arg_1;
            }, "nameAddText.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_Label22.text = _arg_1;
            }, "_MagicCrystalPanel_Label22.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.magiccystalrec;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_Label23.text = _arg_1;
            }, "_MagicCrystalPanel_Label23.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MagicCrystalPanel_LinkButton1.label = _arg_1;
            }, "_MagicCrystalPanel_LinkButton1.label");
            result[12] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get gameQuality():RadioButtonGroup
        {
            return (this._517675181gameQuality);
        }

        public function set mc2(_arg_1:MagicCrystalCanvas):void
        {
            var _local_2:Object = this._107868mc2;
            if (_local_2 !== _arg_1)
            {
                this._107868mc2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mc2", _local_2, _arg_1));
            };
        }

        public function set mc3(_arg_1:MagicCrystalCanvas):void
        {
            var _local_2:Object = this._107869mc3;
            if (_local_2 !== _arg_1)
            {
                this._107869mc3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mc3", _local_2, _arg_1));
            };
        }

        public function set mc4(_arg_1:MagicCrystalCanvas):void
        {
            var _local_2:Object = this._107870mc4;
            if (_local_2 !== _arg_1)
            {
                this._107870mc4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mc4", _local_2, _arg_1));
            };
        }

        public function set mc1(_arg_1:MagicCrystalCanvas):void
        {
            var _local_2:Object = this._107867mc1;
            if (_local_2 !== _arg_1)
            {
                this._107867mc1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mc1", _local_2, _arg_1));
            };
        }

        public function onInitMagicCrystalData(_arg_1:Object):void
        {
            if (initialized)
            {
                mcData = _arg_1;
                if (firstLoad)
                {
                    pageSelector.onPageChanged = onPageChanged;
                    pageSelector.onPageCleared = clearPage;
                    pageSelector.initPageSeletor(max_num, page_num);
                    firstLoad = false;
                };
                pageSelector.refreshPage();
                onUpdatePro();
            };
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 + _arg_1) - 1);
                mcData[_local_3].index = _local_3;
                this[("mc" + _local_4)].data = mcData[_local_3];
                this[("mc" + _local_4)].visible = true;
                _local_4++;
            };
        }

        override public function completeHandler(_arg_1:FlexEvent):void
        {
            _arg_1.currentTarget.removeEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
            initView();
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            _core.remote.call("initMagicCrystalData", null);
        }

        private function _MagicCrystalPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[0];
            _local_1 = ResManager.getIconUrl(parseInt("4130220000897"));
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[13];
            _local_1 = _core.player.magiccystallimit;
            _local_1 = _core.player.magiccystalpre;
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[14];
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[15];
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[16];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[17];
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[18];
            _local_1 = _core.player.magiccystalrec;
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[20];
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

        public function set showCombine2(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427280showCombine2;
            if (_local_2 !== _arg_1)
            {
                this._1464427280showCombine2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine2", _local_2, _arg_1));
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

        public function set showCombine5(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427277showCombine5;
            if (_local_2 !== _arg_1)
            {
                this._1464427277showCombine5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine5", _local_2, _arg_1));
            };
        }

        public function set showCombine6(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427276showCombine6;
            if (_local_2 !== _arg_1)
            {
                this._1464427276showCombine6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine6", _local_2, _arg_1));
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

        public function set showCombine7(_arg_1:Label):void
        {
            var _local_2:Object = this._1464427275showCombine7;
            if (_local_2 !== _arg_1)
            {
                this._1464427275showCombine7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCombine7", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get showCombine1():Label
        {
            return (this._1464427281showCombine1);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine6():Label
        {
            return (this._1464427276showCombine6);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine7():Label
        {
            return (this._1464427275showCombine7);
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

        [Bindable(event="propertyChange")]
        public function get showCombine4():Label
        {
            return (this._1464427278showCombine4);
        }

        [Bindable(event="propertyChange")]
        public function get showCombine9():Label
        {
            return (this._1464427273showCombine9);
        }


    }
}//package com.qeedoo.ui.view.compDragable

