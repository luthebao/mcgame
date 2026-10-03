// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipEquip

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.containers.VBox;
    import mx.controls.Image;
    import mx.core.Repeater;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.controls.Label;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.system.Core;
    import mx.states.RemoveChild;
    import mx.states.SetProperty;
    import mx.controls.Button;
    import mx.containers.HBox;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.net.Responder;
    import com.qeedoo.game.event.GameDataEvent;
    import mx.events.ResizeEvent;
    import mx.binding.Binding;
    import flash.display.DisplayObject;
    import mx.binding.RepeatableBinding;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.states.State;
    import mx.binding.BindingManager;
    import mx.collections.ArrayCollection;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.game.utils.JSONUtil;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.LanguageUtil;
    import com.qeedoo.ui.view.compDragable.ProductPanel;
    import com.qeedoo.ui.view.compDragable.EquiptFuncPanel;
    import com.qeedoo.game.view.ViewManager;
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

    public class TipEquip extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _993674992propSuit:Text;
        private var _285513520magicWeaponAdditional:VBox;
        private var _1716723311petStone5:Image;
        private var _1318946322artifactSkillStr:Text;
        private var _1638753418iconImg:Image;
        private var _81196151magicWeaponSkill1:Repeater;
        private var _994192832propBind:Text;
        private var _81196152magicWeaponSkill0:Text;
        private var _955531502_TipEquip_VBox2:VBox;
        private var _1565378349petStoneText:Text;
        private var _1716723309petStone3:Image;
        private var _849270234tipContainer:VBox;
        private var _3769vo:ToolTipVO;
        public var _TipEquip_Text1:Text;
        public var _TipEquip_Text2:Text;
        public var _TipEquip_Text6:Text;
        private var _1311839802tipName:Label;
        private var _959581682qiling:Text;
        private var _714532018artifactSubSkillStr:Text;
        private var _99346des:Label;
        private var dm:DataManager;
        private var _core:Core;
        public var _TipEquip_Label2:Label;
        private var _1298740563endure:Text;
        public var _TipEquip_Label6:Label;
        public var _TipEquip_Label3:Label;
        private var _431118970reqLevel:Text;
        public var _TipEquip_RemoveChild1:RemoveChild;
        private var _1716723310petStone4:Image;
        private var obj:Object;
        public var _TipEquip_Text13:Array;
        public var _TipEquip_Text17:Text;
        public var _TipEquip_Text19:Text;
        private var _1095316408currencyPrice:Currency;
        private var _1716723308petStone2:Image;
        public var _TipEquip_Image2:Image;
        public var _TipEquip_Image3:Image;
        public var _TipEquip_Image4:Image;
        public var _TipEquip_Image5:Image;
        public var _TipEquip_Image6:Image;
        public var _TipEquip_Image7:Image;
        public var _TipEquip_Image8:Image;
        public var _TipEquip_Image9:Image;
        private var _1716723312petStone6:Image;
        public var _TipEquip_Image10:Image;
        public var _TipEquip_Image11:Image;
        public var _TipEquip_Image12:Image;
        public var _TipEquip_Image13:Array;
        private var _549739330canSell:Label;
        private var _302557384petStoneSkillText:Text;
        public var _TipEquip_Image20:Image;
        public var _TipEquip_Image21:Image;
        public var _TipEquip_Image22:Image;
        public var _TipEquip_Image23:Image;
        public var _TipEquip_Image24:Image;
        public var _TipEquip_Image25:Image;
        public var _TipEquip_Image26:Image;
        public var _TipEquip_Image27:Image;
        public var _TipEquip_Image29:Image;
        public var _TipEquip_Image28:Image;
        public var _TipEquip_SetProperty2:SetProperty;
        private var _993680394propSoul:Text;
        private var _267844315magicWeaponLevel:Text;
        private var _148001439useType:Text;
        private var _1449103471jewelInfo:Text;
        public var _TipEquip_Button1:Button;
        private var _1590276251petStoneContainer:HBox;
        private var _1202564229jewelCanvas:Canvas;
        private var _1887817563sublimation:Text;
        private var _1716723307petStone1:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"tipContainer",
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":57,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"tipName",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":5,
                                                        "text":"完美的什么装备名字[金]"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipEquip_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0x3CFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2,
                                                        "y":39,
                                                        "text":"已绑定"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipEquip_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.right = "5";
                                                    this.color = 16766552;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":38,
                                                        "text":"名字最长的人打造",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"iconImg",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":5,
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":46,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":74,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":88,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":102,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":115.75,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":129.5,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":143,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":156.75,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":170.75,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"_TipEquip_Button1",
                                                "events":{"click":"___TipEquip_Button1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "styleName":"BtnToolTipClose",
                                                        "width":15,
                                                        "height":15
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipEquip_Text1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16773307;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备描述"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipEquip_Text2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备位置: 主手"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"useType",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"使用对象: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"reqLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"等级需求: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"magicWeaponLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"神器等级: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipEquip_Text6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"物理攻击: 9999"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"endure",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备耐久: 9999/9999"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"propBind",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"绑定属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"propSoul",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"灵魂属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "id":"magicWeaponAdditional",
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"magicWeaponSkill0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"神器技能: "});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_TipEquip_Image12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":25,
                                                                    "y":5,
                                                                    "width":12,
                                                                    "height":12
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"artifactSkillStr",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":40,
                                                                    "y":3,
                                                                    "text":"XXX技能"
                                                                });
                                                            }
                                                        })]});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"artifactSubSkillStr",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"魂威技能:"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Repeater,
                                                "id":"magicWeaponSkill1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_TipEquip_Image13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":25,
                                                                                "y":5,
                                                                                "width":12,
                                                                                "height":12
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Text,
                                                                        "id":"_TipEquip_Text13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":40,
                                                                                "y":3,
                                                                                "text":"XXX技能"
                                                                            });
                                                                        }
                                                                    })]});
                                                            }
                                                        })]});
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"propSuit",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"套装属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"petStoneText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"Đá TBPet",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"petStoneContainer",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"petStone1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"petStone2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"petStone3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"petStone4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"petStone5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"petStone6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"petStoneSkillText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipEquip_Text17",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"宝石属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"jewelCanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":19,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image20",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image21",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":17.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image22",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image23",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image24",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":61.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image25",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":76.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image26",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":91.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image27",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":106.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image28",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":121.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipEquip_Image29",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":136.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"jewelInfo",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0x777777;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":""});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipEquip_Text19",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备描述2"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"currencyPrice"
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"canSell",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xC8C8C8;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"sublimation",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"qiling",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"des",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0x777777;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TipEquip_Label6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0x777777;
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipEquip()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.currentState = "common";
            this.states = [_TipEquip_State1_c(), _TipEquip_State2_c()];
            this.addEventListener("resize", ___TipEquip_BasicToolTip1_resize);
        }

        private static function getSuitPropStr(_arg_1:int, _arg_2:int, _arg_3:String="", _arg_4:int=-1):String
        {
            var _local_6:Object;
            var _local_5:Boolean;
            if (((_arg_1 > 0) && (_arg_2 > 0)))
            {
                if ((((((((_arg_1 == GamePredef.EQUSUIT_PROP_HP_PER) || (_arg_1 == GamePredef.EQUSUIT_PROP_MP_PER)) || (_arg_1 == GamePredef.EQUSUIT_PROP_ATTACK_PER)) || (_arg_1 == GamePredef.EQUSUIT_PROP_MATTACK_PER)) || (_arg_1 == GamePredef.EQUSUIT_PROP_DEFENCE_PER)) || (_arg_1 == GamePredef.EQUSUIT_PROP_MDEFENCE_PER)) || (_arg_1 == GamePredef.EQUSUIT_PROP_ENHPHYHURT)))
                {
                    _local_5 = true;
                };
                if (_arg_4 >= 2)
                {
                    _local_6 = {
                        "0":1,
                        "1":1,
                        "2":0.5,
                        "3":1,
                        "4":2
                    };
                    if (_local_5)
                    {
                        if (_arg_1 == GamePredef.EQUSUIT_PROP_ENHPHYHURT)
                        {
                            _arg_3 = (((((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + (Number((_arg_2 * _local_6[_arg_4])) / 100)) + "% ") + _arg_3) + "\n");
                        }
                        else
                        {
                            _arg_3 = (((((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + int((_arg_2 * _local_6[_arg_4]))) + "% ") + _arg_3) + "\n");
                        };
                    }
                    else
                    {
                        if (_arg_1 == GamePredef.EQUSUIT_PROP_CRITICAL_DAMAGE)
                        {
                            _arg_3 = (((((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + Number(((_arg_2 * _local_6[_arg_4]) / 10000)).toFixed(2)) + " ") + _arg_3) + "\n");
                        }
                        else
                        {
                            _arg_3 = (((((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + int((_arg_2 * _local_6[_arg_4]))) + " ") + _arg_3) + "\n");
                        };
                    };
                    _arg_3 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_4]) + "'>") + _arg_3) + "</font>");
                }
                else
                {
                    if (_arg_4 >= 0)
                    {
                        if (_local_5)
                        {
                            if (_arg_1 == GamePredef.EQUSUIT_PROP_ENHPHYHURT)
                            {
                                _arg_3 = (((((((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + Number(((_arg_2 * 0.5) / 100))) + "%-") + Number(((_arg_2 * 2) / 100))) + "% ") + _arg_3) + "\n");
                            }
                            else
                            {
                                _arg_3 = (((((((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + int((_arg_2 * 0.5))) + "%-") + (_arg_2 * 2)) + "% ") + _arg_3) + "\n");
                            };
                        }
                        else
                        {
                            if (_arg_1 == GamePredef.EQUSUIT_PROP_CRITICAL_DAMAGE)
                            {
                                _arg_3 = (((((((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + Number(((_arg_2 * 0.5) / 10000)).toFixed(2)) + "-") + Number(((_arg_2 * 2) / 10000)).toFixed(2)) + " ") + _arg_3) + "\n");
                            }
                            else
                            {
                                _arg_3 = (((((((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + int((_arg_2 * 0.5))) + "-") + (_arg_2 * 2)) + " ") + _arg_3) + "\n");
                            };
                        };
                        _arg_3 = ((BasicToolTip.FONT_COLOR_PRE_UNACTIVE + _arg_3) + BasicToolTip.FONT_COLOR_SUF_UNACTIVE);
                    }
                    else
                    {
                        _arg_3 = (((GamePredef.EQUSUIT_PROP_NAME[_arg_1] + ": ") + int(_arg_2)) + "\n");
                        _arg_3 = BasicToolTip.COLOR_YELLOW.replace("{str}", _arg_3);
                    };
                };
            };
            return (_arg_3);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipEquip._watcherSetupUtil = _arg_1;
        }


        private function _TipEquip_SetProperty1_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "height";
            _local_1.value = 472;
            return (_local_1);
        }

        public function set propSoul(_arg_1:Text):void
        {
            var _local_2:Object = this._993680394propSoul;
            if (_local_2 !== _arg_1)
            {
                this._993680394propSoul = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propSoul", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get artifactSkillStr():Text
        {
            return (this._1318946322artifactSkillStr);
        }

        [Bindable(event="propertyChange")]
        public function get qiling():Text
        {
            return (this._959581682qiling);
        }

        public function set qiling(_arg_1:Text):void
        {
            var _local_2:Object = this._959581682qiling;
            if (_local_2 !== _arg_1)
            {
                this._959581682qiling = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "qiling", _local_2, _arg_1));
            };
        }

        public function set propSuit(_arg_1:Text):void
        {
            var _local_2:Object = this._993674992propSuit;
            if (_local_2 !== _arg_1)
            {
                this._993674992propSuit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propSuit", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tipContainer():VBox
        {
            return (this._849270234tipContainer);
        }

        [Bindable(event="propertyChange")]
        public function get des():Label
        {
            return (this._99346des);
        }

        private function _TipEquip_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = currencyPrice;
            _local_1 = tipContainer;
            _local_1 = vo.name;
            _local_1 = vo.bind;
            _local_1 = vo.maker;
            _local_1 = vo.urlIcon;
            _local_1 = vo.clsStar1;
            _local_1 = vo.clsStar2;
            _local_1 = vo.clsStar3;
            _local_1 = vo.clsStar4;
            _local_1 = vo.clsStar5;
            _local_1 = vo.clsStar6;
            _local_1 = vo.clsStar7;
            _local_1 = vo.clsStar8;
            _local_1 = vo.clsStar9;
            _local_1 = vo.clsStar10;
            _local_1 = vo.btnVisible;
            _local_1 = vo.description;
            _local_1 = vo.position;
            _local_1 = vo.useType;
            _local_1 = vo.reqLevel;
            _local_1 = vo.level;
            _local_1 = (!(vo.level == null));
            _local_1 = vo.propBasic;
            _local_1 = (!(vo.propBasic == null));
            _local_1 = vo.endure;
            _local_1 = (!(vo.endure == null));
            _local_1 = vo.propBind;
            _local_1 = (!(vo.propBind == null));
            _local_1 = vo.propSoul;
            _local_1 = (!(vo.propSoul == null));
            _local_1 = COLOR_YELLOW.replace("{str}", Language.TIPEQUIP_S[29]);
            _local_1 = ResManager.ICON_EQUIP_JEWEL_15;
            _local_1 = COLOR_YELLOW.replace("{str}", Language.TIPEQUIP_S[30]);
            _local_1 = ResManager.ICON_EQUIP_JEWEL_16;
            _local_1 = magicWeaponSkill1.currentItem.tip;
            _local_1 = vo.propSuit;
            _local_1 = (!(vo.propSuit == null));
            _local_1 = ResManager.ICON_EQUIP_HOLE;
            _local_1 = ResManager.ICON_EQUIP_HOLE;
            _local_1 = ResManager.ICON_EQUIP_HOLE;
            _local_1 = ResManager.ICON_EQUIP_HOLE;
            _local_1 = ResManager.ICON_EQUIP_HOLE;
            _local_1 = ResManager.ICON_EQUIP_HOLE;
            _local_1 = vo.propJewel;
            _local_1 = (!(vo.propJewel == null));
            _local_1 = vo.clsJewel1;
            _local_1 = vo.clsJewel2;
            _local_1 = vo.clsJewel3;
            _local_1 = vo.clsJewel4;
            _local_1 = vo.clsJewel5;
            _local_1 = vo.clsJewel6;
            _local_1 = vo.clsJewel7;
            _local_1 = vo.clsJewel8;
            _local_1 = vo.clsJewel9;
            _local_1 = vo.clsJewel10;
            _local_1 = vo.info;
            _local_1 = (!(vo.info == null));
            _local_1 = vo.currency;
            _local_1 = vo.currencyType;
            _local_1 = vo.costVisible;
            _local_1 = vo.costVisible;
            _local_1 = (!(vo.costVisible));
            _local_1 = (!(vo.costVisible));
            _local_1 = Language.TIPEQUIP_S[24];
            _local_1 = Language.TIPEQUIP_S[34];
        }

        public function set _TipEquip_VBox2(_arg_1:VBox):void
        {
            var _local_2:Object = this._955531502_TipEquip_VBox2;
            if (_local_2 !== _arg_1)
            {
                this._955531502_TipEquip_VBox2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TipEquip_VBox2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propBind():Text
        {
            return (this._994192832propBind);
        }

        public function set tipContainer(_arg_1:VBox):void
        {
            var _local_2:Object = this._849270234tipContainer;
            if (_local_2 !== _arg_1)
            {
                this._849270234tipContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipContainer", _local_2, _arg_1));
            };
        }

        public function set artifactSkillStr(_arg_1:Text):void
        {
            var _local_2:Object = this._1318946322artifactSkillStr;
            if (_local_2 !== _arg_1)
            {
                this._1318946322artifactSkillStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "artifactSkillStr", _local_2, _arg_1));
            };
        }

        public function set des(_arg_1:Label):void
        {
            var _local_2:Object = this._99346des;
            if (_local_2 !== _arg_1)
            {
                this._99346des = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "des", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petStone1():Image
        {
            return (this._1716723307petStone1);
        }

        [Bindable(event="propertyChange")]
        public function get petStone2():Image
        {
            return (this._1716723308petStone2);
        }

        [Bindable(event="propertyChange")]
        public function get petStone3():Image
        {
            return (this._1716723309petStone3);
        }

        [Bindable(event="propertyChange")]
        public function get petStone4():Image
        {
            return (this._1716723310petStone4);
        }

        [Bindable(event="propertyChange")]
        public function get petStone5():Image
        {
            return (this._1716723311petStone5);
        }

        private function setLotto(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_5:*;
            var _local_2:Number = GamePredef.EQUIPT_QUALITY[(_arg_1.slotData.q - 1)];
            var _local_3:Number = GamePredef.EQUIPT_QUALITY[_arg_1.slotData.q];
            if (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
            {
                _local_4 = Math.round(_arg_1.slotData.q);
                if (((!(Number(_arg_1.slotData.q))) || (Number(_arg_1.slotData.q) < 0)))
                {
                    _local_4 = "MIN";
                }
                else
                {
                    if (Number(_arg_1.slotData.q) > 8)
                    {
                        _local_4 = "MAX";
                    };
                };
                _local_2 = GamePredef.ARTIFACT_QUALITY[_local_4].min;
                _local_3 = GamePredef.ARTIFACT_QUALITY[_local_4].max;
            };
            vo.costVisible = (_arg_1.temp.tradable > 0);
            if ((((_arg_1.slotData.q > 0) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                vo.name = ((((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.getColorByQuality(_arg_1.slotData.q)]) + "'>") + GamePredef.PRE_EQU_NAME[_core.basic.getPreByQuality(_arg_1.slotData.q)]) + vo.name) + "</font>");
            };
            if (((_arg_1.slotData.q > 0) && (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)))
            {
                vo.name = (vo.name + GamePredef.ARTIFACT_QUALITY_NAME_ARR[(_arg_1.slotData.q - 1)]);
            };
            if (ToolKit.isBigOrEqual(_arg_1.temp.color, 0))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_1.temp.color]) + "'>") + vo.name) + "</font>");
            };
            if ((((_arg_1.slotData.q >= 5) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                vo.name = (vo.name + Language.TIPEQUIP_S[2]);
            };
            vo.propBasic = "";
            if (_arg_1.temp.mainProp1 > 0)
            {
                vo.propBasic = ((((((GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp1] + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.temp.mainPropNum1 * _local_2))) + "-") + int((_arg_1.temp.mainPropNum1 * _local_3))) + FONT_COLOR_SUF_PROP);
            };
            if (_arg_1.temp.mainProp2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.temp.mainPropNum2 * _local_2))) + "-") + int((_arg_1.temp.mainPropNum2 * _local_3))) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop1 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop1]) + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.temp.propNum1 * _local_2))) + "-") + int((_arg_1.temp.propNum1 * _local_3))) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop2]) + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.temp.propNum2 * _local_2))) + "-") + int((_arg_1.temp.propNum2 * _local_3))) + FONT_COLOR_SUF_PROP));
            };
            vo.propBind = "";
            if (((_arg_1.temp.bindPropNum > 0) && (((_arg_1.slotData.q >= 6) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                propBind.visible = true;
                propBind.includeInLayout = true;
                _local_5 = (((_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER)) ? int(_arg_1.temp.bindPropNum) : ("0-" + int((_arg_1.temp.bindPropNum * _local_3))));
                vo.propBind = ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp1]) + ": ") + FONT_COLOR_PRE_PROP) + _local_5) + "%") + FONT_COLOR_SUF_PROP);
                vo.propBind = (vo.propBind + "\n");
                vo.propBind = (vo.propBind + ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + _local_5) + "%") + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.slotData.b <= 0)
            {
                if (vo.propBind.length > 0)
                {
                    vo.propBind = ((FONT_COLOR_PRE_UNACTIVE + vo.propBind) + FONT_COLOR_SUF_UNACTIVE);
                };
            };
            if (vo.propBind.length > 0)
            {
                vo.propBind = ((PRE_BIND_PROP + "\n") + vo.propBind);
            };
            if ((((!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_PETEQU))))
            {
                vo.propJewel = Language.TIPEQUIP_S[5];
            };
            if ((((_arg_1.slotData.q >= 15) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                propSoul.visible = true;
                propSoul.includeInLayout = true;
                vo.propSoul = Language.TIPEQUIP_S[6];
            };
        }

        public function set magicWeaponAdditional(_arg_1:VBox):void
        {
            var _local_2:Object = this._285513520magicWeaponAdditional;
            if (_local_2 !== _arg_1)
            {
                this._285513520magicWeaponAdditional = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicWeaponAdditional", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petStone6():Image
        {
            return (this._1716723312petStone6);
        }

        public function set propBind(_arg_1:Text):void
        {
            var _local_2:Object = this._994192832propBind;
            if (_local_2 !== _arg_1)
            {
                this._994192832propBind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propBind", _local_2, _arg_1));
            };
        }

        public function set canSell(_arg_1:Label):void
        {
            var _local_2:Object = this._549739330canSell;
            if (_local_2 !== _arg_1)
            {
                this._549739330canSell = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canSell", _local_2, _arg_1));
            };
        }

        public function set petStoneSkillText(_arg_1:Text):void
        {
            var _local_2:Object = this._302557384petStoneSkillText;
            if (_local_2 !== _arg_1)
            {
                this._302557384petStoneSkillText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStoneSkillText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconImg():Image
        {
            return (this._1638753418iconImg);
        }

        private function isEquSid(_arg_1:int):void
        {
            var _local_2:Core = Core.getInstance();
            _local_2.remote.call("isEquSid", new Responder(onIsEquSid), _arg_1);
        }

        public function set object(_arg_1:Object):void
        {
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            vo = new ToolTipVO();
            obj = _arg_1;
            if (!_arg_1.temp)
            {
                return;
            };
            setCommon(_arg_1);
            if (((_arg_1.slotType == Slot.SLOT_TREASURE) && ((_arg_1.slotData.q) || (Number(_arg_1.slotData.quality)))))
            {
                if (!_arg_1.slotData.q)
                {
                    _arg_1.slotData.q = _arg_1.slotData.quality;
                };
                setTreasure(_arg_1);
            }
            else
            {
                if (((_arg_1.slotType == Slot.SLOT_LOTTO) && ((_arg_1.slotData.q) || (Number(_arg_1.slotData.quality)))))
                {
                    if (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
                    {
                        setLotto(_arg_1);
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
                else
                {
                    if (_arg_1.slotType == Slot.SLOT_TEMPORARY_BAG)
                    {
                        setLotto(_arg_1);
                    }
                    else
                    {
                        if (_arg_1.q > 0)
                        {
                            if (!_arg_1.slotData)
                            {
                                _arg_1.slotData = {"q":_arg_1.q};
                            };
                            setLotto(_arg_1);
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
                    };
                };
            };
        }

        private function equipDataLoaded(_arg_1:GameDataEvent):void
        {
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.data.id), equipDataLoaded);
            vo.activeEquipName = _arg_1.data.name;
            refreshSoul();
        }

        public function set artifactSubSkillStr(_arg_1:Text):void
        {
            var _local_2:Object = this._714532018artifactSubSkillStr;
            if (_local_2 !== _arg_1)
            {
                this._714532018artifactSubSkillStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "artifactSubSkillStr", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sublimation():Text
        {
            return (this._1887817563sublimation);
        }

        [Bindable(event="propertyChange")]
        public function get petStoneContainer():HBox
        {
            return (this._1590276251petStoneContainer);
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        public function set useType(_arg_1:Text):void
        {
            var _local_2:Object = this._148001439useType;
            if (_local_2 !== _arg_1)
            {
                this._148001439useType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useType", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get endure():Text
        {
            return (this._1298740563endure);
        }

        public function set petStone1(_arg_1:Image):void
        {
            var _local_2:Object = this._1716723307petStone1;
            if (_local_2 !== _arg_1)
            {
                this._1716723307petStone1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStone1", _local_2, _arg_1));
            };
        }

        public function set petStone2(_arg_1:Image):void
        {
            var _local_2:Object = this._1716723308petStone2;
            if (_local_2 !== _arg_1)
            {
                this._1716723308petStone2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStone2", _local_2, _arg_1));
            };
        }

        public function set petStone3(_arg_1:Image):void
        {
            var _local_2:Object = this._1716723309petStone3;
            if (_local_2 !== _arg_1)
            {
                this._1716723309petStone3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStone3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get magicWeaponLevel():Text
        {
            return (this._267844315magicWeaponLevel);
        }

        public function set petStone5(_arg_1:Image):void
        {
            var _local_2:Object = this._1716723311petStone5;
            if (_local_2 !== _arg_1)
            {
                this._1716723311petStone5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStone5", _local_2, _arg_1));
            };
        }

        public function ___TipEquip_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function set petStone6(_arg_1:Image):void
        {
            var _local_2:Object = this._1716723312petStone6;
            if (_local_2 !== _arg_1)
            {
                this._1716723312petStone6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStone6", _local_2, _arg_1));
            };
        }

        public function set petStone4(_arg_1:Image):void
        {
            var _local_2:Object = this._1716723310petStone4;
            if (_local_2 !== _arg_1)
            {
                this._1716723310petStone4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStone4", _local_2, _arg_1));
            };
        }

        private function setCommon(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:String;
            var _local_9:String;
            var _local_10:Array;
            var _local_11:int;
            var _local_12:int;
            var _local_13:Array;
            if (tipContainer.contains(magicWeaponAdditional))
            {
                tipContainer.removeChild(magicWeaponAdditional);
            };
            vo.bind = "";
            vo.btnVisible = _arg_1.btnVisible;
            tipName.toolTip = "";
            sublimation.htmlText = "";
            qiling.htmlText = "";
            vo.name = _arg_1.temp.name;
            if (ToolKit.isBigOrEqual(_arg_1.temp.color, 0))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_1.temp.color]) + "'>") + _arg_1.temp.name) + "</font>");
            };
            if ((((_arg_1.quality > 0) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                vo.name = ((((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.getColorByQuality(_arg_1.quality)]) + "'>") + GamePredef.PRE_EQU_NAME[_core.basic.getPreByQuality(_arg_1.quality)]) + vo.name) + "</font>");
            };
            vo.urlIcon = ResManager.getIconUrl(_arg_1.temp.iconCode);
            ResManager.setColorCode(iconImg, _arg_1.temp.colorCode);
            vo.description = _arg_1.temp.description;
            vo.info = _arg_1.temp.info;
            if (((ToolKit.isBigThan(_arg_1.temp.t, 0)) && (ToolKit.isSmallOrEqual(_arg_1.temp.t, 100000000000))))
            {
                if (vo.info.length > 0)
                {
                    vo.info = (vo.info + "<br>");
                };
                vo.info = (vo.info + Language.TIPEQUIP_S[7]);
                _local_3 = (_arg_1.temp.t % 60);
                _local_4 = int((Math.floor((_arg_1.temp.t / 60)) % 24));
                _local_5 = int((Math.floor((_arg_1.temp.t / 1440)) % 31));
                _local_6 = int((Math.floor((_arg_1.temp.t / 44640)) % 365));
                _local_7 = int(Math.floor((_arg_1.temp.t / 16293600)));
                if (ToolKit.isBigThan(_local_7, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[8].toString().replace("{year}", _local_7));
                };
                if (ToolKit.isBigThan(_local_6, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[9].toString().replace("{month}", _local_6));
                };
                if (ToolKit.isBigThan(_local_5, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[10].toString().replace("{day}", _local_5));
                };
                if (ToolKit.isBigThan(_local_4, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[11].toString().replace("{hour}", _local_4));
                };
                if (ToolKit.isBigThan(_local_3, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[12].toString().replace("{minute}", _local_3));
                };
            };
            if (!ToolKit.isEqual(_arg_1.temp.kind, GamePredef.ITEM_KIND_DRESS))
            {
                _local_8 = Language.TIPEQUIP_S[13].toString().replace("{endureMax}", _arg_1.temp.endureMax);
                vo.endure = _local_8;
            };
            var _local_2:String = Language.TIPEQUIP_S[14].toString().replace("{EQUIP_POSITION}", GamePredef.EQUIP_POSITION[_arg_1.temp.position]);
            vo.costVisible = true;
            vo.position = _local_2;
            vo.bind = GamePredef.PROP_BINDTYPE[_arg_1.temp.bindType];
            if (((_arg_1.slotData) && (_arg_1.slotData.type)))
            {
                if ((((_arg_1.slotData.type == GamePredef.TBL_EQUIPT_TEMPLATE) || (_arg_1.slotData.type == GamePredef.TBL_ITEM_TEMPLATE)) || (_arg_1.slotData.type == GamePredef.TBL_CREATURE)))
                {
                    vo.bind = "";
                };
            };
            if (_arg_1.cost > 0)
            {
                vo.currency = _arg_1.cost;
                vo.currencyType = _arg_1.costType;
            }
            else
            {
                if (_arg_1.temp.price > 0)
                {
                    vo.currency = _arg_1.temp.price;
                    vo.currencyType = Currency.TYPE_MONEYALL;
                };
                if (_arg_1.temp.gold > 0)
                {
                    vo.currency = _arg_1.temp.gold;
                    vo.currencyType = Currency.TYPE_GOLDALL;
                };
            };
            jewelCanvas.visible = false;
            jewelCanvas.includeInLayout = false;
            propBind.visible = false;
            propBind.includeInLayout = false;
            propSoul.visible = false;
            propSoul.includeInLayout = false;
            switch (Number(_arg_1.temp.useType))
            {
                case 1:
                    if (_arg_1.temp.reqLevel)
                    {
                        _local_9 = Language.TIPEQUIP_S[15].toString().replace("{reqLevel}", _arg_1.temp.reqLevel);
                        vo.reqLevel = _local_9;
                        if (ToolKit.isSmallThan(_core.player.level, _arg_1.temp.reqLevel))
                        {
                            vo.reqLevel = ((FONT_COLOR_RED_PROP + vo.reqLevel) + FONT_COLOR_SUF_PROP);
                        };
                    };
                    if (_arg_1.temp.reqClass)
                    {
                        vo.useType = Language.TIPEQUIP_S[16];
                        _local_10 = _arg_1.temp.reqClass.split("|");
                        _local_11 = 0;
                        for each (_local_12 in _local_10)
                        {
                            if ((((_local_12) && (_local_12 >= 1)) && (_local_12 <= 6)))
                            {
                                vo.useType = (vo.useType + (dm.getGameDataList(GamePredef.TBL_CLASS)[_local_12].name + " "));
                                _local_11 = (_local_11 + _local_12);
                            };
                        };
                        if (_local_11 == 21)
                        {
                            vo.useType = Language.TIPEQUIP_S[17];
                        };
                        if (String(_arg_1.temp.reqClass).indexOf((("|" + _core.player.classId) + "|")) < 0)
                        {
                            vo.useType = ((FONT_COLOR_RED_PROP + vo.useType) + FONT_COLOR_SUF_PROP);
                        };
                    };
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = true;
                    break;
                case 2:
                    if (ToolKit.isEqual(_arg_1.temp.kind, GamePredef.ITEM_KIND_PETEQU))
                    {
                        vo.useType = Language.TIPEQUIP_S[16];
                        if (_arg_1.temp.reqClassId)
                        {
                            _local_13 = _arg_1.temp.reqClassId.split("|");
                            for each (_local_12 in _local_13)
                            {
                                if (_local_12)
                                {
                                    vo.useType = (vo.useType + (dm.getGameDataList(GamePredef.TBL_CREATURE)[_local_12].name + " "));
                                };
                            };
                            if (((!(_core.battlePet)) || (String(_arg_1.temp.reqClassId).indexOf((("|" + _core.battlePet.tid) + "|")) < 0)))
                            {
                                vo.useType = ((FONT_COLOR_RED_PROP + vo.useType) + FONT_COLOR_SUF_PROP);
                            };
                        }
                        else
                        {
                            if (_arg_1.temp.reqClass)
                            {
                                _local_10 = _arg_1.temp.reqClass.split("|");
                                _local_11 = 0;
                                for each (_local_12 in _local_10)
                                {
                                    if ((((_local_12) && (_local_12 >= 1)) && (_local_12 <= 6)))
                                    {
                                        vo.useType = (vo.useType + (GamePredef.CREATURE_CLASS_NAME[_local_12] + " "));
                                        _local_11 = (_local_11 + _local_12);
                                    };
                                };
                                if (_local_11 == 21)
                                {
                                    vo.useType = Language.TIPITEM_S[20];
                                };
                                if (((!(_core.battlePet)) || (String(_arg_1.temp.reqClass).indexOf((("|" + _core.battlePet.creatureData.classId) + "|")) < 0)))
                                {
                                    vo.useType = ((FONT_COLOR_RED_PROP + vo.useType) + FONT_COLOR_SUF_PROP);
                                };
                            }
                            else
                            {
                                vo.useType = Language.TIPEQUIP_S[20];
                                if (_arg_1.temp.reqLevel)
                                {
                                    _local_9 = Language.TIPEQUIP_S[15].toString().replace("{reqLevel}", _arg_1.temp.reqLevel);
                                    vo.reqLevel = _local_9;
                                };
                            };
                        };
                        if (_arg_1.temp.reqLevel)
                        {
                            _local_9 = Language.TIPEQUIP_S[15].toString().replace("{reqLevel}", _arg_1.temp.reqLevel);
                            vo.reqLevel = _local_9;
                        };
                    }
                    else
                    {
                        vo.useType = Language.TIPEQUIP_S[18];
                        if (_arg_1.temp.reqLevel)
                        {
                            _local_9 = Language.TIPEQUIP_S[15].toString().replace("{reqLevel}", _arg_1.temp.reqLevel);
                            vo.reqLevel = _local_9;
                        };
                    };
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = true;
                    break;
                case 3:
                    vo.useType = Language.TIPEQUIP_S[19];
                    if (_arg_1.temp.reqLevel)
                    {
                        _local_9 = Language.TIPEQUIP_S[15].toString().replace("{reqLevel}", _arg_1.temp.reqLevel);
                        vo.reqLevel = _local_9;
                        if (ToolKit.isSmallThan(_core.player.level, _arg_1.temp.reqLevel))
                        {
                            vo.reqLevel = ((FONT_COLOR_RED_PROP + vo.reqLevel) + FONT_COLOR_SUF_PROP);
                        };
                    };
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = true;
                    break;
                case 4:
                    vo.useType = Language.TIPEQUIP_S[20];
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = false;
                    break;
            };
            if (obj.slotData)
            {
                isEquSid(obj.slotData.sid);
            };
        }

        public function currencyHide(_arg_1:String):void
        {
            if (_arg_1 == "temp")
            {
                currentState = "simplify";
            };
            if (_arg_1 == "inst")
            {
                if ((((!(vo.currency)) || (vo.currency < 500)) || (canSell.visible)))
                {
                    currentState = "simplify";
                }
                else
                {
                    currentState = "common";
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petStoneText():Text
        {
            return (this._1565378349petStoneText);
        }

        public function set jewelCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1202564229jewelCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1202564229jewelCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelCanvas", _local_2, _arg_1));
            };
        }

        public function set reqLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._431118970reqLevel;
            if (_local_2 !== _arg_1)
            {
                this._431118970reqLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevel", _local_2, _arg_1));
            };
        }

        public function set magicWeaponSkill0(_arg_1:Text):void
        {
            var _local_2:Object = this._81196152magicWeaponSkill0;
            if (_local_2 !== _arg_1)
            {
                this._81196152magicWeaponSkill0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicWeaponSkill0", _local_2, _arg_1));
            };
        }

        public function set magicWeaponSkill1(_arg_1:Repeater):void
        {
            var _local_2:Object = this._81196151magicWeaponSkill1;
            if (_local_2 !== _arg_1)
            {
                this._81196151magicWeaponSkill1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicWeaponSkill1", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get propSuit():Text
        {
            return (this._993674992propSuit);
        }

        [Bindable(event="propertyChange")]
        public function get _TipEquip_VBox2():VBox
        {
            return (this._955531502_TipEquip_VBox2);
        }

        public function set petStoneContainer(_arg_1:HBox):void
        {
            var _local_2:Object = this._1590276251petStoneContainer;
            if (_local_2 !== _arg_1)
            {
                this._1590276251petStoneContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStoneContainer", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get magicWeaponAdditional():VBox
        {
            return (this._285513520magicWeaponAdditional);
        }

        private function setTreasure(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_5:*;
            var _local_2:Number = GamePredef.EQUIPT_QUALITY[(int(_arg_1.slotData.q) - 1)];
            var _local_3:Number = GamePredef.EQUIPT_QUALITY[int(_arg_1.slotData.q)];
            if (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
            {
                _local_4 = Math.round(_arg_1.slotData.q);
                if (((!(Number(_arg_1.slotData.q))) || (Number(_arg_1.slotData.q) < 0)))
                {
                    _local_4 = "MIN";
                }
                else
                {
                    if (Number(_arg_1.slotData.q) > 8)
                    {
                        _local_4 = "MAX";
                    };
                };
                _local_2 = GamePredef.ARTIFACT_QUALITY[_local_4].min;
                _local_3 = GamePredef.ARTIFACT_QUALITY[_local_4].max;
            };
            vo.costVisible = (_arg_1.temp.tradable > 0);
            if ((((_arg_1.slotData.q > 0) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                vo.name = ((((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.getColorByQuality(_arg_1.slotData.q)]) + "'>") + GamePredef.PRE_EQU_NAME[_core.basic.getPreByQuality(_arg_1.slotData.q)]) + vo.name) + "</font>");
            };
            if (((_arg_1.slotData.q > 0) && (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)))
            {
                vo.name = (vo.name + GamePredef.ARTIFACT_QUALITY_NAME_ARR[(_arg_1.slotData.q - 1)]);
            };
            if (ToolKit.isBigOrEqual(_arg_1.temp.color, 0))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_1.temp.color]) + "'>") + _arg_1.temp.name) + "</font>");
            };
            if ((((_arg_1.slotData.q >= 5) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                vo.name = (vo.name + Language.TIPEQUIP_S[2]);
            };
            vo.propBasic = "";
            if (_arg_1.temp.mainProp1 > 0)
            {
                vo.propBasic = ((((((GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp1] + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.temp.mainPropNum1 * _local_2))) + "-") + int((_arg_1.temp.mainPropNum1 * _local_3))) + FONT_COLOR_SUF_PROP);
            };
            if (_arg_1.temp.mainProp2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.temp.mainPropNum2 * _local_2))) + "-") + int((_arg_1.temp.mainPropNum2 * _local_3))) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop1 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop1]) + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.temp.propNum1 * _local_2))) + "-") + int((_arg_1.temp.propNum1 * _local_3))) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop2]) + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.temp.propNum2 * _local_2))) + "-") + int((_arg_1.temp.propNum2 * _local_3))) + FONT_COLOR_SUF_PROP));
            };
            vo.propBind = "";
            if (((_arg_1.temp.bindPropNum > 0) && (((_arg_1.slotData.q >= 6) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                propBind.visible = true;
                propBind.includeInLayout = true;
                _local_5 = (((_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER)) ? int(_arg_1.temp.bindPropNum) : ("0-" + int((_arg_1.temp.bindPropNum * _local_3))));
                vo.propBind = ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp1]) + ": ") + FONT_COLOR_PRE_PROP) + _local_5) + "%") + FONT_COLOR_SUF_PROP);
                if (_arg_1.temp.mainProp2 > 0)
                {
                    vo.propBind = (vo.propBind + "\n");
                    vo.propBind = (vo.propBind + ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + _local_5) + "%") + FONT_COLOR_SUF_PROP));
                };
            };
            if (_arg_1.slotData.b > 0)
            {
                vo.bind = Language.TIPEQUIP_S[3];
            }
            else
            {
                vo.bind = Language.TIPEQUIP_S[4];
                if (vo.propBind.length > 0)
                {
                    vo.propBind = ((FONT_COLOR_PRE_UNACTIVE + vo.propBind) + FONT_COLOR_SUF_UNACTIVE);
                };
            };
            if (((_arg_1.slotData.sid) && (_arg_1.slotData.gold)))
            {
                vo.bind = "";
            };
            if (vo.propBind.length > 0)
            {
                vo.propBind = ((PRE_BIND_PROP + "\n") + vo.propBind);
            };
            if ((((!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_PETEQU))))
            {
                vo.propJewel = Language.TIPEQUIP_S[5];
            };
            if ((((_arg_1.slotData.q >= 15) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                propSoul.visible = true;
                propSoul.includeInLayout = true;
                vo.propSoul = Language.TIPEQUIP_S[6];
            };
        }

        public function set jewelInfo(_arg_1:Text):void
        {
            var _local_2:Object = this._1449103471jewelInfo;
            if (_local_2 !== _arg_1)
            {
                this._1449103471jewelInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petStoneSkillText():Text
        {
            return (this._302557384petStoneSkillText);
        }

        [Bindable(event="propertyChange")]
        public function get canSell():Label
        {
            return (this._549739330canSell);
        }

        public function set endure(_arg_1:Text):void
        {
            var _local_2:Object = this._1298740563endure;
            if (_local_2 !== _arg_1)
            {
                this._1298740563endure = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endure", _local_2, _arg_1));
            };
        }

        public function set sublimation(_arg_1:Text):void
        {
            var _local_2:Object = this._1887817563sublimation;
            if (_local_2 !== _arg_1)
            {
                this._1887817563sublimation = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sublimation", _local_2, _arg_1));
            };
        }

        private function _TipEquip_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():DisplayObject
            {
                return (currencyPrice);
            }, function (_arg_1:DisplayObject):void
            {
                _TipEquip_RemoveChild1.target = _arg_1;
            }, "_TipEquip_RemoveChild1.target");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (tipContainer);
            }, function (_arg_1:Object):void
            {
                _TipEquip_SetProperty2.target = _arg_1;
            }, "_TipEquip_SetProperty2.target");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tipName.htmlText = _arg_1;
            }, "tipName.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bind;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEquip_Label2.htmlText = _arg_1;
            }, "_TipEquip_Label2.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.maker;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEquip_Label3.htmlText = _arg_1;
            }, "_TipEquip_Label3.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.urlIcon);
            }, function (_arg_1:Object):void
            {
                iconImg.source = _arg_1;
            }, "iconImg.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar1);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image2.source = _arg_1;
            }, "_TipEquip_Image2.source");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar2);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image3.source = _arg_1;
            }, "_TipEquip_Image3.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar3);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image4.source = _arg_1;
            }, "_TipEquip_Image4.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar4);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image5.source = _arg_1;
            }, "_TipEquip_Image5.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar5);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image6.source = _arg_1;
            }, "_TipEquip_Image6.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar6);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image7.source = _arg_1;
            }, "_TipEquip_Image7.source");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar7);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image8.source = _arg_1;
            }, "_TipEquip_Image8.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar8);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image9.source = _arg_1;
            }, "_TipEquip_Image9.source");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar9);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image10.source = _arg_1;
            }, "_TipEquip_Image10.source");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar10);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image11.source = _arg_1;
            }, "_TipEquip_Image11.source");
            result[15] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.btnVisible);
            }, function (_arg_1:Boolean):void
            {
                _TipEquip_Button1.visible = _arg_1;
            }, "_TipEquip_Button1.visible");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEquip_Text1.htmlText = _arg_1;
            }, "_TipEquip_Text1.htmlText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.position;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEquip_Text2.htmlText = _arg_1;
            }, "_TipEquip_Text2.htmlText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.useType;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                useType.htmlText = _arg_1;
            }, "useType.htmlText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.reqLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqLevel.htmlText = _arg_1;
            }, "reqLevel.htmlText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicWeaponLevel.htmlText = _arg_1;
            }, "magicWeaponLevel.htmlText");
            result[21] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.level == null));
            }, function (_arg_1:Boolean):void
            {
                magicWeaponLevel.includeInLayout = _arg_1;
            }, "magicWeaponLevel.includeInLayout");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propBasic;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEquip_Text6.htmlText = _arg_1;
            }, "_TipEquip_Text6.htmlText");
            result[23] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.propBasic == null));
            }, function (_arg_1:Boolean):void
            {
                _TipEquip_Text6.includeInLayout = _arg_1;
            }, "_TipEquip_Text6.includeInLayout");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.endure;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                endure.htmlText = _arg_1;
            }, "endure.htmlText");
            result[25] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.endure == null));
            }, function (_arg_1:Boolean):void
            {
                endure.includeInLayout = _arg_1;
            }, "endure.includeInLayout");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propBind;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propBind.htmlText = _arg_1;
            }, "propBind.htmlText");
            result[27] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.propBind == null));
            }, function (_arg_1:Boolean):void
            {
                propBind.includeInLayout = _arg_1;
            }, "propBind.includeInLayout");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propSoul;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propSoul.htmlText = _arg_1;
            }, "propSoul.htmlText");
            result[29] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.propSoul == null));
            }, function (_arg_1:Boolean):void
            {
                propSoul.includeInLayout = _arg_1;
            }, "propSoul.includeInLayout");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = COLOR_YELLOW.replace("{str}", Language.TIPEQUIP_S[29]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicWeaponSkill0.htmlText = _arg_1;
            }, "magicWeaponSkill0.htmlText");
            result[31] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_EQUIP_JEWEL_15);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image12.source = _arg_1;
            }, "_TipEquip_Image12.source");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = COLOR_YELLOW.replace("{str}", Language.TIPEQUIP_S[30]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                artifactSubSkillStr.htmlText = _arg_1;
            }, "artifactSubSkillStr.htmlText");
            result[33] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (ResManager.ICON_EQUIP_JEWEL_16);
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _TipEquip_Image13[_arg_2[0]].source = _arg_1;
            }, "_TipEquip_Image13.source");
            result[34] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = magicWeaponSkill1.mx_internal::getItemAt(_arg_2[0]).tip;
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _TipEquip_Text13[_arg_2[0]].htmlText = _arg_1;
            }, "_TipEquip_Text13.htmlText");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propSuit;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propSuit.htmlText = _arg_1;
            }, "propSuit.htmlText");
            result[36] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.propSuit == null));
            }, function (_arg_1:Boolean):void
            {
                propSuit.includeInLayout = _arg_1;
            }, "propSuit.includeInLayout");
            result[37] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_EQUIP_HOLE);
            }, function (_arg_1:Object):void
            {
                petStone1.source = _arg_1;
            }, "petStone1.source");
            result[38] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_EQUIP_HOLE);
            }, function (_arg_1:Object):void
            {
                petStone2.source = _arg_1;
            }, "petStone2.source");
            result[39] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_EQUIP_HOLE);
            }, function (_arg_1:Object):void
            {
                petStone3.source = _arg_1;
            }, "petStone3.source");
            result[40] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_EQUIP_HOLE);
            }, function (_arg_1:Object):void
            {
                petStone4.source = _arg_1;
            }, "petStone4.source");
            result[41] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_EQUIP_HOLE);
            }, function (_arg_1:Object):void
            {
                petStone5.source = _arg_1;
            }, "petStone5.source");
            result[42] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_EQUIP_HOLE);
            }, function (_arg_1:Object):void
            {
                petStone6.source = _arg_1;
            }, "petStone6.source");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propJewel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEquip_Text17.htmlText = _arg_1;
            }, "_TipEquip_Text17.htmlText");
            result[44] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.propJewel == null));
            }, function (_arg_1:Boolean):void
            {
                _TipEquip_Text17.includeInLayout = _arg_1;
            }, "_TipEquip_Text17.includeInLayout");
            result[45] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel1);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image20.source = _arg_1;
            }, "_TipEquip_Image20.source");
            result[46] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel2);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image21.source = _arg_1;
            }, "_TipEquip_Image21.source");
            result[47] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel3);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image22.source = _arg_1;
            }, "_TipEquip_Image22.source");
            result[48] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel4);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image23.source = _arg_1;
            }, "_TipEquip_Image23.source");
            result[49] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel5);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image24.source = _arg_1;
            }, "_TipEquip_Image24.source");
            result[50] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel6);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image25.source = _arg_1;
            }, "_TipEquip_Image25.source");
            result[51] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel7);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image26.source = _arg_1;
            }, "_TipEquip_Image26.source");
            result[52] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel8);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image27.source = _arg_1;
            }, "_TipEquip_Image27.source");
            result[53] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel9);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image28.source = _arg_1;
            }, "_TipEquip_Image28.source");
            result[54] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel10);
            }, function (_arg_1:Object):void
            {
                _TipEquip_Image29.source = _arg_1;
            }, "_TipEquip_Image29.source");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.info;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEquip_Text19.htmlText = _arg_1;
            }, "_TipEquip_Text19.htmlText");
            result[56] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.info == null));
            }, function (_arg_1:Boolean):void
            {
                _TipEquip_Text19.includeInLayout = _arg_1;
            }, "_TipEquip_Text19.includeInLayout");
            result[57] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.currency);
            }, function (_arg_1:Number):void
            {
                currencyPrice.value = _arg_1;
            }, "currencyPrice.value");
            result[58] = binding;
            binding = new Binding(this, function ():uint
            {
                return (vo.currencyType);
            }, function (_arg_1:uint):void
            {
                currencyPrice.type = _arg_1;
            }, "currencyPrice.type");
            result[59] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.costVisible);
            }, function (_arg_1:Boolean):void
            {
                currencyPrice.visible = _arg_1;
            }, "currencyPrice.visible");
            result[60] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.costVisible);
            }, function (_arg_1:Boolean):void
            {
                currencyPrice.includeInLayout = _arg_1;
            }, "currencyPrice.includeInLayout");
            result[61] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.costVisible));
            }, function (_arg_1:Boolean):void
            {
                canSell.visible = _arg_1;
            }, "canSell.visible");
            result[62] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.costVisible));
            }, function (_arg_1:Boolean):void
            {
                canSell.includeInLayout = _arg_1;
            }, "canSell.includeInLayout");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPEQUIP_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                canSell.text = _arg_1;
            }, "canSell.text");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPEQUIP_S[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEquip_Label6.text = _arg_1;
            }, "_TipEquip_Label6.text");
            result[65] = binding;
            return (result);
        }

        private function setTemp(_arg_1:Object):void
        {
            vo.propBasic = "";
            if (_arg_1.temp.mainProp1 > 0)
            {
                vo.propBasic = (vo.propBasic + (((((GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp1] + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.temp.mainPropNum1) + (((_arg_1.temp.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (_arg_1.temp.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.mainProp2 > 0)
            {
                vo.propBasic = (vo.propBasic + (((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.temp.mainPropNum2) + (((_arg_1.temp.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (_arg_1.temp.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop1 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop1]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.temp.propNum1) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop2]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.temp.propNum2) + FONT_COLOR_SUF_PROP));
            };
        }

        public function ___TipEquip_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get artifactSubSkillStr():Text
        {
            return (this._714532018artifactSubSkillStr);
        }

        private function set vo(_arg_1:ToolTipVO):void
        {
            var _local_2:Object = this._3769vo;
            if (_local_2 !== _arg_1)
            {
                this._3769vo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vo", _local_2, _arg_1));
            };
        }

        private function refreshSoul():void
        {
            var _local_1:String;
            if (vo.activeEquipName == null)
            {
                vo.activeEquipName = "";
            };
            if (obj.soulActived)
            {
                if (obj.inst.activeProp > 0)
                {
                    _local_1 = Language.TIPEQUIP_S[0].toString().replace("{PRE_SOUL_PROP}", PRE_SOUL_PROP);
                    _local_1 = _local_1.replace("{activeEquipName}", vo.activeEquipName);
                    _local_1 = _local_1.replace("{ELEMENT_COLOR}", GamePredef.ELEMENT_COLOR[obj.inst.element]);
                    _local_1 = _local_1.replace("{ELEMENT_NAME}", GamePredef.ELEMENT_NAME[obj.inst.element]);
                    _local_1 = _local_1.replace("{EQUIPT_ACTIVE_NAME}", GamePredef.EQUIPT_ACTIVE_NAME[obj.inst.activeProp]);
                    _local_1 = _local_1.replace("{FONT_COLOR_PRE_PROP}", FONT_COLOR_PRE_PROP);
                    _local_1 = _local_1.replace("{activePropNum}", obj.inst.activePropNum);
                    _local_1 = _local_1.replace("{FONT_COLOR_SUF_PROP}", FONT_COLOR_SUF_PROP);
                    vo.propSoul = _local_1;
                };
            }
            else
            {
                if (obj.inst.activeProp > 0)
                {
                    _local_1 = Language.TIPEQUIP_S[1].toString();
                    _local_1 = _local_1.replace("{PRE_SOUL_PROP}", PRE_SOUL_PROP);
                    _local_1 = _local_1.replace("{FONT_COLOR_PRE_UNACTIVE}", FONT_COLOR_PRE_UNACTIVE);
                    _local_1 = _local_1.replace("{activeEquipName}", vo.activeEquipName);
                    _local_1 = _local_1.replace("{ELEMENT_NAME}", GamePredef.ELEMENT_NAME[obj.inst.element]);
                    _local_1 = _local_1.replace("{EQUIPT_ACTIVE_NAME}", GamePredef.EQUIPT_ACTIVE_NAME[obj.inst.activeProp]);
                    _local_1 = _local_1.replace("{activePropNum}", obj.inst.activePropNum);
                    _local_1 = _local_1.replace("{FONT_COLOR_SUF_UNACTIVE}", FONT_COLOR_SUF_UNACTIVE);
                    vo.propSoul = _local_1;
                };
            };
        }

        public function set currencyPrice(_arg_1:Currency):void
        {
            var _local_2:Object = this._1095316408currencyPrice;
            if (_local_2 !== _arg_1)
            {
                this._1095316408currencyPrice = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currencyPrice", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get useType():Text
        {
            return (this._148001439useType);
        }

        [Bindable(event="propertyChange")]
        public function get jewelCanvas():Canvas
        {
            return (this._1202564229jewelCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get reqLevel():Text
        {
            return (this._431118970reqLevel);
        }

        [Bindable(event="propertyChange")]
        public function get magicWeaponSkill1():Repeater
        {
            return (this._81196151magicWeaponSkill1);
        }

        public function set tipName(_arg_1:Label):void
        {
            var _local_2:Object = this._1311839802tipName;
            if (_local_2 !== _arg_1)
            {
                this._1311839802tipName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipName", _local_2, _arg_1));
            };
        }

        private function onIsEquSid(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                des.text = Language.TIPEQUIP_S[32];
            }
            else
            {
                des.text = Language.TIPEQUIP_S[33];
            };
        }

        [Bindable(event="propertyChange")]
        public function get magicWeaponSkill0():Text
        {
            return (this._81196152magicWeaponSkill0);
        }

        [Bindable(event="propertyChange")]
        public function get jewelInfo():Text
        {
            return (this._1449103471jewelInfo);
        }

        override public function initialize():void
        {
            var target:TipEquip;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipEquip_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipEquipWatcherSetupUtil");
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

        private function _TipEquip_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "common";
            _local_1.overrides = [_TipEquip_SetProperty1_c(), _TipEquip_SetProperty2_i()];
            return (_local_1);
        }

        public function set petStoneText(_arg_1:Text):void
        {
            var _local_2:Object = this._1565378349petStoneText;
            if (_local_2 !== _arg_1)
            {
                this._1565378349petStoneText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petStoneText", _local_2, _arg_1));
            };
        }

        public function set magicWeaponLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._267844315magicWeaponLevel;
            if (_local_2 !== _arg_1)
            {
                this._267844315magicWeaponLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicWeaponLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get currencyPrice():Currency
        {
            return (this._1095316408currencyPrice);
        }

        [Bindable(event="propertyChange")]
        public function get tipName():Label
        {
            return (this._1311839802tipName);
        }

        private function _TipEquip_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _TipEquip_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_TipEquip_RemoveChild1", _TipEquip_RemoveChild1);
            return (_local_1);
        }

        private function setInst(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_4:int;
            var _local_7:String;
            var _local_9:Date;
            var _local_10:String;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:ArrayCollection;
            var _local_15:Boolean;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:int;
            var _local_20:int;
            var _local_21:Object;
            var _local_22:Object;
            var _local_23:Object;
            var _local_24:int;
            var _local_25:int;
            var _local_26:*;
            var _local_27:*;
            var _local_28:*;
            var _local_29:int;
            var _local_30:int;
            var _local_31:String;
            var _local_32:Object;
            var _local_33:int;
            var _local_34:String;
            var _local_35:uint;
            var _local_36:Object;
            var _local_37:String;
            var _local_38:Object;
            var _local_39:int;
            var _local_40:int;
            var _local_41:int;
            var _local_42:String;
            var _local_43:Object;
            var _local_44:int;
            var _local_45:Number;
            var _local_46:int;
            var _local_47:Object;
            var _local_48:Object;
            var _local_49:Number;
            var _local_50:*;
            var _local_51:Object;
            var _local_52:*;
            var _local_53:String;
            var _local_54:Number;
            var _local_55:Object;
            var _local_56:Number;
            var _local_57:*;
            var _local_58:String;
            var _local_59:Object;
            var _local_60:String;
            var _local_61:Object;
            var _local_62:Object;
            var _local_63:Number;
            var _local_64:Image;
            var _local_65:*;
            var _local_66:*;
            var _local_67:Number;
            var _local_68:String;
            var _local_69:Object;
            var _local_70:Object;
            var _local_71:String;
            var _local_72:int;
            var _local_73:Object;
            var _local_74:Object;
            var _local_75:int;
            var _local_76:int;
            var _local_77:int;
            var _local_78:int;
            var _local_79:String;
            var _local_80:String;
            var _local_81:Object;
            var _local_82:Object;
            if (ToolKit.isBigThan(_arg_1.inst.t, 0))
            {
                _local_9 = new Date(Number(_arg_1.inst.t));
                _local_10 = Language.TIPEQUIP_S[21].toString();
                _local_10 = _local_10.replace("{fullYear}", _local_9.fullYear);
                _local_10 = _local_10.replace("{lastMonth}", ToolKit.add(_local_9.month, 1));
                _local_10 = _local_10.replace("{lastDate}", _local_9.date);
                _local_10 = _local_10.replace("{lastHour}", _local_9.hours);
                _local_10 = _local_10.replace("{lastMinutes}", _local_9.minutes);
                vo.info = (vo.info + _local_10);
            };
            vo.costVisible = (_arg_1.temp.tradable > 0);
            if (vo.costVisible)
            {
                if (_arg_1.temp.price > 0)
                {
                    vo.currency = int((_arg_1.temp.price / 4));
                    if (_arg_1.inst.binded > 0)
                    {
                        vo.currencyType = Currency.TYPE_MONEY_BIND;
                    }
                    else
                    {
                        vo.currencyType = Currency.TYPE_MONEY;
                    };
                };
                if (_arg_1.temp.gold > 0)
                {
                    vo.currency = 1;
                    if (_arg_1.inst.binded > 0)
                    {
                        vo.currencyType = Currency.TYPE_MONEY_BIND;
                    }
                    else
                    {
                        vo.currencyType = Currency.TYPE_MONEY;
                    };
                };
            };
            _local_2 = 1;
            while (_local_2 <= _arg_1.inst.upgradeNum)
            {
                if (Number(_arg_1.temp.type) == GamePredef.ITEM_TYPE_MAIN_MAGICWEAPON) break;
                if (Number(_arg_1.temp.type) == GamePredef.ITEM_TYPE_SUB_MAGICWEAPON)
                {
                    if (((!(_arg_1.inst.flag)) || (_arg_1.inst.flag == ""))) break;
                };
                vo[("clsStar" + _local_2)] = ResManager.ICON_EQUIP_STAR;
                _local_2++;
            };
            if (_arg_1.inst)
            {
                if (Number(_arg_1.temp.kind) == GamePredef.ITEM_KIND_MAGICWEAPON)
                {
                    _local_11 = COLOR_ANY.replace("{colorStr}", GamePredef.MSG_ITEM_COLOR[_arg_1.inst.color]).replace("{str}", _arg_1.inst.upgradeNum);
                    vo.level = Language.TIPEQUIP_S[28].toString().replace("{level}", _local_11);
                    if (_arg_1.temp.type == GamePredef.ITEM_TYPE_MAIN_MAGICWEAPON)
                    {
                        tipContainer.addChildAt(magicWeaponLevel, (tipContainer.getChildIndex(reqLevel) + 1));
                        _local_16 = _arg_1.inst.mainPropNum1;
                        _local_17 = _arg_1.temp.mainPropNum1;
                        _local_18 = (_local_16 / _local_17);
                        if (((_local_18 > GamePredef.STAGE_EIGHT_MIN) && (_local_18 < GamePredef.STAGE_EIGHT_MAX)))
                        {
                            vo.name = (vo.name + Language.GAMEPREDEF_S[418]);
                            _local_19 = Math.floor((Number(_arg_1.temp.mainPropNum1) * GamePredef.STAGE_EIGHT_MIN));
                            _local_20 = Math.floor((Number(_arg_1.temp.mainPropNum2) * GamePredef.STAGE_EIGHT_MIN));
                            _local_21 = DataManager.getInstance().gameDataIndex;
                            _local_22 = _local_21[GamePredef.TBL_ARTIFACT][_arg_1.inst.tid];
                            for each (_local_23 in _local_22)
                            {
                                if (((_arg_1.inst.mainPropNum1 == _local_23.propNum1) && (_arg_1.inst.mainPropNum2 == _local_23.propNum2)))
                                {
                                    vo.name = (vo.name + ("+" + _local_23.level));
                                    break;
                                };
                            };
                            tipName.toolTip = Language.TIPEQUIP_S[38];
                        }
                        else
                        {
                            if (_local_18 == GamePredef.STAGE_EIGHT_MAX)
                            {
                                vo.name = (vo.name + Language.GAMEPREDEF_S[419]);
                                tipName.toolTip = Language.TIPEQUIP_S[38];
                            }
                            else
                            {
                                _local_24 = 0;
                                _local_25 = 0;
                                while (_local_25 <= GamePredef.ARTIFACT_QUALITY_ARR.length)
                                {
                                    if (ToolKit.isSmallOrEqual(_local_18, GamePredef.ARTIFACT_QUALITY_ARR[_local_25]))
                                    {
                                        _local_24 = _local_25;
                                        break;
                                    };
                                    _local_25++;
                                };
                                if (GamePredef.ARTIFACT_QUALITY_NAME_ARR[_local_24])
                                {
                                    vo.name = (vo.name + GamePredef.ARTIFACT_QUALITY_NAME_ARR[_local_24]);
                                    tipName.toolTip = Language.TIPEQUIP_S[38];
                                };
                            };
                        };
                    }
                    else
                    {
                        if (tipContainer.contains(magicWeaponLevel))
                        {
                            tipContainer.removeChild(magicWeaponLevel);
                        };
                    };
                    _local_12 = "";
                    _local_13 = _core.getTemplateData(GamePredef.TBL_SKILL, Number(_arg_1.inst.t1));
                    if (((Number(_arg_1.temp.type) == GamePredef.ITEM_TYPE_MAIN_MAGICWEAPON) && (!(_local_13))))
                    {
                        _local_26 = _arg_1.temp.artifactSkill.toString().split("|")[0];
                        _local_13 = _core.getTemplateData(GamePredef.TBL_SKILL, Number(_local_26));
                        _local_12 = ((_local_13) && (((FONT_COLOR_PRE_UNACTIVE + _local_13.name) + FONT_COLOR_SUF_UNACTIVE) + Language.TIPEQUIP_S[31]));
                    }
                    else
                    {
                        if (_local_13)
                        {
                            _local_27 = " ";
                            _local_2 = 0;
                            while (_local_2 < Number(_local_13.level))
                            {
                                _local_27 = (_local_27 + "I");
                                _local_2++;
                            };
                            _local_12 = COLOR_GREEN.replace("{str}", (_local_13.name + _local_27));
                        };
                    };
                    artifactSkillStr.htmlText = _local_12;
                    _local_14 = new ArrayCollection();
                    _local_15 = false;
                    _local_2 = 2;
                    while (_local_2 <= 10)
                    {
                        _local_28 = _core.getTemplateData(GamePredef.TBL_SKILL, Number(_arg_1.inst[("t" + _local_2)]));
                        if (_local_28)
                        {
                            _local_27 = " ";
                            _local_25 = 0;
                            while (_local_25 < Number(_local_28.level))
                            {
                                _local_27 = (_local_27 + "I");
                                _local_25++;
                            };
                            _local_15 = true;
                            _local_14.addItem({"tip":COLOR_GREEN.replace("{str}", (_local_28.name + _local_27))});
                        };
                        _local_2++;
                    };
                    magicWeaponSkill1.dataProvider = _local_14;
                    artifactSubSkillStr.visible = _local_15;
                    tipContainer.addChildAt(magicWeaponAdditional, (tipContainer.getChildIndex(propBind) + 1));
                }
                else
                {
                    if (tipContainer.contains(magicWeaponAdditional))
                    {
                        tipContainer.removeChild(magicWeaponAdditional);
                    };
                };
            };
            var _local_3:* = "";
            if (int(_arg_1.inst.element) > 0)
            {
                _local_29 = _arg_1.inst.element;
                _local_3 = GamePredef.ELEMENT_NAME[_local_29];
                _local_3 = (((("<font color='" + GamePredef.ELEMENT_COLOR[_local_29]) + "'>[") + _local_3) + "]</font>");
            };
            _local_4 = 0;
            var _local_5:* = "";
            if (ToolKit.isBigOrEqual(_arg_1.temp.color, 0))
            {
                _local_4 = int(_arg_1.temp.color);
                vo.name = (_arg_1.temp.name + _local_3);
            }
            else
            {
                vo.name = (vo.name + _local_3);
                _local_4 = ((int(_arg_1.inst.color) > 0) ? int(_arg_1.inst.color) : 0);
                _local_30 = _arg_1.inst.preNameType;
                if ((_local_30 > 0))
                {
                    vo.name = (GamePredef.PRE_EQU_NAME[_local_30] + vo.name);
                };
                _local_31 = _arg_1.inst.flag;
                if (((_local_31) && (!(_local_31.indexOf("sublimeId") == -1))))
                {
                    _local_32 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_31));
                    if (int(_local_32.sublimeId) > 0)
                    {
                        vo.name = (vo.name + ("+" + _local_32.sublimeId));
                        if (int(_arg_1.temp.kind) != 9)
                        {
                            _local_4 = GamePredef.SUBLIMATION_COLOR;
                        };
                        if (int(_local_32.sublimeElement) > 0)
                        {
                            _local_33 = int(_local_32.sublimeElement);
                            _local_34 = GamePredef.ELEMENT_NAME[_local_33];
                            _local_34 = (((("<font color='" + GamePredef.ELEMENT_COLOR[_local_33]) + "'>") + _local_34) + "</font>");
                            _local_35 = ((int(_arg_1.temp.kind) != 9) ? GamePredef.TBL_SUBLIMATION : GamePredef.TBL_SUBLIMATION_PET);
                            _local_36 = GameData.d[_local_35][_local_32.sublimeId];
                            _local_37 = (Number(_local_36.elementNum) * 100).toFixed(2);
                            _local_38 = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_arg_1.inst.tid];
                            _local_39 = GamePredef.EQUIP_FUNCTYPE[_local_38.position];
                            _local_40 = ((_local_39 == GamePredef.EQUIP_TYPE_ATTACK) ? 1 : 3);
                            _local_41 = ((_local_39 == GamePredef.EQUIP_TYPE_ATTACK) ? 43 : 44);
                            _local_42 = Language.TIPEQUIP_S[_local_41];
                            _local_42 = LanguageUtil.replace(_local_42, {
                                "element":_local_34,
                                "num":_local_37
                            });
                            _local_43 = {
                                "prop0":"",
                                "num0":0,
                                "prop1":"",
                                "num1":0,
                                "element":_local_42
                            };
                            _local_2 = _local_40;
                            while (_local_2 < (_local_40 + 2))
                            {
                                _local_44 = _local_36[("prop" + _local_2)];
                                _local_45 = _local_36[("propNum" + _local_2)];
                                _local_46 = (_local_2 - _local_40);
                                _local_43[("prop" + _local_46)] = GamePredef.EQUIPT_PROP_NAME[_local_44];
                                _local_43[("num" + _local_46)] = _local_45;
                                _local_2++;
                            };
                            _local_5 = LanguageUtil.replace(Language.TIPEQUIP_S[42], _local_43);
                        };
                    };
                };
            };
            if ((_local_4 > 0))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_4]) + "'>") + vo.name) + "</font>");
            };
            sublimation.htmlText = _local_5;
            vo.propBasic = "";
            var _local_6:* = "";
            _local_7 = _arg_1.inst.flag2;
            if (((_local_7) && (!(_local_7 == ""))))
            {
                _local_47 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_7));
                if (((((int(_arg_1.temp.kind) == 1) || (int(_arg_1.temp.kind) == 2)) || (int(_arg_1.temp.kind) == 3)) || (int(_arg_1.temp.kind) == 4)))
                {
                    if (((int(_arg_1.temp.reqLevel) > 150) && (!(_local_7.indexOf("t") == -1))))
                    {
                        _local_48 = {
                            "prop0":"",
                            "color0":"#FFFFFF",
                            "num0":"",
                            "add0":"",
                            "prop1":"",
                            "color1":"#FFFFFF",
                            "num1":"",
                            "add1":"",
                            "prop2":"",
                            "color2":"#FFFFFF",
                            "num2":"",
                            "add2":""
                        };
                        _local_2 = 0;
                        while (_local_2 < 3)
                        {
                            if (_local_47[_local_2])
                            {
                                _local_48[("prop" + _local_2)] = Language.TIP_QILING_H[_local_47[_local_2]["t"]];
                                if (_local_47[_local_2]["v"] == _local_47[_local_2]["max"])
                                {
                                    _local_48[("add" + _local_2)] = (("<font color='#FA5B05'>" + Language.QILING_PANEL[4]) + "</font>");
                                };
                                _local_49 = (_local_47[_local_2]["v"] / _local_47[_local_2]["max"]);
                                _local_50 = 0;
                                while (_local_50 < GamePredef.QILING_COLOR.length)
                                {
                                    if (_local_49 >= (GamePredef.QILING_COLOR[_local_50] / 100))
                                    {
                                        _local_48[("color" + _local_2)] = GamePredef.QILING_COLOR_CODE[_local_50];
                                        break;
                                    };
                                    _local_50++;
                                };
                                if (GamePredef.PROP_SUFFIX[_local_47[_local_2]["t"]])
                                {
                                    if (GamePredef.PROP_SUFFIX[_local_47[_local_2]["t"]] == 1)
                                    {
                                        _local_48[("num" + _local_2)] = Math.ceil(_local_47[_local_2]["v"]);
                                    }
                                    else
                                    {
                                        if (GamePredef.PROP_SUFFIX[_local_47[_local_2]["t"]] == 2)
                                        {
                                            _local_48[("num" + _local_2)] = Number(_local_47[_local_2]["v"]).toFixed(3);
                                        }
                                        else
                                        {
                                            _local_48[("num" + _local_2)] = (Number((_local_47[_local_2]["v"] * 100)).toFixed(3) + "%");
                                        };
                                    };
                                }
                                else
                                {
                                    _local_48[("num" + _local_2)] = Math.ceil(_local_47[_local_2]["v"]);
                                };
                            };
                            _local_2++;
                        };
                        _local_6 = LanguageUtil.replace(Language.TIPEQUIP_S[45], _local_48);
                    };
                };
            };
            qiling.htmlText = _local_6;
            var _local_8:* = ((GamePredef.MW_MAIN_POSITION[_arg_1.temp.position]) || (GamePredef.MW_SUB_POSITION[_arg_1.temp.position]));
            if ((((_local_8) && (_arg_1.inst.flag)) && (!(_arg_1.inst.flag == ""))))
            {
                _local_31 = JSONUtil.JSONfy(_arg_1.inst.flag);
                _local_51 = com.adobe.serialization.json.JSON.decode(_local_31);
                for (_local_52 in _local_51)
                {
                    if (((!(_local_51[_local_52])) || (!(_local_51[_local_52].hasOwnProperty("propVal"))))) break;
                    _local_53 = ("" + _local_51[_local_52].propVal);
                    _local_54 = 0;
                    if (_local_53.indexOf(".") > 0)
                    {
                        _local_54 = Number(_local_51[_local_52].propVal);
                    };
                    _local_55 = GamePredef.MW_SUCC_GROW_MAP[int(_local_51[_local_52].propType)];
                    _local_56 = ((_local_55) ? _local_55[int(_arg_1.inst.upgradeNum)] : 0);
                    vo.propBasic = (vo.propBasic + ((((((GamePredef.EQUIPT_PROP_NAME[int(_local_51[_local_52].propType)] + ": ") + FONT_COLOR_PRE_PROP) + ((_local_54) ? (_local_54 * (1 + (_local_56 / 100))).toFixed(1) : Math.floor((_local_51[_local_52].propVal * (1 + (_local_56 / 100)))))) + ((_local_56) ? (("(" + _local_56) + "%)") : "")) + FONT_COLOR_SUF_PROP) + "\n"));
                };
                vo.propBasic.substring(0, (vo.propBasic.length - 1));
            };
            if (_arg_1.inst.mainProp1 > 0)
            {
                _local_56 = ((GamePredef.MW_GROW_MAP[_arg_1.inst.mainProp1]) ? GamePredef.MW_GROW_MAP[_arg_1.inst.mainProp1][_arg_1.inst.upgradeNum] : 1);
                _local_57 = ((_local_8) ? _local_56 : GamePredef.EQUIPT_STAR_NUM[_arg_1.inst.upgradeNum]);
                vo.propBasic = (((((GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp1] + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.inst.mainPropNum1 * _local_57))) + (((_arg_1.inst.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (_arg_1.inst.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + FONT_COLOR_SUF_PROP);
                if (_local_8)
                {
                    vo.propBasic = (vo.propBasic + (("(" + _arg_1.inst.mainPropNum1) + ")"));
                };
            };
            if (_arg_1.inst.mainProp2 > 0)
            {
                _local_56 = ((GamePredef.MW_GROW_MAP[_arg_1.inst.mainProp2]) ? GamePredef.MW_GROW_MAP[_arg_1.inst.mainProp2][_arg_1.inst.upgradeNum] : 1);
                _local_57 = ((_local_8) ? _local_56 : GamePredef.EQUIPT_STAR_NUM[_arg_1.inst.upgradeNum]);
                vo.propBasic = (vo.propBasic + (((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.inst.mainPropNum2 * _local_57))) + (((_arg_1.inst.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (_arg_1.inst.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + FONT_COLOR_SUF_PROP));
                if (_local_8)
                {
                    vo.propBasic = (vo.propBasic + (("(" + _arg_1.inst.mainPropNum2) + ")"));
                };
            };
            if (_arg_1.inst.prop1 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.prop1]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.inst.propNum1) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.inst.prop2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.prop2]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.inst.propNum2) + FONT_COLOR_SUF_PROP));
            };
            vo.propBind = "";
            if (((_arg_1.inst.bindMainPropNum1 > 0) || (_arg_1.inst.bindMainPropNum2 > 0)))
            {
                propBind.visible = true;
                propBind.includeInLayout = true;
            };
            if (_arg_1.inst.binded > 0)
            {
                vo.bind = Language.TIPEQUIP_S[3];
                if (_arg_1.inst.bindMainPropNum1 > 0)
                {
                    vo.propBind = ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp1]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.inst.bindMainPropNum1) + "%") + FONT_COLOR_SUF_PROP);
                };
                if (_arg_1.inst.bindMainPropNum2 > 0)
                {
                    if (vo.propBind.length > 0)
                    {
                        vo.propBind = (vo.propBind + "\n");
                    };
                    vo.propBind = (vo.propBind + ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.inst.bindMainPropNum2) + "%") + FONT_COLOR_SUF_PROP));
                };
            }
            else
            {
                vo.bind = Language.TIPEQUIP_S[4];
                if (_arg_1.inst.bindMainPropNum1 > 0)
                {
                    vo.propBind = ((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp1]) + ": ") + _arg_1.inst.bindMainPropNum1) + "%");
                };
                if (_arg_1.inst.bindMainPropNum2 > 0)
                {
                    if (vo.propBind.length > 0)
                    {
                        vo.propBind = (vo.propBind + "\n");
                    };
                    vo.propBind = (vo.propBind + ((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp2]) + ": ") + _arg_1.inst.bindMainPropNum2) + "%"));
                };
                if (vo.propBind.length > 0)
                {
                    vo.propBind = ((FONT_COLOR_PRE_UNACTIVE + vo.propBind) + FONT_COLOR_SUF_UNACTIVE);
                };
            };
            if (vo.propBind.length > 0)
            {
                vo.propBind = ((PRE_BIND_PROP + "\n") + vo.propBind);
            };
            if (!ToolKit.isEqual(_arg_1.temp.kind, GamePredef.ITEM_KIND_PETEQU))
            {
                _local_58 = "";
                _local_59 = {};
                jewelInfo.text = "";
                jewelInfo.includeInLayout = true;
                jewelInfo.visible = true;
                if (_arg_1.inst.holeNum > 0)
                {
                    jewelCanvas.visible = true;
                    jewelCanvas.includeInLayout = true;
                };
                _local_25 = 1;
                while (_local_25 <= _arg_1.inst.holeNum)
                {
                    if (_arg_1.inst[("t" + _local_25)] > 0)
                    {
                        _local_61 = _core.data.getData(GamePredef.TBL_ITEM_TEMPLATE, _arg_1.inst[("t" + _local_25)]);
                        if (_local_61)
                        {
                            if (!_local_59[_local_61.propType])
                            {
                                _local_59[_local_61.propType] = 0;
                            };
                            _local_59[_local_61.propType] = (_local_59[_local_61.propType] + Number(_local_61.proplNum));
                            vo[("clsJewel" + _local_25)] = ResManager[("ICON_EQUIP_JEWEL_" + _local_61.propType)];
                        };
                    }
                    else
                    {
                        vo[("clsJewel" + _local_25)] = ResManager.ICON_EQUIP_HOLE;
                        jewelInfo.text = Language.TIPEQUIP_S[35];
                    };
                    _local_25++;
                };
                if (_arg_1.inst.holeNum < 10)
                {
                    if (jewelInfo.text)
                    {
                        jewelInfo.text = (jewelInfo.text + ",");
                    };
                    jewelInfo.text = (jewelInfo.text + Language.TIPEQUIP_S[36]);
                };
                if ((((_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_DRESS)) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)))
                {
                    jewelInfo.text = Language.TIPEQUIP_S[37];
                };
                for (_local_60 in _local_59)
                {
                    if (_local_59[_local_60] > 0)
                    {
                        _local_58 = (_local_58 + ((((("\n" + GamePredef.JEWEL_PROP_NAME[_local_60]) + ": ") + FONT_COLOR_PRE_PROP) + _local_59[_local_60]) + FONT_COLOR_SUF_PROP));
                    };
                };
                if (_local_58.length > 0)
                {
                    vo.propJewel = (PRE_JEWEL_PROP + _local_58);
                };
            }
            else
            {
                jewelInfo.text = Language.TIPEQUIP_S[37];
            };
            if (ToolKit.isEqual(_arg_1.temp.kind, GamePredef.ITEM_KIND_PETEQU))
            {
                petStoneText.includeInLayout = true;
                petStoneText.visible = true;
                petStoneContainer.includeInLayout = true;
                petStoneContainer.visible = true;
                jewelInfo.includeInLayout = false;
                jewelInfo.visible = false;
                _local_7 = JSONUtil.JSONfy(_arg_1.inst.flag3);
                if (((_local_7) && (!(_local_7 == ""))))
                {
                    _local_62 = com.adobe.serialization.json.JSON.decode(_local_7);
                    _local_63 = 1;
                    while (_local_63 <= 6)
                    {
                        _local_64 = (this[("petStone" + _local_63)] as Image);
                        if (((_local_62) && (_local_62[_local_63])))
                        {
                            _local_64.source = ResManager.ICON_EQUIP_JEWEL_12;
                        }
                        else
                        {
                            _local_64.source = ResManager.ICON_EQUIP_HOLE;
                        };
                        _local_63++;
                    };
                    if ((((_local_62) && (_local_62[1])) && (Number(_local_62[1][2]) > 0)))
                    {
                        _local_65 = Number(_local_62[1][2]);
                        _local_66 = GameData.d[GamePredef.TBL_SKILL][_local_65];
                        petStoneSkillText.text = ("KN Bảo Thạch:" + _local_66["name"]);
                        petStoneSkillText.visible = true;
                    }
                    else
                    {
                        petStoneSkillText.text = "";
                        petStoneSkillText.visible = false;
                    };
                }
                else
                {
                    _local_67 = 1;
                    while (_local_67 <= 6)
                    {
                        _local_64 = (this[("petStone" + _local_67)] as Image);
                        _local_64.source = ResManager.ICON_EQUIP_HOLE;
                        _local_67++;
                    };
                    petStoneSkillText.text = "";
                    petStoneSkillText.visible = false;
                };
            }
            else
            {
                petStoneSkillText.text = "";
                petStoneSkillText.visible = false;
                petStoneText.includeInLayout = false;
                petStoneText.visible = false;
                petStoneContainer.includeInLayout = false;
                petStoneContainer.visible = false;
                jewelInfo.includeInLayout = true;
                jewelInfo.visible = true;
            };
            if (!ToolKit.isEqual(_arg_1.temp.kind, GamePredef.ITEM_KIND_DRESS))
            {
                _local_68 = Language.TIPEQUIP_S[22].toString();
                if (ProductPanel.isGloveEquip(_arg_1.temp.id))
                {
                    _local_68 = _local_68.replace("{endureLeft}", Number(_arg_1.inst.endureLeft).toFixed(1));
                }
                else
                {
                    _local_68 = _local_68.replace("{endureLeft}", Number(_arg_1.inst.endureLeft));
                };
                _local_68 = _local_68.replace("{endureMax}", _arg_1.inst.endureMax);
                vo.endure = _local_68;
            };
            if (_arg_1.inst.endureLeft == 0)
            {
                vo.endure = ((FONT_COLOR_RED_PROP + vo.endure) + FONT_COLOR_SUF_PROP);
            };
            if (_arg_1.inst.maker)
            {
                vo.maker = (_arg_1.inst.maker + Language.TIPEQUIP_S[23]);
            };
            if (_arg_1.temp.activeEquipId > 0)
            {
                if (_arg_1.inst.activeProp > 0)
                {
                    propSoul.visible = true;
                    propSoul.includeInLayout = true;
                };
                if (dm.hasData(GamePredef.TBL_EQUIPT_TEMPLATE, _arg_1.temp.activeEquipId))
                {
                    _local_69 = dm.getGameData(GamePredef.TBL_EQUIPT_TEMPLATE, _arg_1.temp.activeEquipId);
                    vo.activeEquipName = _local_69.name;
                    refreshSoul();
                }
                else
                {
                    addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + GamePredef.TBL_EQUIPT_TEMPLATE) + "_") + _arg_1.temp.activeEquipId), equipDataLoaded);
                    dm.getGameData(GamePredef.TBL_EQUIPT_TEMPLATE, _arg_1.temp.activeEquipId);
                };
            };
            if (_arg_1.temp.suitId)
            {
                _local_70 = _core.getTemplateData(GamePredef.TBL_EQUIPT_SUIT, Number(_arg_1.temp.suitId));
                if (_local_70)
                {
                    _local_71 = ((BasicToolTip.PRE_SUIT_PROP + Language.TIPEQUIP_S[25].toString().replace("{suitName}", _local_70.name)) + BasicToolTip.SUF_SUIT_PROP);
                    if (EquiptFuncPanel.isSpecPetEqu(_arg_1.temp))
                    {
                        _local_72 = 0;
                        if (((_arg_1.index >= 606) && (_arg_1.index <= 607)))
                        {
                            _local_73 = _core.view.getUI(ViewManager.PANEL_PETMANAGER);
                            if (_local_73)
                            {
                                _local_74 = {};
                                _local_74 = _local_73.getSpecPetEquSuitNum(_local_70.id);
                                if (_local_74)
                                {
                                    _local_75 = 0;
                                    _local_76 = 4;
                                    while (_local_76 >= 2)
                                    {
                                        if (_local_74[_local_76] == null)
                                        {
                                            _local_74[_local_76] = 0;
                                        };
                                        _local_75 = (_local_75 + _local_74[_local_76]);
                                        if (_local_75 == 2)
                                        {
                                            _local_72 = _local_76;
                                            break;
                                        };
                                        _local_76--;
                                    };
                                };
                            };
                        };
                        _local_25 = 1;
                        while (_local_25 <= 5)
                        {
                            _local_77 = int(_local_70[("suitProp" + _local_25)]);
                            _local_78 = int(_local_70[("suitPropNum" + _local_25)]);
                            _local_79 = "";
                            if (((_local_77 > 0) && (_local_78 > 0)))
                            {
                                _local_80 = getSuitPropStr(_local_77, _local_78, _local_79, _local_72);
                                _local_71 = (_local_71 + _local_80);
                            };
                            _local_25++;
                        };
                        _local_71 = (_local_71 + (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_72]) + "'>") + _local_70.skillDescription) + "</font>"));
                    }
                    else
                    {
                        _local_81 = {};
                        if (((_arg_1.index >= 600) && (_arg_1.index <= 605)))
                        {
                            _local_73 = _core.view.getUI(ViewManager.PANEL_PETMANAGER);
                            if (_local_73)
                            {
                                _local_81 = _local_73.getPetEquSuitNum(_local_70.id);
                                if (_local_81)
                                {
                                    _local_75 = 0;
                                    _local_76 = 4;
                                    while (_local_76 >= 2)
                                    {
                                        if (_local_81[_local_76] == null)
                                        {
                                            _local_81[_local_76] = 0;
                                        };
                                        _local_81[_local_76] = (_local_81[_local_76] + _local_75);
                                        _local_75 = _local_81[_local_76];
                                        _local_76--;
                                    };
                                };
                            };
                        };
                        _local_82 = {
                            "0":1,
                            "1":1,
                            "2":0.5,
                            "3":1,
                            "4":2
                        };
                        _local_25 = 1;
                        while (_local_25 <= 5)
                        {
                            _local_77 = int(_local_70[("suitProp" + _local_25)]);
                            _local_78 = int(_local_70[("suitPropNum" + _local_25)]);
                            _local_79 = Language.TIPEQUIP_S[26].toString().replace("{num}", (_local_25 + 1));
                            _local_4 = 0;
                            if (_local_81)
                            {
                                _local_76 = 2;
                                while (_local_76 <= 4)
                                {
                                    if (((_local_81[_local_76]) && (_local_81[_local_76] >= (_local_25 + 1))))
                                    {
                                        _local_4 = _local_76;
                                    };
                                    _local_76++;
                                };
                            };
                            _local_80 = getSuitPropStr(_local_77, _local_78, _local_79, _local_4);
                            _local_71 = (_local_71 + _local_80);
                            _local_25++;
                        };
                    };
                    vo.propSuit = _local_71;
                };
            };
        }

        private function _TipEquip_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _TipEquip_SetProperty2 = _local_1;
            _local_1.name = "width";
            _local_1.value = 192;
            BindingManager.executeBindings(this, "_TipEquip_SetProperty2", _TipEquip_SetProperty2);
            return (_local_1);
        }

        private function _TipEquip_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "simplify";
            _local_1.overrides = [_TipEquip_RemoveChild1_i()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get propSoul():Text
        {
            return (this._993680394propSoul);
        }


    }
}//package com.qeedoo.ui.view.comp

