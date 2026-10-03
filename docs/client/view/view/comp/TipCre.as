// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipCre

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.HBox;
    import mx.containers.ViewStack;
    import mx.controls.Image;
    import com.qeedoo.game.vo.ToolTipCreVO;
    import mx.controls.Button;
    import mx.core.Repeater;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import mx.events.ResizeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import mx.binding.RepeatableBinding;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.logic.PetLogic;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.utils.TextUtil;
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

    public class TipCre extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _TipCre_CharactorShowCanvas1:CharactorShowCanvas;
        private var _30739193attLastPoint:RoundedLabel;
        private var _1878027223_TipCre_HBox1:HBox;
        private var _900562936skill9:ItemSlot;
        private var _2142441348skillTab:ViewStack;
        private var _1638753418iconImg:Image;
        private var _900562943skill2:ItemSlot;
        public var _TipCre_RoundedLabel10:RoundedLabel;
        public var _TipCre_RoundedLabel11:RoundedLabel;
        public var _TipCre_RoundedLabel12:RoundedLabel;
        public var _TipCre_RoundedLabel13:RoundedLabel;
        public var _TipCre_RoundedLabel16:RoundedLabel;
        public var _TipCre_RoundedLabel17:RoundedLabel;
        public var _TipCre_RoundedLabel18:RoundedLabel;
        public var _TipCre_RoundedLabel19:RoundedLabel;
        private var _3769vo:ToolTipCreVO;
        private var _1498624177guardLabel:RoundedLabel;
        public var _TipCre_RoundedLabel20:RoundedLabel;
        public var _TipCre_RoundedLabel21:RoundedLabel;
        private var _900562937skill8:ItemSlot;
        private var _1270522743attEnergy:RoundedLabel;
        private var _81217999catchableLable:RoundedLabel;
        public var _TipCre_RoundedLabel22:RoundedLabel;
        private var _1554141559tabBtn0:Button;
        private var _900562940skill5:ItemSlot;
        public var _TipCre_Button1:Button;
        private var _2147319859skill13:ItemSlot;
        private var _900562944skill1:ItemSlot;
        private var _1315489237starHbox:HBox;
        private var _2147319861skill15:ItemSlot;
        private var _1554141558tabBtn1:Button;
        private var _900562938skill7:ItemSlot;
        private var _2147319858skill12:ItemSlot;
        private var _2147319860skill14:ItemSlot;
        private var _1554141557tabBtn2:Button;
        public var _TipCre_RoundedLabel2:RoundedLabel;
        public var _TipCre_RoundedLabel4:RoundedLabel;
        public var _TipCre_RoundedLabel5:RoundedLabel;
        public var _TipCre_RoundedLabel6:RoundedLabel;
        public var _TipCre_RoundedLabel8:RoundedLabel;
        private var _3540562star:Repeater;
        private var _2147319857skill11:ItemSlot;
        private var _805962357propertyPentagon:PentagonCanvas;
        public var _TipCre_RoundedLabel9:RoundedLabel;
        private var _900562941skill4:ItemSlot;
        public var _TipCre_Image1:Array;
        private var _1900777969localMap:LinkTextArea;
        private var _900562939skill6:ItemSlot;
        private var _2147319856skill10:ItemSlot;
        private var _266483816userText:RoundedLabel;
        private var _900562942skill3:ItemSlot;
        private var obj:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":259,
                    "height":328,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":CharactorShowCanvas,
                        "id":"_TipCre_CharactorShowCanvas1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":177,
                                "y":162,
                                "width":5,
                                "height":5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"starHbox",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":46.95,
                                "x":100.5,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Repeater,
                                    "id":"star",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipCre_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":10,
                                                        "height":10
                                                    });
                                                }
                                            })]});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PentagonCanvas,
                        "id":"propertyPentagon",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "height":103,
                                "y":181,
                                "x":152
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_TipCre_Button1",
                        "events":{"click":"___TipCre_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.top = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnToolTipClose",
                                "width":15,
                                "height":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"catchableLable",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF0000;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":12,
                                "y":159,
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"iconImg",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":3,
                                "y":3,
                                "width":50,
                                "height":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":56,
                                "y":6,
                                "width":149
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"userText",
                        "stylesFactory":function ():void
                        {
                            this.right = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":3});
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkTextArea,
                        "id":"localMap",
                        "stylesFactory":function ():void
                        {
                            this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":100,
                                "y":24,
                                "height":15.950004,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel4",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":44,
                                "y":127.95,
                                "text":"[光]",
                                "width":27
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel5",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":143.95,
                                "x":13
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel6",
                        "stylesFactory":function ():void
                        {
                            this.color = 0x3CFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":56,
                                "y":26.95
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"guardLabel",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.color = 0xF9F900;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "htmlText":"",
                                "x":122,
                                "y":26.95,
                                "text":"",
                                "visible":false,
                                "width":107
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel8",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":44,
                                "y":64.95,
                                "width":37,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel9",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":44,
                                "y":79.95,
                                "width":37,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel10",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "width":45,
                                "y":200.65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel11",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "y":216.65,
                                "width":45
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel12",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "y":231.65,
                                "width":45
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel13",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "y":244.65,
                                "width":45
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"attEnergy",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "y":260.65,
                                "width":45
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"attLastPoint",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":44,
                                "width":40,
                                "y":111.3
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel16",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":40,
                                "height":18,
                                "x":44,
                                "y":95.95
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel17",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":196.65,
                                "x":102,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel18",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":210.65,
                                "x":102,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel19",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":226.65,
                                "x":102,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel20",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":242.65,
                                "x":102,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel21",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":258.65,
                                "x":102,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipCre_RoundedLabel22",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 9;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":178,
                                "x":176,
                                "width":67
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"skillTab",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "y":285,
                                "x":64,
                                "width":184,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":1,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":38,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":75,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":113,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":151,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":1,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":38,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":75,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":113,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":151,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":1,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":38,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":75,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":113,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlot,
                                                "id":"skill15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "movable":false,
                                                        "x":151,
                                                        "y":0,
                                                        "styleName":"CanvasPetSkillSlot"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "stylesFactory":function ():void
                        {
                            this.cornerRadius = 2;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":11,
                                "y":294,
                                "label":"1",
                                "width":15,
                                "height":15,
                                "selected":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.cornerRadius = 2;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":29,
                                "y":294,
                                "label":"2",
                                "width":15,
                                "height":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"tabBtn2",
                        "events":{"click":"__tabBtn2_click"},
                        "stylesFactory":function ():void
                        {
                            this.cornerRadius = 2;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":47,
                                "y":294,
                                "label":"3",
                                "width":15,
                                "height":15
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

        public function TipCre()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.color = 0xFFFFFF;
            };
            this.styleName = "CanvasTipCre";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.width = 259;
            this.height = 328;
            this.addEventListener("resize", ___TipCre_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipCre._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get skill1():ItemSlot
        {
            return (this._900562944skill1);
        }

        [Bindable(event="propertyChange")]
        public function get skill2():ItemSlot
        {
            return (this._900562943skill2);
        }

        public function set skill1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562944skill1;
            if (_local_2 !== _arg_1)
            {
                this._900562944skill1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill1", _local_2, _arg_1));
            };
        }

        public function set skill2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562943skill2;
            if (_local_2 !== _arg_1)
            {
                this._900562943skill2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill4():ItemSlot
        {
            return (this._900562941skill4);
        }

        [Bindable(event="propertyChange")]
        public function get skill8():ItemSlot
        {
            return (this._900562937skill8);
        }

        public function set skill5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562940skill5;
            if (_local_2 !== _arg_1)
            {
                this._900562940skill5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill5", _local_2, _arg_1));
            };
        }

        public function set skill9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562936skill9;
            if (_local_2 !== _arg_1)
            {
                this._900562936skill9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill3():ItemSlot
        {
            return (this._900562942skill3);
        }

        public function set attEnergy(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1270522743attEnergy;
            if (_local_2 !== _arg_1)
            {
                this._1270522743attEnergy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attEnergy", _local_2, _arg_1));
            };
        }

        public function set skill3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562942skill3;
            if (_local_2 !== _arg_1)
            {
                this._900562942skill3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill3", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:Button):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill9():ItemSlot
        {
            return (this._900562936skill9);
        }

        public function set skill6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562939skill6;
            if (_local_2 !== _arg_1)
            {
                this._900562939skill6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill5():ItemSlot
        {
            return (this._900562940skill5);
        }

        [Bindable(event="propertyChange")]
        public function get skill6():ItemSlot
        {
            return (this._900562939skill6);
        }

        public function ___TipCre_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function set skillTab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._2142441348skillTab;
            if (_local_2 !== _arg_1)
            {
                this._2142441348skillTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillTab", _local_2, _arg_1));
            };
        }

        public function set iconImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1638753418iconImg;
            if (_local_2 !== _arg_1)
            {
                this._1638753418iconImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImg", _local_2, _arg_1));
            };
        }

        public function set skill7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562938skill7;
            if (_local_2 !== _arg_1)
            {
                this._900562938skill7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill7", _local_2, _arg_1));
            };
        }

        public function set skill8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562937skill8;
            if (_local_2 !== _arg_1)
            {
                this._900562937skill8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill8", _local_2, _arg_1));
            };
        }

        public function set skill4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._900562941skill4;
            if (_local_2 !== _arg_1)
            {
                this._900562941skill4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill4", _local_2, _arg_1));
            };
        }

        public function set tabBtn0(_arg_1:Button):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        private function skillTabBtnClick(_arg_1:int):void
        {
            skillTab.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= (skillTab.numChildren - 1))
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

        [Bindable(event="propertyChange")]
        public function get skill15():ItemSlot
        {
            return (this._2147319861skill15);
        }

        [Bindable(event="propertyChange")]
        public function get skill10():ItemSlot
        {
            return (this._2147319856skill10);
        }

        [Bindable(event="propertyChange")]
        public function get skill12():ItemSlot
        {
            return (this._2147319858skill12);
        }

        private function _TipCre_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = vo.urlRes;
            _local_1 = vo.color;
            _local_1 = star.currentItem;
            _local_1 = vo.btnVisible;
            _local_1 = vo.catchable;
            _local_1 = vo.urlIcon;
            _local_1 = vo.name;
            _local_1 = vo.name;
            _local_1 = vo.petColor;
            _local_1 = vo.element;
            _local_1 = vo.elementInfo;
            _local_1 = vo.className;
            _local_1 = vo.classInfo;
            _local_1 = vo.bind;
            _local_1 = vo.bind;
            _local_1 = vo.level;
            _local_1 = vo.close;
            _local_1 = vo.attStr;
            _local_1 = vo.attAgi;
            _local_1 = vo.attSta;
            _local_1 = vo.attInt;
            _local_1 = vo.attSpr;
            _local_1 = vo.attLast;
            _local_1 = vo.life;
            _local_1 = vo.aptStr;
            _local_1 = vo.aptAgi;
            _local_1 = vo.aptSta;
            _local_1 = vo.aptInt;
            _local_1 = vo.aptSpr;
            _local_1 = vo.growRate;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill1;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill2;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill3;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill4;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill5;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill6;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill7;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill8;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill9;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill10;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill11;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill12;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill13;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill14;
            _local_1 = GamePredef.TBL_SKILL;
            _local_1 = vo.skill15;
        }

        [Bindable(event="propertyChange")]
        public function get _TipCre_HBox1():HBox
        {
            return (this._1878027223_TipCre_HBox1);
        }

        [Bindable(event="propertyChange")]
        public function get skill13():ItemSlot
        {
            return (this._2147319859skill13);
        }

        [Bindable(event="propertyChange")]
        public function get skill14():ItemSlot
        {
            return (this._2147319860skill14);
        }

        public function set userText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._266483816userText;
            if (_local_2 !== _arg_1)
            {
                this._266483816userText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userText", _local_2, _arg_1));
            };
        }

        private function setTemp(_arg_1:Object):void
        {
            starHbox.visible = false;
            guardLabel.visible = false;
        }

        private function setTreasure(_arg_1:Object):void
        {
            vo.growRate = (_arg_1.slotData.q / 10).toString();
            vo.aptStr = (_arg_1.temp.aptStrength.toString() + "±20%");
            vo.aptAgi = (_arg_1.temp.aptAgility.toString() + "±20%");
            vo.aptSta = (_arg_1.temp.aptStamina.toString() + "±20%");
            vo.aptInt = (_arg_1.temp.aptIntelligence.toString() + "±20%");
            vo.aptSpr = (_arg_1.temp.aptEnergy.toString() + "±20%");
            if (ToolKit.isEqual(_arg_1.slotData.b, 0))
            {
                vo.bind = Language.TIPCRE_S[7];
            }
            else
            {
                if (ToolKit.isEqual(_arg_1.slotData.b, 1))
                {
                    vo.bind = Language.TIPCRE_S[8];
                };
            };
            starHbox.visible = false;
            guardLabel.visible = false;
            vo.petColor = GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate((_arg_1.slotData.q / 10))];
        }

        public function set skill10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2147319856skill10;
            if (_local_2 !== _arg_1)
            {
                this._2147319856skill10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get guardLabel():RoundedLabel
        {
            return (this._1498624177guardLabel);
        }

        public function set _TipCre_HBox1(_arg_1:HBox):void
        {
            var _local_2:Object = this._1878027223_TipCre_HBox1;
            if (_local_2 !== _arg_1)
            {
                this._1878027223_TipCre_HBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TipCre_HBox1", _local_2, _arg_1));
            };
        }

        public function set skill12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2147319858skill12;
            if (_local_2 !== _arg_1)
            {
                this._2147319858skill12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill12", _local_2, _arg_1));
            };
        }

        public function set skill14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2147319860skill14;
            if (_local_2 !== _arg_1)
            {
                this._2147319860skill14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get star():Repeater
        {
            return (this._3540562star);
        }

        [Bindable(event="propertyChange")]
        public function get propertyPentagon():PentagonCanvas
        {
            return (this._805962357propertyPentagon);
        }

        [Bindable(event="propertyChange")]
        public function get catchableLable():RoundedLabel
        {
            return (this._81217999catchableLable);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(0);
        }

        public function set skill15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2147319861skill15;
            if (_local_2 !== _arg_1)
            {
                this._2147319861skill15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill15", _local_2, _arg_1));
            };
        }

        public function ___TipCre_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        public function set catchableLable(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._81217999catchableLable;
            if (_local_2 !== _arg_1)
            {
                this._81217999catchableLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "catchableLable", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:Button):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set skill13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2147319859skill13;
            if (_local_2 !== _arg_1)
            {
                this._2147319859skill13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get attEnergy():RoundedLabel
        {
            return (this._1270522743attEnergy);
        }

        private function _TipCre_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.urlRes;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_CharactorShowCanvas1.url = _arg_1;
            }, "_TipCre_CharactorShowCanvas1.url");
            result[0] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.color);
            }, function (_arg_1:Number):void
            {
                _TipCre_CharactorShowCanvas1.color = _arg_1;
            }, "_TipCre_CharactorShowCanvas1.color");
            result[1] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (star.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _TipCre_Image1[_arg_2[0]].source = _arg_1;
            }, "_TipCre_Image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.btnVisible);
            }, function (_arg_1:Boolean):void
            {
                _TipCre_Button1.visible = _arg_1;
            }, "_TipCre_Button1.visible");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.catchable;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                catchableLable.text = _arg_1;
            }, "catchableLable.text");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.urlIcon);
            }, function (_arg_1:Object):void
            {
                iconImg.source = _arg_1;
            }, "iconImg.source");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel2.htmlText = _arg_1;
            }, "_TipCre_RoundedLabel2.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel2.text = _arg_1;
            }, "_TipCre_RoundedLabel2.text");
            result[7] = binding;
            binding = new Binding(this, function ():uint
            {
                return (vo.petColor);
            }, function (_arg_1:uint):void
            {
                _TipCre_RoundedLabel2.setStyle("color", _arg_1);
            }, "_TipCre_RoundedLabel2.color");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.element;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel4.htmlText = _arg_1;
            }, "_TipCre_RoundedLabel4.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.elementInfo;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel4.toolTip = _arg_1;
            }, "_TipCre_RoundedLabel4.toolTip");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.className;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel5.text = _arg_1;
            }, "_TipCre_RoundedLabel5.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.classInfo;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel5.toolTip = _arg_1;
            }, "_TipCre_RoundedLabel5.toolTip");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bind;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel6.htmlText = _arg_1;
            }, "_TipCre_RoundedLabel6.htmlText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bind;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel6.text = _arg_1;
            }, "_TipCre_RoundedLabel6.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel8.text = _arg_1;
            }, "_TipCre_RoundedLabel8.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.close;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel9.text = _arg_1;
            }, "_TipCre_RoundedLabel9.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.attStr;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel10.text = _arg_1;
            }, "_TipCre_RoundedLabel10.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.attAgi;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel11.text = _arg_1;
            }, "_TipCre_RoundedLabel11.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.attSta;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel12.text = _arg_1;
            }, "_TipCre_RoundedLabel12.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.attInt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel13.text = _arg_1;
            }, "_TipCre_RoundedLabel13.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.attSpr;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                attEnergy.text = _arg_1;
            }, "attEnergy.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.attLast;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                attLastPoint.text = _arg_1;
            }, "attLastPoint.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.life;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel16.text = _arg_1;
            }, "_TipCre_RoundedLabel16.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.aptStr;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel17.text = _arg_1;
            }, "_TipCre_RoundedLabel17.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.aptAgi;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel18.text = _arg_1;
            }, "_TipCre_RoundedLabel18.text");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.aptSta;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel19.text = _arg_1;
            }, "_TipCre_RoundedLabel19.text");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.aptInt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel20.text = _arg_1;
            }, "_TipCre_RoundedLabel20.text");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.aptSpr;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel21.text = _arg_1;
            }, "_TipCre_RoundedLabel21.text");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.growRate;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipCre_RoundedLabel22.text = _arg_1;
            }, "_TipCre_RoundedLabel22.text");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill1.type = _arg_1;
            }, "skill1.type");
            result[30] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill1);
            }, function (_arg_1:Number):void
            {
                skill1.giid = _arg_1;
            }, "skill1.giid");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill2.type = _arg_1;
            }, "skill2.type");
            result[32] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill2);
            }, function (_arg_1:Number):void
            {
                skill2.giid = _arg_1;
            }, "skill2.giid");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill3.type = _arg_1;
            }, "skill3.type");
            result[34] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill3);
            }, function (_arg_1:Number):void
            {
                skill3.giid = _arg_1;
            }, "skill3.giid");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill4.type = _arg_1;
            }, "skill4.type");
            result[36] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill4);
            }, function (_arg_1:Number):void
            {
                skill4.giid = _arg_1;
            }, "skill4.giid");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill5.type = _arg_1;
            }, "skill5.type");
            result[38] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill5);
            }, function (_arg_1:Number):void
            {
                skill5.giid = _arg_1;
            }, "skill5.giid");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill6.type = _arg_1;
            }, "skill6.type");
            result[40] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill6);
            }, function (_arg_1:Number):void
            {
                skill6.giid = _arg_1;
            }, "skill6.giid");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill7.type = _arg_1;
            }, "skill7.type");
            result[42] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill7);
            }, function (_arg_1:Number):void
            {
                skill7.giid = _arg_1;
            }, "skill7.giid");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill8.type = _arg_1;
            }, "skill8.type");
            result[44] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill8);
            }, function (_arg_1:Number):void
            {
                skill8.giid = _arg_1;
            }, "skill8.giid");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill9.type = _arg_1;
            }, "skill9.type");
            result[46] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill9);
            }, function (_arg_1:Number):void
            {
                skill9.giid = _arg_1;
            }, "skill9.giid");
            result[47] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill10.type = _arg_1;
            }, "skill10.type");
            result[48] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill10);
            }, function (_arg_1:Number):void
            {
                skill10.giid = _arg_1;
            }, "skill10.giid");
            result[49] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill11.type = _arg_1;
            }, "skill11.type");
            result[50] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill11);
            }, function (_arg_1:Number):void
            {
                skill11.giid = _arg_1;
            }, "skill11.giid");
            result[51] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill12.type = _arg_1;
            }, "skill12.type");
            result[52] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill12);
            }, function (_arg_1:Number):void
            {
                skill12.giid = _arg_1;
            }, "skill12.giid");
            result[53] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill13.type = _arg_1;
            }, "skill13.type");
            result[54] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill13);
            }, function (_arg_1:Number):void
            {
                skill13.giid = _arg_1;
            }, "skill13.giid");
            result[55] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill14.type = _arg_1;
            }, "skill14.type");
            result[56] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill14);
            }, function (_arg_1:Number):void
            {
                skill14.giid = _arg_1;
            }, "skill14.giid");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_SKILL);
            }, function (_arg_1:int):void
            {
                skill15.type = _arg_1;
            }, "skill15.type");
            result[58] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.skill15);
            }, function (_arg_1:Number):void
            {
                skill15.giid = _arg_1;
            }, "skill15.giid");
            result[59] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get skillTab():ViewStack
        {
            return (this._2142441348skillTab);
        }

        public function set skill11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2147319857skill11;
            if (_local_2 !== _arg_1)
            {
                this._2147319857skill11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill11", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:TipCre;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipCre_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipCreWatcherSetupUtil");
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
        public function get iconImg():Image
        {
            return (this._1638753418iconImg);
        }

        [Bindable(event="propertyChange")]
        public function get skill11():ItemSlot
        {
            return (this._2147319857skill11);
        }

        public function set guardLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1498624177guardLabel;
            if (_local_2 !== _arg_1)
            {
                this._1498624177guardLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guardLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get userText():RoundedLabel
        {
            return (this._266483816userText);
        }

        [Bindable(event="propertyChange")]
        public function get skill7():ItemSlot
        {
            return (this._900562938skill7);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():Button
        {
            return (this._1554141559tabBtn0);
        }

        public function set object(_arg_1:Object):void
        {
            vo = new ToolTipCreVO();
            setCommon(_arg_1);
            if (((_arg_1.slotType == Slot.SLOT_TREASURE) || (_arg_1.slotType == Slot.SLOT_LOTTO)))
            {
                setTreasure(_arg_1);
            }
            else
            {
                if (_arg_1.type == BasicToolTip.TYPE_TEMP)
                {
                    setTemp(_arg_1);
                }
                else
                {
                    setInst(_arg_1);
                };
            };
        }

        public function set starHbox(_arg_1:HBox):void
        {
            var _local_2:Object = this._1315489237starHbox;
            if (_local_2 !== _arg_1)
            {
                this._1315489237starHbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starHbox", _local_2, _arg_1));
            };
        }

        public function set star(_arg_1:Repeater):void
        {
            var _local_2:Object = this._3540562star;
            if (_local_2 !== _arg_1)
            {
                this._3540562star = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipCreVO
        {
            return (this._3769vo);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(1);
        }

        private function set vo(_arg_1:ToolTipCreVO):void
        {
            var _local_2:Object = this._3769vo;
            if (_local_2 !== _arg_1)
            {
                this._3769vo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vo", _local_2, _arg_1));
            };
        }

        private function setInst(_arg_1:Object):void
        {
            var _local_14:int;
            var _local_15:*;
            var _local_16:Array;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Number;
            var _local_21:Number;
            var _local_22:RegExp;
            var _local_23:int;
            var _local_24:Number;
            var _local_25:Number;
            var _local_26:Number;
            var _local_27:Number;
            var _local_28:Number;
            guardLabel.visible = false;
            vo.name = _arg_1.inst.petName;
            if (((_core.player) && (_core.player.petGuardData)))
            {
                _local_14 = _arg_1.inst.id;
                for (_local_15 in _core.player.petGuardData["petData"])
                {
                    if (((_core.player.petGuardData["petData"][_local_15] == _local_14) && (!(_local_14 == 0))))
                    {
                        if (_local_15 < 10)
                        {
                            guardLabel.htmlText = GamePredef.GUARD_NAME[_local_15];
                            guardLabel.text = GamePredef.GUARD_NAME[_local_15];
                            guardLabel.visible = true;
                        }
                        else
                        {
                            _local_15 = (Math.floor((_local_15 / 10)) * 10);
                            guardLabel.text = GamePredef.GUARD_NAME[_local_15];
                            guardLabel.htmlText = GamePredef.GUARD_NAME[_local_15];
                            guardLabel.visible = true;
                        };
                        break;
                    };
                };
            };
            vo.level = PetLogic.expToLv(_arg_1.inst.exp);
            vo.close = _arg_1.inst.close;
            vo.attStr = _arg_1.inst.attStrength;
            vo.attAgi = _arg_1.inst.attAgility;
            vo.attSta = _arg_1.inst.attStamina;
            vo.attInt = _arg_1.inst.attIntelligence;
            vo.attSpr = _arg_1.inst.attEnergy;
            vo.attLast = _arg_1.inst.attLastPoint;
            var _local_2:int = (((_arg_1.inst) && (_arg_1.inst.element)) ? _arg_1.inst.element : 0);
            vo.element = (((("<font color='" + GamePredef.ELEMENT_COLOR[_local_2]) + "'>") + GamePredef.ELEMENT_NAME[_local_2]) + "</font>");
            vo.elementInfo = GamePredef.ELEMENT_INFO[_local_2];
            var _local_3:Number = 0;
            if (_arg_1.inst.upgradeNum == 9)
            {
                _local_3 = (Number(_arg_1.inst.growRateAdd) + 0.1);
            }
            else
            {
                if (_arg_1.inst.upgradeNum == 10)
                {
                    _local_3 = (Number(_arg_1.inst.growRateAdd) + 0.3);
                }
                else
                {
                    if (_arg_1.inst.upgradeNum == 11)
                    {
                        _local_3 = (Number(_arg_1.inst.growRateAdd) + 0.35);
                    }
                    else
                    {
                        if (_arg_1.inst.upgradeNum == 12)
                        {
                            _local_3 = (Number(_arg_1.inst.growRateAdd) + 0.4);
                        }
                        else
                        {
                            _local_3 = Number(_arg_1.inst.growRateAdd);
                        };
                    };
                };
            };
            var _local_4:Number = ToolKit.add(_arg_1.inst.growRate, _local_3);
            vo.growRate = ((_arg_1.inst.growRate + "+") + (Math.round((_local_3 * 100)) / 100).toString());
            var _local_5:Number = ((Number(_arg_1.inst.aptStrengthEx)) || (0));
            var _local_6:Number = ((Number(_arg_1.inst.aptAgilityEx)) || (0));
            var _local_7:Number = ((Number(_arg_1.inst.aptStaminaEx)) || (0));
            var _local_8:Number = ((Number(_arg_1.inst.aptIntelligenceEx)) || (0));
            var _local_9:Number = ((Number(_arg_1.inst.aptEnergyEx)) || (0));
            if (!_arg_1.inst.envo)
            {
                vo.aptStr = Math.round(((Number(_arg_1.inst.aptStrength) + _local_5) * _local_4)).toString();
                vo.aptAgi = Math.round(((Number(_arg_1.inst.aptAgility) + _local_6) * _local_4)).toString();
                vo.aptSta = Math.round(((Number(_arg_1.inst.aptStamina) + _local_7) * _local_4)).toString();
                vo.aptInt = Math.round(((Number(_arg_1.inst.aptIntelligence) + _local_8) * _local_4)).toString();
                vo.aptSpr = Math.round(((Number(_arg_1.inst.aptEnergy) + _local_9) * _local_4)).toString();
            }
            else
            {
                _local_16 = String(_arg_1.inst.envo).split(",");
                _local_17 = 0;
                _local_18 = 0;
                _local_19 = 0;
                _local_20 = 0;
                _local_21 = 0;
                _local_22 = /\d+/;
                _local_23 = 0;
                while (_local_23 < _local_16.length)
                {
                    if (_local_16[_local_23].indexOf("aptStrengthEvolution") >= 0)
                    {
                        _local_17 = Number(_local_16[_local_23].match(_local_22));
                    }
                    else
                    {
                        if (_local_16[_local_23].indexOf("aptAgilityEvolution") >= 0)
                        {
                            _local_18 = Number(_local_16[_local_23].match(_local_22));
                        }
                        else
                        {
                            if (_local_16[_local_23].indexOf("aptStaminaEvolution") >= 0)
                            {
                                _local_19 = Number(_local_16[_local_23].match(_local_22));
                            }
                            else
                            {
                                if (_local_16[_local_23].indexOf("aptIntelligenceEvolution") >= 0)
                                {
                                    _local_20 = Number(_local_16[_local_23].match(_local_22));
                                }
                                else
                                {
                                    if (_local_16[_local_23].indexOf("aptEnergyEvolution") >= 0)
                                    {
                                        _local_21 = Number(_local_16[_local_23].match(_local_22));
                                    };
                                };
                            };
                        };
                    };
                    _local_23++;
                };
                vo.aptStr = Math.round((((Number(_arg_1.inst.aptStrength) + _local_5) + _local_17) * _local_4)).toString();
                vo.aptAgi = Math.round((((Number(_arg_1.inst.aptAgility) + _local_6) + _local_18) * _local_4)).toString();
                vo.aptSta = Math.round((((Number(_arg_1.inst.aptStamina) + _local_7) + _local_19) * _local_4)).toString();
                vo.aptInt = Math.round((((Number(_arg_1.inst.aptIntelligence) + _local_8) + _local_20) * _local_4)).toString();
                vo.aptSpr = Math.round((((Number(_arg_1.inst.aptEnergy) + _local_9) + _local_21) * _local_4)).toString();
            };
            getCatchAble(_arg_1);
            vo.life = _arg_1.inst.life;
            if (ToolKit.isEqual(_arg_1.inst.binded, 0))
            {
                vo.bind = Language.TIPCRE_S[7];
            }
            else
            {
                if (ToolKit.isEqual(_arg_1.inst.binded, 1))
                {
                    vo.bind = Language.TIPCRE_S[8];
                };
            };
            var _local_10:int = 1;
            while (_local_10 <= 15)
            {
                if (_arg_1.inst[("skill" + _local_10)] > 0)
                {
                    vo[("skill" + _local_10)] = _arg_1.inst[("skill" + _local_10)];
                }
                else
                {
                    if (vo[("skill" + _local_10)] > 0)
                    {
                        vo[("skill" + _local_10)] = -1;
                    };
                };
                _local_10++;
            };
            vo.star = _arg_1.inst.upgradeNum;
            starHbox.visible = true;
            var _local_11:Array = [];
            var _local_12:int = 1;
            while (_local_12 <= 12)
            {
                _local_11[_local_12] = ResManager.ICON_PET_STAR_DARK;
                if (ToolKit.isSmallOrEqual(_local_12, _arg_1.inst.upgradeNum))
                {
                    _local_11[_local_12] = ResManager.ICON_PET_STAR_LIGHT;
                };
                _local_12++;
            };
            star.dataProvider = _local_11;
            var _local_13:String = Language.TIPCRE_S[9].toString().replace("{value.inst.upgradeNum}", _arg_1.inst.upgradeNum);
            starHbox.toolTip = _local_13;
            vo.petColor = GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_arg_1.inst.growRate)];
            propertyPentagon.setName = [Language.TIPCRE_S[2], Language.TIPCRE_S[3], Language.TIPCRE_S[4], Language.TIPCRE_S[5], Language.TIPCRE_S[6]];
            if (!_arg_1.inst.envo)
            {
                propertyPentagon.showProperty(10000, [Number(_arg_1.inst.aptStrength), Number(_arg_1.inst.aptAgility), Number(_arg_1.inst.aptStamina), Number(_arg_1.inst.aptIntelligence), Number(_arg_1.inst.aptEnergy)], [vo.aptStr, vo.aptAgi, vo.aptSta, vo.aptInt, vo.aptSpr]);
            }
            else
            {
                _local_16 = String(_arg_1.inst.envo).split(",");
                _local_24 = 0;
                _local_25 = 0;
                _local_26 = 0;
                _local_27 = 0;
                _local_28 = 0;
                _local_22 = /\d+/;
                _local_23 = 0;
                while (_local_23 < _local_16.length)
                {
                    if (_local_16[_local_23].indexOf("aptStrengthEvolution") >= 0)
                    {
                        _local_24 = Number(_local_16[_local_23].match(_local_22));
                    }
                    else
                    {
                        if (_local_16[_local_23].indexOf("aptAgilityEvolution") >= 0)
                        {
                            _local_25 = Number(_local_16[_local_23].match(_local_22));
                        }
                        else
                        {
                            if (_local_16[_local_23].indexOf("aptStaminaEvolution") >= 0)
                            {
                                _local_26 = Number(_local_16[_local_23].match(_local_22));
                            }
                            else
                            {
                                if (_local_16[_local_23].indexOf("aptIntelligenceEvolution") >= 0)
                                {
                                    _local_27 = Number(_local_16[_local_23].match(_local_22));
                                }
                                else
                                {
                                    if (_local_16[_local_23].indexOf("aptEnergyEvolution") >= 0)
                                    {
                                        _local_28 = Number(_local_16[_local_23].match(_local_22));
                                    };
                                };
                            };
                        };
                    };
                    _local_23++;
                };
                propertyPentagon.showProperty(10000, [(Number(_arg_1.inst.aptStrength) + _local_24), (Number(_arg_1.inst.aptAgility) + _local_25), (Number(_arg_1.inst.aptStamina) + _local_26), (Number(_arg_1.inst.aptIntelligence) + _local_27), (Number(_arg_1.inst.aptEnergy) + _local_28)], [vo.aptStr, vo.aptAgi, vo.aptSta, vo.aptInt, vo.aptSpr]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():Button
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get starHbox():HBox
        {
            return (this._1315489237starHbox);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():Button
        {
            return (this._1554141557tabBtn2);
        }

        public function set propertyPentagon(_arg_1:PentagonCanvas):void
        {
            var _local_2:Object = this._805962357propertyPentagon;
            if (_local_2 !== _arg_1)
            {
                this._805962357propertyPentagon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propertyPentagon", _local_2, _arg_1));
            };
        }

        private function setCommon(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Array;
            var _local_6:int;
            var _local_7:String;
            tabBtn0.toolTip = Language.TIPCRE_S[12];
            tabBtn1.toolTip = Language.TIPCRE_S[13];
            tabBtn2.toolTip = Language.TIPCRE_S[14];
            vo.btnVisible = _arg_1.btnVisible;
            vo.name = String(((_arg_1.temp.name) || (""))).split("【")[0];
            vo.className = (GamePredef.CREATURE_QLEVEL[_arg_1.temp.qLevel] + GamePredef.CREATURE_CLASS_NAME[_arg_1.temp.classId]);
            vo.classInfo = GamePredef.CREATURE_CLASS_INFO[_arg_1.temp.classId];
            vo.urlIcon = ResManager.getIconUrl(_arg_1.temp.iconCode);
            vo.urlRes = ResManager.getResUrl(_arg_1.temp.resCode);
            if (((_arg_1.inst) && (_arg_1.inst.colorCode)))
            {
                vo.color = _arg_1.inst.colorCode;
            }
            else
            {
                vo.color = _arg_1.temp.colorCode;
            };
            vo.petColor = GamePredef.CODE_ITEM_COLOR[0];
            vo.useLv = _arg_1.temp.useLv;
            userText.text = Language.TIPCRE_S[11].toString().replace("{vo.useLv}", vo.useLv);
            localMap.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            var _local_2:* = "";
            localMap.text = "";
            for each (_local_3 in GameData.d[GamePredef.TBL_MAP_CREATURE])
            {
                if (_local_3.cid == _arg_1.temp.id)
                {
                    if (_local_2.indexOf(_local_3.mid) < 0)
                    {
                        _local_2 = (_local_2 + (_local_3.mid + "|"));
                    };
                    _local_4 = "";
                    if (!_local_2)
                    {
                        localMap.text = "";
                    }
                    else
                    {
                        _local_5 = _local_2.split("|");
                        for each (_local_6 in _local_5)
                        {
                            if (GameData.d[GamePredef.TBL_MAP][_local_6])
                            {
                                _local_4 = (_local_4 + TextUtil.getMapHtml(_local_6));
                            };
                        };
                        _local_7 = Language.TIPCRE_S[0].toString().replace("{mapName}", _local_4);
                        localMap.htmlText = (("<font color='#FFFFFF'>" + _local_7) + "</font>");
                        localMap.visible = true;
                    };
                };
            };
            ResManager.setColorCode(iconImg, vo.color);
            vo.level = 1;
            vo.close = 100;
            vo.catchable = ((_arg_1.temp.catchable == 0) ? Language.TIPCRE_S[1] : Language.TIPCRE_S[15].replace("{value}", _arg_1.temp.catchable));
            if (_arg_1.temp.catchable == 0)
            {
                catchableLable.setStyle("color", "0xFF0000");
            }
            else
            {
                catchableLable.setStyle("color", "0x00FF00");
            };
            if (_arg_1.temp.catchable == 0)
            {
                userText.text = "";
            };
            vo.element = (((("<font color='" + GamePredef.ELEMENT_COLOR[_arg_1.temp.element]) + "'>") + GamePredef.ELEMENT_NAME[_arg_1.temp.element]) + "</font>");
            vo.elementInfo = GamePredef.ELEMENT_INFO[_arg_1.temp.element];
            vo.attStr = _arg_1.temp.attStrength;
            vo.attAgi = _arg_1.temp.attAgility;
            vo.attSta = _arg_1.temp.attStamina;
            vo.attInt = _arg_1.temp.attIntelligence;
            vo.attSpr = _arg_1.temp.attEnergy;
            vo.aptStr = _arg_1.temp.aptStrength;
            vo.aptAgi = _arg_1.temp.aptAgility;
            vo.aptSta = _arg_1.temp.aptStamina;
            vo.aptInt = _arg_1.temp.aptIntelligence;
            vo.aptSpr = _arg_1.temp.aptEnergy;
            vo.growRate = _arg_1.temp.growBase;
            vo.star = 0;
            vo.life = _arg_1.temp.life;
            propertyPentagon.setName = [Language.TIPCRE_S[2], Language.TIPCRE_S[3], Language.TIPCRE_S[4], Language.TIPCRE_S[5], Language.TIPCRE_S[6]];
            propertyPentagon.showProperty(10000, [_arg_1.temp.aptStrength, _arg_1.temp.aptAgility, _arg_1.temp.aptStamina, _arg_1.temp.aptIntelligence, _arg_1.temp.aptEnergy]);
        }

        [Bindable(event="propertyChange")]
        public function get localMap():LinkTextArea
        {
            return (this._1900777969localMap);
        }

        public function set attLastPoint(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._30739193attLastPoint;
            if (_local_2 !== _arg_1)
            {
                this._30739193attLastPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attLastPoint", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(2);
        }

        [Bindable(event="propertyChange")]
        public function get attLastPoint():RoundedLabel
        {
            return (this._30739193attLastPoint);
        }

        public function set localMap(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1900777969localMap;
            if (_local_2 !== _arg_1)
            {
                this._1900777969localMap = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "localMap", _local_2, _arg_1));
            };
        }

        private function getCatchAble(_arg_1:Object):void
        {
            if (_arg_1.temp.catchable == 0)
            {
                vo.catchable = Language.TIPCRE_S[1];
                return;
            };
            if ((vo.level - _core.player.level) >= 5)
            {
                vo.catchable = Language.TIPCRE_S[10];
                return;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

